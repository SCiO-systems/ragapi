context("test project lead")


test_that("Test class project lead data version 0233", {
  
  test_v0233 <- AgProjLead$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                               version ="/0233/r") #, endPoint= "/proj-lead/getAll?id=")
  out_test <- test_v0233$ag_get_projlead_studyId( studyDbId= 3, format="data.frame")
  testthat::expect_equal(object = nrow(out_test),expected = 0)
  
})



test_that("Test class project lead data version 0135", {
  
  test_v0135 <- AgProjLead$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                 version ="/0135/r") #, endPoint= "/proj-lead/getAll?id=")
  out_test <- test_v0135$ag_get_projlead_studyId( studyDbId= 6, format="data.frame")
  testthat::expect_equal(object = nrow(out_test),expected = 2)
  
})

test_that("Test agronomic exp. details version 0118", {
  
  test_v0118 <- AgProjLead$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                 version ="/0118/r") #, endPoint= "/proj-lead/getAll?id=")
  out_test <- test_v0118$ag_get_projlead_studyId( studyDbId= 6, format="data.frame")
  testthat::expect_equal(object = nrow(out_test),expected = 1)
  
})







