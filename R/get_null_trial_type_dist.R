run_permuted_ttype_null <- function(brain_behave_data, 
                                         electrodes, 
                                         regressors, 
                                         nBins, 
                                         niter = 1000,
                                         sub, 
                                         tag) {
  
  # create results dfs #
  results <- data.frame(matrix(nrow = niter*length(regressors)*length(electrodes)*length(nBins), 
                               ncol = 10))
  colnames(results) <- c("subject", "electrode", "predictor", "bin", "R2_Adv", "Beta_Adv", "p_Adv", "R2_Dis", "Beta_Dis", "p_Dis")
  
  # fill results dfs with electrode & bin info #
  results$electrode <- rep(electrodes, length(regressors)*niter *length(nBins))
  results$subject <- sub
  
  for(elec in electrodes) {
    
    # update #
    print(paste0("Starting electrode ", which(electrodes %in% elec), " of ", length(electrodes)))
    
    
    
    # fill with regressor info #
    results <- results %>% 
      mutate_cond(electrode == elec & subject == sub, 
                  predictor = rep(regressors, niter*length(nBins)))
    
    # filter to single electrode #
    brain_behave_data_elec <- brain_behave_data %>% filter(electrodes == elec)
    num_adv_trials <- nrow(brain_behave_data_elec %>% filter(trial_type == "Advantageous"))
     
    for(reg in regressors){
      
      
      # Create null distribution by shuffling labels #
      null_df <-NULL
      null_df <- foreach(h = 1:niter, .inorder=FALSE, .combine = 'rbind') %dopar% {
        # print status #
        if(h %% 100 == 0){
          print(paste0( (h/niter) * 100, "% complete for electrode", which(electrodes %in% elec), " of ", length(electrodes)))
        }
        
        
        # intialize vars #
        null_r2_adv <- NULL
        null_p_adv <- NULL
        null_beta_adv <- NULL
        null_r2_dis <- NULL
        null_p_dis <- NULL
        null_beta_dis <- NULL
        for (bin in nBins) { # This is the slooooow step
          # consistent permuting across time bins
          # set.seed(h)
          
          # divide data set
          adv_trials <- sample(brain_behave_data_elec$trial, num_adv_trials)
          dis_trials <- brain_behave_data_elec %>% filter(!trial %in% adv_trials) %>% pull(trial)
          brain_behave_data_adv <- brain_behave_data_elec %>% slice(adv_trials)
          brain_behave_data_dis <- brain_behave_data_elec %>% slice(dis_trials)
          
          # run models #
          bin_vec_adv <- brain_behave_data_adv %>% pull(bin)
          reg_vec_adv <- brain_behave_data_adv %>% pull(reg)
          
          bin_vec_dis <- brain_behave_data_dis %>% pull(bin)
          reg_vec_dis <- brain_behave_data_dis %>% pull(reg)
          
          null_lm_adv <-summary(lm(bin_vec_adv ~ reg_vec_adv))
          null_lm_dis <-summary(lm(bin_vec_dis ~ reg_vec_dis))
          
          # save info from models #
          null_r2_adv[bin] <- null_lm_adv$r.squared
          null_p_adv[bin] <- null_lm_adv$coefficients[2, 4]
          null_beta_adv[bin] <- null_lm_adv$coefficients[2, 1]
          
          null_r2_dis[bin] <- null_lm_dis$r.squared
          null_p_dis[bin] <- null_lm_dis$coefficients[2, 4]
          null_beta_dis[bin] <- null_lm_dis$coefficients[2, 1]
        }
        
        ## average across bins ##
        null_df <- cbind(null_r2_adv, null_p_adv, null_beta_adv, null_r2_dis, null_p_dis, null_beta_dis)
        
        return(null_df)
      }
      
      
      # save vals in results df #
      results <- results %>% 
        mutate_cond(electrode == elec & predictor == reg & subject == sub, 
                    bin = rownames(null_df),
                    R2_Adv = null_df[, 1],
                    p_Adv = null_df[, 2],
                    Beta_Adv = null_df[, 3],
                    R2_Dis = null_df[, 4],
                    p_Dis = null_df[, 5],
                    Beta_Dis = null_df[, 6])
      
    }
    # save results to results folder #
    write.csv(results, path(here(), "results", paste0(sub, "_",  tag, "_results.csv")))
    
  }
  
}
