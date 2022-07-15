compile_mult_reg_results <- function(regions, method = "false", type, sub, path, spec_vars = c("*", "*")){
  # function rbinds result dfs based on list of regions #
  
  ## search the results folder for results csvs ##
  filenames <- dir(path)
  # only from the region list#
  files_to_combine <- filenames[grepl(paste(paste0("^", regions, "_.*results.csv"), collapse = "|"), filenames, perl = F)]
  # on certain variables? #
  files_to_combine <- files_to_combine[grepl(paste(spec_vars, collapse = "|"), files_to_combine)]
  # type/tag #
  files_to_combine <- files_to_combine[grepl(type, files_to_combine)] 
  # multiple#
  files_to_combine <- files_to_combine[grepl("multiple", files_to_combine) | grepl("inter", files_to_combine) | grepl("split-model", files_to_combine) | grepl("reg-vs-omni", files_to_combine)] 
  # new method #
  if(method == "new"){
    files_to_combine <- files_to_combine[grepl("trial_type", files_to_combine)]
  }
  
  # loop over and rbind #
  combined_results <- NULL
  for(file in files_to_combine){
    temp <- read.csv(path(path, file))
    predictor <- gsub("^[^_]*_", "", gsub(".*-", "", gsub(paste0("_", type, ".*"), "", file))) # because _someone_ didn't save the predictor in the damn df
    region <- gsub("_.*", "", file)
    temp$predictor <- predictor
    temp$region <- region
    temp <- temp %>% select(-X)
    if(method == "new"){
      if(length(colnames(temp)) == 16) {
        combined_results <- rbind(combined_results, temp)
      }
    } else {
      combined_results <- rbind(combined_results, temp)
    }
  }
  
  return(combined_results)
}