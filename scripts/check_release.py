"""Independent release checks: standard-library only; no network."""
import csv, json, math, re, statistics, sys, zipfile
from pathlib import Path
from html.parser import HTMLParser
from urllib.parse import urlsplit, unquote

root = Path(__file__).resolve().parents[1]
def read_csv(path):
    with path.open(encoding="utf-8-sig", newline="") as f:
        return list(csv.DictReader(f))
d = read_csv(root/"data/processed/croatia_inflation.csv")
assert len(d) == 120
for source, column in [("hicp", "hicp_yoy_pct"), ("expectations", "expectations_balance")]:
    j = json.loads((root/f"data/raw/{source}.json").read_text(encoding="utf-8-sig"))
    times = j["dimension"]["time"]["category"]["index"]
    for row in d:
        assert float(row[column]) == j["value"][str(times[row["month"]])], (source, row["month"])
annual = read_csv(root/"data/reference/annual_summary.csv")
for row in annual:
    sample = [x for x in d if x["month"].startswith(row["year"])]
    assert len(sample) == int(row["n_months"]) == 12
    for col in ["hicp_yoy_pct", "expectations_balance"]:
        assert math.isclose(statistics.mean(float(x[col]) for x in sample), float(row[col]), abs_tol=1e-10)
groups = [d, d[:60], d[60:]]
for sample, row in zip(groups, read_csv(root/"data/reference/correlations.csv")):
    r = statistics.correlation([float(x["hicp_yoy_pct"]) for x in sample],
                               [float(x["expectations_balance"]) for x in sample])
    assert math.isclose(r, float(row["pearson_r"]), abs_tol=1e-12)

class Page(HTMLParser):
    def __init__(self, text):
        super().__init__(); self.ids=set(); self.links=[]
        self.feed(text)
    def handle_starttag(self, tag, attrs):
        a = dict(attrs)
        if "id" in a: self.ids.add(a["id"])
        if tag in ("a","link") and "href" in a: self.links.append(a["href"])
        if tag in ("img","script") and "src" in a: self.links.append(a["src"])

site = Path(sys.argv[1]).resolve() if len(sys.argv)>1 else root/"_site"
names = ["index.html","admin/prerequisites.html","admin/workshop_overview.html",
 "slides/day1.html","slides/day2.html","data/dictionary.html",
 "materials/exercises/index.html","materials/sources.html","materials/rubric.html",
 "materials/solutions.html","materials/results.html","admin/instructor.html"]
pages = {site/n:Page((site/n).read_text(encoding="utf-8")) for n in names}
assert {str(p.relative_to(site)).replace("\\", "/") for p in site.rglob("*.html")} == set(names), "Unexpected HTML in preview"
assert (site/"results/inflation_expectations.svg").read_text(encoding="utf-8").count("data:font/ttf;base64,") == 2
errors = []
for path,p in pages.items():
    for link in p.links:
        u = urlsplit(link)
        if u.scheme or u.netloc: continue
        target = (site/unquote(u.path.lstrip("/")) if u.path.startswith("/") else path.parent/unquote(u.path)).resolve() if u.path else path
        if target.is_dir(): target /= "index.html"
        if not target.is_file(): errors.append(f"{path.relative_to(site)}: missing {link}"); continue
        if u.fragment and target.suffix==".html":
            q=pages.get(target)
            if q is None: q=Page(target.read_text(encoding="utf-8"))
            if unquote(u.fragment) not in q.ids: errors.append(f"{path.relative_to(site)}: missing anchor {link}")
with zipfile.ZipFile(root/"downloads/eiz-workshop.zip") as z:
    members = z.namelist()
    assert all(not ("/.git/" in n or n.startswith((".git/",".claude/","submissions/","renv/library/"))) for n in members)
    assert not any(n.endswith((".html",".pdf",".log")) for n in members)
    assert "code/starter.R" in members and "data/processed/croatia_inflation.csv" in members
for css in (site/"styles").glob("*.css"):
    for rel in re.findall(r'url\(["\']?([^)"\']+)', css.read_text(encoding="utf-8")):
        if not rel.startswith(("data:","http")):
            assert (css.parent/rel).is_file(), rel
assert not errors, "\n".join(errors)
print(f"PASS: independent JSON/CSV and numerical cross-check; {len(pages)} pages, local assets/anchors, fonts and ZIP allowlist.")
