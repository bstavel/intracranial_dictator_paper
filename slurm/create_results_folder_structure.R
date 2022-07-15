subs <- c("IR9", "IR16", "IR19", "IR26", "IR28", "IR35", "IR57", "IR39", "GP51", "DA9", "ST40")

# for(sub in subs){
#   dir.create(paste0(path(here(), "results/"), "/", sub))
# }
# 
# for(sub in subs){
#   dir.create(paste0(path(here(), "results/"), "/", sub, "/post_eda/theta"), recursive = T)
# }
# 
# for(sub in subs){
#   dir.create(paste0(path(here(), "results/"), "/", sub, "/post_eda/delta"), recursive = T)
# }

for(sub in subs){
  dir.create(paste0(path(here(), "results/"), "/", sub, "/final"), recursive = T)
}