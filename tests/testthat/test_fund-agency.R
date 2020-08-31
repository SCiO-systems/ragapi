context("test funding agency information")


test_that("Test agronomic exp. details version 0135", {
  
  fundagency_v0135 <- AgFundingAgency$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                          version ="/0135/r") #, endPoint= "/fund-agency/getAll?id=")
  out_test <- fundagency_v0135$ag_get_fundagency_studyId(studyDbId= 6, format="data.frame")
  
  #out_test <- out_test$ag_get_fundagency_studyId( studyDbId= 6, format="data.frame")
  testthat::expect_equal(object = nrow(out_test),expected =2)
})


test_that("Test agronomic exp. details version 0118", {
  
  fundagency_v0118 <- AgFundingAgency$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                          version ="/0118/r") #, endPoint= "/fund-agency/getAll?id=")
  out_test <- fundagency_v0118$ag_get_fundagency_studyId( studyDbId= 6, format="data.frame")
  testthat::expect_equal(object = nrow(out_test),expected =2)
  
})