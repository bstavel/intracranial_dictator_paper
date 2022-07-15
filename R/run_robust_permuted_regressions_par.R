run_permuted_split_model_par <- function(brain_behave_data, 
                                         electrodes, 
                                         regressor, 
                                         nBins, 
                                         region_name, 
                                         niter = 1000,
                                         sub, 
                                         tag) {
  print(paste0("Beginning regressions for predictor: ", regressor))
  for(elec in electrodes) {
    
    # update #
    print(paste0("Starting electrode ", which(electrodes %in% elec), " of ", length(electrodes)))
    
    # initialize temp vars #
    reg_1 <- regressor[1]
    reg_2 <- regressor[2]
    adv_intercept <- NULL
    adv_beta_reg <- NULL
    adv_beta_ttype <- NULL
    adv_p_reg <- NULL
    adv_p_ttype <- NULL
    adv_pval <- NULL
    adv_r2 <- NULL
    
    dis_intercept <- NULL
    dis_beta_reg <- NULL
    dis_beta_ttype <- NULL
    dis_p_reg <- NULL
    dis_p_ttype <- NULL
    dis_pval <- NULL
    dis_r2 <- NULL
    
    adv_fstat <- NULL
    dis_fstat <- NULL
    broken <- FALSE
    
    
    # create results dfs #
    results <- data.frame(matrix(nrow = length(nBins), ncol = 28))
    colnames(results) <- c("electrode", "bin", "adv_p", "dis_p", "adv_R2", "dis_R2",
                           "adv_Intercept", "dis_Intercept", "adv_Beta_Reg", "dis_Beta_Reg", "adv_Beta_TType", "dis_Beta_TType", 
                           "adv_p_Reg", "dis_p_Reg", "adv_p_TType", "dis_p_TType", 
                           "Adv_FStat", "Dis_FStat",  "Adv_FStretch", "Dis_FStretch",  "adv_perm_p", "dis_perm_p",
                           "adv_fstat_null_max", "adv_fstat_null_mean", "adv_fstat_null_sd",
                           "dis_fstat_null_max", "dis_fstat_null_mean", "dis_fstat_null_sd")
    
    # fill results dfs with electrode & bin info #
    results$electrode <- elec
    results$bin <- nBins
    
    # filter to single electrode #
    brain_behave_data_elec <- brain_behave_data %>% filter(electrodes == elec)
    
    
    tryCatch(
      expr = {
        
        for (bin in nBins) { # This is the slooooow step
          
          bin_vec <- brain_behave_data_elec %>%  pull(bin)
          reg_1_vec <- brain_behave_data_elec %>% pull(reg_1)
          trial_type_vec <- brain_behave_data_elec %>% pull("trial_type")
          reg_1_adv <- replace(reg_1_vec, which(trial_type_vec == "Advantageous"), 0)
          reg_1_dis <- replace(reg_1_vec, which(trial_type_vec == "Disadvantageous"), 0)
          
          adv_model <- summary(lm(bin_vec ~ reg_1_adv + trial_type_vec))
          dis_model <- summary(lm(bin_vec ~ reg_1_dis + trial_type_vec))
          
          m_real <- gls(bin_vec ~ trial_type_vec + reg_1_dis, weights=varIdent(form=~1|trial_type_vec))
          m_null <- gls(bin_vec ~1, weights=varIdent(form=~1|trial_type_vec))
          
          anova(m_real, m_null)
          
          ## save info from both models ##
          # adv #
          adv_intercept[bin] <- adv_model$coefficients[1, 1]
          adv_beta_reg[bin] <- adv_model$coefficients[2, 1]
          adv_beta_ttype[bin] <- adv_model$coefficients[3, 1]
          
          adv_p_reg[bin] <- adv_model$coefficients[2, 4]
          adv_p_ttype[bin] <- adv_model$coefficients[3, 4]
          
          adv_r2[bin] <- adv_model$r.squared
          adv_pval[bin] <-  pf(adv_model$fstatistic[1],
                               adv_model$fstatistic[2], adv_model$fstatistic[3], lower.tail = F)
          # dis #
          dis_intercept[bin] <- dis_model$coefficients[1, 1]
          dis_beta_reg[bin] <- dis_model$coefficients[2, 1]
          dis_beta_ttype[bin] <- dis_model$coefficients[3, 1]
          
          dis_p_reg[bin] <- dis_model$coefficients[2, 4]
          dis_p_ttype[bin] <- dis_model$coefficients[3, 4]
          
          dis_r2[bin] <- dis_model$r.squared
          dis_pval[bin] <-  pf(dis_model$fstatistic[1],
                               dis_model$fstatistic[2], dis_model$fstatistic[3], lower.tail = F)       
          
          
          # save fstat info
          adv_fstat[bin] <- adv_model$fstatistic[1]
          dis_fstat[bin] <- dis_model$fstatistic[1]
          
        }
        
      },
      error=function(e) {
        broken <<- TRUE
      }
    )  
    
    if(broken) {
      for(bin in nBins) {
        adv_intercept[bin] <- NA
        adv_beta_reg[bin] <- NA
        adv_beta_ttype[bin] <- NA
        
        adv_p_reg[bin] <- NA
        adv_p_ttype[bin] <- NA
        
        adv_r2[bin] <- NA
        adv_pval[bin] <-  2
        
        # dis #
        dis_intercept[bin] <- NA
        dis_beta_reg[bin] <- NA
        dis_beta_ttype[bin] <- NA
        
        dis_p_reg[bin] <- NA
        dis_p_ttype[bin] <- NA
        
        dis_r2[bin] <- NA
        dis_pval[bin] <-  2
        
        adv_fstat[bin] <- .00000000009
        dis_fstat[bin] <- .00000000009
        
      }
    }
    
    ## Find out the longest stretch in which pval < 0.05 and create sum-of-F-stats statistic ##
    # adv #
    stretch <- adv_pval < 0.05
    indices <- stretch_start_end(stretch)
    
    # if there is no stretch, take the max beta and max f statistic #
    if(is.na(indices[1])) {
      adv_fstat_stretch <- max(adv_fstat)
      # if there is a stretch, sum the betas and the f statistics #
    } else {
      adv_fstat_stretch <- sum(adv_fstat[indices[1]:indices[2]]) # Summary stat
    }
    # dis #
    stretch <- dis_pval < 0.05
    indices <- stretch_start_end(stretch)
    
    # if there is no stretch, take the max beta and max f statistic #
    if(is.na(indices[1])) {
      dis_fstat_stretch <- max(dis_fstat)
      # if there is a stretch, sum the betas and the f statistics #
    } else {
      dis_fstat_stretch <- sum(dis_fstat[indices[1]:indices[2]]) # Summary stat
    }  
    
    # only run permutation testing if fstratch is above 7, otherwise extremely unlikely to be sig
    # advantageous#
    if( adv_fstat_stretch > 5 ) {
      # Create null distribution by shuffling labels #
      adv_null_fstat_stretch <- NULL
      adv_null_fstat_stretch <- foreach(h = 1:niter, .inorder=FALSE) %dopar% {
        # print status #
        if(h %% 100 == 0){
          print(paste0( (h/niter) * 100, "% complete for electrode", which(electrodes %in% elec), " of ", length(electrodes)))
        }
        
        # intialize vars #
        null_fstat <- NULL
        null_model_pval <- NULL
        for (bin in nBins) { # This is the slooooow step
          
          set.seed(h)
          bin_vec <- brain_behave_data_elec %>%  pull(bin)
          reg_1_vec <- brain_behave_data_elec %>% pull(reg_1)
          trial_type_vec <- brain_behave_data_elec %>% pull("trial_type")
          
          randomization <- sample(1:length(reg_1_vec))
          reg_1_vec_rand <- reg_1_vec[randomization]
          null_reg_1_adv <- replace(reg_1_vec_rand, which(trial_type_vec == "Advantageous"), 0)
          
          null_adv_model <- summary(lm(bin_vec ~ null_reg_1_adv + trial_type_vec))
          
          # save info from models #
          null_fstat[bin] <- null_adv_model$fstatistic[1]
          null_model_pval[bin] <-  pf(null_adv_model$fstatistic[1],
                                      null_adv_model$fstatistic[2], null_adv_model$fstatistic[3], lower.tail = F)
          
        }
        
        ## Find out the longest stretch in which pval < 0.05 and create sum-of-F-stats statistic ##
        stretch <- null_model_pval < 0.05
        indices <- stretch_start_end(stretch)
        
        # if there is no stretch, take the max beta and max f statistic #
        if(is.na(indices[1])) {
          adv_null_fstat_stretch[h] <- max(null_fstat)
          # if there is a stretch, sum the betas and the f statistics #
        } else {
          adv_null_fstat_stretch[h] <- sum(null_fstat[indices[1]:indices[2]]) # Summary stat
        }
        
        return(adv_null_fstat_stretch[h])
      }
      
      # our test statistic for the permutation test is the sum of f tests #
      adv_perm_pval <- sum(adv_null_fstat_stretch > adv_fstat_stretch)/niter
      adv_fstatStr_sd <- sd(unlist(adv_null_fstat_stretch), na.rm = T)
      adv_fstatStr_max <- max(unlist(adv_null_fstat_stretch), na.rm = T)
      adv_fstatStr_mean <- mean(unlist(adv_null_fstat_stretch), na.rm = T)
      
    } else {
      adv_perm_pval <- 2
      adv_fstatStr_sd <- 2
      adv_fstatStr_max <- 2
      adv_fstatStr_mean <- 2
    }
    # disadvantageous#
    if( dis_fstat_stretch > 5 ) {
      # Create null distribution by shuffling labels #
      dis_null_fstat_stretch <- NULL
      dis_null_fstat_stretch <- foreach(h = 1:niter, .inorder=FALSE) %dopar% {
        # print status #
        if(h %% 100 == 0){
          print(paste0( (h/niter) * 100, "% complete for electrode", which(electrodes %in% elec), " of ", length(electrodes)))
        }
        
        # intialize vars #
        null_fstat <- NULL
        null_model_pval <- NULL
        for (bin in nBins) { # This is the slooooow step
          
          set.seed(h)
          bin_vec <- brain_behave_data_elec %>%  pull(bin)
          reg_1_vec <- brain_behave_data_elec %>% pull(reg_1)
          trial_type_vec <- brain_behave_data_elec %>% pull("trial_type")
          
          randomization <- sample(1:length(reg_1_vec))
          reg_1_vec_rand <- reg_1_vec[randomization]
          null_reg_1_dis <- replace(reg_1_vec_rand, which(trial_type_vec == "Disadvantageous"), 0)
          
          null_dis_model <- summary(lm(bin_vec ~ null_reg_1_dis + trial_type_vec))
          
          # save info from models #
          null_fstat[bin] <- null_dis_model$fstatistic[1]
          null_model_pval[bin] <-  pf(null_dis_model$fstatistic[1],
                                      null_dis_model$fstatistic[2], null_dis_model$fstatistic[3], lower.tail = F)
          
        }
        
        ## Find out the longest stretch in which pval < 0.05 and create sum-of-F-stats statistic ##
        stretch <- null_model_pval < 0.05
        indices <- stretch_start_end(stretch)
        
        # if there is no stretch, take the max beta and max f statistic #
        if(is.na(indices[1])) {
          dis_null_fstat_stretch[h] <- max(null_fstat)
          # if there is a stretch, sum the betas and the f statistics #
        } else {
          dis_null_fstat_stretch[h] <- sum(null_fstat[indices[1]:indices[2]]) # Summary stat
        }
        
        return(dis_null_fstat_stretch[h])
      }
      
      # our test statistic for the permutation test is the sum of f tests #
      dis_perm_pval <- sum(dis_null_fstat_stretch > dis_fstat_stretch)/niter
      dis_fstatStr_sd <- sd(unlist(dis_null_fstat_stretch), na.rm = T)
      dis_fstatStr_max <- max(unlist(dis_null_fstat_stretch), na.rm = T)
      dis_fstatStr_mean <- mean(unlist(dis_null_fstat_stretch), na.rm = T)
      
    } else {
      dis_perm_pval <- 2
      dis_fstatStr_sd <- 2
      dis_fstatStr_max <- 2
      dis_fstatStr_mean <- 2
    }
    
    # save vals in results df #
    results <- results %>% 
      mutate_cond(electrode == elec, 
                  adv_R2 = adv_r2, adv_p = adv_pval,  adv_Intercept = adv_intercept, 
                  adv_Beta_Reg = adv_beta_reg, adv_Beta_TType = adv_beta_ttype, 
                  adv_p_Reg = adv_p_reg, adv_p_TType = adv_p_ttype,
                  dis_R2 = dis_r2, dis_p = dis_pval,  dis_Intercept = dis_intercept, 
                  dis_Beta_Reg = dis_beta_reg, dis_Beta_TType = dis_beta_ttype, 
                  dis_p_Reg = dis_p_reg, dis_p_TType = dis_p_ttype,
                  Adv_FStat = adv_fstat, Adv_FStretch = adv_fstat_stretch, adv_perm_p = adv_perm_pval,
                  Dis_FStat = dis_fstat, Dis_FStretch = dis_fstat_stretch, dis_perm_p = dis_perm_pval,
                  adv_fstat_null_max = adv_fstatStr_max, adv_fstat_null_mean = adv_fstatStr_mean, adv_fstat_null_sd = adv_fstatStr_sd,
                  dis_fstat_null_max = dis_fstatStr_max, dis_fstat_null_mean = dis_fstatStr_mean, dis_fstat_null_sd = dis_fstatStr_sd)
    
    
    # save results to results folder #
    write.csv(results, path(here(), "results", sub, paste0(region_name, "_", elec, "_", reg_1, "_", reg_2, "_", tag, "_results.csv")))
    
  } 
  
}
