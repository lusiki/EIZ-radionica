# EIZ: start here. Base R only; no network or additional packages.
# Open the repository folder in Positron. Run from its root directory.
source("code/lib.R", encoding = "UTF-8")
d <- read_workshop_data()
print(head(d))
print(c(rows = nrow(d), unique_months = length(unique(d$month)),
        missing_values = sum(is.na(d))))
print(range(d$hicp_yoy_pct))
print(range(d$expectations_balance))

# Task 2.2: explain each line before running it.
d$year <- as.integer(substr(d$month, 1, 4))
year_2022 <- d[d$year == 2022, ]
stopifnot(nrow(year_2022) == 12)
mean_hicp_2022 <- mean(year_2022$hicp_yoy_pct)
print(mean_hicp_2022)

# TODO: calculate the mean expectations balance in 2022.
# TODO: produce a table of yearly means and check 12 months in every year.
# TODO: draw each series in its own panel and label its units.
# Keep your work in submissions/ (ignored by Git).
# Reference solution: code/02_analysis.R; open after attempting the tasks.
