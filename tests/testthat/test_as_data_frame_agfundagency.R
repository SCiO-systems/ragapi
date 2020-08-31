context("test as_as_data_frame_agapi")


test_that("Test as_as_data_frame_agapi with testq0 ", {
  
  fp <- rprojroot::find_testthat_root_file("data","testq0-fund-agency.rds")
  dfr <- readRDS(fp)  
  out_test <- as_data_frame_agapi(dfr)
  testthat::expect_equal(object = nrow(out_test),expected = 0)
  
})

test_that("Test as_data_frame_agapi with testq1 ", {
  
  fp <- rprojroot::find_testthat_root_file("data","testq1-fund-agency.rds")
  dfr <- readRDS(fp)  
  out_test <- as_data_frame_agapi(dfr)
  testthat::expect_equal(object = nrow(out_test),expected = 1)
  
})

test_that("Test as_data_frame_agapi with testq2", {
  
  fp <- rprojroot::find_testthat_root_file("data","testq2-fund-agency.rds")
  dfr <- readRDS(fp)  
  out_test <- as_data_frame_agapi(dfr)
  testthat::expect_equal(object = nrow(out_test),expected = 2)
  
})

test_that("Test as_data_frame_agapi with testq3", {
  fp <- rprojroot::find_testthat_root_file("data","testq3-fund-agency.rds")
  dfr <- readRDS(fp)  
  out_test <- as_data_frame_agapi(dfr)
  testthat::expect_equal(object = nrow(out_test),expected = 1)
})


test_that("Test as_data_frame_agapi with testq4", {
  
  fp <- rprojroot::find_testthat_root_file("data","testq4-fund-agency.rds")
  dfr <- readRDS(fp)  
  out_test <- as_data_frame_agapi(dfr)
  testthat::expect_equal(object = nrow(out_test),expected = 2)
  
})



test_that("Test as_data_frame_agapi with testq5", {
  
  fp <- rprojroot::find_testthat_root_file("data","testq5-fund-agency.rds")
  dfr <- readRDS(fp)  
  out_test <- as_data_frame_agapi(dfr)
  testthat::expect_equal(object = nrow(out_test),expected = 1)
  
})


test_that("Test as_data_frame_agapi with testq6", {

  fp <- rprojroot::find_testthat_root_file("data","testq6-fund-agency.rds")
  dfr <- readRDS(fp)
  out_test <- as_data_frame_agapi(dfr)
  testthat::expect_equal(object = nrow(out_test),expected = 1)
  
})
