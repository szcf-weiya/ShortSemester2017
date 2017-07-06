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

## Boxplots
## Base graphics boxplot function
with(fossum, boxplot(totlngth, horiz=TRUE))
## Alternative: lattice graphics bwplot function
bwplot(~totlngth, data=fossum)


##  Patterns in univariate time series
## Panel A
plot(log10(measles), xlab="", ylim=log10 (c(1,5000*1000)),
     ylab=" Deaths; Population (log scale)", yaxt="n")
ytiks <- c(1, 10, 100, 1000, 1000000, 5000000)
## London population in thousands
londonpop <-
  ts(c(1088,1258,1504,1778,2073,2491,2921,3336,3881,4266,
       4563,4541,4498,4408), start=1801, end=1931, deltat=10)
points(log10(londonpop*1000), pch=16, cex=.5)
axis(2, at=log10(ytiks), labels=paste(ytiks), las=2)
## Panel B
plot(window(measles, start=1840, end=1882), ylim=c (0, 4600),
     yaxt="n")
axis(2, at=(0:4)* 1000, labels=paste(0:4), las=2)

## Panel A:
par(fig=c(0, 1, .38, 1)) # 38% to 100% of page, in y-direction
plot(log10(measles), ylab="log10(Deaths)",
     ylim=log10(c(1,5000*1000)))
mtext(side=3, line=0.5, "A (1629-1939)", adj=0)
## Panel B: window from 1840 to 1882; more complete code
par(fig=c(0, 1, 0, .4), new=TRUE) # 0% to 38% of height of figure region
plot(window(measles, start=1840, end=1882), ylab="Deaths")
mtext(side=3, line=0.5, "B (1841-1881)", adj=0)
par(fig=c(0, 1, 0, 1)) # Restore default figure region


## Patterns in bivariate data

## Plot four vs one: data frame milk (DAAG)
xyrange <- range(milk)
plot(four ~ one, data = milk, xlim = xyrange, ylim = xyrange,
     pch = 16, pty="s") # pty="s": square plotting region

rug(milk$one) # x-axis rug (default is side=1)
rug(milk$four, side = 2) # y-axis rug
abline(0, 1)

## The fitting of a smooth trend curve
## Plot ohms vs juice: data frame fruitohms (DAAG)
plot(ohms ~ juice, xlab="Apparent juice content (%)",
     ylab="Resistance (ohms)", data=fruitohms)
## Add a smooth curve, as in Panel B
with(fruitohms, lines(lowess(juice, ohms), lwd=2))
# With lwd=2, the curve is twice the default thickness

## What is the appropriate scale?
## The following omits the labeling information
oldpar <- par(mfrow = c(1,2), pty="s")
## Plot brain vs body: data frame Animals (MASS package)
library(MASS)
plot(brain ~ body, data=Animals) # Panel A
plot(log(brain) ~ log(body), data=Animals) # Panel B
par(oldpar)

## Patterns in grouped data – lengths of cuckoo eggs

## Compare stripplot() with bwplot(), both from lattice package
stripplot(species ~ length, xlab="Length of egg (mm)", data=cuckoos)
bwplot(species ~ length, xlab="Length of egg (mm)", data=cuckoos,
       scales=list(y=list(alternating=0)))
# alternating=0; omit y-axis labels

## Comparing densities between groups – lattice style density plots
## Density plot for earconch: data frame possum (DAAG package)
library(lattice)
densityplot(~earconch | sex, groups=Pop, data=possum,
            auto.key=list(space="right"))


## Apply function range to columns of data frame jobs (DAAG)
sapply(jobs, range)

## Simplified plot; all series in a single panel; use log scale
(simplejobsA.xyplot <-
    xyplot(Ontario+Quebec+BC+Alberta+Prairies+Atlantic  ~ Date,
           outer=FALSE, data=jobs, type="b",
           ylab="Number of workers", scales=list(y=list(log="e")),
           auto.key=list(space="right", lines=TRUE)))