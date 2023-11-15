library(usethis)
library(testthat)

test_that("oneORthree decides accurately", {
  expect_equal(oneORthree_code("E123P"), "one")
})

test_that("oneORthree decides accurately", {
  expect_equal(oneORthree_code("Glu123Phe"), "three")
})
