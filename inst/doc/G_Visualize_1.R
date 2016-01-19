## ----pch_col_examp-------------------------------------------------------
#use runif to generate a vector of n random numbers between min and max
data1 <- data.frame(x=1:75, y=runif(n=25, min=0, max=75)) 
data2 <- data.frame(x=1:75, y=runif(25, 0, 75))

#Now, plot two different sets of points in different colors
plot(data1$x, data1$y, pch=16, col='#FF5034')
points(data2$x, data2$y, pch=16, col='skyblue')

## ----par_example---------------------------------------------------------
par(las=2, tck=0.01, bg="darkseagreen")
plot(data1$x, data1$y, pch=6)

## ----legend_example------------------------------------------------------
#plot the same plot using to illustrate color and point type
plot(data1$x, data1$y, pch=16, col='#FF5034')
points(data2$x, data2$y, pch=16, col='skyblue')

#add a legend
legend(x="topright", legend=c("My data1 points", "my data2 points"),
       pch=16, col=c('#FF5034', 'skyblue'), title="Legend")

## ----add_features_example------------------------------------------------
#plot formulas using curve()
curve(x^2, from=0, to=10)
curve(sin(x), from=-pi, to=pi)

#plot rectangles or polygons
plot(1:15, c(1:7, 9.5, 9:15), type='l')
rect(xleft=6, xright=10, ybottom=5, ytop=11, density=5, col="orange")
polygon(x=c(2,3,4), y=c(2,6,2), col="lightgreen", border=NA)

#use symbols to plot circles (and more) based on data
x <- runif(25, 0, 25)
y <- runif(25, 0, 25)
radii <- runif(25, 0, 10)
cols <- colors()[round(runif(25, 0, 500))]
symbols(x, y, circles = radii, bg = cols)


## ----warning = FALSE, message = FALSE------------------------------------
library(dataRetrieval)
# Gather NWIS data:
P_site1 <- readNWISqw("01656960", parameterCd = "00665")
P_site2 <- readNWISqw("01656725", parameterCd = "00665")


## ----axis_example--------------------------------------------------------
xData <- 1:50
yData <- runif(50, min=1, max=10000)

#add a second y axis
plot(xData, yData, pch=20)
axis(side=3, at=seq(1,50, by=0.5))

#log the y-axis
plot(xData, yData, pch=20, log='y')
axis(side=4) #this axis is also logged


## ----multiple_plots_example----------------------------------------------
#use the built-in r data, "iris"

layout_matrix <- matrix(c(1:4), nrow=2, ncol=2, byrow=TRUE)
layout(layout_matrix)

#four boxplots:
plot1 <- plot(iris$Species, iris$Sepal.Width, ylab="Sepal Width")
plot2 <- plot(iris$Species, iris$Sepal.Length, ylab="Sepal Length")
plot3 <- plot(iris$Species, iris$Petal.Width, ylab="Petal Width")
plot4 <- plot(iris$Species, iris$Petal.Length, ylab="Petal Length")


