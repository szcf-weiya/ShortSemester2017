library(lattice)
attach(mtcars)

gear = factor(gear, levels = c(3, 4, 5), labels = c("3 gears", "4 gears", "5 gears"))
cyl = factor(cyl, levels = c(4, 6, 8), labels = c("4 cyls", "6 cyls", "8 cyls"))

densityplot(~mpg, main = "Density Plot", xlab = "Miles per Gallon")
densityplot(~mpg | cyl, main = "Density Plot", xlab = "Miles per Gallon")
bwplot(cyl ~ mpg | gear, main = "Box plots by cylinders and gears", xlab = "Miles per Gallon", ylab = "Cylinders")

xyplot(mpg ~ wt | cyl*gear, main = "Scatter Plots by Cylinders and Gears", xlab = "Car Weight", ylab = "Miles per Gallon")

cloud(mpg ~ wt*qsec | cyl, main = "3D Scatter Plots by Cylinders")
dotplot(cyl ~ mpg | gear, main = "Dot Plots by Number of Gears and Cylinders", xlab = "Miles Per Gallon")

splom(mtcars[c(1,3,4,5,6)], main = "Scatter Plot Matrix for mtcars Data")
detach(mtcars)