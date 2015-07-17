# R carpentry day2 R session
library(dplyr)

#This will pipe iris. groupby 
iris %>% group_by(Species) %>% summarise(mean.length = mean(Sepal.Length),max.Width = max(Sepal.Width),sd.petal = sd(Petal.Width))

mystatscut <- diamonds %>% group_by(cut, color) %>% summarise(MinCar = min(carat), meanCar = mean(carat), MaxCar = max(carat))

habitat = c("Forest","land","temperate")
iris_habitat <- data.frame( Species = c("setosa", "versicolor", "virginica" ), Habitat = c( "forest", "meadow", "wetland") )

dat <- diamonds

g1 <- ggplot(dat, aes(x = depth, y = carat, fill = cut))
g1+ geom_point()
g2 <- ggplot(dat,aes(fill = color))
g2 + geom_boxplot(aes(x = cut, y =price))


dat2 <- iris_full

g1 <- ggplot(dat2, aes(x = Species,colour = Species)) +geom_density()
g1 <- ggplot(dat2, aes(x = group = paste(Species),colour = Species)) +geom_density()



