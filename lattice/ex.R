library(lattice)
attach(mtcars)

gear = factor(gear, levels = c(3, 4, 5), labels = c("3 gears", "4 gears", "5 gears"))
cyl = factor(cyl, levels = c(4, 6, 8), labels = c("4 cyls", "6 cyls", "8 cyls"))

densityplot(~mpg, main = "Density Plot", xlab = "Miles per Gallon")
densityplot(~mpg | cyl, main = "Density Plot", xlab = "Miles per Gallon")
bwplot(cyl ~ mpg | gear, main = "Box plots by cylinders and gears", xlab = "Miles per Gallon", ylab = "Cylinders")

