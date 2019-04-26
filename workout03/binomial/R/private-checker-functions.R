
# private auxiliary function to test if the input is a valid probability
check_prob = function(prob) {
  if (all(prob >= 0 & prob <=1 & length(prob)==1)) {
    return (TRUE)
  }
  else {
    stop("invalid prob value: prob has to be a number between 0 and 1")
  }
}

# private auxiliary function to test if the input is a valid number of trials
check_trials = function(trials) {
  if (all(is.numeric(trials))) {
    if (all(trials==as.integer(trials) & trials >= 0)) {
      return (TRUE)
    }
  else {
    stop('invalid trials value: trials has to be an integer greater than or equal to 0')
    }
  }
  else {
    stop('invalid trials value: trials has to be an integer greater than or equal to 0')
  }
}

# private auxiliary function to test if the input is a valid number of successes
check_success = function(success, trials) {
  if (!(check_trials(trials)==TRUE)) {
    stop('invalid trials value: trials has to be an integer greater than or equal to 0')
  }
  if (all(is.vector(success) & is.numeric(success))) {
    if (all(success==as.integer(success) & success>=0)) {
      if (all(success<=trials)) {
        return (TRUE)
      }
      else if (any(success>trials)) {
        stop('success cannot be greater than trials')
      }
    }
    else {
      stop('success must be only non-negative integers')
    }
  }
  else {
    stop('invalid success value')
  }
}
