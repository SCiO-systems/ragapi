context("test project management entity")
library(stringr)
library(dplyr)

test_that("Test agronomic exp. details version 0135", {
  
  test_v0135 <- AgProjEntity$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                       version ="/0135/r") #,endPoint= "/proj-entity/getAll?id=")
  out_test <- test_v0135$ag_get_projentity_studyId( studyDbId= 6, format="data.frame")
  testthat::expect_equal(object = nrow(out_test),expected = 6)

})


test_that("Test agronomic exp. details version 0118", {
  
  test_v0118 <- AgProjEntity$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                 version ="/0118/r")#, endPoint= "/proj-entity/getAll?id=")
  out_test <- test_v0118$ag_get_projentity_studyId( studyDbId= 6, format="data.frame")
  testthat::expect_equal(object = nrow(out_test),expected = 6)
  
})