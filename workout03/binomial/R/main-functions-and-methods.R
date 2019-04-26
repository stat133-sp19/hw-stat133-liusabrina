

tryCatch({
  source('../../R/private-checker-functions.R')
  source('../../R/private-auxiliary-functions-for-summary-measures.R')
  },
  error = function(err) {
    source('R/private-checker-functions.R')
    source('R/private-auxiliary-functions-for-summary-measures.R')
  }
)

#source('../../R/private-checker-functions.R')
#source('../../R/private-auxiliary-functions-for-summary-measures.R')

#' @title choose function
#' @description calculates the number of combinations in which k successes can occur in n trials
#' @param k: number of successes, a non-negative integer
#' @param n: number of trials, a non-negative integer
#' @return "n choose k"
#' @export
#' @examples
#' > bin_choose(5,2)
#' [1] 10
#' > bin_choose(5,0)
#' [1] 1
#' > bin_choose(5,1:3)
#' [1] 5 10 10
bin_choose = function(n,k) {
  check_trials(n)
  check_success(k, n)
  num = factorial(n)
  den = factorial(k) * factorial(n-k)
  return (num/den)
}

#' @title probability of binomial
#' @description calculates the probability of getting [success] successes in [trials] trials assuming the probabiity of success is [prob]
#' @param success: number of successes, a non-negative integer
#' @param trials: number of trials, a non-negative integer
#' @param prob: probability of success, a number between 0 and 1, inclusive
#' @return probability of k successes in n trials with prob p
#' @export
#' @examples
#' > bin_probability(success = 2, trials = 5, prob = 0.5)
#' [1] 0.3125
#' > bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' [1] 0.03125 0.15625 0.31250
#' > bin_probability(success = 55, trials = 100, prob = 0.45)
#'  [1] 0.01075277
bin_probability = function(success, trials, prob) {
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  n = trials
  k = success
  p = prob
  return (bin_choose(n,k)*p^k*(1-p)^(n-k))
}

#' @title distribution of binomial
#' @description calculates the probability distribution given trials and success prob
#' @param trials: number of trials, a non-negative integer
#' @param prob: probability of success, a number between 0 and 1, inclusive
#' @return probability distribution of each number of successes
#' @export
#' @examples
#' > bin_distribution(trials = 5, prob = 0.5)
bin_distribution = function(trials, prob) {
  suc = seq(0,trials)
  pro = bin_probability(suc, trials, prob)
  tab = data.frame(success=suc, probability=pro)
  class(tab) = c('bindis', 'data.frame')
  return (tab)
}

#' @title plots binomial distribution
#' @description graphs a barplot to display the probability histogram of a binomial distribution object
#' @export
#' @examples
#' > dis1 <- bin_distribution(trials = 5, prob = 0.5)
#' > plot(dis1)
plot.bindis = function(bindis) {
  barplot(bindis$probability, xlab='successes', ylab='probability', names.arg=bindis$success)
}

#' @title cumulative distribution of binomial
#' @description calculates the probability distribution and the cumulative distribution
#' @param trials: number of trials, a non-negative integer
#' @param prob: probability of success, a number between 0 and 1, inclusive
#' @return probability and cumulative distributions
#' @export
#' @examples
#' > bin_cumulative(trials = 5, prob = 0.5)
bin_cumulative = function(trials, prob) {
  tab = bin_distribution(trials, prob)
  tab$cumulative = cumsum(tab$probability)
  class(tab) = c('bincum', 'data.frame')
  return (tab)
}

#' @title plots cumulative binomial distribution
#' @description graphs the cumulative distribution of an object
#' @export
#' @examples
#' > dis2 <- bin_cumulative(trials = 5, prob = 0.5)
#' > plot(dis2)
plot.bincum = function(bincum) {
  plot(bincum$success, bincum$cumulative, type="b", xlab='successes', ylab='probability')
}

#' @title binomial random variable
#' @description returns a list with the named elements trials and prob
#' @param trials: number of trials, a non-negative integer
#' @param prob: probability of success, a number between 0 and 1, inclusive
#' @return list of trials and prob
#' @export
#' @examples
#' > bin_variable(trials = 5, prob = 0.5)
bin_variable = function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  lst = list(trials=trials, prob=prob)
  class(lst) = c('binvar')
  return (lst)
}

#' @description nicely prints the content of an object binvar
#' @export
#' @examples
#' > bin1 <- bin_variable(trials = 10, p = 0.3)
#' > bin1
print.binvar = function(binvar) {
  cat("\"Binomial variable\" \n \nParameters \n- number of trials:", binvar$trials,
      "\n- prob of success:", binvar$prob)
}

#' @description summarizes the contents of an object binvar
#' @export
summary.binvar = function(binvar) {
  trials = binvar$trials
  prob = binvar$prob
  lst = list(trials=trials, prob=prob, mean=aux_mean(trials, prob),
             variance=aux_variance(trials, prob), mode=aux_mode(trials, prob),
             skewness=aux_skewness(trials, prob), kurtosis=aux_kurtosis(trials, prob))
  class(lst) = c("summary.binvar")
  return (lst)
}

#' @description nicely prints the content of an object summary.binvar
#' @export
#' @examples
#' > bin1 <- bin_variable(trials = 10, p = 0.3)
#' > binsum1 <- summary(bin1)
#' > binsum1
print.summary.binvar = function(binsum) {
  cat("\"Summary Binomial\" \n \nParameters \n- number of trials:", binsum$trials,
      "\n- prob of success:", binsum$prob, "\n \n- mean:", binsum$mean,
      "\n- variance:", binsum$variance, "\n- mode:", binsum$mode,
      "\n- skewness:", binsum$skewness, "\n- kurtosis:", binsum$kurtosis)
}

#' @title binomial mean
#' @description calculates the mean of the binomial
#' @param trials: number of trials, a non-negative integer
#' @param prob: probability of success, a number between 0 and 1, inclusive
#' @return mean of binomial
#' @export
#' @examples
#' > bin_mean(10, 0.3)
#' [1] 3
bin_mean = function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return (aux_mean(trials, prob))
}

#' @title binomial variance
#' @description calculates the variance of the binomial
#' @param trials: number of trials, a non-negative integer
#' @param prob: probability of success, a number between 0 and 1, inclusive
#' @return variance of binomial
#' @export
#' @examples
#' > bin_variance(10, 0.3)
#' [1] 2.1
bin_variance = function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return (aux_variance(trials, prob))
}

#' @title binomial mode
#' @description calculates the mode of the binomial
#' @param trials: number of trials, a non-negative integer
#' @param prob: probability of success, a number between 0 and 1, inclusive
#' @return mode of binomial
#' @export
#' @examples
#' > bin_mode(10, 0.3)
#' [1] 3
bin_mode = function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return (aux_mode(trials, prob))
}

#' @title binomial skewness
#' @description calculates the skewness of the binomial
#' @param trials: number of trials, a non-negative integer
#' @param prob: probability of success, a number between 0 and 1, inclusive
#' @return skewness of binomial
#' @export
#' @examples
#' > bin_skewness(10, 0.3)
#' [1] 0.2760262
bin_skewness = function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return (aux_skewness(trials, prob))
}

#' @title binomial kurtosis
#' @description calculates the kurtosis of the binomial
#' @param trials: number of trials, a non-negative integer
#' @param prob: probability of success, a number between 0 and 1, inclusive
#' @return kurtosis of binomial
#' @export
#' @examples
#' > bin_kurtosis(10, 0.3)
#' [1] -0.1238095
bin_kurtosis = function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  return (aux_kurtosis(trials, prob))
}
