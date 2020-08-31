#' 
#' # Convert agrofims form -------------------------------------------------------
#' #'x object AgroFims Trait-list data object
#' #'dict data.frame table of application form conversion 
#' #'initf character initial or current format form you want to change
#' #'newf character new format form you want to convert
#' 
#' convert_agrofims_form <- function(x, dict=NULL, initf ="kdsmart", newf="fieldbookApp"){
#'   
#'   if(!is(x,"AgTraitListData")){
#'     message("x is not a Agronomic Trait-List data object")  
#'   }else if(initf=="" || is.null(initf)){
#'     message("Please introduce the initial format you want to change. Ex. kdsmart")  
#'   } else if(newf=="" || is.null(newf)){
#'     message("Please introduce the new format you want to convert. Ex. FieldbookApp")  
#'   } else {
#'     
#'   var_enq <- rlang::sym(newf)
#'   #out <- dict %>% dplyr::filter(!is.na(!!var_enq))
#'    out <- dict %>% dplyr::filter(!!var_enq!="") 
#' 
#'   }
#'   out
#' }
#' convert_agrofims_form(x = trait_data, dict=x, initf= "kdsmart", newf="fieldbookApp")
#' 
#' 
#' 
#' library(jsonlite)
#' url <- "https://research.cip.cgiar.org/agrofims/api/prod/equi/getAll.php"
#' res <- httr::GET(url = url)
#' out <- httr::content(x = res, as = "text", encoding = "UTF-8")
#' # Get metadata
#' dict <- jsonlite::fromJSON(txt = out)
#' class(dict) <- c("AgTraitListData","data.frame")
#' 
#' # Seeting file path -------------------------------------------------------------
#' fp <- "D:/omar/AgroFIMS-Project/agrofims_rcode/datasets/XXXX1588710821--FMCassava202005_.xlsx"
#' 
#' # check type of experiment ------------------------------------------------
#' type_exp <- readxl::read_xlsx(fp,"Metadata") %>% filter(Parameter == "Cropping type")
#' type_exp <- type_experiment[[2]]
#' 
#' 
#' if(type_exp== "Monocrop"){
#'   
#' sheet <- "TraitList"  
#' trait_list_data <- readxl::read_xlsx(fp, sheet = sheet)
#' class(trait_list_data) <- c("AgTraitListData","data.frame", "tbl_df", "tbl")
#' convert_agrofims_form(x = trait_data, dict=x, initf= "kdsmart", newf="fieldbookApp")
#' 
#' 
#' 
#' }
#' 
#' 
#' 
#' 
#' 
#' 
#' 
