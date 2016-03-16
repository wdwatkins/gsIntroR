## ----setup, echo=FALSE---------------------------------------------------
set.seed(3)
title="C. Clean"
gsIntroR::navigation_array(title)

## ----indexing_examp------------------------------------------------------
#Create a vector
x <- c(10:19)
x
#Positive indexing returns just the value in the ith place
x[7]
#Negative indexing returns all values except the value in the ith place
x[-3]
#Ranges work too
x[8:10]
#A vector can be used to index
#Can be numeric
x[c(2,6,10)]
#Can be boolean - will repeat the pattern 
x[c(TRUE,FALSE)]
#Can even get fancy
x[x %% 2 == 0]

## ----data_frame_index----------------------------------------------------
#Let's use one a data frame from the smwrData package

#Load the package and data frame:
library(smwrData)
data("PugetNitrate")

head(PugetNitrate)
#And grab a specific value
PugetNitrate[1,1]
#A whole column
nitrate_levels <- PugetNitrate[,7]
nitrate_levels
#A row
obs15<-PugetNitrate[15,]
obs15
#Many rows
obs3to7<-PugetNitrate[3:7,]
obs3to7

## ----more_data_frame_index-----------------------------------------------
#First, there are a couple of ways to use the column names
PugetNitrate$wellid
head(PugetNitrate["wellid"])
#Multiple colums
head(PugetNitrate[c("date","nitrate")])
#Now we can combine what we have seen to do some more complex queries
#Get all the data where nitrate concentration is greater than 10
high_nitrate <- PugetNitrate[PugetNitrate$nitrate > 10,]
head(high_nitrate)
#Or maybe we want just the nitrate concentrations for Bedrock geology
bedrock_nitrate <- PugetNitrate$nitrate[PugetNitrate$surfgeo == "BedRock"]
head(bedrock_nitrate)

## ----setup_dplyr,eval=FALSE----------------------------------------------
#  install.packages("dplyr")
#  library("dplyr")

## ----more_data_frame_dplyr-----------------------------------------------
#First, select some columns
dplyr_sel <- select(PugetNitrate, date, nitrate, surfgeo)
#That's it.  Select one or many columns
#Now select some observations, like before
dplyr_high_nitrate <- filter(PugetNitrate, nitrate > 10)
head(dplyr_high_nitrate)
#Or maybe we want just the bedrock samples
bedrock_nitrate <- filter(PugetNitrate, surfgeo == "BedRock")
head(bedrock_nitrate)

## ----combine_commands----------------------------------------------------
#Intermediate data frames
#Select First: note the order of the output, neat too!
dplyr_bedrock_tmp1 <- select(PugetNitrate, surfgeo, date, nitrate)
dplyr_bedrock_tmp <- filter(dplyr_bedrock_tmp1, surfgeo == "BedRock")
head(dplyr_bedrock_tmp)

#Nested function
dplyr_bedrock_nest <- filter(
  select(PugetNitrate, surfgeo, date, nitrate),
  surfgeo == "BedRock")
head(dplyr_bedrock_nest)

#Pipes
dplyr_bedrock_pipe <- 
  PugetNitrate %>% 
  select(surfgeo, date, nitrate) %>%
  filter(surfgeo == "BedRock")
head(dplyr_bedrock_pipe)

## ----Exercise1, echo=FALSE-----------------------------------------------

## ----rbind_examp---------------------------------------------------------
#Let's first create a new small example data.frame
rbind_df <- data.frame(a=1:3, b=c("a","b","c"), c=c(T,T,F), d=rnorm(3))
#Now an example df to add
rbind_df2 <- data.frame(a=10:12, b=c("x","y","z"), c=c(F,F,F), d=rnorm(3))
rbind_df <- rbind(rbind_df, rbind_df2)
rbind_df

## ----merge_example-------------------------------------------------------
# Contrived data frame
rbind_df_merge_me <- data.frame(
  a=c(1,3,10,11,14,6,23), x=rnorm(7), 
  names=c("bob","joe","sue",NA,NA,"jeff",NA))
# Create merge of matches
rbind_df_merge_match <- merge(rbind_df, rbind_df_merge_me, by="a")
rbind_df_merge_match
# Create merge of matches and all of the first data frame
rbind_df_merge_allx <- merge(rbind_df, rbind_df_merge_me, by="a", all.x=TRUE)
rbind_df_merge_allx

# dplyr is faster
rbind_df_merge_allx_dplyr <- left_join(rbind_df, rbind_df_merge_me, by="a")
all.equal(rbind_df_merge_allx_dplyr, rbind_df_merge_allx)

## ----Exercise2, echo=FALSE-----------------------------------------------

## ----aggregate_examp-----------------------------------------------------
#Chained with Pipes
PugetNitrate %>%
  group_by(surfgeo) %>%
  summarize(mean(nitrate),
            mean(wellmet))

## ----arrange_example-----------------------------------------------------
data("TNLoads")

head(TNLoads)
# every function, including head(), can be chained
TNLoads %>% head()
#ascending order is default
arrange(TNLoads, LOGTN) %>% head()
#descending
arrange(TNLoads, desc(LOGTN)) %>% head()
#multiple columns: most nitrogen with lowest rainfall at top
arrange(TNLoads, desc(LOGTN), MSRAIN) %>% head()

## ----slice_example-------------------------------------------------------
#grab rows 3 through 10
slice(TNLoads, 3:10)

## ----mutate_example------------------------------------------------------
mutate(TNLoads, TN=exp(LOGTN)) %>% head()

## ----rowwise_examp-------------------------------------------------------
#Add a column that totals landuse for each observation
landuse_sum <- TNLoads %>% 
  rowwise() %>% 
  mutate(landuse_total = sum(PRES, PNON, PCOMM, PIND))
head(landuse_sum)

## ----Exercise3, echo=FALSE-----------------------------------------------

## ----echo=FALSE----------------------------------------------------------
gsIntroR::navigation_array(title)

