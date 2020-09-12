#' @include checkers.R utils.R
#' 
#' Experiment-Site Class
#' 
#' @description subclass for representing the experiment-site data. It inherents from AgAPI client class 
#' all the basic parameters and methods.
#'
#' @title ExpSite
#'
#' @docType class
#'
#' @format R6 class
#'
#' @field user specifies the user name, defaults to NULL 
#' @field password specifies the password, defaults to NULL
#' @field user specifies the user name, defaults to NULL 
#' @field password specifies the password, defaults to NULL
#' @field authentication specifies the password, defaults to NULL
#' @field token specifies the password, defaults to NULL
#' @field user_agent specifies the password, defaults to NULL
#' @field serverURL specifies the password, defaults to 
#'                  http://research.cip.cgiar.org/agrofims/api/dev/
#' @field version specifies the version, defaults to 0051
#' @field endPoint specifies the end point value,   tableName/method.php 
#' @importFrom R6 R6Class
#' 
#' @export
#' 
AgExpSite <- R6::R6Class(
  
  classname = "AgExpSite",
  inherit = AgAPIClient,
  # private = list(
  #   super$endPoint = "/exp-site/getAll?id="
  # ),
  
  public = list(
    
    siteId = NA, #siteId 
    initialize = function(user=NULL, password=NULL, authentication=NULL, token=NULL, user_agent=NULL,
                          serverURL, version ){ #, endPoint) {
      super$initialize(user, password, authentication, token, user_agent, serverURL, version)#, endPoint)
    },
    
    ag_get_expsite_studyId = function(studyDbId, format, ...){},
    ag_get_sitedesc_studyId = function(studyDbId, format, ...){},
    ag_get_cropsite_studyId  = function(studyDbId, format, ...){},
    ag_get_sitedesc_expsiteId = function(expsiteDbId, format, ...){}
  )
)

#' @title  Get all experiment-site data from an agronomic study by its agronomical study database ID
#' @description retrieve data from databases with AgAPI standard
#' @field ... argument inherents by AgaAPIClient
#' @field studyDbID character agronomical study id
#' @field format support in three data structures: json, list and data.frames
#' @importFrom R6 R6Class
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @importFrom tibble rownames_to_column
#' @author Omar Benites
#' @export 
#' 
AgExpSite$set(which = "public", name = "ag_get_expsite_studyId",  function(studyDbId =NULL,
                                                                   format=c("json","list","data.frame"),
                                                                   ...){
  
  format <- match.arg(format)
  super$endPoint <- "/exp-site/getAll?id="
  url  <- paste0(self$serverURL, self$version, super$endPoint) #everything before the URL
  #url  <- paste0(self$serverURL, self$version, self$endPoint) #everything before the URL
  print(url)
  
  headerParams <- character()
  
  queryParams <- list(id = studyDbId) #everythig after the ? in the URL 
  
  res <- self$call_api(
    url = url, 
    method = "GET",
    queryParams = queryParams, #, #TODO
    #headerParams = headerParams, #TODO
    #body = body,
    ...
  )
  cont <- httr::content(res, as = "text", encoding = "UTF-8")
  
  if(format=="json"){
    out <-  cont
  } else if(format=="list"){
    out <- jsonlite::fromJSON(cont,simplifyVector = "vector")
  } else if(format=="data.frame") {
    out <- as_data_frame_agapi(cont)
  }
  return(out)
},
overwrite = TRUE)   

#######


#' @title  Get all experiment-site description data from an agronomic study by its agronomical study database ID
#' @description retrieve data from databases with AgAPI standard
#' @field ... argument inherents by AgaAPIClient
#' @field studyDbID character agronomical study id
#' @field format support in three data structures: json, list and data.frames
#' @importFrom R6 R6Class
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @importFrom tibble rownames_to_column
#' @author Omar Benites
#' @export 
#' 
AgExpSite$set(which = "public", name = "ag_get_sitedesc_studyId", 
                                function( studyDbId =NULL,
                                          format=c("json","list","data.frame"),
                                          ... ){  
                                        
  
  #Create objet AgExpSite -------------------------------------------
  obj_expsite <- AgExpSite$new(serverURL = self$serverURL ,
                              version = self$version )
  #Get experiment sites studies -------------------------------
  dt_expsite <- obj_expsite$ag_get_expsite_studyId(studyDbId= studyDbId, format="data.frame")
  expsite_id <- dt_expsite$expSiteId

  super$endPoint <- "/exp-site/get?id="
  url  <- paste0(self$serverURL, self$version, super$endPoint) #everything before the URL
  print(url)
  
  #GET parameters for retrieving data ----------------------------
  #headerParams <- character()
  queryParams <- vector(mode="list",length = 1)
  
  #Allocate response objects from GET method ----------------------
  res <- out <-  vector(mode="list", length = length(expsite_id))
  
  #Iterate over exp_site_id to extract experiment descript from each site in the study
  for(i in 1:length(expsite_id)){
    queryParams <- list(id = expsite_id[i])  
    res[[i]] <- self$call_api(
      url = url, 
      method = "GET",
      queryParams = queryParams, #, #TODO
      #headerParams = headerParams, #TODO
      #body = body,
      ...
    )    
    cont <- httr::content(res[[i]], as = "text", encoding = "UTF-8")
    #Object structure
    if(format=="json"){
      out[[i]] <-  cont
    } else if(format=="list"){
      out[[i]] <- jsonlite::fromJSON(cont,simplifyVector = "vector")
    } else if(format=="data.frame") {
      out[[i]] <- as_data_frame_agexpdetails(cont)
    }
    
  }
  
  return(out)
  
},
overwrite = TRUE)   

