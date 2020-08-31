# library(jsonlite)
# 
# url <- "https://research.cip.cgiar.org/agrofims/api/prod/equi/getAll.php"
# 
# res <- httr::GET(url = url)
# out <- httr::content(x = res, as = "text", encoding = "UTF-8")
# # Get metadata
# x <- jsonlite::fromJSON(txt = out)
# 
# 
