#' almost same as [rmarkdown::html_document()]
#'
#' @importFrom magrittr %>%
#' @importFrom readr read_file write_lines
#' @importFrom rmarkdown html_document
#' @importFrom stringr str_replace_all
#' @export
html_document2 <- function(...){
  format <- html_document(...)

  pre_knit <- format$pre_knit
  format$pre_knit <- function(...){
    frames <- sys.frames()
    e <- frames[[ length(frames) - 1 ]]

    old_input <- e$knit_input
    new_input <- tempfile( fileext = "Rmd" )
    e$knit_input <- new_input

    lines <- read_file(old_input) %>%
      str_replace_all("(````.*?\n)```", "\\1`r ''````"  )
    write_lines( lines , new_input )

    pre_knit(...)
  }
  format
}
