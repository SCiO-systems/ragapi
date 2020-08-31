context("test ")

test_that("Test as_data_frame_agexpdetails with testq0 ", {
  
  fp <- rprojroot::find_testthat_root_file("data","testq0-experiment_details.rds")
  dfr <- readRDS(fp)  
  out_test <- as_data_frame_agexpdetails(dfr)
  testthat::expect_equal(object = nrow(out_test),expected = 12)
  
})


test_that("Test as_data_frame_agexpdetails with testq1 ", {
  
  fp <- rprojroot::find_testthat_root_file("data","testq1-experiment-details.rds")
  dfr <- readRDS(fp)  
  out_test <- as_data_frame_agexpdetails(dfr)
  testthat::expect_equal(object = nrow(out_test),expected = 12)
  
})







