
# How to use dplyr-filter in fuctions and shiny ---------------------------

# AppName <- "FieldbookApp" #Aplication Name
# agdatadictobj <- AgDataDictObjt #
# temp <- eval(substitute(agdatadictobj %>% dplyr::filter(!is.na(y)), list(y=as.name(AppName))))


# bare to quosure in function: enquo
# bare_to_quo_in_func <- function(x, var) {
#   var_enq <- enquo(var)
#   x %>% select(!!var_enq) %>% head(1)
# }
# bare_to_quo_in_func(mtcars, mpg)
# Fuente : https://edwinth.github.io/blog/dplyr-recipes/