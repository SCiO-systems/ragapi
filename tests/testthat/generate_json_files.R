library(gsheet)
library(rjson)
library(dplyr)
library(RJSONIO)
library(jsonlite)

quality_test_link <- "https://docs.google.com/spreadsheets/d/124fPX0f_J9Ws-f4ZgSX6AyXQVbCZY50nMsuaFfPaDWg/edit#gid=588175663"
quality_test_info <- gsheet::gsheet2tbl(url = quality_test_link,sheetid = "QualityTest")


# Json-data for testq0 --------------------------------------------

test_name <- quality_test_info[[1,2]]
api_version <- "v0.1.35"
studyDbId <- 16
queryParams <- list(id = studyDbId)

##CALL URL
agapi_calls_url <- vector(mode="list",6)
agapi_calls_url <- list( 
  expdetails = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/experiment/get?id=",studyDbId),
  fund_agency= paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/fund-agency/getAll?id=",studyDbId),
  proj_entity = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/proj-entity/getAll?id=",studyDbId),
  proj_lead = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/proj-lead/getAll?id=",studyDbId),
  personnel = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/personnel/getAll?id=",studyDbId),
  exp_site = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/exp-site/getAll?id=",studyDbId)
) 

## CALL NAME
agapi_call_name <- c("experiment_details","fund-agency","proj-entity","proj-lead","personnel","exp-site")

for(i in 1:length(agapi_calls_url)){
  res <- httr::GET(agapi_calls_url[[i]],
                   query = queryParams, 
                   user_agent = NULL, #ua, #TODO ENABLE WHEN have user and password
                   headers = NULL    #headers, ...   #TODO ENABLE WHEN have user and password
  )
  cont <- httr::content(res, as = "text", encoding = "UTF-8") #%>% jsonlite::fromJSON()
  saveRDS(cont, file = paste0("tests/testthat/data/",test_name,"-",agapi_call_name[i],".rds"))
  #cont <- httr::content(res, as = "text", encoding = "UTF-8") #%>% jsonlite::fromJSON()
  #saveRDS(cont,file = paste0("tests/testthat/data/",test_name,"-",agapi_call_name[i],".json"))
  #jsonlite::write_(x = cont, file = paste0("tests/testthat/data/",test_name,"-",agapi_call_name[i],".json"))
  #jsonlite::write_(x = cont, file = paste0("tests/testthat/data/",test_name,"-",agapi_call_name[i],".json"))
    
}

# Json-data for testq1 ----------------------------------------------------

library(gsheet)
quality_test_link <- "https://docs.google.com/spreadsheets/d/124fPX0f_J9Ws-f4ZgSX6AyXQVbCZY50nMsuaFfPaDWg/edit#gid=588175663"
quality_test_info <- gsheet::gsheet2tbl(url = quality_test_link,sheetid = "QualityTest")

test_name <- quality_test_info[[2,2]]
api_version <- "v0.1.35"
studyDbId <- 17
queryParams <- list(id = studyDbId)

##CALL URL
agapi_calls_url <- vector(mode="list",6)
agapi_calls_url <- list( 
  expdetails = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/experiment/get?id=",studyDbId),
  fund_agency= paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/fund-agency/getAll?id=",studyDbId),
  proj_entity = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/proj-entity/getAll?id=",studyDbId),
  proj_lead = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/proj-lead/getAll?id=",studyDbId),
  personnel = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/personnel/getAll?id=",studyDbId),
  exp_site = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/exp-site/getAll?id=",studyDbId)
) 

## CALL NAME
agapi_call_name <- c("experiment_details","fund-agency","proj-entity","proj-lead","personnel","exp-site")

for(i in 1:length(agapi_calls_url)){
  res <- httr::GET(agapi_calls_url[[i]],
                   query = queryParams, 
                   user_agent = NULL, #ua, #TODO ENABLE WHEN have user and password
                   headers = NULL    #headers, ...   #TODO ENABLE WHEN have user and password
  )
  cont <- httr::content(res, as = "text", encoding = "UTF-8") #%>% jsonlite::fromJSON()
  saveRDS(cont,file = paste0("tests/testthat/data/",test_name,"-",agapi_call_name[i],".rds"))
  # cont <- httr::content(res, as = "text", encoding = "UTF-8") %>% jsonlite::fromJSON()
  # saveRDS(cont,file = paste0("tests/testthat/data/",test_name,"-",agapi_call_name[i],".json"))
  # #jsonlite::write_json(cont, path = paste0("tests/testthat/data/",test_name,"-",agapi_call_name[i],".json"))
  
}



