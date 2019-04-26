
context("Test for private auxiliary functions for summary measures, checking summary measure outputs")

# load the source code of the functions to be tested
source("../../R/private-auxiliary-functions-for-summary-measures.R")

test_that('aux_mean works as expected', {
  expect_equal(aux_mean(4, 0.25), 1)
  expect_length(aux_mean(c(1:5), 7), 5)
  expect_true(is.vector(aux_mean(4:9, 11)))
})

test_that('aux_variance works as expected', {
  expect_equal(aux_variance(8, 0.25), 1.5)
  expect_equal(aux_variance(c(6,12), 0.7), c(1.26, 2.52))
  expect_length(aux_variance(1:4, 0.7), 4)
  expect_true(is.vector(aux_variance(8, 0.2)))
})

test_that('aux_mode works as expected', {
  expect_equal(aux_mode(4, 0.2), 1)
  expect_equal(aux_mode(5, 0.17), 1)
  expect_true(all(is.integer(aux_mode(3:10, 0.12))))
})

test_that('aux_skewness works as expected', {
  expect_equal(aux_skewness(10, 0.5), 0)
  expect_equal(aux_skewness(100, 0.32), 0.07717436)
  expect_equal(aux_skewness(57, 0.99), -1.304581)
})

test_that('aux_kurtosis works as expected', {
  expect_equal(aux_kurtosis(16, 0.5), -0.125)
  expect_length(aux_kurtosis(6:8, 0.1), 3)
  expect_true(is.numeric(aux_kurtosis(54, 0.11)))
})
