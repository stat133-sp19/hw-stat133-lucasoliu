context("checkers")

test_that("check_prob", {
  expect_true(check_prob(0.5))
  expect_true(check_prob(1))
  expect_error(check_prob(2))
})

test_that("check_trials", {
  expect_true(check_trials(2))
  expect_error(check_trials(0.5))
  expect_error(check_trials(0))
})

test_that("check_success", {
  expect_true(check_success(1, 3))
  expect_true(check_success(3, 3))
  expect_error(check_success(5, 3))
})
