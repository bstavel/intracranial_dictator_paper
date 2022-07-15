source(path(here(), "analysis/batch_IR39_regression_script_presentation-locked_par.R"))
source(path(here(), "analysis/batch_IR39_regression_script_choice-locked_par.R"))
source(path(here(), "analysis/batch_IR35_regression_script_presentation-locked_par.R"))
source(path(here(), "analysis/batch_IR35_regression_script_choice-locked_par.R"))


R CMD BATCH --no-save ./analysis/batch_IR19_regression_script_presentation-locked_par.R ./slurm/beta_4-8.out
R CMD BATCH --no-save ./analysis/batch_IR39_regression_script_presentation-locked_par.R ./slurm/beta_4-8.out
R CMD BATCH --no-save ./analysis/batch_IR39_regression_script_choice-locked_par.R ./slurm/beta_4-8.out
R CMD BATCH --no-save ./analysis/batch_IR35_regression_script_presentation-locked_par.R ./slurm/beta_4-8.out
R CMD BATCH --no-save ./analysis/batch_IR35_regression_script_choice-locked_par.R ./slurm/beta_4-8.out
