library(maps)
map('state') > map("state", boundary = FALSE, col="gray", add = TRUE ,title("Bernie vs. Trump, 2016"), legend("bottomleft", legend = c("Trump","Bernie"), fill = c("red", "blue")))

map('state') > map("state", boundary = FALSE, col="gray", add = TRUE ,title("Trump, 2016"))

map('state') > map("state", boundary = FALSE, col="gray", add = TRUE ,title("Bernie, 2016"))



#For Bernie Sanders - Blue
mydata_bernie <- read.table("C:/Users/pedbv9699/Desktop/Programming_for_dataScience/Master_bernie.txt", sep="\t", header=FALSE)
names(mydata_bernie) <- c("lon","lat","color")
points(mydata_bernie$lon,mydata_bernie$lat,col="blue",pch=18)


#For Donald Trump - Red

mydata_trump <- read.table("C:/Users/pedbv9699/Desktop/Programming_for_dataScience/Master_donald.txt", sep="\t", header=FALSE)
names(mydata_trump) <- c("lon","lat","color")
points(mydata_trump$lon,mydata_trump$lat,col="red",pch=18)

#sum of all latitude below 38 to indicate southern states

sum_below_line_trump_south = sum(mydata_trump$lat < 38)
sum_below_line_bernie_south = sum(mydata_bernie$lat < 38)

#count of all latitude above 38 to indicate northern states
sum_above_line_trump_north = sum(mydata_trump$lat > 38)
sum_above_line_bernie_north = sum(mydata_bernie$lat > 38)



# Souther States on count of postive tweets 

>  sum_below_line_trump_south = sum(mydata_trump$lat < 38)
>  sum_below_line_trump_south
[1] 278

> sum_below_line_bernie_south = sum(mydata_bernie$lat < 38)
> sum_below_line_bernie_south
[1] 189

# Northern States on count of postive tweets 

> sum_below_line_trump_north = sum(mydata_trump$lat > 38)
> sum_above_line_trump_north
[1] 206

> sum_above_line_bernie_north = sum(mydata_bernie$lat > 38)
> sum_above_line_bernie_north
[1] 284





south_vector <- c(sum_below_line_bernie_south,sum_below_line_trump_south)
names(south_vector) <- c("Bernie in South","Trump in South")
barplot(south_vector, col = c("blue","red"), title("Bernie vs. Trump in Southern States"))





north_vector <- c(sum_above_line_bernie_north,sum_above_line_bernie_north)
names(north_vector) <- c("Bernie in North","Trump in North")
barplot(north_vector, col = c("blue","red"), title("Bernie vs. Trump in Northern States"))

