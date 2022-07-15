compile_interaction_data <- function(tag, ofc_file_name, cing_file_name, post_sub_path = post_sub_path, pre_tag = NULL){
  
  
  
  ### any subject general vars ###
  spec_vars <- c("*", "*")
  regions_to_combine <- c("All")
  
  ## IR57 ##
  
  presentation_results_57 <- compile_mult_reg_results(regions = regions_to_combine,
                                             type = paste0(pre_tag, "pres-", tag),
                                             sub = "IR57",
                                             spec_vars = spec_vars,
                                             path = path(here(), "results", "IR57", post_sub_path))
  
  
  pre_choice_results_57 <- compile_mult_reg_results(regions = regions_to_combine,
                                           type = paste0(pre_tag, "pre-choice-", tag),
                                           sub = "IR57",
                                           spec_vars = spec_vars,
                                           path = path(here(), "results", "IR57", post_sub_path)
                                           )
  
  
  post_choice_results_57 <- compile_mult_reg_results(regions = regions_to_combine,
                                            type = paste0(pre_tag, "post-choice-", tag),
                                            sub = "IR57",
                                            spec_vars = spec_vars,
                                            path = path(here(), "results", "IR57", post_sub_path)
                                            )
  
  
  
  
  
  
  ## IR35 ##
  
  presentation_results_35 <- compile_mult_reg_results(regions = regions_to_combine,
                                             type = paste0(pre_tag, "pres-", tag),
                                             sub = "IR35",
                                             spec_vars = spec_vars,
                                             path = path(here(), "results", "IR35", post_sub_path)
                                             )
  
  
  pre_choice_results_35 <- compile_mult_reg_results(regions = regions_to_combine,
                                           type = paste0(pre_tag, "pre-choice-", tag),
                                           sub = "IR35",
                                           spec_vars = spec_vars,
                                           path = path(here(), "results", "IR35", post_sub_path)
                                           )
  
  
  post_choice_results_35 <- compile_mult_reg_results(regions = regions_to_combine,
                                            type = paste0(pre_tag, "post-choice-", tag),
                                            sub = "IR35",
                                            spec_vars = spec_vars,
                                            path = path(here(), "results", "IR35", post_sub_path)
                                            )
  
  
  
  ## IR28 ##
  
  
  presentation_results_28 <- compile_mult_reg_results(regions = regions_to_combine, 
                                             type = paste0(pre_tag, "pres-", tag), 
                                             sub = "IR28", 
                                             spec_vars = spec_vars, 
                                             path = path(here(), "results", "IR28", post_sub_path) 
                                             )
  
  pre_choice_results_28 <- compile_mult_reg_results(regions = regions_to_combine, 
                                           type = paste0(pre_tag, "pre-choice-", tag), 
                                           sub = "IR28", 
                                           spec_vars = spec_vars, 
                                           path = path(here(), "results", "IR28", post_sub_path) 
                                           )
  
  post_choice_results_28 <- compile_mult_reg_results(regions = regions_to_combine, 
                                            type = paste0(pre_tag, "post-choice-", tag), 
                                            sub = "IR28", 
                                            spec_vars = spec_vars, 
                                            path = path(here(), "results", "IR28", post_sub_path) 
                                            )
  
  ## IR26 ##
  
  presentation_results_26 <- compile_mult_reg_results(regions = regions_to_combine,
                                             type = paste0(pre_tag, "pres-", tag),
                                             sub = "IR26",
                                             spec_vars = spec_vars,
                                             path = path(here(), "results", "IR26", post_sub_path)
                                             )
  
  
  pre_choice_results_26 <- compile_mult_reg_results(regions = regions_to_combine,
                                           type = paste0(pre_tag, "pre-choice-", tag),
                                           sub = "IR26",
                                           spec_vars = spec_vars,
                                           path = path(here(), "results", "IR26", post_sub_path)
                                           )
  
  
  post_choice_results_26 <- compile_mult_reg_results(regions = regions_to_combine,
                                            type = paste0(pre_tag, "post-choice-", tag),
                                            sub = "IR26",
                                            spec_vars = spec_vars,
                                            path = path(here(), "results", "IR26", post_sub_path)
                                            )
  
  
  ## IR16 ##
  
  presentation_results_16 <- compile_mult_reg_results(regions = regions_to_combine,
                                             type = paste0(pre_tag, "pres-", tag),
                                             sub = "IR16",
                                             spec_vars = spec_vars,
                                             path = path(here(), "results", "IR16", post_sub_path)
                                             )
  
  
  pre_choice_results_16 <- compile_mult_reg_results(regions = regions_to_combine,
                                           type = paste0(pre_tag, "pre-choice-", tag),
                                           sub = "IR16",
                                           spec_vars = spec_vars,
                                           path = path(here(), "results", "IR16", post_sub_path)
                                           )
  
  
  post_choice_results_16 <- compile_mult_reg_results(regions = regions_to_combine,
                                            type = paste0(pre_tag, "post-choice-", tag),
                                            sub = "IR16",
                                            spec_vars = spec_vars,
                                            path = path(here(), "results", "IR16", post_sub_path)
                                            )
  
  
  ## IR10 ##
  
  presentation_results_10 <- compile_mult_reg_results(regions = regions_to_combine,
                                             type = paste0(pre_tag, "pres-", tag),
                                             sub = "IR10",
                                             spec_vars = spec_vars,
                                             path = path(here(), "results", "IR10", post_sub_path)
                                             )
  
  
  pre_choice_results_10 <- compile_mult_reg_results(regions = regions_to_combine,
                                           type = paste0(pre_tag, "pre-choice-", tag),
                                           sub = "IR10",
                                           spec_vars = spec_vars,
                                           path = path(here(), "results", "IR10", post_sub_path)
                                           )
  
  
  post_choice_results_10 <- compile_mult_reg_results(regions = regions_to_combine,
                                            type = paste0(pre_tag, "post-choice-", tag),
                                            sub = "IR10",
                                            spec_vars = spec_vars,
                                            path = path(here(), "results", "IR10", post_sub_path)
                                            )
  
  
  ## IR9 ##
  
  presentation_results_9 <- compile_mult_reg_results(regions = regions_to_combine,
                                            type = paste0(pre_tag, "pres-", tag),
                                            sub = "IR9",
                                            spec_vars = spec_vars,
                                            path = path(here(), "results", "IR9", post_sub_path)
                                            )
  
  
  pre_choice_results_9 <- compile_mult_reg_results(regions = regions_to_combine,
                                          type = paste0(pre_tag, "pre-choice-", tag),
                                          sub = "IR9",
                                          spec_vars = spec_vars,
                                          path = path(here(), "results", "IR9", post_sub_path)
                                          )
  
  
  post_choice_results_9 <- compile_mult_reg_results(regions = regions_to_combine,
                                           type = paste0(pre_tag, "post-choice-", tag),
                                           sub = "IR9",
                                           spec_vars = spec_vars,
                                           path = path(here(), "results", "IR9", post_sub_path)
                                           )
  
  # ## IR19 ##
  # 
  # presentation_results_19 <- compile_mult_reg_results(regions = regions_to_combine,
  #                                            type = paste0(pre_tag, "pres-", tag),
  #                                            sub = "IR19",
  #                                            spec_vars = spec_vars,
  #                                            path = path(here(), "results", "IR19", post_sub_path)
  #                                            )
  # 
  # 
  # pre_choice_results_19 <- compile_mult_reg_results(regions = regions_to_combine,
  #                                          type = paste0(pre_tag, "pre-choice-", tag),
  #                                          sub = "IR19",
  #                                          spec_vars = spec_vars,
  #                                          path = path(here(), "results", "IR19", post_sub_path)
  #                                          )
  # 
  # 
  # post_choice_results_19 <- compile_mult_reg_results(regions = regions_to_combine,
  #                                           type = paste0(pre_tag, "post-choice-", tag),
  #                                           sub = "IR19",
  #                                           spec_vars = spec_vars,
  #                                           path = path(here(), "results", "IR19", post_sub_path)
  #                                           )
  
  ## IR39 ##
  
  presentation_results_39 <- compile_mult_reg_results(regions = regions_to_combine,
                                             type = paste0(pre_tag, "pres-", tag),
                                             sub = "IR39",
                                             spec_vars = spec_vars,
                                             path = path(here(), "results", "IR39", post_sub_path)
                                             )
  
  
  pre_choice_results_39 <- compile_mult_reg_results(regions = regions_to_combine,
                                           type = paste0(pre_tag, "pre-choice-", tag),
                                           sub = "IR39",
                                           spec_vars = spec_vars,
                                           path = path(here(), "results", "IR39", post_sub_path)
                                           )
  
  
  post_choice_results_39 <- compile_mult_reg_results(regions = regions_to_combine,
                                            type = paste0(pre_tag, "post-choice-", tag),
                                            sub = "IR39",
                                            spec_vars = spec_vars,
                                            path = path(here(), "results", "IR39", post_sub_path)
                                            )
  
  # ## CP34 ##
  # 
  # presentation_results_cp34 <- compile_mult_reg_results(regions = regions_to_combine,
  #                                              type = paste0(pre_tag, "pres-", tag),
  #                                              sub = "CP34",
  #                                              spec_vars = spec_vars,
  #                                              path = path(here(), "results", "CP34", post_sub_path)
  #                                              )
  # 
  # 
  # pre_choice_results_cp34 <- compile_mult_reg_results(regions = regions_to_combine,
  #                                            type = paste0(pre_tag, "pre-choice-", tag),
  #                                            sub = "CP34",
  #                                            spec_vars = spec_vars,
  #                                            path = path(here(), "results", "CP34", post_sub_path)
  #                                            )
  # 
  # 
  # post_choice_results_cp34 <- compile_mult_reg_results(regions = regions_to_combine,
  #                                             type = paste0(pre_tag, "post-choice-", tag),
  #                                             sub = "CP34",
  #                                             spec_vars = spec_vars,
  #                                             path = path(here(), "results", "CP34", post_sub_path)
  #                                             )
  
  ## GP51 ##
  
  presentation_results_gp51 <- compile_mult_reg_results(regions = regions_to_combine,
                                               type = paste0(pre_tag, "pres-", tag),
                                               sub = "GP51",
                                               spec_vars = spec_vars,
                                               path = path(here(), "results", "GP51", post_sub_path)
                                               )
  
  
  pre_choice_results_gp51 <- compile_mult_reg_results(regions = regions_to_combine,
                                             type = paste0(pre_tag, "pre-choice-", tag),
                                             sub = "GP51",
                                             spec_vars = spec_vars,
                                             path = path(here(), "results", "GP51", post_sub_path)
                                             )
  
  
  post_choice_results_gp51 <- compile_mult_reg_results(regions = regions_to_combine,
                                              type = paste0(pre_tag, "post-choice-", tag),
                                              sub = "GP51",
                                              spec_vars = spec_vars,
                                              path = path(here(), "results", "GP51", post_sub_path)
                                              )
  
  # ## DA9 ##
  # 
  # presentation_results_da9 <- compile_mult_reg_results(regions = regions_to_combine,
  #                                              type = paste0(pre_tag, "pres-", tag),
  #                                              sub = "DA9",
  #                                              spec_vars = spec_vars,
  #                                              path = path(here(), "results", "DA9", post_sub_path)
  #                                              )
  # 
  # 
  # pre_choice_results_da9 <- compile_mult_reg_results(regions = regions_to_combine,
  #                                            type = paste0(pre_tag, "pre-choice-", tag),
  #                                            sub = "DA9",
  #                                            spec_vars = spec_vars,
  #                                            path = path(here(), "results", "DA9", post_sub_path)
  #                                            )
  # 
  # 
  # post_choice_results_da9 <- compile_mult_reg_results(regions = regions_to_combine,
  #                                             type = paste0(pre_tag, "post-choice-", tag),
  #                                             sub = "DA9",
  #                                             spec_vars = spec_vars,
  #                                             path = path(here(), "results", "DA9", post_sub_path)
  #                                             )
  # 
  ## ST40 ##
  
  presentation_results_st40 <- compile_mult_reg_results(regions = regions_to_combine,
                                               type = paste0(pre_tag, "pres-", tag),
                                               sub = "ST40",
                                               spec_vars = spec_vars,
                                               path = path(here(), "results", "ST40", post_sub_path)
                                               )
  
  
  pre_choice_results_st40 <- compile_mult_reg_results(regions = regions_to_combine,
                                             type = paste0(pre_tag, "pre-choice-", tag),
                                             sub = "ST40",
                                             spec_vars = spec_vars,
                                             path = path(here(), "results", "ST40", post_sub_path)
                                             )
  
  
  post_choice_results_st40 <- compile_mult_reg_results(regions = regions_to_combine,
                                              type = paste0(pre_tag, "post-choice-", tag),
                                              sub = "ST40",
                                              spec_vars = spec_vars,
                                              path = path(here(), "results", "ST40", post_sub_path)
                                              )
  
  # ## DA8 ##
  # 
  # presentation_results_da8 <- compile_mult_reg_results(regions = regions_to_combine,
  #                                             type = paste0(pre_tag, "pres-", tag),
  #                                             sub = "DA8",
  #                                             spec_vars = spec_vars,
  #                                             path = path(here(), "results", "DA8", post_sub_path)
  #                                             )
  # 
  # 
  # pre_choice_results_da8 <- compile_mult_reg_results(regions = regions_to_combine,
  #                                           type = paste0(pre_tag, "pre-choice-", tag),
  #                                           sub = "DA8",
  #                                           spec_vars = spec_vars,
  #                                           path = path(here(), "results", "DA8", post_sub_path)
  #                                           )
  
  
  # post_choice_results_da8 <- compile_mult_reg_results(regions = regions_to_combine,
  #                                            type = paste0(pre_tag, "post-choice-", tag),
  #                                            sub = "DA8",
  #                                            spec_vars = spec_vars,
  #                                            path = path(here(), "results", "DA8", post_sub_path)
  #                                            )
  
  
  ### Merge Files Together ###
  # merge together
  results_IR57 <- rbind(presentation_results_57 %>% mutate(epoch = "presentation"),
                        pre_choice_results_57 %>% mutate(epoch = "pre-choice"),
                        post_choice_results_57 %>% mutate(epoch = "post-choice"))
  
  results_IR35 <- rbind(presentation_results_35 %>% mutate(epoch = "presentation"),
                        pre_choice_results_35 %>% mutate(epoch = "pre-choice"),
                        post_choice_results_35 %>% mutate(epoch = "post-choice"))
  
  results_IR28 <- rbind(presentation_results_28 %>% mutate(epoch = "presentation"),
                        pre_choice_results_28 %>% mutate(epoch = "pre-choice"),
                        post_choice_results_28 %>% mutate(epoch = "post-choice"))
  
  results_IR26 <- rbind(presentation_results_26 %>% mutate(epoch = "presentation"),
                        pre_choice_results_26 %>% mutate(epoch = "pre-choice"),
                        post_choice_results_26 %>% mutate(epoch = "post-choice"))
  
  results_IR16 <- rbind(presentation_results_16 %>% mutate(epoch = "presentation"),
                        pre_choice_results_16 %>% mutate(epoch = "pre-choice"),
                        post_choice_results_16 %>% mutate(epoch = "post-choice"))
  
  # results_IR10 <- rbind(presentation_results_10 %>% mutate(epoch = "presentation"),
  #                       pre_choice_results_10 %>% mutate(epoch = "pre-choice"),
  #                       post_choice_results_10 %>% mutate(epoch = "post-choice"))
  
  results_IR9 <- rbind(presentation_results_9 %>% mutate(epoch = "presentation"),
                       pre_choice_results_9 %>% mutate(epoch = "pre-choice"),
                       post_choice_results_9 %>% mutate(epoch = "post-choice"))
  
  # results_IR19 <- rbind(presentation_results_19 %>% mutate(epoch = "presentation"),
  #                       pre_choice_results_19 %>% mutate(epoch = "pre-choice"),
  #                       post_choice_results_19 %>% mutate(epoch = "post-choice"))
  # 
  results_IR39 <- rbind(presentation_results_39 %>% mutate(epoch = "presentation"),
                        pre_choice_results_39 %>% mutate(epoch = "pre-choice"),
                        post_choice_results_39 %>% mutate(epoch = "post-choice"))
  
  results_GP51 <- rbind(presentation_results_gp51 %>% mutate(epoch = "presentation"),
                        pre_choice_results_gp51 %>% mutate(epoch = "pre-choice"),
                        post_choice_results_gp51 %>% mutate(epoch = "post-choice"))
  
  # results_DA9 <- rbind(presentation_results_da9 %>% mutate(epoch = "presentation"),
  #                       pre_choice_results_da9 %>% mutate(epoch = "pre-choice"),
  #                       post_choice_results_da9 %>% mutate(epoch = "post-choice"))
  
  results_ST40 <- rbind(presentation_results_st40 %>% mutate(epoch = "presentation"),
                        pre_choice_results_st40 %>% mutate(epoch = "pre-choice"),
                        post_choice_results_st40 %>% mutate(epoch = "post-choice"))  
  
  # results_CP34 <- rbind(presentation_results_cp34 %>% mutate(epoch = "presentation"),
  #                       pre_choice_results_cp34 %>% mutate(epoch = "pre-choice"),
  #                       post_choice_results_cp34 %>% mutate(epoch = "post-choice"))
  # 
  # results_DA8 <- rbind(presentation_results_da8 %>% mutate(epoch = "presentation"),
  #                      pre_choice_results_da8 %>% mutate(epoch = "pre-choice"))
  
  merged_results <- rbind(results_IR57 %>% mutate(subject = "IR57"),
                          results_IR39 %>% mutate(subject = "IR39"),
                          results_IR35 %>% mutate(subject = "IR35"),
                          results_IR28 %>% mutate(subject = "IR28"),
                          results_IR26 %>% mutate(subject = "IR26"),
                          results_IR16 %>% mutate(subject = "IR16"),
                          # results_IR10 %>% mutate(subject = "IR10"),
                          results_IR9 %>% mutate(subject = "IR9"),
                          results_GP51 %>% mutate(subject = "GP51"),
                          results_ST40 %>% mutate(subject = "ST40"))
  
  
  
  merged_results <- merged_results %>%
    mutate(electrode = gsub("POL ", "", electrode)) %>%
    mutate(electrode = gsub(" POL", "", electrode)) %>%
    mutate(electrode = gsub("-Ref", "", electrode)) %>%
    mutate(electrode = gsub("-Ref-", "-", electrode)) 
  
  bad_predictors <- c("self_var_payoff_adv", "self_var_payoff_dis", "other_var_payoff_adv", "other_var_payoff_dis", "more_or_none")
  
  localizations <- read_csv(path(here(), "munge", "combined_electrode_info_with_bob.csv"))
  localized_results_pres <- merge_all_subs_with_elec_info(merged_results, localizations)
  ofc_merged_results <- localized_results_pres %>%
    filter(grepl("ofc", ROI, ignore.case = T) | grepl("orbit", ROI, ignore.case = T)) %>% 
    mutate(predictor = gsub('[[:digit:]]+', "", predictor)) %>%
    mutate(predictor = gsub("OFG_", "", predictor)) %>%
    filter(!predictor %in% bad_predictors)
  cing_merged_results <- localized_results_pres %>%
    filter(grepl("cing", ROI, ignore.case = T) | grepl("CC", ROI, ignore.case = T)) %>% 
    filter(!grepl("occipital", ROI, ignore.case = T)) %>%
    filter(!predictor %in% bad_predictors)
  
  write_csv(ofc_merged_results, path(here(), "results", "interactions", ofc_file_name))
  write_csv(cing_merged_results, path(here(), "results", "interactions", cing_file_name))
  
  
  
  
}