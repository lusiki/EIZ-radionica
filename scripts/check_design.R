tok <- yaml::read_yaml("design-tokens.yml")
scss <- paste(readLines("styles/_tokens.scss", warn = FALSE), collapse = "\n")
for (nm in names(tok$color$palette)) {
  pattern <- paste0("\\$tok-", nm, ":\\s*", tok$color$palette[[nm]], "\\b")
  if (!grepl(pattern, scss, perl = TRUE, ignore.case = TRUE)) stop("Token mismatch: ", nm)
}
style <- paste(readLines("styles/custom.scss", warn = FALSE), collapse = "\n")
if (grepl("#[0-9a-fA-F]{3,8}\\b", style)) stop("Raw colour outside token file.")
if (!grepl("66ch", scss, fixed = TRUE)) stop("Missing text measure.")
for (path in c("Jost-Regular.ttf","Jost-Medium.ttf","Literata-Regular.ttf",
 "Literata-Italic.ttf","JetBrainsMono-Regular.ttf","OFL-jost.txt","OFL-literata.txt","OFL-jetbrainsmono.txt")) {
  if (!file.exists(file.path("styles/fonts", path))) stop("Missing font or licence: ", path)
}
cat("PASS: colour tokens, text measure, local fonts and font licences.\n")
