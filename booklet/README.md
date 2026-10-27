# Extended reader / editorial and build notes

The latest content revision is documented in the final section below;
earlier sections record the successive editorial history.

This is an edited reading edition of the original two workshop days, not
an unchanged historical facsimile. The source is commit
`d942375f366e5c2aba7081b346b0cc3cb27a1c08`, `slides/day1.qmd` and
`slides/day2.qmd`. The original attribution (Luka Šikić, UNICATH) is retained.
The historical source remains in Git. The original HTML/PDF exports are
untouched. No new event date, institutional approval or licence is asserted.

The reader connects eight topics with the short day guides and practical
exercises. It provides the extended explanations behind each example. Repetition, promotional language, unsupported
statistics and outdated UI recipes were condensed or replaced. Original
examples with unverified findings were changed into hypothetical research
extensions or connected to the frozen Croatian teaching dataset.

| Original section | Revised chapter | Retained and corrected |
| --- | --- | --- |
| Day 1, block 1.1 | `_01-foundations.qmd` | LLM explanation, limitations, research phases, integrity. Probability, context, tool access and permissions corrected |
| Day 1, block 1.2 | `_02-search.qmd` | Three-stage query demonstration, triple verification, search patterns, independent exercise. Academic-filter guarantees and undefined IAG removed |
| Day 1, block 1.3 | `_03-deep-research.qmd` | Plan, report, limitations, verification, synthesis. Speculative internal architecture and colour-based verification replaced |
| Day 1, block 1.4 | `_04-structure.qmd` | Five prompt principles, four-step outline demonstration, hypotheses and follow-ups. Model ranking and predetermined methodological justification removed |
| Day 2, block 2.1 | `_05-agents.qmd` | Agent workflow, five analytical steps, OLS/HAC and sensitivity extension. Panel, p-value, causal, memory and safety misconceptions corrected |
| Day 2, block 2.2 | `_06-ide.qmd` | IDE assistance, tool comparison, iterative demonstration and exercises. RStudio/Copilot, extension compatibility and current Posit Assistant corrected |
| Day 2, block 2.3 | `_07-notebooks.qmd` | Notebook metaphor, five exploratory questions, comparison of approaches, hidden state and export. Same dataset throughout, reproducibility explained without unsupported rates |
| Day 2, block 2.4 | `_08-writing.qmd` | Writing as research, six prompts, four editing passes, Croatian terminology and final exercise. Unsupported productivity/DOI statistics and universal permissions removed |

## One source for HTML and PDF

Edit the numbered `_*.qmd` files. Quarto includes them in the two HTML
reading pages. `scripts/build_booklet.py` reads these same files through
Quarto's bundled Pandoc and typesets a searchable PDF with ReportLab.
No separate prose copy needs to be maintained. The source ZIP includes
the chapter files, PDF builder, font licences and the generated PDF.

`scripts/build.ps1` builds the PDF before packaging and rendering the site.
Set `EIZ_PYTHON` to a Python executable with `reportlab` installed if it is
not on PATH. On this workstation the build can also discover the bundled
Codex Python runtime. The basic R examples run independently of Python and ReportLab.
To rebuild only the PDF, run `python scripts/build_booklet.py` from the root.

`scripts/check_booklet.py` checks chapter coverage in the PDF, metadata,
bookmarks, external links, numerical examples and preserved local source
paths. PDF visual inspection is still needed after layout/content changes.

## Documentation checked on 26 October 2026

Primary links are placed beside their claims in the chapters. Important
updates include Posit Assistant replacing Positron Assistant and Databot
from Positron 2026.07. RStudio's existing Copilot support. Retrieval of
selected project passages rather than guaranteed simultaneous reading of
all files. Selectable sources and editable plans in Gemini Deep Research.
And current Colab support for conversational/agentic notebook operations.
Do not refresh this date without checking the supporting pages again.

The original sources mention media attention and an alleged 31,536-article
corpus. No such verified corpus is bundled. Those numerical claims are
not revived. No synthetic media observations replace them. The printed
correlations refer only to the frozen official 2015–2024 teaching data.

