# Run from project root after renv::restore(); uses frozen data only.
if (!file.exists("code/lib.R")) stop("Run from the repository root.")
source("code/01_prepare.R", encoding = "UTF-8")
source("code/02_analysis.R", encoding = "UTF-8")
source("code/check.R", encoding = "UTF-8")
