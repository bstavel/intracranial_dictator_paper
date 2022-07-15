load_and_collate_reg_results <- function(tag, epoch, folder) {

    ## first read in just self_payoff regressions ##
    ### any subject general vars ###
    spec_vars <- c("*", "*")
    regions_to_combine <- c("All")

    
      ## IR57 ##
      var_reg_df_57 <- compile_mult_reg_results(regions = regions_to_combine,
                                                          type = tag,
                                                          sub = "IR57",
                                                          spec_vars = spec_vars,
                                                          path = path(here(), "results", "IR57", folder))
      
      
      ## IR35 ##
      var_reg_df_35 <- compile_mult_reg_results(regions = regions_to_combine,
                                                          type = tag,
                                                          sub = "IR35",
                                                          spec_vars = spec_vars,
                                                          path = path(here(), "results", "IR35", folder))
      
      
      ## IR28 ##
      var_reg_df_28 <- compile_mult_reg_results(regions = regions_to_combine,
                                                          type = tag,
                                                          sub = "IR28",
                                                          spec_vars = spec_vars,
                                                          path = path(here(), "results", "IR28", folder))
      
      ## IR26 ##
      var_reg_df_26 <- compile_mult_reg_results(regions = regions_to_combine,
                                                          type = tag,
                                                          sub = "IR26",
                                                          spec_vars = spec_vars,
                                                          path = path(here(), "results", "IR26", folder))
      
      
      ## IR16 ##
      var_reg_df_16 <- compile_mult_reg_results(regions = regions_to_combine,
                                                          type = tag,
                                                          sub = "IR16",
                                                          spec_vars = spec_vars,
                                                          path = path(here(), "results", "IR16", folder))
      
      
      ## IR10 ##
      var_reg_df_10 <- compile_mult_reg_results(regions = regions_to_combine,
                                                          type = tag,
                                                          sub = "IR10",
                                                          spec_vars = spec_vars,
                                                          path = path(here(), "results", "IR10", folder))
      
      
      ## IR9 ##
      var_reg_df_9 <- compile_mult_reg_results(regions = regions_to_combine,
                                                         type = tag,
                                                         sub = "IR9",
                                                         spec_vars = spec_vars,
                                                         path = path(here(), "results", "IR9", folder))

 
    
    if(epoch == "presentation") {   
        # presentation dfs #
        var_reg_df_57 <- var_reg_df_57 %>% mutate(sub = "IR57") %>% mutate(epoch = "presentation")
        var_reg_df_35 <- var_reg_df_35 %>% mutate(sub = "IR35") %>% mutate(epoch = "presentation")
        var_reg_df_28 <- var_reg_df_28 %>% mutate(sub = "IR28") %>% mutate(epoch = "presentation")
        var_reg_df_26 <- var_reg_df_26 %>% mutate(sub = "IR26") %>% mutate(epoch = "presentation")
        var_reg_df_16 <- var_reg_df_16 %>% mutate(sub = "IR16") %>% mutate(epoch = "presentation")
        var_reg_df_10 <- var_reg_df_10 %>% mutate(sub = "IR10") %>% mutate(epoch = "presentation")
        var_reg_df_9 <- var_reg_df_9 %>% mutate(sub = "IR9") %>% mutate(epoch = "presentation")
        
    } else if(epoch == "pre-choice") {
      # pre choice dfs #
      var_reg_df_57 <- var_reg_df_57 %>% mutate(sub = "IR57") %>% mutate(epoch = "pre-choice")
      var_reg_df_35 <- var_reg_df_35 %>% mutate(sub = "IR35") %>% mutate(epoch = "pre-choice")
      var_reg_df_28 <- var_reg_df_28 %>% mutate(sub = "IR28") %>% mutate(epoch = "pre-choice")
      var_reg_df_26 <- var_reg_df_26 %>% mutate(sub = "IR26") %>% mutate(epoch = "pre-choice")
      var_reg_df_16 <- var_reg_df_16 %>% mutate(sub = "IR16") %>% mutate(epoch = "pre-choice")
      var_reg_df_10 <- var_reg_df_10 %>% mutate(sub = "IR10") %>% mutate(epoch = "pre-choice")
      var_reg_df_9 <- var_reg_df_9 %>% mutate(sub = "IR9") %>% mutate(epoch = "pre-choice")
      
    } else if(epoch == "post-choice") {
      # post choice dfs #
      var_reg_df_57 <- var_reg_df_57 %>% mutate(sub = "IR57") %>% mutate(epoch = "post-choice")
      var_reg_df_35 <- var_reg_df_35 %>% mutate(sub = "IR35") %>% mutate(epoch = "post-choice")
      var_reg_df_28 <- var_reg_df_28 %>% mutate(sub = "IR28") %>% mutate(epoch = "post-choice")
      var_reg_df_26 <- var_reg_df_26 %>% mutate(sub = "IR26") %>% mutate(epoch = "post-choice")
      var_reg_df_16 <- var_reg_df_16 %>% mutate(sub = "IR16") %>% mutate(epoch = "post-choice")
      var_reg_df_10 <- var_reg_df_10 %>% mutate(sub = "IR10") %>% mutate(epoch = "post-choice")
      var_reg_df_9 <- var_reg_df_9 %>% mutate(sub = "IR9") %>% mutate(epoch = "post-choice")
      
    }
        
    # bind together #
    all_var_reg_results <- rbind(var_reg_df_9, 
                                      var_reg_df_10,
                                      var_reg_df_16,
                                      var_reg_df_26,
                                      var_reg_df_28,
                                      var_reg_df_35,
                                      var_reg_df_57)
    
    # clean electrode var #
    all_var_reg_results <- all_var_reg_results %>%
      mutate(electrode = gsub("POL ", "", electrode)) %>%
      mutate(electrode = gsub(" POL", "", electrode)) %>%
      mutate(electrode = gsub("-Ref", "", electrode)) %>%
      mutate(electrode = gsub("-Ref-", "-", electrode)) 

    
  return(all_var_reg_results)
    
    
    


}