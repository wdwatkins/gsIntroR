## ----setup, echo=FALSE, warning=FALSE------------------------------------
options(repos=c("http://cran.rstudio.com/","http://owi.usgs.gov/R"))
if(!require("EGRET")){
  install.packages("EGRET")
}

if(!require("XML")){
  install.packages("XML")

}
library("XML")

library(knitr)

pageNumber <- 7

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

directions <- dfPages$markdownToPrint[c(pageNumber-1,pageNumber+1)]  
directions <- c(directions[1],"-----------------------------------------",directions[2])
kable(t(directions))

## ----rf_install, eval=FALSE----------------------------------------------
#  install.packages("EGRET")
#  library("EGRET")
#  help(package="EGRET")

## ----flow_history_example------------------------------------------------
# Merced River at Happy Isles Bridge, CA:
siteNumber<-"11264500"
Daily <-readNWISDaily(siteNumber,"00060",startDate="",endDate="")
INFO <- readNWISInfo(siteNumber,"",interactive=FALSE)
INFO$shortName <- "Merced River at Happy Isles Bridge, CA"
eListMerced <- as.egret(INFO, Daily, NA, NA)
plotFlowSingle(eListMerced, istat=5)
# Then, we can run the same function, but first set
# the pa to start in December and only run for 3 months.
eListMerced <- setPA(eListMerced,paStart=12,paLong=3)
plotFlowSingle(eListMerced,istat=5,qMax=200)


## ----plotFourStats_example-----------------------------------------------
plotFourStats(eListMerced, qUnit=3)

## ----Exercise1, echo=FALSE-----------------------------------------------

## ----Choptank_noWRTDS, eval=FALSE----------------------------------------
#  #Choptank River at Greensboro, MD:
#  siteNumber <- "01491000"
#  startDate <- "1979-10-01"
#  endDate <- "2011-09-30"
#  param<-"00631"
#  Daily <- readNWISDaily(siteNumber,"00060",startDate,endDate)
#  INFO<- readNWISInfo(siteNumber,param,interactive=FALSE)
#  INFO$shortName <- "Choptank River"
#  Sample <- readNWISSample(siteNumber,param,startDate,endDate)
#  eList <- mergeReport(INFO, Daily, Sample)

## ----echo=FALSE, eval=TRUE-----------------------------------------------
eList <- Choptank_eList

## ----Choptank_noWRTDS_plotexample----------------------------------------
multiPlotDataOverview(eList, qUnit=1)

## ----Choptank_WRTDS, eval=FALSE------------------------------------------
#  eList <- modelEstimation(eList)

## ----Exercise2, echo=FALSE-----------------------------------------------

## ----vignette_examp,eval=FALSE-------------------------------------------
#  vignette(package="knitr")

## ----echo=FALSE----------------------------------------------------------
kable(t(directions))

