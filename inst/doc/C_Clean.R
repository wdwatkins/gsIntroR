## ----setup, echo=FALSE, warning=FALSE------------------------------------
options(repos=c("http://cran.rstudio.com/","http://owi.usgs.gov/R"))

if(!require("ggplot2")){
  install.packages("ggplot2")
}
if(!require("dplyr")){
  install.packages("dplyr")
}

library(ggplot2)
library(dplyr)
library(knitr)

pageNumber <- 4

titles <- c("Workshop Outline","A. Introduction", 
            "B. Get", "C. Clean", "D. Explore",
             "E. Analyze Base", "F. Analyze Packages", "G. Visualize",
             "H. Repeat and Reproduce", "I. Parting Thoughts")

pages <- paste0(c("Outline","A_Introduction", "B_Get", "C_Clean", "D_Explore",
             "E_Analyze", "F_Analyze", "G_Visualize",
             "H_Repeat-Reproduce", "I_Parting-Thoughts-and-Extra-Materials"),
             ".html")
markdownToPrint <- paste0("[",titles,"](",pages,")")

dfPages <- data.frame(titles,pages,markdownToPrint,stringsAsFactors = FALSE)

directions <- dfPages$markdownToPrint[c(pageNumber-1,pageNumber+1)]
directions <- c(directions[1],"-----------------------------------------",directions[2])
kable(t(directions))

## ----indexing_examp------------------------------------------------------
#Create a vector
x<-c(10:19)
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
x[x%%2==0]

## ----data_frame_index----------------------------------------------------
#Let's use one of the stock data frames in R, iris
head(iris)
#And grab a specific value
iris[1,1]
#A whole column
petal_len<-iris[,3]
petal_len
#A row
obs15<-iris[15,]
obs15
#Many rows
obs3to7<-iris[3:7,]
obs3to7

## ----more_data_frame_index-----------------------------------------------
#First, there are a couple of ways to use the column names
iris$Petal.Length
head(iris["Petal.Length"])
#Multiple colums
head(iris[c("Petal.Length","Species")])
#Now we can combine what we have seen to do some more complex queries
#Lets get all the data for Species with a petal length greater than 6
big_iris<-iris[iris$Petal.Length>=6,]
head(big_iris)
#Or maybe we want just the sepal widths of the virginica species
virginica_iris<-iris$Sepal.Width[iris$Species=="virginica"]
head(virginica_iris)

## ----setup_dplyr,eval=FALSE----------------------------------------------
#  install.packages("dplyr")
#  library("dplyr")

## ----more_data_frame_dplyr-----------------------------------------------
#First, select some columns
dplyr_sel<-select(iris,Sepal.Length,Petal.Length,Species)
#That's it.  Select one or many columns
#Now select some, like before
dplyr_big_iris<-filter(iris, Petal.Length>=6)
head(dplyr_big_iris)
#Or maybe we want just the virginica species
virginica_iris<-filter(iris,Species=="virginica")
head(virginica_iris)

## ----combine_commands----------------------------------------------------
#Intermediate data frames
#Select First: note the order of the output, neat too!
dplyr_big_iris_tmp1<-select(iris,Species,Sepal.Length,Petal.Length)
dplyr_big_iris_tmp<-filter(dplyr_big_iris_tmp1,Petal.Length>=6)
head(dplyr_big_iris_tmp)

#Nested function
dplyr_big_iris_nest<-filter(select(iris,Species,Sepal.Length,Petal.Length),Species=="virginica")
head(dplyr_big_iris_nest)

#Pipes
dplyr_big_iris_pipe<-select(iris,Species,Sepal.Length,Petal.Length) %>%
  filter(Species=="virginica")
head(dplyr_big_iris_pipe)

## ----Exercise1, echo=FALSE-----------------------------------------------

## ----rbind_examp---------------------------------------------------------
#Let's first create a new small example data.frame
rbind_df<-data.frame(a=1:3,b=c("a","b","c"),c=c(T,T,F),d=rnorm(3))
#Now an example df to add
rbind_df2<-data.frame(a=10:12,b=c("x","y","z"),c=c(F,F,F),d=rnorm(3))
rbind_df<-rbind(rbind_df, rbind_df2)
rbind_df

## ----merge_example-------------------------------------------------------
# Contrived data frame
rbind_df_merge_me <- data.frame(a=c(1,3,10,11,14,6,23),x=rnorm(7),names=c("bob","joe","sue",NA,NA,"jeff",NA))
# Create merge of matches
rbind_df_merge_match<-merge(rbind_df,rbind_df_merge_me,by="a")
rbind_df_merge_match
# Create merge of matches and all of the first data frame
rbind_df_merge_allx <- merge(rbind_df,rbind_df_merge_me,by="a",all.x=TRUE)
rbind_df_merge_allx

