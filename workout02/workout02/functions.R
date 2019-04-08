
#' @title future value function
#' @description computes the future value of an investment
#' @param amount: initial invested amount as a dollar amount
#' @param rate: annual rate of return as a decimal
#' @param years: number of years
#' @return the future value of an initial investment for specified time and rate
future_value = function(amount, rate, years) {
  return (amount*(1+rate)^years)
}

#' @title future value of annuity
#' @description computes the future value of annuity
#' @param contrib: contributed amount as a dollar amount
#' @param rate: annual rate of return as a decimal
#' @param years: number of years
#' @return the future value of annuity for specified time and rate
annuity = function(contrib, rate, years) {
  num = (1+rate)^years - 1
  den = rate
  return (contrib * num / den)
}

#' @title future value of growing annuity
#' @description computes the future value of growing annuity
#' @param contrib: contributed amount as a dollar amount
#' @param rate: annual rate of return as a decimal
#' @param growth: annual growth rate as a decimal
#' @param years: number of years
#' @return the future value of growing annuity for specified time and rate
growing_annuity = function(contrib, rate, growth, years) {
  num = (1+rate)^years - (1+growth)^years
  den = rate - growth
  return (contrib * num / den)
}


#' @title yearly balances of different contributions
#' @description compiles a table of yearly balances for each of the three contributions
#' @param amount: initial invested amount as a dollar amount
#' @param rrate: annual rate of return as a decimal
#' @param years: number of years
#' @param contrib: annual contributed amount as a dollar amount
#' @param growth: annual growth rate as a decimal
balances = function(amount, rrate, years, contrib, growth) {
  rrate = rrate / 100
  growth = growth / 100
  years = seq(0,years)
  mode1 = c()
  mode2 = c()
  mode3 = c()
  for (i in years) {
    FV = future_value(amount = amount, rate = rrate, years = i)
    FVA = annuity(contrib = contrib, rate = rrate, years = i)
    FVGA = growing_annuity(contrib = contrib, rate = rrate, growth = growth, years = i)
    mode1 = c(mode1, FV)
    mode2 = c(mode2, FV+FVA)
    mode3 = c(mode3, FV+FVGA)
  }
  modalities = data.frame(year=years, no_contrib=mode1, fixed_contrib=mode2, growing_contrib=mode3)
  return (modalities)
}

balances(1000, 0.05, 10, 200, 0.03)



