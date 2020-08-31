context("test experiment details information")

test_that("Test agronomic exp. details version 0135", {
  
 
  test_v0135 <- AgExpDetails$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                     version ="/0135/r") #, endPoint= "/experiment/get?id=")
  out_test <- test_v0135$ag_get_expdetails_studyId(studyDbId= 6, format="data.frame")
  
  #out_test <- ag_expdetails
  
  testthat::expect_equal(object = nrow(out_test),expected =12)
  
})

test_that("Test agronomic exp. details version 0118", {
  
  test_v0118 <- AgExpDetails$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                      version ="/0118/r") #, endPoint= "/experiment/get?id=")
  out_test <- test_v0118$ag_get_expdetails_studyId(studyDbId= 6, format="data.frame")
  testthat::expect_equal(object = nrow(out_test),expected =12)
  
})


# test_that("Test agronomic exp. details version 002", {
#   
#   expdetail_v002 <- AgPersonnel$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
#                                    version ="/002/r", endPoint= "/experiment/get.php")
#   out_test <- expdetail_v002$ag_personnel( studyDbId= 78, format="data.frame")
#   testthat::expect_equal(object = nrow(out_test),expected =11)
#   
# })
# 
# 
# test_that("Test agronomic exp. details api version 0112", {
#   
#   expdetail_v002 <- AgPersonnel$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
#                                      version ="/0112/r", endPoint= "/experiment/get.php")
#   out_test <- expdetail_v002$ag_personnel( studyDbId= 6, format="data.frame")
#   testthat::expect_equal(object = nrow(out_test), expected =11)
#   
# })