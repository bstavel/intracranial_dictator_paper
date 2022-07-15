#!/bin/bash

cd /Users/bstavel/Projects/dictator_analysis/dictator_game/dg_behave_analysis/results

# # # interaction folder
# rsync -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR57/*trial-type-inter-new-hilbertRS*.csv IR57/new_sig_thresh/interactions/
# 
# rsync -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR39/*trial-type-inter-new-hilbertRS*.csv IR39/new_sig_thresh/interactions/
# 
# rsync -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR35/*trial-type-inter-new-hilbertRS*.csv IR35/new_sig_thresh/interactions/
# 
# rsync -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR28/*trial-type-inter-new-hilbertRS*.csv IR28/new_sig_thresh/interactions/
# 
# rsync -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR26/*trial-type-inter-new-hilbertRS*.csv IR26/new_sig_thresh/interactions/
# 
# # # rsync -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR19/*trial-type-inter-new-hilbertRS*.csv .
# 
# rsync -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR16/*trial-type-inter-new-hilbertRS*.csv IR16/new_sig_thresh/interactions/
# 
# rsync -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR10/*trial-type-inter-new-hilbertRS*.csv IR10/new_sig_thresh/interactions/
# 
# rsync -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR9/*trial-type-inter-new-hilbertRS*.csv IR9/new_sig_thresh/interactions/
# 
# rsync -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/GP51/*trial-type-inter-new-hilbertRS*.csv GP51/new_sig_thresh/interactions/
# 
# rsync -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/ST40/*trial-type-inter-new-hilbertRS*.csv ST40/new_sig_thresh/interactions/

# 
# # multiple regressions folder
# cd results/IR57/new_sig_thresh/multiple_regressions/new_method
# # rsync -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR57/new_sig_thresh/multiple_regressions/*multiple*.csv .
# 
# cd ../../../../IR39/new_sig_thresh/multiple_regressions/new_method
# rsync -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR39/new_sig_thresh/multiple_regressions/*multiple*.csv .
# 
# cd ../../../../IR35/new_sig_thresh/multiple_regressions/new_method
# rsync -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR35/new_sig_thresh/multiple_regressions/*multiple*.csv .
# 
# cd ../../../../IR28/new_sig_thresh/multiple_regressions/new_method
# rsync -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR28/new_sig_thresh/multiple_regressions/*multiple*.csv .
# 
# cd ../../../../IR26/new_sig_thresh/multiple_regressions/new_method
# rsync -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR26/new_sig_thresh/multiple_regressions/*multiple*.csv .
# 
# # cd ../../../../IR19/new_sig_thresh/multiple_regressions/new_method
# # rsync -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR19/new_sig_thresh/multiple_regressions/*multiple*.csv .
# 
# cd ../../../../IR16/new_sig_thresh/multiple_regressions/new_method
# rsync -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR16/new_sig_thresh/multiple_regressions/*multiple*.csv .
# 
# cd ../../../../IR10/new_sig_thresh/multiple_regressions/new_method
# rsync -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR10/new_sig_thresh/multiple_regressions/*multiple*.csv .
# 
# cd ../../../../IR9/new_sig_thresh/multiple_regressions/new_method
# rsync -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR9/new_sig_thresh/multiple_regressions/*multiple*.csv .
# 
# cd ../../../../GP51/new_sig_thresh/multiple_regressions/new_method
# rsync -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/GP51/new_sig_thresh/multiple_regressions/*multiple*.csv .

# # main folder

# # # delta
rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR57/*delta*only-hilbertRS_results.csv IR57/post_eda/delta/

rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR35/*delta*only-hilbertRS_results.csv IR35/post_eda/delta/

rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR28/*delta*only-hilbertRS_results.csv IR28/post_eda/delta/

rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR26/*delta*only-hilbertRS_results.csv IR26/post_eda/delta/

rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR16/*delta*only-hilbertRS_results.csv IR16/post_eda/delta/

# rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR10/*delta*only-hilbertRS_results.csv IR10/post_eda/delta/

rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR9/*delta*only-hilbertRS_results.csv IR9/post_eda/delta/

rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR39/*delta*only-hilbertRS_results.csv IR39/post_eda/delta/

rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/GP51/*delta*only-hilbertRS_results.csv GP51/post_eda/delta/

rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/ST40/*delta*only-hilbertRS_results.csv ST40/post_eda/delta/

rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/DA9/*delta*only-hilbertRS_results.csv DA9/post_eda/delta/

# # # theta
rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR57/*theta*only-hilbertRS_results.csv IR57/post_eda/theta/

rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR35/*theta*only-hilbertRS_results.csv IR35/post_eda/theta/

rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR28/*theta*only-hilbertRS_results.csv IR28/post_eda/theta/

rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR26/*theta*only-hilbertRS_results.csv IR26/post_eda/theta/

rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR16/*theta*only-hilbertRS_results.csv IR16/post_eda/theta/

# rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR10/*theta*only-hilbertRS_results.csv IR10/post_eda/theta/

rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR9/*theta*only-hilbertRS_results.csv IR9/post_eda/theta/

rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR39/*theta*only-hilbertRS_results.csv IR39/post_eda/theta/

rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/GP51/*theta*only-hilbertRS_results.csv GP51/post_eda/theta/

rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/ST40/*theta*only-hilbertRS_results.csv ST40/post_eda/theta/

rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/DA9/*theta*only-hilbertRS_results.csv DA9/post_eda/theta/

# # hfa
# 
# rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR57/*only-hilbertRS_results.csv IR57/post_eda/
# 
# rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR35/*only-hilbertRS_results.csv IR35/post_eda/
# 
# rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR28/*only-hilbertRS_results.csv IR28/post_eda/
# 
# rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR26/*only-hilbertRS_results.csv IR26/post_eda/
# 
# rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR16/*only-hilbertRS_results.csv IR16/post_eda/
# 
# # rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR10/*only-hilbertRS_results.csv IR10/post_eda/
# 
# rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR9/*only-hilbertRS_results.csv IR9/post_eda/
# 
# rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/IR39/*only-hilbertRS_results.csv IR39/post_eda/
# 
# rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/GP51/*only-hilbertRS_results.csv GP51/post_eda/
# 
# rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/ST40/*only-hilbertRS_results.csv ST40/post_eda/
# 
# rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/DA9/*only-hilbertRS_results.csv DA9/post_eda/



# null dist 
# rsync -av bstavel@hpc.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/*null-average-r2-*.csv .
# 
# rsync -e "ssh -o 'ControlPath=/Users/bstavel/.ssh/ctl/%L-%r@%h:%p'" -av bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/*null-average-r2-*.csv .

# cat subject_sync_list.txt | xargs -n1 -P4 -I% rsync -Pa bstavel@dtn.brc.berkeley.edu:/global/scratch/users/bstavel/dictator_data_analysis/results/%/*hfa*-only*results.csv %/new_sig_thresh/

