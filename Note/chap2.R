## splitting the graphics window
par(mfrow=c(3,2))
par(mfcol=c(3,2))

mat <- matrix(c(2,3,0,1,0,0,0,4,0,0,0,5),
              4, 3, byrow=T)

layout(mat)
layout.show(5)

layout(mat, widths = c(1, 5, 14), heights = c(1,2, 4, 1))
layout.show(5)

curve(x^3-3*x, from = -2, to = 2)
X <- matrix(1:12, nrow=3)

## image()
colours = colors()[sample(657, 12)]
image(as.matrix(rev(as.data.frame(t(X)))), col = colours)
text(rep(c(0, 0.33, 0.67, 1), each = 3),
     rep(c(1, 0.5, 0), 4), 1:12, cex = 2)

## locator()
plot(1, 1)
text(locator(1), labels="here")

## par()
save.par <- par(no.readonly = TRUE)
par(bg = "red")
par(save.par)
