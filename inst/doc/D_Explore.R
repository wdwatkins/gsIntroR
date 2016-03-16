## ----setup, echo=FALSE---------------------------------------------------
title="D. Explore"
gsIntroR::navigation_array(title)

## ----summary_data_example------------------------------------------------
#Load the data package!
library(smwrData)

#load the dataset and take a quick look
data("MenomineeMajorIons")
summary(MenomineeMajorIons)

## ----range_examp---------------------------------------------------------
range(MenomineeMajorIons$HCO3)

## ----iqr_examp-----------------------------------------------------------
IQR(MenomineeMajorIons$Potassium)

## ----quantile_example----------------------------------------------------
quantile(MenomineeMajorIons$Magnesium)

#try this with Sulfate instead 
#quantile(MenomineeMajorIons$Sulfate)
#there are missing values, so add the na.rm argument
quantile(MenomineeMajorIons$Sulfate, na.rm = TRUE)

## ----quantile_probs_examp------------------------------------------------
quantile(MenomineeMajorIons$Magnesium, probs=(c(0.025, 0.975)))

## ----Exercise1, echo=FALSE-----------------------------------------------

## ----plot_examp----------------------------------------------------------
data("MenomineeMajorIons")
plot(MenomineeMajorIons$Sulfate, MenomineeMajorIons$HCO3)

## ----plot_examp_2--------------------------------------------------------
plot(MenomineeMajorIons$Sulfate, MenomineeMajorIons$HCO3,
     main="Changes in bicarbonate concentration as function of sulfate concentration",
     xlab="Sulfate Concentration", ylab="Bicarbonate concentration")

## ----pairs_examp---------------------------------------------------------
#get a data frame with concentrations of 4 major ions and the season
menominee_pairs <- MenomineeMajorIons %>% 
  select(HCO3, Nitrate, Potassium, Sulfate, season)
plot(menominee_pairs, main="Menominee Major Ions Pairs Plot")

## ----abline_examp--------------------------------------------------------
plot(MenomineeMajorIons$Sulfate, MenomineeMajorIons$HCO3)
#horizontal line at specified y value
abline(h=140)
#a vertical line
abline(v=15)
#Line with a slope and intercept
abline(55, 6)

## ----abline_examp_lm-----------------------------------------------------
plot(MenomineeMajorIons$Sulfate, MenomineeMajorIons$HCO3)
#abline accepts a linear model object as input
#linear model is done with lm, and uses a formula as input
abline(lm(HCO3 ~ Sulfate, data=MenomineeMajorIons))

## ----boxplot_examp-------------------------------------------------------
boxplot(MenomineeMajorIons$Chloride, main="Boxplot of Chloride Concentration", ylab="Concentration")

## ----boxplot_grps_examp--------------------------------------------------
boxplot(MenomineeMajorIons$Chloride ~ MenomineeMajorIons$season, 
        main="Boxplot of Chloride Concentration by Season", ylab="Concentration")

## ----base_hist_examp-----------------------------------------------------
hist(MenomineeMajorIons$Magnesium)
hist(MenomineeMajorIons$Magnesium, breaks=4)

## ----cdf_examp-----------------------------------------------------------
calcium_ecdf <- ecdf(MenomineeMajorIons$Calcium)
plot(calcium_ecdf)

## ----Exercise1, echo=FALSE-----------------------------------------------

## ----echo=FALSE----------------------------------------------------------
gsIntroR::navigation_array(title)

