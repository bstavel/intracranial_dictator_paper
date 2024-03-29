stretch_start_end <- function(stretch) {
#####################################################################
##  function to identify the longest stretchs of sig p vals.
## input: 
##    stretch: logical vec where T indicates sig p val.
## output:
##    sun_indicies: begining and ending inex of longest stretch.
####################################################################
  # intialize values #
  streak_counter <- 0
  max_streak <- 0
  
  if(sum(is.na(stretch)) == length(stretch)){
    run_indices <- NA
  } else if(sum(is.na(stretch)) > 0) {
    stretch <- stretch[!is.na(stretch)]
  } else {
    # loop over stretch
    for(idx in 1:length(stretch)) {
      # if stretch == 1 start counting run #
      if (stretch[idx] == T) {
        # if no current streak, grab index #
        if (streak_counter == 0){
          beg_idx <- idx
        }
        
        # add to count #
        streak_counter <- streak_counter + 1
        
        # if streak counter is length of stetch, set indicies #
        if (streak_counter == length(stretch)) {
        run_indices <- c(1, length(stretch))
        } else if(idx == length(stretch)) {
          # if at the end of the vector and sig, end the stretch only if stertch is the longest
          if(streak_counter > max_streak){
            run_indices <- c(beg_idx, idx)
          }
        }
      # if stretch idx is 0, end previous streaks, if max streak finishes store indices #
      } else if (stretch[idx] == F) {
        max_streak <- max(max_streak, streak_counter)
        
        if (max_streak == 0) {
          run_indices <- NA
        } else if (max_streak == streak_counter) {
          run_indices <- c(beg_idx, (idx-1))
        }
        # reset streak counter #
        streak_counter <- 0
      
      # throw error if not 1 or 0 #
      } else {
        print("issue not binary vec")
      }
    }  
  }
  
  return(run_indices)
}