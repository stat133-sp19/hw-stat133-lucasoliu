context("binomial")

test_that("bin_choose", {
  expect_equal(bin_choose(10, 5), 252)
  expect_equal(bin_choose(6, 2), 15)
  expect_error(bin_choose(6, 7))
})

test_that("bin_probability", {
  expect_equal(bin_probability(5, 10, 1), 0)
  expect_equal(bin_probability(0, 2, 0), 1)
  expect_error(bin_probability(10, 5, 1))
})

test_that("bin_distribution", {
  expect_equal(bin_distribution(10, 0)$probability[1], 1)
  expect_equal(bin_distribution(10, 0)$probability[2], 0)
  expect_equal(length(bin_distribution(10, 0.5)$probability), 11)
})

test_that("bin_cumulative", {
  expect_equal(bin_cumulative(10, 0)$probability[1], 1)
  expect_equal(bin_cumulative(10, 0)$probability[2], 0)
  expect_equal(bin_cumulative(10, 0)$cumulative[1], 1)
})
