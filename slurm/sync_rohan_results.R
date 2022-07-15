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
# cd results/IR57/post_eda/
# # # theta
# # rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR57/*.csv .
# 
# cd ../../IR35/post_eda/
# rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR35/*.csv .
# 
# # cd ../../IR28/post_eda/
# # rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR28/*.csv .
# 
# cd ../../IR26/post_eda/
# rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR26/*.csv .
# 
# # cd ../../IR16/post_eda/
# # rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR16/*.csv .
# 
# cd ../../IR10/post_eda/
# rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR10/*.csv .
# 
# cd ../../IR9/post_eda/
# rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR9/*.csv .

# hfa

rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR57/*results.csv IR57/post_eda/

rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR35/*results.csv IR35/post_eda/

rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR28/*results.csv IR28/post_eda/

rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR26/*results.csv IR26/post_eda/

rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR16/*results.csv IR16/post_eda/
# 
# rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR10/*results.csv IR10/post_eda/

rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR9/*results.csv IR9/post_eda/

rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR19/*results.csv IR19/post_eda/
  
rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/IR39/*results.csv IR39/post_eda/

rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/GP51/*results.csv GP51/post_eda/

rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/DA9/*results.csv DA9/post_eda/

rsync -av --rsh='ssh -p1729 -o ConnectTimeout=120' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/ST40/*results.csv ST40/post_eda/
  
  
  
# no ofc   
# cd ../../CP34/post_eda/
# rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/CP34/*_hfa*.csv .
#
# cd ../../DA8/post_eda/
# rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/DA8/*_hfa*.csv .
  
# cd ../../CP38/post_eda/
# rsync -av --rsh='ssh -p1729' brooke@garrett.legendarylan.com:/home/brooke/dictator_data_analysis/results/CP38/*_hfa*.csv .
  