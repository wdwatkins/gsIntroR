## ----setup, echo=FALSE---------------------------------------------------
set.seed(5)
title="E. Analyze - base"
gsIntroR::navigation_array(title)

## ----ttest_examp---------------------------------------------------------
pop1 <- rnorm(30, mean=3, sd=2)
pop2 <- rnorm(30, mean=10, sd=5)
pop_ttest <- t.test(pop1, pop2)
pop_ttest

## ----ttest_formula_examp-------------------------------------------------
#Let's pick another dataset, ToothGrowth (see ?ToothGrowth)
#Compare tooth lengths between groups given different supplements
rbind(head(ToothGrowth), tail(ToothGrowth))
t.test(ToothGrowth$len ~ ToothGrowth$supp)

## ----corr_examp,message=FALSE,warning=FALSE------------------------------
#A simple correlation
cor(iris$Petal.Width, iris$Petal.Length)
#And a test of that correlation
cor.test(iris$Petal.Width, iris$Petal.Length)

#A data frame as input to cor returns a correlation matrix
#Can't just do cor(iris) because iris is not numeric:
# cor(iris)
library(dplyr) # use dplyr to select the numeric columns of iris
select(iris, -Species) %>% 
  cor()

## ----lm_examp------------------------------------------------------------
lm(Ozone ~ Temp, data=airquality)
#Not much info, so save to object and use summary
lm_aq1 <- lm(Ozone ~ Temp, data=airquality)
summary(lm_aq1)
#And now a multiple linear regression
lm_aq2 <- lm(Ozone ~ Temp + Wind + Solar.R, data=airquality)
summary(lm_aq2)

## ----Exercise1, echo=FALSE-----------------------------------------------

## ----echo=FALSE----------------------------------------------------------
gsIntroR::navigation_array(title)

