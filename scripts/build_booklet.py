"""Typeset the shared Quarto reader chapters as a local, searchable PDF.

Requires Quarto (bundled Pandoc) and reportlab. No network or AI call.
"""
from __future__ import annotations

import hashlib
import html
import json
import re
import shutil
import subprocess
from pathlib import Path
from urllib.parse import urljoin, urlsplit, urlunsplit

from reportlab.lib import colors
from reportlab.lib.enums import TA_LEFT
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import ParagraphStyle, getSampleStyleSheet
from reportlab.lib.units import mm
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.platypus import (
    BaseDocTemplate, Flowable, Frame, KeepTogether, PageBreak, PageTemplate,
    Paragraph, Preformatted, Spacer,
)
from reportlab.platypus.tableofcontents import TableOfContents

ROOT = Path(__file__).resolve().parents[1]
SITE_URL = re.search(r'^  site-url: (https://\S+)$',
                     (ROOT / '_quarto.yml').read_text(encoding='utf-8'), re.M)[1]
CHAPTERS = sorted((ROOT / "booklet").glob("_0[1-8]-*.qmd"))
INTRO = ROOT / "booklet/_00-intro.qmd"
OUT = ROOT / "downloads/EIZ-prirucnik.pdf"
PALETTE = dict(re.findall(r'^\s+([\w-]+):\s*"(#[0-9A-Fa-f]{6})"',
                         (ROOT / "design-tokens.yml").read_text(encoding="utf-8"), re.M))
INK = colors.HexColor(PALETTE["ink"])
NAVY = colors.HexColor(PALETTE["concept"])
CREAM = colors.HexColor(PALETTE["paper"])
MUSTARD = colors.HexColor(PALETTE["accent"])


def register_fonts():
    fonts = {
        "Literata": "Literata-Regular.ttf",
        "Literata-Bold": "Literata-Bold.ttf",
        "Literata-Italic": "Literata-Italic.ttf",
        "Literata-BoldItalic": "Literata-BoldItalic.ttf",
        "Jost": "Jost-Regular.ttf",
        "Jost-Medium": "Jost-Medium.ttf",
        "JetBrainsMono": "JetBrainsMono-Regular.ttf",
    }
    for family, filename in fonts.items():
        pdfmetrics.registerFont(TTFont(family, str(ROOT / "styles/fonts" / filename)))
    pdfmetrics.registerFontFamily("Literata", normal="Literata", bold="Literata-Bold",
                                  italic="Literata-Italic", boldItalic="Literata-BoldItalic")
    pdfmetrics.registerFontFamily("Jost", normal="Jost", bold="Jost-Medium",
                                  italic="Jost", boldItalic="Jost-Medium")


def raw_text(nodes):
    parts = []
    for node in nodes:
        kind, value = node["t"], node.get("c")
        if kind == "Str": parts.append(value)
        elif kind in ("Space", "SoftBreak", "LineBreak"): parts.append(" ")
        elif kind in ("Strong", "Emph", "Superscript", "Subscript"): parts.append(raw_text(value))
        elif kind in ("Link", "Span"): parts.append(raw_text(value[1]))
        elif kind == "Code": parts.append(value[1])
        elif kind == "Math": parts.append(value[1])
        else: raise ValueError(f"Unhandled text node: {kind}")
    return "".join(parts)


MATH = {
    r"P(t_k \mid t_1, \ldots, t_{k-1}; \theta)":
        "P(t<sub>k</sub> | t<sub>1</sub>, ..., t<sub>k-1</sub>; θ)",
    r"y_t = \alpha + \beta x_t + u_t.":
        "y<sub>t</sub> = α + βx<sub>t</sub> + u<sub>t</sub>.",
    "y_t": "y<sub>t</sub>", "x_t": "x<sub>t</sub>",
}


def rich_text(nodes):
    parts = []
    for node in nodes:
        kind, value = node["t"], node.get("c")
        if kind == "Str": parts.append(html.escape(value))
        elif kind in ("Space", "SoftBreak"): parts.append(" ")
        elif kind == "LineBreak": parts.append("<br/>")
        elif kind in ("Strong", "Emph"):
            tag = "b" if kind == "Strong" else "i"
            parts.append(f"<{tag}>{rich_text(value)}</{tag}>")
        elif kind == "Code":
            parts.append(f'<font name="JetBrainsMono" size="8.2">{html.escape(value[1])}</font>')
        elif kind == "Link":
            url = value[2][0]
            # Shared chapter sources use relative links for local HTML previews.
            # The downloadable PDF opens the corresponding published page.
            link_parts = urlsplit(url)
            if not link_parts.scheme and not link_parts.netloc:
                path = re.sub(r'\.qmd$', '.html', link_parts.path)
                url = urljoin(SITE_URL.rstrip('/') + '/booklet/',
                              urlunsplit(('', '', path, link_parts.query, link_parts.fragment)))
            if not url.startswith("https://"):
                raise ValueError(f"Print chapter link must be external HTTPS: {url}")
            parts.append(f'<link href="{html.escape(url, quote=True)}" color="{PALETTE["concept"]}">'
                         f'<u>{rich_text(value[1])}</u></link>')
        elif kind == "Span": parts.append(rich_text(value[1]))
        elif kind == "Math":
            if value[1] not in MATH:
                raise ValueError(f"Add a reviewed printable formula: {value[1]}")
            parts.append(MATH[value[1]])
        else: raise ValueError(f"Unhandled inline node: {kind}")
    return "".join(parts)


