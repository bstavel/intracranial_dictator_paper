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
source(path(here(), "R", "load_behave_data.R"))
source(path(here(), "R", "prep_behave_data.R"))
source(path(here(), "R", "stretch_start_end.R"))
source(path(here(), "R", "load_high_gamma_data.R"))
source(path(here(), "R", "rolling_window_and_baseline.R"))
source(path(here(), "R", "run_permuted_controlled_regressions_par.R"))
source(path(here(), "R", 'mutate_cond.R'))

## paralellization ##
nCores <- 16
registerDoParallel(nCores)

## regression parameters ##
# save info needed for regressions #
niter <- 1000

## subs to run ##
subs <- c("IR9", "IR16", "IR19", "IR26", "IR28", "IR35", "IR57", "IR39", "GP51", "DA9", "ST40")
# subs <- c("IR9", "IR16", "IR19", "IR26", "IR28", "IR35", "IR57", "IR39")
## frequencies to run ##
freqs <- c("theta")

for(freq in freqs){

  for(sub in subs){
      # Null main file out each time #
      power_behave <- NULL
      print(sub)
      ## electrodes ##
      # # load  all #
      # file_path_to_elecs_of_interest <- path(here(), "munge", paste0(sub, "_elecs_of_interest.csv"))
      # elecs_to_use <- read.csv(file_path_to_elecs_of_interest)
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
  
      ## read in data ##
      path_hp_clean <- path(here(), "munge", sub, paste0(freq, "_behave_presentation_rscaler_2575_200.csv"))
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
        mutate(pie_type = if_else(pie_size > 27, "large", "small")) %>%
        mutate(selfv_type = if_else(self_var_payoff >= 13, "large", "small")) %>%
        ungroup()
      
      # Trial type #
      brain_behave_data_adv <- brain_behave_data %>% filter(trial_type == "Advantageous")
      brain_behave_data_dis <- brain_behave_data %>% filter(trial_type == "Disadvantageous")
  
      all_electrodes <- unique(brain_behave_data$electrodes)
      # bin names #
      nBins <- colnames(power_behave %>% select(starts_with("bin_")))[1:15]
  
      # ## run regressions ##
      ## Advantageous ##
      # # self var paroff #
      run_permuted_controlled_regressions_par(brain_behave_data_adv, electrodes = all_electrodes, regressor = "self_var_payoff", regressor_control = "other_var_payoff", nBins, region_name =  "All", niter, sub = sub, tag = "-pres-locked-adv-only-cperm-resid-hilbertRS")
      # other var payoff #
      run_permuted_controlled_regressions_par(brain_behave_data_adv, electrodes = all_electrodes, regressor = "other_var_payoff", regressor_control = "self_var_payoff", nBins, region_name =  "All", niter, sub = sub, tag = "-pres-locked-adv-only-cperm-resid-hilbertRS")
      
    
      ## Disadvantageous ##
      ## Advantageous ##
      # # self var paroff #
      run_permuted_controlled_regressions_par(brain_behave_data_dis, electrodes = all_electrodes, regressor = "self_var_payoff", regressor_control = "other_var_payoff", nBins, region_name =  "All", niter, sub = sub, tag = "-pres-locked-dis-only-cperm-resid-hilbertRS")
      # other var payoff #
      run_permuted_controlled_regressions_par(brain_behave_data_dis, electrodes = all_electrodes, regressor = "other_var_payoff", regressor_control = "self_var_payoff", nBins, region_name =  "All", niter, sub = sub, tag = "-pres-locked-dis-only-cperm-resid-hilbertRS")
      

  }
}