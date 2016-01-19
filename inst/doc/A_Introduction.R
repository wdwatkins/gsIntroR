## ----setup, echo=FALSE---------------------------------------------------
set.seed(1)
title="A. Introduction"
gsIntroR::navigation_array(title)

## ----Exercise1, echo=FALSE-----------------------------------------------

## ----function_examples, eval=FALSE---------------------------------------
#  #Print
#  print("hello world!")
#  #A sequence
#  seq(1,10)
#  #Random normal numbers
#  rnorm(100,mean=10,sd=2)
#  #Mean
#  mean(rnorm(100))
#  #Sum
#  sum(rnorm(100))

## ----set_repos, eval=FALSE-----------------------------------------------
#  options(repos=c("http://cran.rstudio.com/","http://owi.usgs.gov/R"))

## ----install_package, eval=FALSE-----------------------------------------
#  #Install dataRetrieval and EGRET
#  install.packages("dataRetrieval")
#  install.packages("EGRET")
#  
#  #You can also put more than one in
#  install.packages(c("dplyr","ggplot2"))

## ----load_package--------------------------------------------------------
#Add libraries to your R Session
library("dataRetrieval")
library("EGRET")

#You can also access functions without loading by using package::function
dataRetrieval::readNWISuv

## ----help_from_console, eval=FALSE---------------------------------------
#  #Using the help command/shortcut
#  help("print") #Help on the print command
#  ?print #Help on the print command using the `?` shortcut
#  help(package="dplyr") #Help on the package `dplyr`
#  
#  #Don't know the exact name or just part of it
#  apropos("print") #Returns all available functions with "print" in the name
#  ??"print" #Returns fuzzy matches to the text. Also searches demos and vignettes in a formatted page
#  
#  #Explore what's loaded
#  ls("package:stats") #Lists all functions in the stats package (which is always loaded)
#  #'pri'-TAB #press the Tab key as you're typing to see a list of possible word completions

## ----Exercise2, echo=FALSE-----------------------------------------------

## ----echo=FALSE----------------------------------------------------------
gsIntroR::navigation_array(title)

