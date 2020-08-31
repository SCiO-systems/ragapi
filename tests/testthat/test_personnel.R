context("test personnel class")
library(stringr)
library(dplyr)

test_that("Test agronomic exp. details version 0135", {
  
  test_v0135 <- AgPersonnel$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                      version ="/0135/r")#, endPoint= "/personnel/getAll?id=")
  out_test <- test_v0135$ag_get_personnel_studyId( studyDbId= 18, format="data.frame")
  testthat::expect_equal(object = nrow(out_test),expected =12)
  
})

test_that("Test agronomic exp. details version 0118", {
  
  test_v0118 <- AgPersonnel$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                      version ="/0118/r")#, endPoint= "/personnel/getAll?id=")
  out_test <- test_v0118$ag_get_personnel_studyId( studyDbId= 6, format="data.frame")
  testthat::expect_equal(object = nrow(out_test),expected =12)
  
})

