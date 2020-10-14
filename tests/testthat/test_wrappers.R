context("test wrappers for agronomic calls implementations")

test_that("Test ag_get_projentity_studyId apiver 0233 - testq0- no combos", {
  
  out_test <- ag_get_projentity_studyId(studyDbId = 3,format = "data.frame")
  testthat::expect_equal(object = nrow(out_test),expected = 0)
  
})

test_that("Test ag_get_projentity_studyId apiver 0233 - testq1 - one empty combo", {
  
  out_test <- ag_get_projentity_studyId(studyDbId = 4,format = "data.frame")
  testthat::expect_equal(object = nrow(out_test),expected = 1)
  
})

test_that("Test ag_get_projentity_studyId apiver 0233 - testq2 - 2 combos-1 filled", {
  
  out_test <- ag_get_projentity_studyId(studyDbId = 5,format = "data.frame")
  testthat::expect_equal(object = nrow(out_test),expected = 2)
  
})


test_that("Test ag_get_projlead_studyId apiver 0233 - testq0 - no combos", {
  
  out_test <- ag_get_projlead_studyId(studyDbId = 3,format = "data.frame")
  testthat::expect_equal(object = nrow(out_test),expected = 0)
  
})


test_that("Test ag_get_projlead_studyId apiver 0233 - testq1 - empty combos", {
  
  out_test <- ag_get_projlead_studyId(studyDbId = 4,format = "data.frame",version ="/0233/r")
  testthat::expect_equal(object = nrow(out_test),expected = 1)
  
})


test_that("Test ag_get_projlead_studyId apiver 0233 - testq6 - 1 filled combo", {
  
  out_test <- ag_get_projlead_studyId(studyDbId = 8, version ="/0233/r", format = "data.frame")
  testthat::expect_equal(object = nrow(out_test),expected = 1)
  
})


test_that("Test ag_get_projlead_studyId apiver 0233 - testq7 - 1 normal combo + 1 combo other", {
  
  out_test <- ag_get_projlead_studyId(studyDbId = 9, version ="/0233/r", format = "data.frame")
  testthat::expect_equal(object = nrow(out_test),expected = 3)
  
})


test_that("Test ag_get_sitedesc_expsiteId apiver 0233 - testq0 - no sites", {
out_test <- ag_get_expsite_studyId(studyDbId = 3, format = "data.frame",
                              serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                              version ="/0233/r")
testthat::expect_equal(object = nrow(out_test),expected = 0)
testthat::expect_equal(object = ncol(out_test),expected = 0)

})

test_that("Test ag_get_sitedesc_expsiteId apiver 0233 - testq7 - site Peru", {
  
  out_test <- ag_get_sitedesc_expsiteId(expsiteDbId = 5,
                                        format = "data.frame",
                                        serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                        version ="/0233/r")
  testthat::expect_equal(object = nrow(out_test),expected = 26)
  testthat::expect_equal(object = ncol(out_test),expected = 2)
})


test_that("Test ag_get_projlead_studyId apiver 0233 - testq7 - site India", {
  
  out_test <- ag_get_sitedesc_expsiteId(expsiteDbId = 6,
                                   format = "data.frame",
                                   serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                   version ="/0233/r")
  testthat::expect_equal(object = nrow(out_test),expected = 26)
  testthat::expect_equal(object = ncol(out_test),expected = 2)
})




test_that("Test ag_get_projlead_studyId apiver 0233 - testq7 - site India", {
  
  out_test <- ag_get_edsinfo_expsiteId(expsiteDbId = 5,
                                        format = "data.frame",
                                        serverURL = "https://research.cip.cgiar.org/agrofims/api/dev",
                                        version ="/0233/r")
  testthat::expect_equal(object = nrow(out_test),expected = 2)
  testthat::expect_equal(object = ncol(out_test),expected = 21)
})

