run_permuted_regressions_par <- function(brain_behave_data, 
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
    
    # create results dfs #
    results <- data.frame(matrix(nrow = length(nBins), ncol = 17))
    colnames(results) <- c("electrode", "bin", "R2", "Beta", "Intercept", "Fstat", "p", 
                           "fstretch", "bstretch", "perm_p", "perm_p_beta", 
                           "beta_null_max", "beta_null_mean", "beta_null_sd",
                           "fstat_null_max", "fstat_null_mean", "fstat_null_sd")
    
    # fill results dfs with electrode & bin info #
    results$electrode <- elec
    results$bin <- nBins
    
    # filter to single electrode #
    brain_behave_data_elec <- brain_behave_data %>% filter(electrodes == elec)
     
    # initialize temp vars #
    r2 <- NULL
    fstat <- NULL
    beta <- NULL
    lm_pval <- NULL
    intercept <- NULL
    broken <- FALSE
    
    tryCatch(
      expr = {
        for (bin in nBins) {      
          # run models #
          bin_vec <- brain_behave_data_elec %>% pull(bin)
          reg_vec <- brain_behave_data_elec %>% pull(regressor)
          model <- summary(lm(bin_vec ~ reg_vec))
          
          # store info from models #
          r2[bin] <- model$r.squared
          fstat[bin] <- model$fstatistic[1]
          intercept[bin] <-  model$coefficients[1, 1]
          beta[bin] <- model$coefficients[2, 1]
          lm_pval[bin] <- model$coefficients[2,4]
          
        }
    },
      error=function(e) {
        broken <<- TRUE
      }
    )
    
    if(broken) {
      for(bin in nBins) {
        r2[bin] <- NA
        fstat[bin] <- 1.9999
        beta[bin] <- NA
        lm_pval[bin] <- NA
        intercept[bin] <- NA
      }
    }
    
    ## Find out the longest stretch in which pval < 0.05 and create sum-of-F-stats statistic ##
    stretch <- lm_pval < 0.05
    indices <- stretch_start_end(stretch)
    
    # if there is no stretch, take the max beta and max f statistic #
    if(is.na(indices[1])) {
      beta_stretch <- max(abs(beta))
      fstat_stretch <- max(fstat)
      # if there is a stretch, sum the betas and the f statistics #
    } else {
      beta_stretch <- sum(abs(beta[indices[1]:indices[2]])) # Summary stat
      fstat_stretch <- sum(fstat[indices[1]:indices[2]]) # Summary stat
    }
    
    # only run permutation testing if fstratch is above 7, otherwise extremely unlikely to be sig and speeds up processing-- set to zero now so we can do fdr correction if needed
    if( fstat_stretch > 0 ) {
      # Create null distribution by shuffling labels #
      null_stretch <- matrix(nrow = niter, ncol = 2)
      null_stretch <- foreach(h = 1:niter, .inorder=FALSE, .combine = 'rbind') %dopar% {
        # print status #
        if(h %% 100 == 0){
          print(paste0( (h/niter) * 100, "% complete for electrode", which(electrodes %in% elec), " of ", length(electrodes)))
        }
        
        # intialize vars #
        null_fstat <- NULL
        null_beta <- NULL
        null_lm_pval <- NULL
        
       for (bin in nBins) { 
          # consistent permuting across time bins
          # set.seed(h)
          
          # run models #
          bin_vec <- brain_behave_data_elec %>% pull(bin)
          reg_vec <- brain_behave_data_elec %>% pull(regressor)
          null_lm <-summary(lm(bin_vec ~ sample(reg_vec), data = brain_behave_data_elec))
          
          # save info from models #
          null_fstat[bin] <- null_lm$fstatistic[1]
          null_beta[bin] <- null_lm$coefficients[2,1]
          null_lm_pval[bin] <- null_lm$coefficients[2,4]
          
        }
        
        ## Find out the longest stretch in which pval < 0.05 and create sum-of-F-stats statistic ##
        stretch <- null_lm_pval < 0.05
        indices <- stretch_start_end(stretch)
        if(is.na(indices[1])) {
          # if no stretch just take the max vals #
          null_stretch[h, 1] <- max(null_fstat)
          null_stretch[h, 2] <- max(abs(null_beta))
          
        } else {
          # if a stretch take the sum of f stats #  
          null_stretch[h, 1] <- sum(null_fstat[indices[1]:indices[2]]) # Summary stat
          null_stretch[h, 2] <- sum(abs(null_beta[indices[1]:indices[2]])) # Summary stat
        }
        
        return(null_stretch[h, 1:2])
      }
      
      # our test statistic for the permutation test is the sum of f tests #
      null_fstat_stretch <- null_stretch[, 1]
      null_beta_stretch <- null_stretch[, 2]
      perm_pval <- sum(null_fstat_stretch > fstat_stretch)/niter
      perm_pval_beta <- sum(null_beta_stretch > beta_stretch)/niter
      
      # get null values 
      betaStr_sd <- sd(unlist(null_beta_stretch), na.rm = T)
      betaStr_max <- max(unlist(null_beta_stretch), na.rm = T)
      betaStr_mean <- mean(unlist(null_beta_stretch), na.rm = T)
      
      fstatStr_sd <- sd(unlist(null_fstat_stretch), na.rm = T)
      fstatStr_max <- max(unlist(null_fstat_stretch), na.rm = T)
      fstatStr_mean <- mean(unlist(null_fstat_stretch), na.rm = T)
      
    } else {
      perm_pval <- 2
      perm_pval_beta <- 2
      
      betaStr_sd <- 2
      betaStr_max <- 2
      betaStr_mean <- 2
      
      fstatStr_sd <- 2
      fstatStr_max <- 2
      fstatStr_mean <- 2
    }

    # save vals in results df #
    results <- results %>% 
      mutate_cond(electrode == elec, 
                  R2 = r2, 
                  Beta = beta, 
                  Intercept = intercept, 
                  Fstat = fstat, 
                  p = lm_pval, 
                  fstretch = fstat_stretch, 
                  bstretch = beta_stretch, 
                  perm_p = perm_pval,
                  perm_p_beta = perm_pval_beta, 
                  beta_null_max = betaStr_max, beta_null_sd = betaStr_sd, beta_null_mean = betaStr_mean,
                  fstat_null_max = fstatStr_max, fstat_null_sd = fstatStr_sd, fstat_null_mean = fstatStr_mean)
    
  
    # save results to results folder #
    write.csv(results, path(here(), "results", sub, paste0(region_name, "_", elec, "_", regressor, "_", tag, "_results.csv")))
    
  }
  
}