The optional reading exercises offer further ways to explore the examples.
Revision notes for readers are on `index.qmd`. This file records the editorial mapping for maintainers.

## Prose edit, 27 October 2026

The workshop pages and reader were edited using
[Humanizer 3.1.0](https://github.com/blader/humanizer/blob/main/SKILL.md).
The pass removed repeated closers, revision commentary inside lessons,
unnecessary contrasts and decorative paragraph labels. Croatian teaching
prose remains neutral. Methodological distinctions and cautions are retained.
Code, quoted examples, link targets and YAML metadata were checked against
the previous commit and left unchanged. The documentation verification
date above still refers to the factual review, not this language edit.

## Workshop tone, 27 October 2026

The day guides, exercises and shared reader now use an open workshop format.
Repeated teacher/student roles, fixed timings, word counts and grading
criteria were replaced with practical suggestions and questions for reflection.
The eight headings, crosslinks, source verification and numerical examples
remain connected. Both HTML and PDF are rebuilt from these sources.

## Simpler activities, 27 October 2026

The live workshop uses one discussion question, one displayed example and
one small attempt per topic. The canonical examples in materials/activities/
are included by both day pages and the all-examples page. They require only
the page and an AI conversation. Numerical tasks use three actual months
and simple arithmetic, with R code read and modified in chat.

Each reader chapter now starts with the corresponding short activity.
Full-data workflows, file management, notebooks and advanced methods are
clearly presented as optional further reading. No activity depends on
written notes or files produced in an earlier topic.

## Full dataset with a simple workflow, 27 October 2026

This revision supersedes the three-month activities above. All eight topics
use the full 120-month CSV through one AI conversation with code execution.
Participants choose a question, verify measures, revise a flawed summary,
plan and execute descriptive analysis, compare periods and write about
150 words supported by a graph and checked numbers. The shared chapter
openers match the day pages and exercises. Desktop R, project folders,
separate logs and advanced methods remain optional further reading.


## Research discussion and instructions without code, 27 October 2026

This revision supersedes the longer reader and its optional IDE, notebook,
R-code and project-management passages described above. Both parts now
use natural-language instructions and prompts throughout. Repeated source
checklists, project-note boxes and continuation closers were removed.
The eight-topic sequence, frozen Croatian data and numerical distinctions
remain. Chapter 2.2 is now "Izradite i objasnite prikaze" everywhere.

Goldsmith-Pinkham's primary essays and demonstrations are integrated where
they explain a research decision: execution costs and judgment, verification
debt, complementary stages, data meaning, choosing a display, and writing
to understand. They are identified as arguments or demonstrations, not
causal evidence of learning gains. A six-item annotated reading list is
available in materials/sources.qmd. The media-text extension is a proposed
new project, not a result from the frozen two-series dataset.

The live activities and instructor guide follow the same approach. Students
explain an expected result, interpret a display and justify a choice.
Writing starts with their own draft, followed by AI comments and their own
revision, with language assistance available afterwards. Reader openers
summarize these activities; detailed prompts remain on the day pages.
Reference scripts stay in the repository, separate from the reading text.

## Reader prose pass, 27 October 2026

The introduction and all eight chapters now use more direct Croatian
explanations, concrete questions and shorter transitions. Repeated abstract
conclusions were removed. Reader prose contains no semicolons. The copied
prompts, numerical examples, link targets and eight-topic structure are
unchanged. The rebuilt edition has 5,426 source words and 19 pages.

## Short discussion extensions, 27 October 2026

The following extension retains that prose pass and adds one short section
to each of the eight steps, using Luka Šikić's How Economics Absorbed AI,
its supplements, and two linked primary studies. The additions cover local
knowledge, source access, forecasts, portable plans, LLM measurement,
denominators, testing a checker, and independent understanding. Classroom
applications are distinguished from findings. The collection is not treated
as a census, its model is described as a theoretical sketch, and the learning
experiments are not generalized to long-term economics education.

The instructor page supplies eight matching discussion prompts. Sources
are linked beside the new passages and on the sources page. Existing
activity prompts, numerical examples and the eight-step structure remain.
The extended edition has 6,221 source words and 20 pages.
