context("test project agronomic crop-site information AgExpSite class")


test_that("Test get exp-site description ver. 0135 with 3 sites", {
  
  test_v0135 <- AgExpSite$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                              version ="/0135/r")#, endPoint= "/exp-site/getAll?id=")
  out_test <- test_v0135$ag_get_cropsite_studyId(studyDbId= 23, format="data.frame")
  testthat::expect_equal(object = length(out_test),expected = 3)
  
})



