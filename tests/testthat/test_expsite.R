context("test project agronomic experiment-site AgExpSite class")
library(jsonlite)
library(dplyr)


test_that("Test agronomic exp. details version 0135", {
  
  test_v0135 <- AgExpSite$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                              version ="/0135/r")#, endPoint= "/exp-site/getAll?id=")
  out_test <- test_v0135$ag_get_expsite_studyId(studyDbId= 6, format="data.frame")
  testthat::expect_equal(object = nrow(out_test),expected = 6)
  
})

test_that("Test ag_expdetails-Test-all-empty",{
  
  test_v0135 <- AgExpSite$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                              version ="/0135/r")#, endPoint= "/exp-site/getAll?id=")
  out_test <- test_v0135$ag_get_expsite_studyId(studyDbId= 16, format="data.frame")
  testthat::expect_equal(object = nrow(out_test),expected = 6)

})



test_that("Test agronomic exp. details version 0118", {
  
  test_v0118 <- AgExpSite$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                              version ="/0118/r")#, endPoint= "/exp-site/getAll?id=")
  out_test <- test_v0118$ag_get_expsite_studyId( studyDbId= 6, format="data.frame")
  testthat::expect_equal(object = nrow(out_test),expected = 6)
  
})
