#' AgAPI Client Class
#' 
#' @description the AgAPI client provides a general class for all the AgAPI calls. It includes 
#'
#' @title ApiClient class
#' @description Generic class for API client calls, all nbaR client classes
#' derive from this class
#'
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
#' @importFrom httr add_headers user_agent GET POST
#' @author Omar Benites
#' @export
#' @description Specifies the public interface which any data accessing classes must implement.
#' @references Api url structure https://swagger.io/docs/specification/api-host-and-base-path/
#' @importFrom R6 R6Class
#' 
AgAPIClient <- R6::R6Class(
  
  classname = "AgAPIClient",

  private = list(
     endPoint = "tableName/method.php"#,#temporary values
  ),
  
  public = list(
    
    #secure = TRUE,
    user = NULL, 
    password = NULL,
    authentication= NULL,
    token = NULL,
    user_agent =NULL,
    
    serverURL = "http://research.cip.cgiar.org/agrofims/api/dev/",
    version = "v002/r/",
    
    #query = NULL, 
    #params = NULL,
    
    # multicrop = TRUE,
    # crop = NULL,
    # grant_type= NULL,
    # page= NULL,
    # pageSize = NULL,
    
    initialize = function(user=NULL, password=NULL, authentication=NULL, token=NULL,user_agent=NULL,
                          serverURL="https://research.cip.cgiar.org/agrofims/api/dev", 
                          version="/0135/r" ){ #, endPoint){
                          
    
      self$user <- user
      self$password <- password
      self$authentication <- authentication
      self$token <- token
      self$user_agent <-  user_agent
      
      self$serverURL <- serverURL
      self$version <- version
      
      #private$tableName <-
        
      #self$endPoint <- endPoint
      
      #self$query <- query
      #self$params <- params
      # self$multicrop <-  multicrop
      # self$crop <- crop
      # self$page <- page
      # self$pageSize <- pageSize
        
      #invisible(self)
      
    },
    
    print = function(...) {},
    
    call_api = function(url, method, queryParams, headerParams, body, ...){} #,
    
    #ag_response =  function(Object, studyDbId =NULL,format=c("json","list","data.frame"),...){}
    
  )
)

#' Print method for the AgAPIClient main class
#' 

AgAPIClient$set(which = "public", name = "print", function(...) {
  
  obj <- paste(self$serverURL, self$version)
  cat("<AgAPI Package>\n")
  cat("Fields:\n")
  cat("\tserverURL: ", paste0("<", self$serverURL, ">"), "\n")
  cat("\tversion: ", paste0("<", self$version, ">"), "\n")
  cat("call URL: ", paste0(self$serverURL,self$version))
  #cat("\tendPoint: ", paste0("<", private$endPoint, ">"), "\n")
  #cat("\tbaseURL: ", paste0(self$serverURL, self$version, private$endPoint), "\n") 
  
}, overwrite = TRUE)



#' AgAPIClient method for http methods GET and POST
#' 
#' @field url base URL composed by the composition of the server URL, api version and end point
#' @field method GET and POST methods
#' @field queryParams parameters to retrieve information
#' @field headerParams parameter values
#' @field body corpues of the request
#' @field ... inherents argument from the class
#' @importFrom curl has_internet
#' @author Omar Benites
#' @export

AgAPIClient$set(which = "public", "call_api", function(url, method, queryParams=NULL, 
                                                       headerParams=NULL, body, ...) {
  
  
  if(curl::has_internet()){
    
    headers <- httr::add_headers(headerParams) 
    ua <- NULL #httr::user_agent(self$userAgent) #TODO ENABLE WHEN have user and password
    if (method == "GET") {
      
      res <- httr::GET(url,
                       query = queryParams, 
                       user_agent = NULL, #ua, #TODO ENABLE WHEN have user and password
                       headers = NULL    #headers, ...   #TODO ENABLE WHEN have user and password
      )
      txt <- ifelse(res$status == 200, "The request was fulfilled successfully with status 200", 
                    paste0("There was a possible issue in your request with an status ",res$status))
      print(txt)
      class(res) <- c("AgAPIClient","response")
      return(res) 
      
    }
    else if (method == "POST") {
      httr::POST(url,
                 query = queryParams, ua,
                 headers = headers, body = body, encode = "json", ...
      )
    }
    else {
      stop(paste("http method must be `GET` or `POST`."))
    }  
  } else {
    stop(paste("No internet connection or quite unstable to connect to the server. Check your connection."))
  }
  
  
}, overwrite = TRUE)

#########################################


