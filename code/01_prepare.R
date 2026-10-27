# Rebuild from the committed snapshot; no network and no imputation.
source("code/lib.R", encoding = "UTF-8")
manifest <- jsonlite::fromJSON("data/raw/manifest.json", simplifyVector = FALSE)
for (s in manifest$sources) {
  fail_if(!identical(unname(tools::md5sum(file.path("data/raw", s$file))), s$md5),
          paste("Raw file checksum mismatch:", s$file))
}
h <- read_series("data/raw/hicp.json", list(freq = "M", geo = "HR", coicop18 = "TOTAL", unit = "RCH_A"))
e <- read_series("data/raw/expectations.json", list(freq = "M", geo = "HR", indic = "BS-PT-NY", s_adj = "NSA", unit = "BAL"))
fail_if(!identical(h$month, e$month), "Source keys differ.")
d <- data.frame(month = h$month, country = "HR", hicp_yoy_pct = h$value,
                expectations_balance = e$value, hicp_unit = "RCH_A",
                expectations_unit = "BAL", survey_adjustment = "NSA",
                hicp_flag = h$flag, expectations_flag = e$flag)
validate_data(d)
dir.create("data/processed", recursive = TRUE, showWarnings = FALSE)
write.csv(d, "data/processed/croatia_inflation.csv", row.names = FALSE, na = "NA")
cat("Prepared", nrow(d), "rows from the frozen source files.\n")