############################

#' @title  Get experiment site description by site ID (expsiteId)
#' @description retrieve data from databases with AgAPI standard
#' @field ... argument inherents by AgaAPIClient
#' @field expsiteDbId character experiment site ID
#' @field format support in three data structures: json, list and data.frames
#' @importFrom R6 R6Class
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @importFrom tibble rownames_to_column
#' @author Omar Benites
#' @export 
#' 
AgExpSite$set(which = "public", name = "ag_get_sitedesc_expsiteId", 
              function( expsiteDbId =NULL,
                        format=c("json","list","data.frame"),
                        ... ){  
                
                super$endPoint <- "/exp-site/get?id="
                url  <- paste0(self$serverURL, self$version, super$endPoint) #everything before the URL
                print(url)
                
                #GET parameters for retrieving data ----------------------------
                #headerParams <- character()
                queryParams <- list(id = expsiteDbId)  
                
                #Iterate over exp_site_id to extract experiment descript from each site in the study
                 
                  res <- self$call_api(
                    url = url, 
                    method = "GET",
                    queryParams = queryParams, #, #TODO
                    #headerParams = headerParams, #TODO
                    #body = body,
                    ...
                  )    
                  cont <- httr::content(res, as = "text", encoding = "UTF-8")
                  #Object structure
                  if(format=="json"){
                    out <-  cont
                  } else if(format=="list"){
                    out <- jsonlite::fromJSON(cont,simplifyVector = "vector")
                  } else if(format=="data.frame") {
                    out <- as_data_frame_agexpdetails(cont)
                  }
                
                return(out)
                
              },
overwrite = TRUE)   




# TODO:
#
#############################################################################################

#' @title  Get all crop information within sites based on the agronomic study database ID
#' @description retrieve data from databases with AgAPI standard
#' @field ... argument inherents by AgaAPIClient
#' @field studyDbID character agronomical study id
#' @field format support in three data structures: json, list and data.frames
#' @importFrom R6 R6Class
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#' @importFrom tibble rownames_to_column
#' @author Omar Benites
#' @export 
#' 
AgExpSite$set(which = "public", name = "ag_get_cropsite_studyId", 
              function(studyDbId =NULL,
                        format=c("json","list","data.frame"),
                        ... ){  
                
                #Create objet AgExpSite -------------------------------------------
                obj_expsite <- AgExpSite$new(serverURL = self$serverURL ,
                                             version = self$version )
                #Get experiment sites studies -------------------------------
                dt_expsite <- obj_expsite$ag_get_expsite_studyId(studyDbId= studyDbId, format="data.frame")
                expsite_id <- dt_expsite$expSiteId
                
                super$endPoint <- "/site-crop/getAll?id="
                url  <- paste0(self$serverURL, self$version, super$endPoint) #everything before the URL
                print(url)
                
                #GET parameters for retrieving data ----------------------------
                #headerParams <- character()
                queryParams <- vector(mode="list",length = 1)
                
                #Allocate response objects from GET method ----------------------
                res <- out <-  vector(mode="list", length = length(expsite_id))
                
                #Iterate over exp_site_id to extract crop information by site from each site in the study
                for(i in 1:length(expsite_id)){
                  queryParams <- list(id = expsite_id[i])  
                  res[[i]] <- self$call_api(
                    url = url, 
                    method = "GET",
                    queryParams = queryParams, #, #TODO
                    #headerParams = headerParams, #TODO
                    #body = body,
                    ...
                  )    
                  cont <- httr::content(res[[i]], as = "text", encoding = "UTF-8")
                  #Object structure
                  if(format=="json"){
                    out[[i]] <-  cont
                  } else if(format=="list"){
                    out[[i]] <- jsonlite::fromJSON(cont,simplifyVector = "vector")
                  } else if(format=="data.frame") {
                    out[[i]] <- as_data_frame_agapi(cont)
                  }
              }
  return(out)
                
},
overwrite = TRUE)   