# Json-data for testq2 ----------------------------------------------------

library(gsheet)
quality_test_link <- "https://docs.google.com/spreadsheets/d/124fPX0f_J9Ws-f4ZgSX6AyXQVbCZY50nMsuaFfPaDWg/edit#gid=588175663"
quality_test_info <- gsheet::gsheet2tbl(url = quality_test_link,sheetid = "QualityTest")

test_name <- quality_test_info[[3,2]]
api_version <- "v0.1.35"
studyDbId <- 18
queryParams <- list(id = studyDbId)

##CALL URL
agapi_calls_url <- vector(mode="list",6)
agapi_calls_url <- list( 
  expdetails = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/experiment/get?id=",studyDbId),
  fund_agency= paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/fund-agency/getAll?id=",studyDbId),
  proj_entity = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/proj-entity/getAll?id=",studyDbId),
  proj_lead = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/proj-lead/getAll?id=",studyDbId),
  personnel = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/personnel/getAll?id=",studyDbId),
  exp_site = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/exp-site/getAll?id=",studyDbId)
) 

## CALL NAME
agapi_call_name <- c("experiment_details","fund-agency","proj-entity","proj-lead","personnel","exp-site")

for(i in 1:length(agapi_calls_url)){
  res <- httr::GET(agapi_calls_url[[i]],
                   query = queryParams, 
                   user_agent = NULL, #ua, #TODO ENABLE WHEN have user and password
                   headers = NULL    #headers, ...   #TODO ENABLE WHEN have user and password
  )
  cont <- httr::content(res, as = "text", encoding = "UTF-8") #%>% jsonlite::fromJSON()
  saveRDS(cont,file = paste0("tests/testthat/data/",test_name,"_",agapi_call_name[i],".rds"))
  # cont <- httr::content(res, as = "text", encoding = "UTF-8") %>% jsonlite::fromJSON()
  # saveRDS(cont,file = paste0("tests/testthat/data/",test_name,"-",agapi_call_name[i],".json"))
  # #jsonlite::write_json(cont, path = paste0("tests/testthat/data/",test_name,"-",agapi_call_name[i],".json"))
}



# Json-data for testq3-----------------------------------------------------------

quality_test_link <- "https://docs.google.com/spreadsheets/d/124fPX0f_J9Ws-f4ZgSX6AyXQVbCZY50nMsuaFfPaDWg/edit#gid=588175663"
quality_test_info <- gsheet::gsheet2tbl(url = quality_test_link,sheetid = "QualityTest")

test_name <- quality_test_info[[4,2]]
api_version <- "v0.1.35"
studyDbId <- 19
queryParams <- list(id = studyDbId)

##CALL URL
agapi_calls_url <- vector(mode="list",6)
agapi_calls_url <- list( 
  expdetails = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/experiment/get?id=",studyDbId),
  fund_agency= paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/fund-agency/getAll?id=",studyDbId),
  proj_entity = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/proj-entity/getAll?id=",studyDbId),
  proj_lead = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/proj-lead/getAll?id=",studyDbId),
  personnel = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/personnel/getAll?id=",studyDbId),
  exp_site = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/exp-site/getAll?id=",studyDbId)
) 

## CALL NAME
agapi_call_name <- c("experiment_details","fund-agency","proj-entity","proj-lead","personnel","exp-site")

for(i in 1:length(agapi_calls_url)){
  res <- httr::GET(agapi_calls_url[[i]],
                   query = queryParams, 
                   user_agent = NULL, #ua, #TODO ENABLE WHEN have user and password
                   headers = NULL    #headers, ...   #TODO ENABLE WHEN have user and password
  )
  cont <- httr::content(res, as = "text", encoding = "UTF-8") #%>% jsonlite::fromJSON()
  saveRDS(cont,file = paste0("tests/testthat/data/",test_name,"-",agapi_call_name[i],".rds"))
    #jsonlite::write_json(cont, path = paste0("tests/testthat/data/",test_name,"-",agapi_call_name[i],".json"))
}


# Json-data for testq4-----------------------------------------------------------

test_name <- quality_test_info[[5,2]]
api_version <- "v0.1.35"
studyDbId <- 20
queryParams <- list(id = studyDbId)

