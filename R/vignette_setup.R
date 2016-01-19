#' Produce a 1-row, 3-col array describing the position of the current page (as named by the title arg)
#' 
#' @param title Character title of the page, e.g., "A. Introduction"
navigation_array <- function(title) {
  
  titles <- c(
    Outline="Workshop Outline",
    A_Introduction="A. Introduction",
    B_Get="B. Get", 
    C_Clean="C. Clean", 
    D_Explore="D. Explore",
    E_Analyze="E. Analyze - base", 
    F_Analyze="F. Analyze - packages", 
    G_Visualize_1="G. Visualize - base",
    G_Visualize="G. Visualize - ggplot2",
    "H_Repeat-Reproduce"="H. Repeat and Reproduce", 
    "I_Parting-Thoughts-and-Extra-Materials"="I. Parting Thoughts")
  pageNumber <- grep(title, titles)
  
  markdownToPrint <- paste0("[",titles,"](",names(titles),".html)")
  
  # make and return page navigation information as a 1-row, 3-col array suitable
  # for printing with kable
  directions <- data.frame(
    'Previous'=if(pageNumber > 1) markdownToPrint[pageNumber-1] else NA, 
    'Current'=markdownToPrint[pageNumber], 
    'Next'=if(pageNumber < length(titles)) markdownToPrint[pageNumber+1] else NA,
    'Outline'=markdownToPrint[1],
    stringsAsFactors=FALSE)
  
  knitr::kable(directions, col.names=c(paste(c("Previous","Current","Next"), "Lesson"), "Workshop Outline"))
}