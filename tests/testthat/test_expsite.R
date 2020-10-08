context("test project agronomic experiment-site AgExpSite class and methods")

##studyDbId


test_that("Test get exp-site description ver. 0135 with 3 sites by studyId", {
  
  test_v0135 <- AgExpSite$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                              version ="/0135/r")
  out_test2 <- test_v0135$ag_get_cropsite_studyId(studyDbId= 23, format="data.frame")
  testthat::expect_equal(object = length(out_test2),expected = 3)
  
})


test_that("Test agronomic exp-sites version 0233 with 1 sites", {
  
  test_v0233 <- AgExpSite$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                              version ="/0233/r")#, endPoint= "/exp-site/getAll?id=")
  out_test <- test_v0135$ag_get_expsite_studyId(studyDbId= 2, format="data.frame")
  testthat::expect_equal(object = nrow(out_test),expected = 3)
  
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

### expsiteId

test_that("Test get exp-site description by expsiteDbId ver. 0135 -Afganistan ", {
  
  test_v0135 <- AgExpSite$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                              version ="/0135/r")
  out_test <- test_v0135$ag_get_sitedesc_expsiteId(expsiteDbId= 21, format="data.frame")
  testthat::expect_equal(object = nrow(out_test),expected = 15)
  
  a1 <- test_v0135$ag_get_cropsite_expsiteId(expsiteDbId= 22, format="data.frame")
  
  
})

test_that("Test get exp-site description by expsiteDbId ver. 0135-Peru ", {
  
  test_v0135 <- AgExpSite$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                              version ="/0135/r")
  out_test <- test_v0135$ag_get_sitedesc_expsiteId(expsiteDbId= 22, format="data.frame")
  testthat::expect_equal(object = nrow(out_test),expected = 15)
  
})

test_that("Test ag_get_cropsite_expsiteId by expsiteDbId=22-v0135-Peru", {
  
  test_v0135 <- AgExpSite$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                              version ="/0135/r")
  out_test <- test_v0135$ag_get_cropsite_expsiteId(expsiteDbId= 22, format="data.frame")
  testthat::expect_equal(object = nrow(out_test),expected = 2)
  
})



