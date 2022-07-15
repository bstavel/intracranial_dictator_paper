#!/bin/bash

cd /Users/bstavel/Projects/dictator_analysis/dictator_game/dg_behave_analysis/results

# # # interaction folder
# rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR57/*trial-type-inter-new*.csv IR57/post_eda/interactions/
# 
# rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR39/*trial-type-inter-new*.csv IR39/post_eda/interactions/
# 
# rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR35/*trial-type-inter-new*.csv IR35/post_eda/interactions/
# 
# rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR28/*trial-type-inter-new*.csv IR28/post_eda/interactions/
# 
# rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR26/*trial-type-inter-new*.csv IR26/post_eda/interactions/
# 
# # # rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR19/*trial-type-inter-new*.csv .
# 
# rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR16/*trial-type-inter-new*.csv IR16/post_eda/interactions/
# 
# rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR10/*trial-type-inter-new*.csv IR10/post_eda/interactions/
# 
# rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR9/*trial-type-inter-new*.csv IR9/post_eda/interactions/
# 
# rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/GP51/*trial-type-inter-new*.csv GP51/post_eda/interactions/
# 
# rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/ST40/*trial-type-inter-new*.csv ST40/post_eda/interactions/
#  
 
# # multiple regressions folder
# cd results/IR57/post_eda/multiple_regressions/new_method
# # rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR57/post_eda/multiple_regressions/*multiple*.csv .
# 
# cd ../../../../IR39/post_eda/multiple_regressions/new_method
# rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR39/post_eda/multiple_regressions/*multiple*.csv .
# 
# cd ../../../../IR35/post_eda/multiple_regressions/new_method
# rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR35/post_eda/multiple_regressions/*multiple*.csv .
# 
# cd ../../../../IR28/post_eda/multiple_regressions/new_method
# rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR28/post_eda/multiple_regressions/*multiple*.csv .
# 
# cd ../../../../IR26/post_eda/multiple_regressions/new_method
# rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR26/post_eda/multiple_regressions/*multiple*.csv .
# 
# # cd ../../../../IR19/post_eda/multiple_regressions/new_method
# # rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR19/post_eda/multiple_regressions/*multiple*.csv .
# 
# cd ../../../../IR16/post_eda/multiple_regressions/new_method
# rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR16/post_eda/multiple_regressions/*multiple*.csv .
# 
# cd ../../../../IR10/post_eda/multiple_regressions/new_method
# rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR10/post_eda/multiple_regressions/*multiple*.csv .
# 
# cd ../../../../IR9/post_eda/multiple_regressions/new_method
# rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR9/post_eda/multiple_regressions/*multiple*.csv .
# 
# cd ../../../../GP51/post_eda/multiple_regressions/new_method
# rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/GP51/post_eda/multiple_regressions/*multiple*.csv .

# # main folder

# # delta 
# rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR57/*delta*only-hilbertRS_results.csv IR57/post_eda/delta/
# 
# rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR35/*delta*only-hilbertRS_results.csv IR35/post_eda/delta/
# 
# rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR28/*delta*only-hilbertRS_results.csv IR28/post_eda/delta/
# 
# rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR26/*delta*only-hilbertRS_results.csv IR26/post_eda/delta/
# 
# rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR16/*delta*only-hilbertRS_results.csv IR16/post_eda/delta/
# 
# # rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR10/*delta*only-hilbertRS_results.csv IR10/post_eda/delta/
# 
# rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR9/*delta*only-hilbertRS_results.csv IR9/post_eda/delta/
# 
# rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR39/*delta*only-hilbertRS_results.csv IR39/post_eda/delta/
# 
# rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/GP51/*delta*only-hilbertRS_results.csv GP51/post_eda/delta/
# 
# rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/DA9/*delta*only-hilbertRS_results.csv DA9/post_eda/delta/
# 
# rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/ST40/*delta*only-hilbertRS_results.csv ST40/post_eda/delta/


# # theta 
# rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR57/*theta*only-hilbertRS_results.csv IR57/post_eda/theta/
# 
# rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR35/*theta*only-hilbertRS_results.csv IR35/post_eda/theta/
# 
# rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR28/*theta*only-hilbertRS_results.csv IR28/post_eda/theta/
# 
# rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR26/*theta*only-hilbertRS_results.csv IR26/post_eda/theta/
# 
# rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR16/*theta*only-hilbertRS_results.csv IR16/post_eda/theta/
# 
# # rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR10/*theta*only-hilbertRS_results.csv IR10/post_eda/theta/
# 
# rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR9/*theta*only-hilbertRS_results.csv IR9/post_eda/theta/
# 
# rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR39/*theta*only-hilbertRS_results.csv IR39/post_eda/theta/
# 
# rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/GP51/*theta*only-hilbertRS_results.csv GP51/post_eda/theta/
# 
# rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/DA9/*theta*only-hilbertRS_results.csv DA9/post_eda/theta/
# 
# rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/ST40/*theta*only-hilbertRS_results.csv ST40/post_eda/theta/


# hfa

rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR57/*cperm*results.csv IR57/final/

rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR35/*cperm*results.csv IR35/final/

rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR28/*cperm*results.csv IR28/final/

rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR26/*cperm*results.csv IR26/final/

rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR16/*cperm*results.csv IR16/final/

rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR19/*cperm*results.csv IR19/final/

rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR9/*cperm*results.csv IR9/final/

rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR39/*cperm*results.csv IR39/final/

rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/GP51/*cperm*results.csv GP51/final/

rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/DA9/*cperm*results.csv DA9/final/

rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/ST40/*cperm*results.csv ST40/final/
