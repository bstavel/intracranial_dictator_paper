run_permuted_null_resid_average_r2 <- function(brain_behave_data, 
                                         permute_data,
                                         electrodes, 
                                         regressors, 
                                         regressor_controls,
                                         nBins, 
                                         niter = 1000,
                                         sub, 
                                         tag) {
  
  # create results dfs #
  results <- data.frame(matrix(nrow = niter*length(regressors)*length(electrodes)*length(nBins), 
                               ncol = 7))
  colnames(results) <- c("subject", "electrode", "predictor", "bin", "R2", "Beta", "p")
  
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
    permute_data_elec <- permute_data %>% filter(electrodes == elec)
    
    for(reg in regressors){
      for(regressor_control in regressor_controls){
        
        if(reg == regressor_control){
          next
        }
      
        # Create null distribution by shuffling labels #
        null_df <-NULL
        null_df <- foreach(h = 1:niter, .inorder=FALSE, .combine = 'rbind') %dopar% {
          # print status #
          if(h %% 100 == 0){
            print(paste0( (h/niter) * 100, "% complete for electrode", which(electrodes %in% elec), " of ", length(electrodes)))
          }
          
          # intialize vars #
          null_r2 <- NULL
          null_p <- NULL
          null_beta <- NULL
          for (bin in nBins) { # This is the slooooow step
            # consistent permuting across time bins
            # set.seed(h)
            
            # get vars #
            bin_vec <- brain_behave_data_elec %>% pull(bin)
            control_reg_vec <- brain_behave_data_elec %>% pull(regressor_control)
            reg_vec <- permute_data_elec %>% pull(reg)
            
            # get residuals #
            control_model <- summary(lm(bin_vec ~ control_reg_vec))
            residuals <- control_model$residuals
            
            # run model #
            null_lm <-summary(lm(residuals ~ sample(reg_vec, length(bin_vec))))
            
            # save info from models #
            null_r2[bin] <- null_lm$r.squared
            null_p[bin] <- null_lm$coefficients[2, 4]
            null_beta[bin] <- null_lm$coefficients[2, 1]
          }
          
          ## average across bins ##
          null_df <- cbind(null_r2, null_p, null_beta)
          
          return(null_df)
        }
        
        
        # save vals in results df #
        results <- results %>% 
          mutate_cond(electrode == elec & predictor == reg & subject == sub, 
                      bin = rownames(null_df),
                      R2 = null_df[, 1],
                      Beta = null_df[, 3],
                      p = null_df[, 2])
      
      }
    }
    # save results to results folder #
    write.csv(results, path(here(), "results", paste0(sub, "_",  tag, "_results.csv")))
    
  }
  
}
