
context("Test for main functions and methods, checking binomial outputs")

# load the source code of the functions to be tested
source("../../R/private-checker-functions.R")
source("../../R/private-auxiliary-functions-for-summary-measures.R")
source("../../R/main-functions-and-methods.R")

test_that("bin_choose works as expected", {
  expect_true(is.numeric(bin_choose(4, 1)))
  expect_true(length(bin_choose(5, 1:3))==length(1:3))
  expect_error(bin_choose(1,4), 'success cannot be greater than trials')
})

test_that("bin_probability works as expected", {
  expect_equal(bin_probability(2,5,0.5), 0.3125)
  expect_true(length(bin_probability(1:3, 7, 0.25))==length(1:3))
  expect_error(bin_probability(4, 9.8, 1), 'invalid trials value: trials has to be an integer greater than or equal to 0')
})

test_that("bin_distribution works as expected", {
  expect_is(bin_distribution(10,0.5), c('bindis', 'data.frame'))
  expect_true(ncol(bin_distribution(5,0.2))==2)
  expect_true(nrow(bin_distribution(4,.1))==length(seq(0,4)))
})

test_that("bin_cumulative works as expected", {
  expect_is(bin_cumulative(8,0.8), c('bincum', 'data.frame'))
  expect_true(ncol(bin_cumulative(15,0.31))==3)
  expect_true(nrow(bin_cumulative(11,0.12))==length(seq(0,11)))
  expect_equal(bin_cumulative(12,0.76)$cumulative[13], 1)
})

test_that("bin_variable works as expected", {
  expect_is(bin_variable(10,0.66), c('binvar'))
  expect_error(bin_variable(-10, 0.2), 'invalid trials value: trials has to be an integer greater than or equal to 0')
  expect_error(bin_variable(9, 1.2), 'invalid prob value: prob has to be a number between 0 and 1')
})