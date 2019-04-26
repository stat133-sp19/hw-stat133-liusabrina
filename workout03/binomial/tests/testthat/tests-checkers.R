
context("Test for private checker functions, checking binomial arguments")

# load the source code of the functions to be tested
source('../../R/private-checker-functions.R')

test_that("check_prob only takes probabilities between 0 and 1", {
  expect_true(check_prob(0.5))
  expect_error(check_prob(-0.1), "invalid prob value: prob has to be a number between 0 and 1")
  expect_error(check_prob(1.1), "invalid prob value: prob has to be a number between 0 and 1")
})
test_that("check_prob only takes probabilities of length 1", {
  expect_true(check_prob(0.1))
  expect_error(check_prob(c(0.2, 0.5)), "invalid prob value: prob has to be a number between 0 and 1")
  expect_error(check_prob(1:3), "invalid prob value: prob has to be a number between 0 and 1")
})


test_that("check_trials only takes numerics", {
  expect_true(check_trials(3))
  expect_error(check_trials(c('abc')), 'invalid trials value: trials has to be an integer greater than or equal to 0')
  expect_error(check_trials(c('one')), 'invalid trials value: trials has to be an integer greater than or equal to 0')
})
test_that("check_trials only takes integers", {
  expect_true(check_trials(3))
  expect_error(check_trials(1.2), 'invalid trials value: trials has to be an integer greater than or equal to 0')
  expect_error(check_trials(1.001), 'invalid trials value: trials has to be an integer greater than or equal to 0')
})
test_that("check_trials only takes non-negative values", {
  expect_true(check_trials(70))
  expect_error(check_trials(-3), 'invalid trials value: trials has to be an integer greater than or equal to 0')
  expect_error(check_trials(-0.001), 'invalid trials value: trials has to be an integer greater than or equal to 0')
})


test_that("check_success only takes a vector of integers", {
  expect_true(check_success(c(1,2,3), 4))
  expect_error(check_success('1',4), 'invalid success value')
  expect_error(check_success(c(1,'two',3), 4), 'invalid success value')
  expect_error(check_success(c(1,2,3.1), 4), 'success must be only non-negative integers')
  expect_error(check_success(c(1,-1,2), 4), 'success must be only non-negative integers')
})
test_that("check_success only takes success values less than or equal to trials", {
  expect_true(check_success(4,5))
  expect_true(check_success(7,7))
  expect_true(check_success(c(2,3,7),9))
  expect_error(check_success(3,2), 'success cannot be greater than trials')
  expect_error(check_success(c(1,2,4),3), 'success cannot be greater than trials')
})
