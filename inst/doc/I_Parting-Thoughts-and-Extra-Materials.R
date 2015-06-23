## ----echo=FALSE----------------------------------------------------------

library(knitr)

pageNumber <- 10

titles <- c("Workshop Outline","A. Introduction", 
            "B. Get", "C. Clean", "D. Explore",
             "E. Analyze Base", "F. Analyze Packages", "G. Visualize",
             "H. Repeat and Reproduce", "I. Parting Thoughts")

pages <- paste0(c("0_Outline","A_Introduction", "B_Get", "C_Clean", "D_Explore",
             "E_Analyze", "F_Analyze", "G_Visualize",
             "H_Repeat-Reproduce", "I_Parting-Thoughts-and-Extra-Materials"),
             ".html")
markdownToPrint <- paste0("[",titles,"](",pages,")")

dfPages <- data.frame(titles,pages,markdownToPrint,stringsAsFactors = FALSE)

directions <- dfPages$markdownToPrint[c(pageNumber-1)]  
directions <- c(directions[1],"-----------------------------------------")
kable(t(directions))

## ----echo=FALSE----------------------------------------------------------
kable(t(directions))

