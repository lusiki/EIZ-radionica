# Dated compatibility record

Revision: 2026-10-26. Windows 11 reference machine.

| Component | Status |
|---|---|
| R 4.6.0 | Reference scripts executed; base-R starter separately exercised |
| Quarto 1.9.38 | Local HTML build checked |
| Packages | renv.lock restored into a separate empty library; reference and optional HAC scripts passed |
| Positron | Recommended teaching interface; terminal R execution does not constitute a full IDE walkthrough |
| RStudio/Copilot | Documented supported integration; not required or interactively tested here |
| AI web accounts | Optional; no account, quota, price or model quality guarantee |
| Claude Code | Optional instructor demonstration; not a student prerequisite |
| Linux/macOS | Not exercised; R font packages may need system dependencies |
| Learner pilot | Not performed by this implementation |

Additional checks: independent Python recalculation against raw JSON and
reference CSVs; 12-page local link and anchor check; ZIP allowlist; base-R
starter run from the unpacked ZIP with user libraries removed from the search
path. Browser checks covered desktop landing/reader/results pages and the
390px mobile navigation, with no horizontal overflow on the checked pages.
The chart embeds its licensed fonts for offline portability. No browser
console errors were reported on the results page.

The build script sets a Windows UTF-8 locale for its process because the
host's inherited C.UTF-8 setting is not accepted by this R installation.
This does not change user or machine environment settings.
