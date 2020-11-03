context("test fertilizer measurement class and methods")

test_that("Test get fertilizer-product ver. 0291 - site ID = 7", {
  
  test_v0291 <- AgFertilizerMea$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                              version ="/0291/r")
  out_test2 <- test_v0291$ag_get_fertmea_expsiteId(expsiteDbId= 7, format="data.frame")
  testthat::expect_equal(object = nrow(out_test2),expected = 7)
  
})


test_that("Test get fertilizer-product ver. 0291 - site ID = 8-intercrop", {
  
  test_v0291 <- AgFertilizerMea$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                              version ="/0291/r")
  out_test2 <- test_v0291$ag_get_fertmea_expsiteId(expsiteDbId= 8, format="data.frame")
  testthat::expect_equal(object = nrow(out_test2),expected = 7)
  
})


test_that("Test get fertilizer-product ver. 0291 - site ID = 9 - monocrop", {
  
  test_v0291 <- AgFertilizerMea$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                    version ="/0291/r")
  out_test2 <- test_v0291$ag_get_fertmea_expsiteId(expsiteDbId= 9, format="data.frame")
  testthat::expect_equal(object = nrow(out_test2),expected = 5)
  
})

test_that("Test get fertilizer-product ver. 0291 - site ID = 9 - intercrop", {
  
  test_v0291 <- AgFertilizerMea$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                    version ="/0291/r")
  out_test2 <- test_v0291$ag_get_fertmea_expsiteId(expsiteDbId= 9, format="data.frame")
  testthat::expect_equal(object = nrow(out_test2),expected = 5)
  
})



