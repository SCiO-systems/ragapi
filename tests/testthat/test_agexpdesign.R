context("test project agronomic experiment-site AgExpSite class and methods")

##studyDbId


test_that("Test get exp-site description ver. 0233 -testq7- expsite 5", {
  
  sc <- AgExpDesign$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev", version = "/0233/r")
  out_test <- sc$ag_get_edsinfo_expsiteId(expsiteDbId = 5,
                                      format = "data.frame")
  testthat::expect_equal(object = length(out_test),expected = 2)
  
})
