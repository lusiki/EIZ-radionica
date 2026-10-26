# Focused data and result checks, including deliberately corrupted inputs.
source("code/lib.R", encoding = "UTF-8")
d <- read_workshop_data()
must_fail <- function(z, pattern) {
  err <- tryCatch({ validate_data(z); NULL }, error = identity)
  if (is.null(err) || !grepl(pattern, conditionMessage(err), fixed = TRUE))
    stop("Guard failed: ", pattern)
}
z <- d; z$month[2] <- z$month[1]; must_fail(z, "Duplicate")
must_fail(d[-1, ], "120")
z <- d; z$hicp_yoy_pct[1] <- NA_real_; must_fail(z, "Missing")
z <- d; z$hicp_unit <- "I15"; must_fail(z, "RCH_A")
z <- d; z$expectations_unit <- "PCT"; must_fail(z, "BAL")
z <- d; z$survey_adjustment <- "SA"; must_fail(z, "NSA")
must_fail(d[nrow(d):1, ], "order")
z <- d; z$expectations_balance[1] <- 101; must_fail(z, "support")
out <- Sys.getenv("EIZ_OUTPUT_DIR", "results")
for (nm in c("annual_summary.csv", "correlations.csv", "audit.csv")) {
  actual <- read.csv(file.path(out, nm))
  expected <- read.csv(file.path("data/reference", nm))
  if (!isTRUE(all.equal(actual, expected, tolerance = 1e-10)))
    stop("Reference mismatch: ", nm, ". Investigate before updating the baseline.")
}
stopifnot(all(read.csv(file.path(out, "annual_summary.csv"))$n_months == 12))
cat("PASS: sample, keys, missingness, units, ordering, support and frozen numeric references.\n")
