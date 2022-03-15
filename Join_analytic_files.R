

#######################################################################################################################
######################################################################################################################
#
#
# author: Amund R. Tallaksen
# date: March 2022
#
#
# purpose: (1) join together the four separate Michigan JJ files: Wayne, Kalamazoo, PCS, and TCS
# #        (2) create a few new unique ID variables
#          (3) produce final csv file for further analysis
#
#
##################################################################################################################
###################################################################################################################



# packages / set.seed
library(csgjcr)
library(tidyverse)
library(lubridate)
set.seed(1234)


# file path to analytic files
MI_path <- csg_sp_path("JC Research - JJ_Michigan - JJ_Michigan/Data/Converted/Final/Analytic Files")



##################################################################################################################
##################################################################################################################
#
# Import the separate analytic files 
#
#################################################################################################################
#################################################################################################################



# Original file has 17 variables
PCS <- read_csv(file.path(MI_path, "PCS_petitions.csv"), show_col_types = FALSE) 


# Original file has 19 variables
TCS <- read_csv(file.path(MI_path, "tcs_front_end_analytic_file.csv"), show_col_types = FALSE)


# Original file has 16 variables + file needs to have its pre-2016 rows removed
Wayne <- read_csv(file.path(MI_path, "wayne_petitions_for_append_2022-03-14.csv"), show_col_types = FALSE) %>%
  mutate(temp_pet_date = mdy(petition_date)) %>% filter(temp_pet_date >= "2016-01-01") %>% select(-temp_pet_date)



##################################################################################################################
##################################################################################################################
#
# Initial cleaning, etc.
#
##################################################################################################################
##################################################################################################################



PCS <- PCS %>%
  
  # Add "MISSING" into NA rows
  mutate(race_ethnic = ifelse(is.na(race_ethnic), "MISSING", race_ethnic)) %>%
  mutate(sex = ifelse(is.na(sex), "MISSING", sex)) %>%
  mutate(disp_desc = ifelse(is.na(disp_desc), "MISSING", disp_desc)) %>%
  mutate(violation_prob_ind = ifelse(is.na(violation_prob_ind), "MISSING", violation_prob_ind)) %>%
  mutate(off_lvl_pet = ifelse(is.na(off_lvl_pet), "MISSING", off_lvl_pet)) %>%
  mutate(off_lvl_disp = ifelse(is.na(off_lvl_disp), "MISSING", off_lvl_disp)) %>%
  
  # Add 3 columns in order to match with other files (fill new columns with NA)
  mutate(violation_cnst_ind = NA) %>% relocate(violation_cnst_ind, .after = "violation_prob_ind") %>%
  mutate(off_stat_mflag = NA) %>% relocate(off_stat_mflag, .after = "off_lvl_disp") %>%
  mutate(num_chg = NA) %>% relocate(num_chg, .before = "num_chg_adj")



TCS <- TCS %>%
  
  # Add "MISSING" into NA rows
  mutate(race_ethnic = ifelse(is.na(race_ethnic), "MISSING", race_ethnic)) %>%
  mutate(sex = ifelse(is.na(sex), "MISSING", sex)) %>%
  mutate(disp_desc = ifelse(is.na(disp_desc), "MISSING", disp_desc)) %>%
  mutate(violation_prob_ind = ifelse(is.na(violation_prob_ind), "MISSING", violation_prob_ind)) %>%
  mutate(violation_cnst_ind = ifelse(is.na(violation_cnst_ind), "MISSING", violation_cnst_ind)) %>%
  mutate(off_lvl_pet = ifelse(is.na(off_lvl_pet), "MISSING", off_lvl_pet)) %>%
  mutate(off_lvl_disp = ifelse(is.na(off_lvl_disp), "MISSING", off_lvl_disp)) %>%

  # Add 1 column in order to match with other files (fill new columns with NA)
  mutate(off_stat_mflag = NA) %>% relocate(off_stat_mflag, .after = "off_lvl_disp")



Wayne <- Wayne %>%
  
  # Add "MISSING" into NA rows
  mutate(race_ethnic = ifelse(is.na(race_ethnic), "MISSING", race_ethnic)) %>%
  mutate(sex = ifelse(is.na(sex), "MISSING", sex)) %>%
  mutate(disp_desc = ifelse(is.na(disp_desc), "MISSING", disp_desc)) %>%
  mutate(off_lvl_pet = ifelse(is.na(off_lvl_pet), "MISSING", off_lvl_pet)) %>%
  mutate(off_lvl_disp = ifelse(is.na(off_lvl_disp), "MISSING", off_lvl_disp)) %>%
  
  # Add 4 columns in order to match with other files (fill new columns with NA)
  mutate(offense_date = NA) %>% relocate(offense_date, .after = "petition_date") %>%
  mutate(violation_prob_ind = NA) %>% relocate(violation_prob_ind, .after = "offense_date") %>%
  mutate(violation_cnst_ind = NA) %>% relocate(violation_cnst_ind, .after = "violation_prob_ind") %>%
  mutate(cc_ind = NA) %>% relocate(cc_ind, .after = "violation_cnst_ind") %>%
  
  # Move columns into place
  relocate(disp_date, .after = "cc_ind") %>%
  relocate(disp_desc, .after = "disp_date") %>%
  relocate(off_lvl_disp, .after = "off_lvl_pet") %>%
  relocate(num_chg, .after = "off_stat_mflag")



##########################################################################################################
##########################################################################################################
#
# Join files
#
###########################################################################################################
###########################################################################################################

Joined <- rbind(PCS, TCS, Wayne)
























