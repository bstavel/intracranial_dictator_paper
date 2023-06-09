#### batch script for regressions on scf cluster ###

### ALL SUBJECTS!!!! ###

## libraries ##
library(tidyverse)
library(ggplot2)
library(magrittr)
library(zoo)
library(lme4)
library(doParallel)
library(parallel)
library(foreach)
library(here)
library(fs)

## hand written functions ##
source(path(here(), "R", "get_null_average_r2_dist.R"))
source(path(here(), "R", 'mutate_cond.R'))

## paralellization ##
nCores <- 16
registerDoParallel(nCores)

## regression parameters ##
# save info needed for regressions #
niter <- 1000

## subs to run ##
subs <- c("IR9", "IR16", "IR26", "IR28", "IR35", "IR57", "IR39", "GP51", "DA9", "ST40")

for(sub in subs){
  # Null main file out each time #
  power_behave <- NULL
  print(sub)
  ## electrodes ##
  # load specific regions #
  file_path_to_ofc_elecs <- path(here(), "munge", "combined_electrode_info_with_bob.csv")
  elecs_to_use <- read.csv(file_path_to_ofc_elecs)
  # prep #
  all_elecs <- elecs_to_use %>%
    filter(subject == sub) %>%
    filter(grepl("cing", Loc.Meeting, ignore.case = T) | grepl("CC", Loc.Meeting, ignore.case = T) |
             grepl("ofc", Loc.Meeting, ignore.case = T) | grepl("orbit", Loc.Meeting, ignore.case = T)) %>%
    filter(!grepl("occipital", Loc.Meeting, ignore.case = T)) %>%
    filter(is.na(Notes)) %>%
    select(Electrode)
  
  ### Presentation ###

  ## read in data ##
  path_hp_clean <- path(here(), "munge", sub, "theta_behave_presentation_rscaler_2575_200.csv")
  power_behave <-  read.csv(path_hp_clean)
  # merge with elecs #
  brain_behave_data <- power_behave %>%
    filter(grepl(paste(all_elecs$Electrode, collapse = "|"), electrodes)) %>%
    rowwise() %>%
    mutate(pie_size = self_var_payoff + other_var_payoff) %>%
    mutate(ratio = other_var_payoff / self_var_payoff) %>%
    mutate(max_self = max(self_var_payoff, 10)) %>%
    mutate(max_other = max(other_var_payoff, 10)) %>%
    mutate(min_self = min(self_var_payoff, 10)) %>%
    mutate(min_other = min(other_var_payoff, 10)) %>%
    mutate(max = max(self_var_payoff, other_var_payoff)) %>%
    mutate(min = min(self_var_payoff, other_var_payoff)) %>%
    mutate(trial_type = if_else(self_var_payoff == other_var_payoff, "equality",
                                if_else(self_var_payoff > other_var_payoff,
                                        "Advantageous", "Disadvantageous"))) %>%
    ungroup()   %>%
    filter(trial_type != "equality")

  # elecs of interest #
  all_electrodes <- unique(brain_behave_data$electrodes)

  # bin names #
  nBins <- colnames(power_behave %>% select(starts_with("bin_")))[1:15]

  # regs of interest #
  regressors_to_use <- c("self_var_payoff", "other_var_payoff", "max", "min")

  # split by adv and dis #
  brain_behave_data_adv <- brain_behave_data %>% filter(trial_type == "Advantageous")
  brain_behave_data_dis <- brain_behave_data %>% filter(trial_type == "Disadvantageous")

  # run_permuted_null_average_r2(brain_behave_data,
  #                              permute_data = brain_behave_data,
  #                              electrodes = all_electrodes,
  #                              regressors = regressors_to_use,
  #                              nBins,
  #                              niter,
  #                              sub = sub,
  #                              tag = "pres-null-average-r2-comb-theta-cperm-hilbertRS")

  run_permuted_null_average_r2(brain_behave_data_adv,
                               permute_data = brain_behave_data,
                               electrodes = all_electrodes,
                               regressors = regressors_to_use,
                               nBins,
                               niter,
                               sub = sub,
                               tag = "pres-null-average-r2-adv-theta-cperm-hilbertRS")


  run_permuted_null_average_r2(brain_behave_data_dis,
                               permute_data = brain_behave_data,
                               electrodes = all_electrodes,
                               regressors = regressors_to_use,
                               nBins,
                               niter,
                               sub = sub,
                               tag = "pres-null-average-r2-dis-theta-cperm-hilbertRS")

  brain_behave_data <- NULL
  


  ## Pre-Choice ##
  
  ## read in data ##
  path_hp_clean <- path(here(), "munge", sub, "theta_behave_choice_rscaler_2575_200.csv")
  power_behave <-  read.csv(path_hp_clean)
  # merge with elecs #
  brain_behave_data <- power_behave %>%
    filter(grepl(paste(all_elecs$Electrode, collapse = "|"), electrodes)) %>%
    rowwise() %>%
    mutate(pie_size = self_var_payoff + other_var_payoff) %>%
    mutate(ratio = other_var_payoff / self_var_payoff) %>%
    mutate(max_self = max(self_var_payoff, 10)) %>%
    mutate(max_other = max(other_var_payoff, 10)) %>%
    mutate(min_self = min(self_var_payoff, 10)) %>%
    mutate(min_other = min(other_var_payoff, 10)) %>%
    mutate(max = max(self_var_payoff, other_var_payoff)) %>%
    mutate(min = min(self_var_payoff, other_var_payoff)) %>%
    mutate(trial_type = if_else(self_var_payoff == other_var_payoff, "equality",
                                if_else(self_var_payoff > other_var_payoff,
                                        "Advantageous", "Disadvantageous"))) %>%
    ungroup()   %>%
    filter(trial_type != "equality")
  
  # elecs of interest #
  all_electrodes <- unique(brain_behave_data$electrodes)
  
  # bin names #
  nBins <- colnames(brain_behave_data %>% select(starts_with("pre_")))
  
  # regs of interest #
  regressors_to_use <- c("self_var_payoff", "other_var_payoff", "max", "min")
  
  # split by adv and dis #
  brain_behave_data_adv <- brain_behave_data %>% filter(trial_type == "Advantageous")
  brain_behave_data_dis <- brain_behave_data %>% filter(trial_type == "Disadvantageous")
  
  # run regressions #
  # run_permuted_null_average_r2(brain_behave_data,
  #                              permute_data = brain_behave_data,
  #                              electrodes = all_electrodes,
  #                              regressors = regressors_to_use,
  #                              nBins,
  #                              niter,
  #                              sub = sub,
  #                              tag = "pre-choice-null-average-r2-comb-theta-cperm-hilbertRS")

  run_permuted_null_average_r2(brain_behave_data_adv,
                               permute_data = brain_behave_data,
                               electrodes = all_electrodes,
                               regressors = regressors_to_use,
                               nBins,
                               niter,
                               sub = sub,
                               tag = "pre-choice-null-average-r2-adv-theta-cperm-hilbertRS")
  
  run_permuted_null_average_r2(brain_behave_data_dis, 
                               permute_data = brain_behave_data,
                               electrodes = all_electrodes, 
                               regressors = regressors_to_use, 
                               nBins, 
                               niter, 
                               sub = sub, 
                               tag = "pre-choice-null-average-r2-dis-theta-cperm-hilbertRS")
  
  ## Post-Choice ##

  # just need to change the bin names for post-choice  #
  nBins <- NULL
  nBins <- colnames(brain_behave_data %>% select(starts_with("post_")))[1:20]


  # run regressions #
  # run_permuted_null_average_r2(brain_behave_data,
  #                              permute_data = brain_behave_data,
  #                              electrodes = all_electrodes,
  #                              regressors = regressors_to_use,
  #                              nBins,
  #                              niter,
  #                              sub = sub,
  #                              tag = "post-choice-null-average-r2-comb-theta-cperm-hilbertRS")

  run_permuted_null_average_r2(brain_behave_data_adv,
                               permute_data = brain_behave_data,
                               electrodes = all_electrodes,
                               regressors = regressors_to_use,
                               nBins,
                               niter,
                               sub = sub,
                               tag = "post-choice-null-average-r2-adv-theta-cperm-hilbertRS")

  run_permuted_null_average_r2(brain_behave_data_dis,
                               permute_data = brain_behave_data,
                               electrodes = all_electrodes,
                               regressors = regressors_to_use,
                               nBins,
                               niter,
                               sub = sub,
                               tag = "post-choice-null-average-r2-dis-theta-cperm-hilbertRS")


  
}