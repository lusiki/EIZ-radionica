# Descriptive reference solution; no hypothesis tests or causal estimates.
source("code/lib.R", encoding = "UTF-8")
d <- read_workshop_data()
out <- Sys.getenv("EIZ_OUTPUT_DIR", "results")
dir.create(out, recursive = TRUE, showWarnings = FALSE)
d$year <- as.integer(substr(d$month, 1, 4))
annual <- aggregate(d[c("hicp_yoy_pct", "expectations_balance")], list(year = d$year), mean)
annual$n_months <- as.integer(table(d$year))
write.csv(annual, file.path(out, "annual_summary.csv"), row.names = FALSE)
groups <- list(full_sample = rep(TRUE, nrow(d)), years_2015_2019 = d$year <= 2019,
               years_2020_2024 = d$year >= 2020)
correlations <- do.call(rbind, lapply(names(groups), function(nm) {
  z <- d[groups[[nm]], ]
  data.frame(sample = nm, n = nrow(z), pearson_r = cor(z$hicp_yoy_pct, z$expectations_balance))
}))
write.csv(correlations, file.path(out, "correlations.csv"), row.names = FALSE)
audit <- data.frame(rows = nrow(d), unique_months = length(unique(d$month)),
  first_month = min(d$month), last_month = max(d$month), missing_values = sum(is.na(d)),
  hicp_min = min(d$hicp_yoy_pct), hicp_max = max(d$hicp_yoy_pct),
  expectations_min = min(d$expectations_balance), expectations_max = max(d$expectations_balance))
write.csv(audit, file.path(out, "audit.csv"), row.names = FALSE)
table_lines <- c("| Godina | HICP: prosjek mjesečnih godišnjih stopa (%) | Saldo: godišnji prosjek (bodovi) |",
                 "|---|---:|---:|",
                 sprintf("| %d | %.2f | %.2f |", annual$year, annual$hicp_yoy_pct, annual$expectations_balance),
                 "", sprintf("Istodobna korelacija cijelog uzorka (n = 120): **%.4f**.", correlations$pearson_r[1]))
writeLines(enc2utf8(table_lines), "materials/_results-table.md", useBytes = TRUE)
source("code/theme.R", encoding = "UTF-8")
draw_workshop_series(d, file.path(out, "inflation_expectations.svg"))
capture.output(sessionInfo(), file = file.path(out, "session-info.txt"))
cat("Descriptive outputs written to", out, "\n")