class Cover(Flowable):
    def __init__(self, width, height):
        super().__init__(); self.width = width; self.height = height

    def draw(self):
        c = self.canv
        w, h = self.width, self.height
        c.setFillColor(CREAM)
        c.rect(-24*mm, -22*mm, A4[0], A4[1], fill=1, stroke=0)
        c.setFillColor(INK)
        c.setFont("Jost-Medium", 11)
        c.drawString(0, h-12, "EIZ / PRIRUČNIK ZA SAMOSTALNO ČITANJE")
        c.setFont("Jost", 49)
        for i, line in enumerate(["istraživanje", "uz umjetnu", "inteligenciju"]):
            c.drawString(-1, h-104-i*56, line)
        c.setFont("Literata", 13)
        c.drawString(0, h-258, "Prošireni tekst obaju dana radionice")
        c.setFont("Jost", 11)
        c.drawString(0, h-284, "Izvorni materijal / Luka Šikić, UNICATH")
        c.drawString(0, h-302, "Revidirano izdanje / 27. listopada 2026.")
        # Zvono geometry: baseline, dome, disc and vertical axis.
        x, y, radius = w-118, 126, 100
        c.setFillColor(NAVY)
        p = c.beginPath(); p.moveTo(x-radius, y)
        p.curveTo(x-radius, y+radius*1.33, x+radius, y+radius*1.33, x+radius, y)
        p.close(); c.drawPath(p, fill=1, stroke=0)
        c.setFillColor(CREAM)
        p = c.beginPath(); p.moveTo(x-60, y)
        p.curveTo(x-60, y+80, x+60, y+80, x+60, y)
        p.close(); c.drawPath(p, fill=1, stroke=0)
        c.setFillColor(MUSTARD); c.circle(x, y+190, 31, fill=1, stroke=0)
        c.setStrokeColor(INK); c.setLineWidth(1)
        c.line(x, y, x, y+159)
        c.setLineWidth(3); c.line(0, y, w, y)
        c.setFillColor(INK); c.setFont("Jost", 11)
        c.drawString(0, 57, "OSAM POGLAVLJA / IZVORI · ANALIZA · PISANJE")
        c.setFont("Literata-Italic", 10)
        c.drawString(0, 32, "Materijali za radionicu i samostalno čitanje.")


class ReaderDoc(BaseDocTemplate):
    def __init__(self, filename, **kwargs):
        super().__init__(filename, **kwargs)
        frame = Frame(self.leftMargin, self.bottomMargin, self.width, self.height,
                      leftPadding=0, rightPadding=0, topPadding=0, bottomPadding=0)
        self.addPageTemplates(PageTemplate(id="reader", frames=[frame], onPage=self.decorate))
        self.outline_counter = 0

    def beforeDocument(self):
        self.outline_counter = 0
        self.canv.setTitle("Istraživanje uz AI - priručnik")
        self.canv.setAuthor("Izvorni materijal / Luka Šikić, UNICATH")
        self.canv.setSubject("Izdanje 27.10.2026. / dokumentacija provjerena 26.10.2026.")
        self.canv.setCreator("EIZ booklet builder / ReportLab; shared Quarto chapter sources")

    def decorate(self, c, doc):
        if doc.page == 1: return
        c.saveState(); c.setFillColor(INK); c.setStrokeColor(INK)
        c.setFont("Jost", 8.5)
        c.drawString(self.leftMargin, A4[1]-15*mm, "EIZ / ISTRAŽIVANJE UZ AI")
        c.setLineWidth(.5)
        c.line(self.leftMargin, A4[1]-18*mm, A4[0]-self.rightMargin, A4[1]-18*mm)
        c.drawString(self.leftMargin, 13*mm, "Izdanje / 27. listopada 2026.")
        c.drawRightString(A4[0]-self.rightMargin, 13*mm, str(doc.page))
        c.restoreState()

    def afterFlowable(self, flowable):
        if isinstance(flowable, Paragraph) and getattr(flowable, "toc_level", None) is not None:
            title = flowable.getPlainText()
            key = f"section-{self.outline_counter}"
            self.outline_counter += 1
            self.canv.bookmarkPage(key)
            # Top-level entries are intentional: no unsupported parent jump.
            self.canv.addOutlineEntry(title, key, level=0, closed=False)
            self.notify("TOCEntry", (flowable.toc_level, title, self.page, key))


