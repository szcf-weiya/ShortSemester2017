## Histograms and density plots
library(DAAG)
## Form the subset of possum that holds data on females only
fossum = subset(possum, sex == "f")

par(mfrow=c(2,2))
attach(fossum)
hist(totlngth, breaks = 72.5 + (0:5) * 5, ylim = c(0, 22),
     xlab="Total length (cm)", main ="A: Breaks at 72.5, 77.5, ...")
hist(totlngth, breaks = 75 + (0:5) * 5, ylim = c(0, 22),
     xlab="Total length (cm)", main="B: Breaks at 75, 80, ...")

dens <- density(totlngth)
xlim <- range(dens$x); ylim <- range(dens$y)
hist(totlngth, breaks = 72.5 + (0:5) * 5, probability = T,
     xlim = xlim, ylim = ylim, xlab="Total length (cm)", main=" ")
lines(dens)
hist(totlngth, breaks = 75 + (0:5) * 5, probability = T,
     xlim = xlim, ylim = ylim, xlab="Total length (cm)", main= " ")
lines(dens)
par(mfrow=c(1,1)); detach(fossum)

## The stem-and-leaf display
with(ais, stem(ht[sport=="Row"]))

