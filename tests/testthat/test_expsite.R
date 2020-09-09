context("test project agronomic experiment-site AgExpSite class")


test_that("Test get exp-site description ver. 0135 with 3 sites", {
  
  test_v0135 <- AgExpSite$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                              version ="/0135/r")
  out_test <- test_v0135$ag_get_cropsite_studyId(studyDbId= 23, format="data.frame")
  testthat::expect_equal(object = length(out_test),expected = 3)
  
})

test_that("Test agronomic exp-sites version 0135 with 3 sites", {
  
  test_v0135 <- AgExpSite$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                              version ="/0135/r")#, endPoint= "/exp-site/getAll?id=")
  out_test <- test_v0135$ag_get_expsite_studyId(studyDbId= 23, format="data.frame")
  testthat::expect_equal(object = nrow(out_test),expected = 3)
  
})

test_that("Test agronomic exp-sites version 0135 with 0 sites", {
  
  test_v0135 <- AgExpSite$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                              version ="/0135/r")#, endPoint= "/exp-site/getAll?id=")
  out_test <- test_v0135$ag_get_expsite_studyId(studyDbId= 16, format="data.frame")
  testthat::expect_equal(object = nrow(out_test),expected = 0)
  
})


test_that("Test agronomic exp-sites version 0135", {

  test_v0135 <- AgExpSite$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                              version ="/0135/r")#, endPoint= "/exp-site/getAll?id=")
  out_test <- test_v0135$ag_get_expsite_studyId(studyDbId= 6, format="data.frame")
  testthat::expect_equal(object = nrow(out_test),expected = 2)

})

