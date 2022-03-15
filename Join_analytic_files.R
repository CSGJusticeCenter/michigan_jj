

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


# Original file has 17 variables + remove any pre-2016 petition rows
PCS <- read_csv(file.path(MI_path, "PCS_petitions.csv"), show_col_types = FALSE) %>%
  mutate(temp_pet_date = mdy(petition_date)) %>% filter(temp_pet_date >= "2016-01-01") %>% select(-temp_pet_date)

# pet_id_orig = all unique
PCS %>%
  distinct(pet_id_orig) %>%
  nrow()

###################################


# Original file has 19 variables + remove any pre-2016 petition rows
TCS <- read_csv(file.path(MI_path, "tcs_front_end_analytic_file.csv"), show_col_types = FALSE) %>%
  mutate(temp_pet_date = mdy(petition_date)) %>% filter(temp_pet_date >= "2016-01-01") %>% select(-temp_pet_date)

# pet_id_orig = all unique
TCS %>%
  distinct(pet_id_orig) %>%
  nrow()

###################################

# Original file has 16 variables + remove any pre-2016 petition rows
Wayne <- read_csv(file.path(MI_path, "wayne_petitions_for_append_2022-03-14.csv"), show_col_types = FALSE) %>%
  mutate(temp_pet_date = mdy(petition_date)) %>% filter(temp_pet_date >= "2016-01-01") %>% select(-temp_pet_date)

# pet_id_orig = all unique
Wayne %>%
  distinct(pet_id_orig) %>%
  nrow()

####################################

# Original file has 17 variables + remove any pre-2016 rows (by OFFENSE date)
Kalamazoo <- read_csv(file.path(MI_path, "analytic_file_KAL.csv"), show_col_types = FALSE) %>%
  mutate(temp_off_date = mdy(offense_date)) %>% filter(temp_off_date >= "2016-01-01") %>% select(-temp_off_date)

# pet_id_orig = all unique
Kalamazoo %>%
  distinct(pet_id_orig) %>%
  nrow()


##################################################################################################################
##################################################################################################################
#
# Initial cleaning, etc.
#
##################################################################################################################
##################################################################################################################



PCS <- PCS %>%
  
  # Add 3 columns in order to match with other files (fill new columns with NA)
  mutate(violation_cnst_ind = NA) %>% relocate(violation_cnst_ind, .after = "violation_prob_ind") %>%
  mutate(off_stat_mflag = NA) %>% relocate(off_stat_mflag, .after = "off_lvl_disp") %>%

  # Make sure Kid ID is unique once joined
  mutate(kid_id = paste0(33,kid_id_orig)) %>% relocate(kid_id, .after = "kid_id_orig")



TCS <- TCS %>%

  # Add 1 column in order to match with other files (fill new columns with NA)
  mutate(off_stat_mflag = NA) %>% relocate(off_stat_mflag, .after = "off_lvl_disp") %>%

  # Make sure Kid ID is unique once joined
  mutate(kid_id = paste0(44,kid_id_orig)) %>% relocate(kid_id, .after = "kid_id_orig")


Wayne <- Wayne %>%
  
  # Add 4 columns in order to match with other files (fill new columns with NA)
  mutate(offense_date = NA) %>% relocate(offense_date, .after = "petition_date") %>%
  mutate(violation_prob_ind = NA) %>% relocate(violation_prob_ind, .after = "offense_date") %>%
  mutate(violation_cnst_ind = NA) %>% relocate(violation_cnst_ind, .after = "violation_prob_ind") %>%
  mutate(cc_ind = NA) %>% relocate(cc_ind, .after = "violation_cnst_ind") %>%
  
  # Shorten age variable
  mutate(age = str_sub(age, 1, 2)) %>%
  
  # Move columns into place
  relocate(disp_date, .after = "cc_ind") %>%
  relocate(disp_desc, .after = "disp_date") %>%
  relocate(off_lvl_disp, .after = "off_lvl_pet") %>%
  relocate(num_chg, .after = "off_stat_mflag") %>%

  # Make sure Kid ID is unique once joined
  mutate(kid_id = paste0(22,kid_id_orig)) %>% relocate(kid_id, .after = "kid_id_orig")