##CALL URL
agapi_calls_url <- vector(mode="list",6)
agapi_calls_url <- list( 
  expdetails = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/experiment/get?id=",studyDbId),
  fund_agency= paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/fund-agency/getAll?id=",studyDbId),
  proj_entity = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/proj-entity/getAll?id=",studyDbId),
  proj_lead = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/proj-lead/getAll?id=",studyDbId),
  personnel = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/personnel/getAll?id=",studyDbId),
  exp_site = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/exp-site/getAll?id=",studyDbId)
) 

## CALL NAME
agapi_call_name <- c("experiment_details","fund-agency","proj-entity","proj-lead","personnel","exp-site")

for(i in 1:length(agapi_calls_url)){
  res <- httr::GET(agapi_calls_url[[i]],
                   query = queryParams, 
                   user_agent = NULL, #ua, #TODO ENABLE WHEN have user and password
                   headers = NULL    #headers, ...   #TODO ENABLE WHEN have user and password
  )
  cont <- httr::content(res, as = "text", encoding = "UTF-8") #%>% jsonlite::fromJSON()
  saveRDS(cont,file = paste0("tests/testthat/data/",test_name,"-",agapi_call_name[i],".rds"))
  #jsonlite::write_json(cont, path = paste0("tests/testthat/data/",test_name,"-",agapi_call_name[i],".json"))
}

# Json-data for testq5-----------------------------------------------------------

test_name <- quality_test_info[[6,2]]
api_version <- "v0.1.35"
studyDbId <- 21
queryParams <- list(id = studyDbId)

##CALL URL
agapi_calls_url <- vector(mode="list",6)
agapi_calls_url <- list( 
  expdetails = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/experiment/get?id=",studyDbId),
  fund_agency= paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/fund-agency/getAll?id=",studyDbId),
  proj_entity = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/proj-entity/getAll?id=",studyDbId),
  proj_lead = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/proj-lead/getAll?id=",studyDbId),
  personnel = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/personnel/getAll?id=",studyDbId),
  exp_site = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/exp-site/getAll?id=",studyDbId)
) 

## CALL NAME
agapi_call_name <- c("experiment_details","fund-agency","proj-entity","proj-lead","personnel","exp-site")

for(i in 1:length(agapi_calls_url)){
  res <- httr::GET(agapi_calls_url[[i]],
                   query = queryParams, 
                   user_agent = NULL, #ua, #TODO ENABLE WHEN have user and password
                   headers = NULL    #headers, ...   #TODO ENABLE WHEN have user and password
  )
  cont <- httr::content(res, as = "text", encoding = "UTF-8") #%>% jsonlite::fromJSON()
  saveRDS(cont,file = paste0("tests/testthat/data/",test_name,"-",agapi_call_name[i],".rds"))
  #jsonlite::write_json(cont, path = paste0("tests/testthat/data/",test_name,"-",agapi_call_name[i],".json"))
}


# Json-data for testq6-----------------------------------------------------------

test_name <- quality_test_info[[7,2]]
api_version <- "v0.1.35"
studyDbId <- 22
queryParams <- list(id = studyDbId)

##CALL URL
agapi_calls_url <- vector(mode="list",6)
agapi_calls_url <- list( 
  expdetails = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/experiment/get?id=",studyDbId),
  fund_agency= paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/fund-agency/getAll?id=",studyDbId),
  proj_entity = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/proj-entity/getAll?id=",studyDbId),
  proj_lead = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/proj-lead/getAll?id=",studyDbId),
  personnel = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/personnel/getAll?id=",studyDbId),
  exp_site = paste0("https://research.cip.cgiar.org/agrofims/api/dev/0135/r/exp-site/getAll?id=",studyDbId)
) 

## CALL NAME
agapi_call_name <- c("experiment_details","fund-agency","proj-entity","proj-lead","personnel","exp-site")

for(i in 1:length(agapi_calls_url)){
  res <- httr::GET(agapi_calls_url[[i]],
                   query = queryParams, 
                   user_agent = NULL, #ua, #TODO ENABLE WHEN have user and password
                   headers = NULL    #headers, ...   #TODO ENABLE WHEN have user and password
  )
  cont <- httr::content(res, as = "text", encoding = "UTF-8") #%>% jsonlite::fromJSON()
  saveRDS(cont,file = paste0("tests/testthat/data/",test_name,"-",agapi_call_name[i],".rds"))
  #jsonlite::write_json(cont, path = paste0("tests/testthat/data/",test_name,"-",agapi_call_name[i],".json"))
}
