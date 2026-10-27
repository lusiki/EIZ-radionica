# OPTIONAL instructor extension, outside the seven-hour core.
# Teaching association only; it is not a causal or forecasting model.
source("code/lib.R", encoding = "UTF-8")
d <- read_workshop_data()
# Prespecified direction and intercept; no model search:
fit <- lm(hicp_yoy_pct ~ expectations_balance, data = d)
# Bartlett kernel, 12 monthly lags chosen for demonstration, no prewhitening,
# finite-sample adjustment. These choices do not establish a valid model.
V <- sandwich::NeweyWest(fit, lag = 12, prewhite = FALSE, adjust = TRUE)
b <- coef(fit)
se <- sqrt(diag(V))
tab <- data.frame(term = names(b), estimate = b, hac_se = se,
                  lower_95 = b - qnorm(.975) * se, upper_95 = b + qnorm(.975) * se)
print(tab, row.names = FALSE)
cat("Intervals are asymptotic and conditional on model assumptions.\n",
    "HAC does not remove endogeneity, common shocks or nonstationarity.\n",
    "No evidence of causation or out-of-sample predictive performance.\n")
