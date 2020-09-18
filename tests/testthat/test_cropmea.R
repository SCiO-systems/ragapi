context("tests for AgCropMea class and methods")


test_that("Test get crop measurements data by siteCropId - ver. 0212 - Testq07", {
  
  test_v0135 <- AgCropMea$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                              version ="/0212/r")
  out_test_74 <- test_v0135$ag_get_cropmea_sitecropId(siteCropDbId= 74, format="data.frame")
  
  out_test_80 <- test_v0135$ag_get_cropmea_sitecropId(siteCropDbId= 80, format="data.frame")
  out_test_82 <- test_v0135$ag_get_cropmea_sitecropId(siteCropDbId= 82, format="data.frame")
  
  out_test_84 <- test_v0135$ag_get_cropmea_sitecropId(siteCropDbId= 84, format="data.frame")
  
  testthat::expect_equal(object = nrow(out_test_74),expected = 3)
  testthat::expect_equal(object = nrow(out_test_80),expected = 1)
  testthat::expect_equal(object = nrow(out_test_82),expected = 3)
  testthat::expect_equal(object = nrow(out_test_84),expected = 0)
  
})


test_that("Test get crop measurements data by siteCropId - ver. 0135 - Testq07", {
  
  test_v0135 <- AgCropMea$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                              version ="/0135/r")
  out_test_74 <- test_v0135$ag_get_cropmea_sitecropId(siteCropDbId= 74, format="data.frame")
  
  out_test_80 <- test_v0135$ag_get_cropmea_sitecropId(siteCropDbId= 80, format="data.frame")
  out_test_82 <- test_v0135$ag_get_cropmea_sitecropId(siteCropDbId= 82, format="data.frame")
  
  out_test_84 <- test_v0135$ag_get_cropmea_sitecropId(siteCropDbId= 84, format="data.frame")
  
  testthat::expect_equal(object = nrow(out_test_74),expected = 3)
  testthat::expect_equal(object = nrow(out_test_80),expected = 1)
  testthat::expect_equal(object = nrow(out_test_82),expected = 3)
  testthat::expect_equal(object = nrow(out_test_84),expected = 0)
  
})

test_that("Test get crop measurements data by expsiteDbId - ver. 0212 - Testq07", {
  
  test_v0135 <- AgCropMea$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                              version ="/0212/r")
  out_test_21 <- test_v0135$ag_get_cropmea_expsiteId(expsiteDbId= 21, format="data.frame")
  testthat::expect_equal(object = length(out_test_21),expected = 1)
  
  out_test_21 <- test_v0135$ag_get_cropmea_expsiteId(expsiteDbId= 22, format="data.frame")
  testthat::expect_equal(object = length(out_test_21),expected = 2)
  
  out_test_21 <- test_v0135$ag_get_cropmea_expsiteId(expsiteDbId= 23, format="data.frame")
  testthat::expect_equal(object = length(out_test_21),expected = 1)
  
})



test_that("Test get crop measurements data by expsiteDbId - ver. 0135 - Testq07", {
  
  test_v0135 <- AgCropMea$new(serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                              version ="/0135/r")
  out_test_21 <- test_v0135$ag_get_cropmea_expsiteId(expsiteDbId= 21, format="data.frame")
  testthat::expect_equal(object = length(out_test_21),expected = 1)
  
  out_test_21 <- test_v0135$ag_get_cropmea_expsiteId(expsiteDbId= 22, format="data.frame")
  testthat::expect_equal(object = length(out_test_21),expected = 2)
  
  out_test_21 <- test_v0135$ag_get_cropmea_expsiteId(expsiteDbId= 23, format="data.frame")
  testthat::expect_equal(object = length(out_test_21),expected = 1)
  
})
