context("measures")

test_that("aux_mean", {
  expect_equal(aux_mean(10, 0.3), 3)
  expect_equal(aux_mean(6, 0.5), 3)
  expect_equal(aux_mean(10, 0.69), 6.9)
})

test_that("aux_variance", {
  expect_equal(aux_variance(10, 0.3), 2.1)
  expect_equal(aux_variance(6, 0.5), 1.5)
  expect_equal(aux_variance(10, 0.69), 2.139)
})

test_that("aux_mode", {
  expect_equal(aux_mode(10, 0.3), 3)
  expect_equal(aux_mode(6, 0.5), 3)
  expect_equal(aux_mode(10, 0.69), 7)
})

test_that("aux_skewness", {
  expect_equal(aux_skewness(10, 0.5), 0)
  expect_equal(aux_skewness(6, 0.5), 0)
  expect_equal(aux_skewness(5, 0.5), 0)
})

test_that("aux_kurtosis", {
  expect_equal(aux_kurtosis(10, 0.5), -0.2)
  expect_equal(aux_kurtosis(20, 0.5), -0.1)
  expect_equal(aux_kurtosis(5, 0.5), -0.4)
})
