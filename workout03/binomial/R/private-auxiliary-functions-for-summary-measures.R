
# computes the mean
aux_mean = function(trials, prob) {
  n = trials
  p = prob
  return (n*p)
}

# computes the variance
aux_variance = function(trials, prob) {
  n = trials
  p = prob
  return (n*p*(1-p))
}

# computes the mode
aux_mode = function(trials, prob) {
  n = trials
  p = prob
  return (as.integer(n*p+p))
}

# computes the skewness
aux_skewness = function(trials, prob) {
  n = trials
  p = prob
  num = 1-2*p
  den = sqrt(n*p*(1-p))
  return (num/den)
}

# computes the kurtosis
aux_kurtosis = function(trials, prob) {
  n = trials
  p = prob
  num = 1-6*p*(1-p)
  den = n*p*(1-p)
  return (num/den)
}
