# To share or not to share? iEEG evidence for state-dependent inequity encoding in the human OFC

This repo contains the main analysis scripts for the above paper that investigated high frequency activity in the OFC during a dictator game. The preprint can be found here: https://www.biorxiv.org/content/10.1101/2022.06.23.497432v1


* Analyses (Contains the main analyses for the paper)
    * `load_clean_prep_all_hilbert_power_data_for_regressions.Rmd`: loads and preps the HFA data for the regressions
    * `behavioral_analyses.Rmd`: behaveioral analyses and panels for Figure 1 
    * `batch_subject_scripts`: batch scripts than ran the various permutation analyses
    * `compile*.Rmd` and `null_distribution.Rmd`: used to compile the permutation results and, for inequity dependent results, calculate the permutation statistic
    *  `unified_encoding.Rmd`: Core unified analyses and panels for Figure 2 
    *  `split_analyses.Rmd`: Inequity dependent results and panels for Figure 3
    *  `residuals` and `theta` versions are available for both unified and inequity dependent analyses
    * `alternate hypotheses*.Rmd`, `noise_comparison*.Rmd`: Contains analyses for alternative hypotheses
    * `*_anatomy.Rmd`: plotting helpers for the brain plots
    * `effect_localization`: anatomical localization analyses

* R
    * Helper functions used in the analysis scripts
* Matlab
    * Matlab was used to preprocess the data (scripts not yet included) and create brain plots `batch_dictator_plotting*.m`
* slurm
    * bash scripts for submitting jobs to slurm 
* data, munge, results
    * data removed
