# DELIBERATELY WRONG TEACHING EXAMPLE. Do not use for research.
# This script is illustrative, not an archived response from a real model.
d <- read.csv("data/processed/croatia_inflation.csv")
d <- d[-1, ]                         # Why remove a valid month?
d$expected_inflation_pct <- d$expectations_balance / 100  # Wrong meaning/unit.
x <- log(d$hicp_yoy_pct)              # Undefined for zero/negative rates.
x <- x[is.finite(x)]                  # Hides a problem by silently changing sample.
fit <- lm(hicp_yoy_pct ~ expected_inflation_pct - 1, data = d) # No justified intercept removal.
print(summary(fit))
cat("This proves that expectations cause inflation.\n")  # Unsupported causal claim.
