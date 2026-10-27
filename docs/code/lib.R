# Shared assertions. Core data checks require base R only.
expected_months <- format(seq(as.Date("2015-01-01"), as.Date("2024-12-01"), by = "month"), "%Y-%m")
fail_if <- function(condition, message) if (isTRUE(condition)) stop(message, call. = FALSE)

validate_data <- function(d) {
  cols <- c("month", "country", "hicp_yoy_pct", "expectations_balance",
            "hicp_unit", "expectations_unit", "survey_adjustment", "hicp_flag", "expectations_flag")
  fail_if(!identical(names(d), cols), "Unexpected columns: consult data/dictionary.qmd.")
  fail_if(nrow(d) != 120L, "Expected exactly 120 monthly rows.")
  fail_if(anyDuplicated(d$month) > 0L, "Duplicate month key.")
  fail_if(!identical(d$month, expected_months), "Months missing, out of order or outside the fixed sample.")
  fail_if(anyNA(d), "Missing value: investigate; do not delete or interpolate silently.")
  fail_if(!all(d$country == "HR"), "Country must be HR.")
  fail_if(!all(d$hicp_unit == "RCH_A"), "HICP must be annual percentage change, RCH_A.")
  fail_if(!all(d$expectations_unit == "BAL"), "Expectations must be a balance, BAL.")
  fail_if(!all(d$survey_adjustment == "NSA"), "Expected unadjusted survey series, NSA.")
  for (nm in c("hicp_yoy_pct", "expectations_balance")) {
    fail_if(!is.numeric(d[[nm]]) || any(!is.finite(d[[nm]])), paste("Non-finite numeric data:", nm))
  }
  fail_if(any(abs(d$expectations_balance) > 100), "Balance outside its [-100,100] support.")
  invisible(d)
}

read_workshop_data <- function(path = "data/processed/croatia_inflation.csv") {
  d <- read.csv(path, stringsAsFactors = FALSE, colClasses = c(
    "character", "character", "numeric", "numeric", rep("character", 5)), na.strings = "NA")
  validate_data(d)
  d
}

# JSON-stat reader deliberately accepts only one selected series.
read_series <- function(path, filters) {
  j <- jsonlite::fromJSON(path, simplifyVector = FALSE)
  ids <- unlist(j$id, use.names = FALSE)
  sizes <- unlist(j$size, use.names = FALSE)
  fail_if(!identical(j$class, "dataset") || !("time" %in% ids), "Invalid JSON-stat dataset.")
  fail_if(any(sizes[ids != "time"] != 1), "Expected exactly one series; check API filters.")
  for (nm in names(filters)) {
    actual <- names(j$dimension[[nm]]$category$index)
    fail_if(!identical(actual, filters[[nm]]), paste("Unexpected dimension", nm))
  }
  ti <- unlist(j$dimension$time$category$index)
  months <- names(ti)[order(ti)]
  values <- rep(NA_real_, length(months))
  flags <- rep("", length(months))
  # JSON-stat sparse offsets are zero based, not positions in the value object.
  if (length(j$value)) {
    offsets <- as.integer(names(j$value))
    if (is.null(names(j$value))) offsets <- seq_along(j$value) - 1L
    values[offsets + 1L] <- vapply(j$value, function(v) if (is.null(v)) NA_real_ else as.numeric(v), numeric(1))
  }
  if (length(j$status)) {
    offsets <- as.integer(names(j$status))
    if (is.null(names(j$status))) offsets <- seq_along(j$status) - 1L
    flags[offsets + 1L] <- unlist(j$status, use.names = FALSE)
  }
  out <- data.frame(month = months, value = values, flag = flags)
  out <- out[out$month %in% expected_months, , drop = FALSE]
  fail_if(!identical(out$month, expected_months), "Source does not cover the fixed sample.")
  fail_if(anyNA(out$value), "Source contains missing observations.")
  out
}