Kalamazoo <- Kalamazoo %>%
  mutate(file_src = 1) %>%
  mutate(case_type = case_when(case_type %in% "DL" ~ 1,
                               case_type %in% "DJ" ~ 2,
                               case_type %in% "FJ" ~ 3,
                               case_type %in% "IJ" ~ 4,
                               case_type %in% "TL" ~ 5)) %>%
  mutate(race_ethnic = case_when(race_ethnic %in% "White" ~ 1,
                                 race_ethnic %in% "Black" ~ 2,
                                 race_ethnic %in% "Hispanic" ~ 3,
                                 race_ethnic %in% "AI/AN" ~ 4,
                                 race_ethnic %in% "A/AP" ~ 5,
                                 race_ethnic %in% "multiracial" ~ 6,
                                 race_ethnic %in% "Other" ~ 7)) %>%
  mutate(sex = case_when(sex %in% "Female" ~ 1,
                         sex %in% "Male" ~ 2)) %>%
  mutate(petition_date = str_replace_all(petition_date,"/","")) %>%
  mutate(offense_date = str_replace_all(offense_date,"/","")) %>%
  mutate(disp_date = str_replace_all(disp_date,"/","")) %>%
  mutate(disp_desc = case_when(disp_desc %in% "Adjudication" ~ 1,
                               disp_desc %in% "Non-Adjudication" ~ 2,
                               disp_desc %in% "Other" ~ 3)) %>%
  mutate(off_lvl_pet = case_when(off_lvl_pet %in% "felony-person" ~ 1,
                                 off_lvl_pet %in% "felony-not-person" ~ 2,
                                 off_lvl_pet %in% "misdemeanor-person" ~ 3,
                                 off_lvl_pet %in% "misdemeanor-not-person" ~ 4,
                                 off_lvl_pet %in% "status" ~ 5,
                                 off_lvl_pet %in% "other" ~ 6)) %>%
  mutate(off_lvl_disp = case_when(off_lvl_disp %in% "felony-person" ~ 1,
                                  off_lvl_disp %in% "felony-not-person" ~ 2,
                                  off_lvl_disp %in% "misdemeanor-person" ~ 3,
                                  off_lvl_disp %in% "misdemeanor-not-person" ~ 4,
                                  off_lvl_disp %in% "status" ~ 5,
                                  off_lvl_disp %in% "other" ~ 6,
                                  off_lvl_disp %in% "no adjudicated offense" ~ 7)) %>%
  
  # Add 4 columns in order to match with other files (fill new columns with NA)
  mutate(violation_prob_ind = NA) %>% relocate(violation_prob_ind, .after = "offense_date") %>%
  mutate(violation_cnst_ind = NA) %>% relocate(violation_cnst_ind, .after = "violation_prob_ind") %>%
  mutate(cc_ind = NA) %>% relocate(cc_ind, .after = "violation_cnst_ind") %>%
  
  # Make sure Kid ID is unique once joined
  mutate(kid_id = paste0(11,kid_id_orig)) %>% relocate(kid_id, .after = "kid_id_orig")

  


##########################################################################################################
##########################################################################################################
#
# Join files and create new ID variables
#
###########################################################################################################
###########################################################################################################



Joined <- rbind(PCS, TCS, Wayne, Kalamazoo) %>%
  mutate(pet_id = paste0(555, row_number())) %>% relocate(pet_id, .after = "pet_id_orig") %>%
  mutate(age_cat = case_when(age < 12 ~ 1,
                             age >= 12 & age < 14 ~ 2,
                             age >= 14 & age < 16 ~ 3,
                             age >= 16 & age < 18 ~ 4,
                             age >= 18 & age < 21 ~ 5)) %>%
  relocate(age_cat, .after = "age") 


rm(PCS, TCS, Wayne, Kalamazoo)


# pet_id = all unique
Joined %>%
  distinct(pet_id) %>%
  nrow()


###########################################################################################################
############################################################################################################
#
# Create csv file
#
#############################################################################################################
#############################################################################################################


write.csv(as.data.frame(Joined), file = file.path(MI_path, "MI_JJ_joined_file.csv"))





















  