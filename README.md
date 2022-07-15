# To share or not to share? iEEG evidence for state-dependent inequity encoding in the human OFC

This repo contains the main analysis scripts for the above paper that investigated high frequency activity in the OFC during a dictator game. The preprint can be found here: https://www.biorxiv.org/content/10.1101/2022.06.23.497432v1

For now all data have been removed, but will be uploaded upon publication. Here is a brief overview of the repo's structure

* Analyses
    * Contains the main analyses for the paper. Figure 1 results are primarily in `behavioral_analyses.Rmd`. Figure 2 analyses are primarily in `unified_encoding.Rmd`. Figure 3 analyses are primarily in `state_dependent_analyses.Rmd`.
    * Contains analyses for alternative hypotheses, compilation scripts, and batch scripts for the electrolde-level regressions
* R
    * Helper functions used in the analysis scripts
* Matlab
    * Matlab was used to preprocess the data (scripts not yet included) and create brain plots `batch_dictator_plotting*.m`
* slurm
    * bash scripts for submitting jobs to slurm 
* data, munge, results
    * data removed