#dplyr is faster:

rbind_df_merge_allx_dplyr <- left_join(rbind_df,rbind_df_merge_me,by="a")
all.equal(rbind_df_merge_allx_dplyr, rbind_df_merge_allx)


## ----Exercise2, echo=FALSE-----------------------------------------------

## ----aggregate_examp-----------------------------------------------------
#Chained with Pipes
group_by(iris,Species)%>%
  summarize(mean(Sepal.Length),
            mean(Sepal.Width),
            mean(Petal.Length),
            mean(Petal.Width))

## ----arrange_example-----------------------------------------------------
head(mtcars)
#ascending order is default
head(arrange(mtcars,mpg))
#descending
head(arrange(mtcars,desc(mpg)))
#multiple columns: most cyl with best mpg at top
head(arrange(mtcars,desc(cyl),desc(mpg)))

## ----slice_example-------------------------------------------------------
#grab rows 3 through 10
slice(mtcars,3:10)

## ----mutate_example------------------------------------------------------
head(mutate(mtcars,kml=mpg*0.425))

## ----rowwise_examp-------------------------------------------------------
#First a dataset of temperatures, recorded weekly at 100 sites.
temp_df<-data.frame(id=1:100,week1=runif(100,20,25), week2=runif(100,19,24), 
                    week3=runif(100,18,26), week4=runif(100,17,23))
head(temp_df)
#To add row means to the dataset, without the ID
temp_df2<-temp_df %>% 
  rowwise() %>% 
  mutate(site_mean = mean(c(week1,week2,week3,week4)))
head(temp_df2)

## ----Exercise3, echo=FALSE-----------------------------------------------

## ----function_create-----------------------------------------------------
hw<-function(){
  print("Hello, World")
}

hw()

## ----function2_create----------------------------------------------------
p<-function(my_text){
  print(my_text)
}

p("Hello, world")
p("Hola, mundo")
p("Howdy, Texas")

## ----function_examp------------------------------------------------------
min_length_and_species <- function(min_petal_length, species, df=iris) {
    filtered_df <- filter(df, Petal.Length>=min_petal_length, Species==species)
    subset_df <- select(filtered_df, Petal.Length, Species)
}

virginica_iris <- min_length_and_species(6, "virginica")
setsoa_iris <- min_length_and_species(3, "setsoa")

## ----if_else_examp-------------------------------------------------------
odd_even<-function(num){
  if(num %% 2 == 0){
    print("EVEN")
  } else {
    print("ODD")
  }
}

odd_even(27)
odd_even(34)

## ----if_else_examp2------------------------------------------------------
plus_minus<-function(num){
  if(num>0){
    print("plus")
  } else if (num < 0) {
    print("minus")
  } else {
    print("zero")
  }
}
 
plus_minus(198)
plus_minus(-44)
plus_minus(37*0)

## ----for_examp-----------------------------------------------------------
sum_vec<-function(vec){
  j<-0
  for(i in vec){
    j<-i+j
    print(j)
  }
}

sum_vec(1:2)
sum_vec(1:10)

## ----for_examp_print-----------------------------------------------------
# A simple vectorize operation
x<-1:100
y<-100:1
z<-x+y
z

## ----looping_vector_examp------------------------------------------------
#We will assume vectors of the same length...
add_vecs<-function(vec1,vec2){
  out<-NULL
  for(i in 1:length(vec1)){
    out[i]<-vec1[i]+vec2[i]
  }
  out
}
add_vecs(x,y)

## ----for_vector_time-----------------------------------------------------
large_vec1<-as.numeric(1:100000)
large_vec2<-as.numeric(100000:1)
#Different speed
vec_time<-system.time(large_vec1+large_vec2)
loop_time<-system.time(add_vecs(large_vec1,large_vec2))
vec_time
loop_time

## ----looping_vector_examp2-----------------------------------------------
#We will assume vectors of the same length...
add_vecs2<-function(vec1,vec2){
  out<-vector("numeric",length(vec1))
  for(i in 1:length(vec1)){
    out[i]<-vec1[i]+vec2[i]
  }
  out
}

system.time(add_vecs2(large_vec1,large_vec2))

## ----odd_even_return-----------------------------------------------------
odd_even<-function(num){
  if(num %% 2 == 0){
    return("EVEN")
  } 
  return("ODD")
}

## ----sum_vec_return------------------------------------------------------
sum_vec<-function(vec){
  j<-0
  for(i in vec){
    j<-i+j
  }
  return(j)
}

## ----echo=FALSE----------------------------------------------------------
kable(t(directions))


