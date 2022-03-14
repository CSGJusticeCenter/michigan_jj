

library(csgjcr)
library(tidyverse)

MI_path <- csg_sp_path("JC Research - JJ_Michigan - JJ_Michigan/Data/Converted/Final/Analytic Files")


PCS <- read_csv(file.path(MI_path, "PCS_petitions.csv"), show_col_types = FALSE)