def make_styles():
    s = getSampleStyleSheet()
    common = dict(fontName="Literata", fontSize=10.5, leading=15,
                  textColor=INK, alignment=TA_LEFT, spaceAfter=7,
                  allowWidows=0, allowOrphans=0, splitLongWords=True)
    s.add(ParagraphStyle("Body", **common))
    s.add(ParagraphStyle("Prompt", parent=s["Body"], leftIndent=12, rightIndent=8,
                         borderColor=NAVY, borderWidth=1, borderPadding=9,
                         backColor=colors.HexColor(PALETTE["paper-soft"]), spaceBefore=8, spaceAfter=13))
    s.add(ParagraphStyle("Part", fontName="Jost", fontSize=29, leading=33,
                         textColor=NAVY, spaceAfter=22, keepWithNext=True))
    s.add(ParagraphStyle("Chapter", fontName="Jost-Medium", fontSize=23, leading=27,
                         textColor=INK, spaceAfter=18, keepWithNext=True))
    s.add(ParagraphStyle("Section", fontName="Jost-Medium", fontSize=15, leading=19,
                         textColor=INK, spaceBefore=16, spaceAfter=8, keepWithNext=True))
    s.add(ParagraphStyle("CodeReader", fontName="JetBrainsMono", fontSize=8.2, leading=12,
                         leftIndent=9, rightIndent=4, spaceBefore=7, spaceAfter=14,
                         backColor=colors.HexColor(PALETTE["paper-soft"]), borderPadding=8))
    return s


def build():
    if len(CHAPTERS) != 8: raise RuntimeError("Expected exactly eight reader chapters")
    quarto = shutil.which("quarto")
    if not quarto: raise RuntimeError("Quarto is required for its bundled Pandoc")
    sections = [INTRO.read_text(encoding="utf-8"), "# Prvi dan / od pitanja do provjerenih izvora\n"]
    sections.extend(p.read_text(encoding="utf-8") for p in CHAPTERS[:4])
    sections.append("# Drugi dan / od podataka do zaključka\n")
    sections.extend(p.read_text(encoding="utf-8") for p in CHAPTERS[4:])
    manuscript = "\n\n".join(sections)
    result = subprocess.run([quarto, "pandoc", "--from", "markdown", "--to", "json"],
                            input=manuscript, text=True, encoding="utf-8", capture_output=True, check=True)
    blocks = json.loads(result.stdout)["blocks"]
    register_fonts(); styles = make_styles(); OUT.parent.mkdir(exist_ok=True)
    doc = ReaderDoc(str(OUT), pagesize=A4, leftMargin=24*mm, rightMargin=22*mm,
                    topMargin=25*mm, bottomMargin=23*mm, pageCompression=1)
    story = [Cover(doc.width, doc.height), PageBreak(), Paragraph("Sadržaj", styles["Chapter"])]
    toc = TableOfContents()
    toc.levelStyles = [
        ParagraphStyle("TocPart", fontName="Jost-Medium", fontSize=12, leading=17,
                       textColor=INK, spaceBefore=14, spaceAfter=7),
        ParagraphStyle("TocChapter", fontName="Literata", fontSize=10.5, leading=16,
                       textColor=INK, leftIndent=10, firstLineIndent=0, spaceBefore=4),
    ]
    toc.dotsMinLevel = 1
    story.extend([toc, Spacer(1, 26),
                  Paragraph("Poveznice u sadržaju i bočne oznake PDF-a vode na poglavlja. "
                            "Podcrtane poveznice uz tvrdnje vode na izvorne dokumente. "
                            "Tekst možete pretraživati i označavati.", styles["Body"]), PageBreak()])
    last_kind = None
    for block in blocks:
        kind, value = block["t"], block.get("c")
        if kind == "Header":
            level, _, nodes = value
            if level == 1:
                story.append(PageBreak()); style = "Part"
            elif level == 2:
                if last_kind is not None and last_kind != "Part": story.append(PageBreak())
                style = "Chapter"
            else: style = "Section"
            p = Paragraph(rich_text(nodes), styles[style])
            if level <= 2: p.toc_level = 0 if level == 1 else 1
            story.append(p); last_kind = style
            continue
        if kind in ("Para", "Plain"):
            story.append(Paragraph(rich_text(value), styles["Body"]))
        elif kind == "BlockQuote":
            paras = []
            for child in value:
                if child["t"] not in ("Para", "Plain"): raise ValueError("Unexpected quote block")
                paras.append(rich_text(child["c"]))
            story.append(KeepTogether([Paragraph("<br/><br/>".join(paras), styles["Prompt"])]))
        elif kind == "CodeBlock":
            story.append(Preformatted(value[1], styles["CodeReader"], maxLineLength=83))
        else: raise ValueError(f"Unhandled block: {kind}")
        last_kind = kind
    doc.multiBuild(story)
    sources = [INTRO, *CHAPTERS]
    manifest = {
        "revision": "2026-10-27", "pdf": OUT.name,
        "source_files": {str(p.relative_to(ROOT)).replace("\\", "/"):
                         hashlib.sha256(p.read_bytes()).hexdigest() for p in sources},
        "word_count": len(re.findall(r"\S+", manuscript)),
        "pdf_sha256": hashlib.sha256(OUT.read_bytes()).hexdigest(),
    }
    (OUT.parent/"booklet-manifest.json").write_text(json.dumps(manifest, indent=2)+"\n", encoding="utf-8")
    print(f"Booklet: {OUT} ({manifest['word_count']} source words)")


if __name__ == "__main__":
    build()
