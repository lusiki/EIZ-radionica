"""Verify the reader's full text, links, geometry and source provenance.

Run after build_booklet.py. Requires pypdf and pdfplumber; visual review is
separate. No network. Numerical examples are checked against the frozen CSV.
"""
import csv
import hashlib
import html
import json
import re
import shutil
import statistics
import subprocess
from pathlib import Path

import pdfplumber
from pypdf import PdfReader
from build_booklet import CHAPTERS, INTRO, OUT, ROOT, rich_text


def normalize(text):
    return "".join(c.lower() for c in text if c.isalnum())


manifest = json.loads((OUT.parent/"booklet-manifest.json").read_text(encoding="utf-8"))
assert hashlib.sha256(OUT.read_bytes()).hexdigest() == manifest["pdf_sha256"]
for name, digest in manifest["source_files"].items():
    assert hashlib.sha256((ROOT/name).read_bytes()).hexdigest() == digest, name
assert len(CHAPTERS) == 8 and len(manifest["source_files"]) == 9
reader = PdfReader(OUT)
full_text = "\n".join(p.extract_text() for p in reader.pages)
body_lines = [line for line in full_text.splitlines()
              if line.strip() not in ("EIZ / AI U STUDENTSKOM ISTRAŽIVANJU",
                                      "Izdanje / 26. listopada 2026.")
              and not re.fullmatch(r"\s*\d+\s*", line)]
normalized_pdf = normalize("\n".join(body_lines))
assert "Luka Šikić" in full_text and "UNICATH" in full_text
assert len(reader.outline) == 11, "Introduction, two parts and eight chapter bookmarks required"
assert len(reader.pages) >= 20, "Unexpectedly short reading edition"

checked = 0
expected_links = set()
for path in [INTRO, *CHAPTERS]:
    j = subprocess.run([shutil.which("quarto"), "pandoc", "-f", "markdown", "-t", "json"],
                       input=path.read_text(encoding="utf-8"), text=True, encoding="utf-8",
                       capture_output=True, check=True)
    blocks = json.loads(j.stdout)["blocks"]
    for b in blocks:
        if b["t"] == "Header": fragments = [rich_text(b["c"][2])]
        elif b["t"] in ("Para", "Plain"): fragments = [rich_text(b["c"])]
        elif b["t"] == "BlockQuote": fragments = [rich_text(x["c"]) for x in b["c"]]
        elif b["t"] == "CodeBlock": fragments = [html.escape(b["c"][1])]
        else: raise AssertionError(b["t"])
        for fragment in fragments:
            expected_links.update(html.unescape(u) for u in re.findall(r'href="([^"]+)"', fragment))
            plain = html.unescape(re.sub(r"<[^>]+>", "", fragment))
            assert normalize(plain) in normalized_pdf, f"PDF text missing: {path.name}: {plain[:140]}"
            checked += 1

actual_links = set()
for page in reader.pages:
    for annotation in page.get("/Annots", []):
        action = annotation.get_object().get("/A", {})
        if action.get("/S") == "/URI": actual_links.add(str(action["/URI"]))
assert expected_links <= actual_links, expected_links - actual_links
assert "\ufffd" not in full_text, "Replacement glyph in text"

with pdfplumber.open(OUT) as pdf:
    for i, page in enumerate(pdf.pages, 1):
        assert page.chars, f"Empty page: {i}"
        for c in page.chars:
            assert -1 <= c["x0"] < c["x1"] <= page.width+1, (i, c)
            assert -1 <= c["top"] < c["bottom"] <= page.height+1, (i, c)

with (ROOT/"data/processed/croatia_inflation.csv").open(encoding="utf-8-sig") as f:
    data = list(csv.DictReader(f))
for sample, printed in [(data, "0,6985"), (data[:60], "0,8279"), (data[60:], "0,5342")]:
    r = statistics.correlation([float(x["hicp_yoy_pct"]) for x in sample],
                               [float(x["expectations_balance"]) for x in sample])
    assert f"{r:.4f}".replace(".", ",") == printed
    assert printed in full_text
print(f"PASS: {len(reader.pages)} PDF pages; all {checked} source blocks present; "
      f"{len(expected_links)} source URLs, 11 bookmarks, bounds, hashes and numerical examples.")
