context("test project agronomic crop-site information AgExpSite class")


test_that("Test get cropping site information by expsiteDbId ver. 0212 -Afganistan ", {
  
  test_v0135 <- AgExpSite$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                              version ="/0212/r")
  out_test <- test_v0135$ag_get_sitedesc_expsiteId(expsiteDbId= 21, format="data.frame")
  testthat::expect_equal(object = nrow(out_test),expected = 15)
  
})

test_that("Test get cropping site information by expsiteDbId ver. 0135 -Afganistan ", {
  
  test_v0135 <- AgExpSite$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                              version ="/0135/r")
  out_test <- test_v0135$ag_get_sitedesc_expsiteId(expsiteDbId= 21, format="data.frame")
  testthat::expect_equal(object = nrow(out_test),expected = 15)
  
})


test_that("Test get exp-site description ver. 0135 with 3 sites by studyId", {
  
  test_v0135 <- AgExpSite$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                              version ="/0135/r")#, endPoint= "/exp-site/getAll?id=")
  out_test <- test_v0135$ag_get_cropsite_studyId(studyDbId= 23, format="data.frame")
  testthat::expect_equal(object = length(out_test),expected = 3)
  
})

