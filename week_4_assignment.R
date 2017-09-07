
setwd("C:/Users/lopezf/Documents/R/R-3.3.1/library/rprogramming/ProgAssignment3-data")


outcome = read.csv("outcome-of-care-measures.csv", colClasses = "character")

outcome[, 11] = as.numeric(outcome[, 11])
## You may get a warning about NAs being introduced; that is okay
hist(outcome[, 11])

best = function(state, outcome) {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with lowest 30-day death
  ## rate
}


rankhospital = function(state, outcome, num = "best") {
  ## Read outcome data
  ## Check that state and outcome are valid
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
}
