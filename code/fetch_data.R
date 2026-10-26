# Maintainer-only download; never silently replaces an existing snapshot.
# From repository root: Rscript --vanilla code/fetch_data.R [empty-directory]
if (!requireNamespace("jsonlite", quietly = TRUE)) stop("Install jsonlite first.")
args <- commandArgs(trailingOnly = TRUE)
dest <- if (length(args)) args[[1]] else "data/raw"
if (dir.exists(dest) && length(list.files(dest, all.files = TRUE, no.. = TRUE)))
  stop("Destination is not empty. Use a new directory and review revisions.")
dir.create(dest, recursive = TRUE, showWarnings = FALSE)
base <- "https://ec.europa.eu/eurostat/api/dissemination/statistics/1.0/data/"
window <- "&sinceTimePeriod=2015-01&untilTimePeriod=2024-12"
sources <- list(
  hicp = list(file = "hicp.json", dataset = "prc_hicp_minr",
    url = paste0(base, "prc_hicp_minr?lang=EN&freq=M&geo=HR&coicop18=TOTAL&unit=RCH_A", window)),
  expectations = list(file = "expectations.json", dataset = "ei_bsco_m",
    url = paste0(base, "ei_bsco_m?lang=EN&freq=M&geo=HR&indic=BS-PT-NY&s_adj=NSA&unit=BAL", window)))
options(timeout = 180)
for (key in names(sources)) {
  s <- sources[[key]]
  path <- file.path(dest, s$file)
  download.file(s$url, path, mode = "wb", quiet = TRUE, method = "libcurl")
  j <- jsonlite::fromJSON(path, simplifyVector = FALSE)
  if (!identical(j$class, "dataset") || is.null(j$value)) stop("Unexpected API response: ", key)
  sources[[key]]$provider_updated <- j$updated
  sources[[key]]$retrieved_utc <- format(Sys.time(), "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")
  sources[[key]]$md5 <- unname(tools::md5sum(path))
}
jsonlite::write_json(list(
  description = "Croatia, monthly HICP annual change and qualitative price expectations",
  sample_start = "2015-01", sample_end = "2024-12",
  note = "Revised historical data, not real-time vintages. Never mix NSA and SA.",
  provider = "Eurostat; survey source: European Commission DG ECFIN",
  reuse = "Acknowledge European Union / Eurostat and DG ECFIN; see data/README.md.",
  sources = sources), file.path(dest, "manifest.json"), pretty = TRUE, auto_unbox = TRUE)
cat("Snapshot saved to", dest, "\n")
