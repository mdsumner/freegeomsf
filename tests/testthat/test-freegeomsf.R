test_that("multiplication works", {
  expect_equal(attr(freegeomsf(sfx)$geometry, "bbox")[c(1, 3, 2, 4)],
               c(xmin = 0, xmax = 1, ymin = 0, ymax = 1))

})
