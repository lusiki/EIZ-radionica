# Dated compatibility record

The latest revision is recorded at the end of this file. Earlier entries
describe their own editions and do not describe the current reader length.

Revision, 2026-10-26. Windows 11 reference machine.

| Component | Status |
|---|---|
| R 4.6.0 | Reference scripts executed. Base-R starter separately exercised |
| Quarto 1.9.38 | Local HTML build checked |
| Packages | renv.lock restored into a separate empty library. Reference and optional HAC scripts passed |
| Positron | Recommended teaching interface. Terminal R execution does not constitute a full IDE walkthrough |
| RStudio/Copilot | Documented supported integration. Not required or interactively tested here |
| AI web accounts | Optional. No account, quota, price or model quality guarantee |
| Claude Code | Optional instructor demonstration. Not a student prerequisite |
| Linux/macOS | Not exercised. R font packages may need system dependencies |
| Learner pilot | Not performed by this implementation |

Additional checks, independent Python recalculation against raw JSON and
reference CSVs. 15-page local link and anchor check. ZIP allowlist. Base-R
starter run from the unpacked ZIP with user libraries removed from the search
path. Browser checks covered desktop landing/reader/results pages and the
390px mobile navigation, with no horizontal overflow on the checked pages.
The chart embeds its licensed fonts for offline portability. No browser
console errors were reported on the results page.

The build script sets a Windows UTF-8 locale for its process because the
host's inherited C.UTF-8 setting is not accepted by this R installation.
This does not change user or machine environment settings.

## Extended reader, same revision date

The original eight topic blocks are available as a revised reading edition
of approximately 9,400 source words. Its two HTML reading parts and landing
page were checked in the browser at desktop and 390px viewport settings.
The menu and reading links worked without document-level horizontal overflow.
No browser console errors were reported on the reading pages.

The ReportLab PDF has 29 A4 pages, searchable text, embedded local fonts,
clickable contents/bookmarks and linked sources. All 269 source blocks were
checked against the extracted PDF text. 16 source URLs, source hashes,
page bounds and the three printed correlations were checked. PDF pages
were rendered and visually reviewed, including formulas, prompts and code.
HTML and PDF use the same chapter files. The PDF is included in the ZIP.
The two base-R code snippets were executed against the frozen dataset.

These checks cover the generated materials, not a learner pilot or live
testing of every optional commercial AI product. Editorial mapping and
dated documentation notes are in `booklet/README.md`.

## Condensed reader and research discussion, 27 October 2026

The reader now contains 5,747 source words and 19 PDF pages. All 192 source
blocks, 33 linked targets, 11 bookmarks, source hashes, page bounds and
printed correlations pass the PDF checks. Completeness is checked against
the full source text rather than the minimum page count of the older edition.
The nine reader source files contain no Pandoc Code or CodeBlock nodes.
The removed checklist/project-note sections are absent from those sources.

The local 15-page release check passes its independent raw-data and CSV
cross-checks, local links/anchors, fonts and ZIP contents. Browser checks
of both reading parts, the second-day guide and instructor guide pass at
1440px and 390px widths without horizontal overflow, code blocks or
JavaScript errors. The updated chapter 2.2 title is consistent across them.
PDF pages were rendered and visually inspected; the final paragraph was
shortened to eliminate a nearly empty last page.

The numerical reference scripts and data were not changed. The build used
SkipAnalysis and retained the previously computed results; the independent
release check recalculates the values used here. No new learner pilot or
live AI-account test is claimed by this editorial revision.
