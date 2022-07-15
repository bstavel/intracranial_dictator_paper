compile_results <- function(regions, type, sub, path, spec_vars = c("*", "*"), exclude_string = F, freq = "*"){
# function rbinds result dfs based on list of regions #
  
  ## search the results folder for results csvs ##
  filenames <- dir(path)
  # only from the region list#
  files_to_combine <- filenames[grepl(paste(paste0("^", regions, "_.*results.csv"), collapse = "|"), filenames, perl = F)]
  # on certain variables? #
  files_to_combine <- files_to_combine[grepl(paste(spec_vars, collapse = "|"), files_to_combine)]
  # not anova results #
  files_to_combine <- files_to_combine[!grepl("anova", files_to_combine)] # HACK fix this later please
  # not beta results #
  files_to_combine <- files_to_combine[!grepl("full_beta", files_to_combine)] # HACK fix this later please
  # type #
  files_to_combine <- files_to_combine[grepl(type, files_to_combine)] # HACK fix this later please
  # freq #
  files_to_combine <- files_to_combine[grepl(freq, files_to_combine)]
  
  # loop over and rbind #
  combined_results <- NULL
  for(file in files_to_combine){
    temp <- read.csv(path(path, file))
    predictor_freq <- gsub("^[^_]*_", "", gsub(".*-", "", gsub(paste0("-", type, "_results.csv"), "", file))) # because _someone_ didn't save the predictor in the damn df
    freq <- gsub(".*_", "", predictor_freq)
    predictor <- gsub(paste0("_", freq), "", predictor_freq)
    region <- gsub("_.*", "", file)
    temp$predictor <- predictor
    temp$region <- region
    temp$freq <- freq
    # # grab not absolute value beta for exist check #
    if(exclude_string == T){
      if(grepl("ineq_var_hfa", file)) { # using ineq_var_abs since it makes more sense with trial types. ineq_var then has old csv format
        next()
      }
    }
    if(length(colnames(temp)) < 15) { # exclude older versions of the scripts
      next()
    }
    
    # remove absolute beta so it can be combined with other values
    temp <- temp %>% select(-X)
    combined_results <- rbind(combined_results, temp)
  }
  
  return(combined_results)
}