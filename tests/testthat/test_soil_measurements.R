context("test project agronomic soil Variables Class and Methods")

test_that("Test get soil variables by expsiteId=21", {
  
  test_v0212 <- AgSoilMea$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                 version ="/0212/r")
  out_test <- test_v0212$ag_get_soil_expsiteId(expsiteDbId= 21, format="data.frame")
  testthat::expect_equal(object = nrow(out_test),expected = 2)
  testthat::expect_equal(object = ncol(out_test),expected = 14)
})


test_that("Test get soil variables by studyId=23", {
  
  test_v0212 <- AgSoilMea$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                 version ="/0212/r")
  out_test <- test_v0212$ag_get_soil_studyId(studyDbId = 23, format="data.frame")
  testthat::expect_equal(object = length(out_test),expected = 3)
  
})
