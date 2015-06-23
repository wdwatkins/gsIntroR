## ----echo=FALSE----------------------------------------------------------

library(knitr)

pageNumber <- 8

titles <- c("00 Before the Workshop","01 Introduction", 
            "02 Get", "03 Clean", "04 Explore",
             "05 Analyze Base", "06 Analyze Packages", "07 Visualize",
             "08 Repeat and Reproduce", "09 Parting Thoughts")

pages <- paste0(c("1_Before-The-Workshop","A_Introduction", "B_Get", "C_Clean", "D_Explore",
             "E_Analyze", "F_Analyze", "G_Visualize",
             "H_Repeat-Reproduce", "I_Parting-Thoughts-and-Extra-Materials"),
             ".html")
markdownToPrint <- paste0("[",titles,"](",pages,")")

dfPages <- data.frame(titles,pages,markdownToPrint,stringsAsFactors = FALSE)

directions <- dfPages$markdownToPrint[c(pageNumber-1,pageNumber+1)]  
directions <- c(directions[1],"-----------------------")
kable(t(directions))

## ----echo=FALSE----------------------------------------------------------
kable(t(directions))

