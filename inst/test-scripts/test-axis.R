
library(gridGraphics)

require(stats) # for rnorm

axis1 <- function() {
    set.seed(1)
    plot(1:4, rnorm(4), axes = FALSE)
    axis(1, 1:4, LETTERS[1:4])
    axis(2)
    box() #- to make it look "as usual"
}

axis2 <- function() {
    set.seed(1)
    plot(1:7, rnorm(7), main = "axis() examples",
         type = "s", xaxt = "n", frame = FALSE, col = "red")
    axis(1, 1:7, LETTERS[1:7], col.axis = "blue")
    # unusual options:
    axis(4, col = "violet", col.axis = "dark violet", lwd = 2)
    axis(3, col = "gold", lty = 2, lwd = 0.5)
}

axis3 <- function() {
    # one way to have a custom x axis
    plot(1:10, xaxt = "n")
    axis(1, xaxp = c(2, 9, 7))
}

# Test axis drawn in outer margin
axis4 <- function() {
    par(omi=rep(.5, 4))
    plot(1:10)
    box("inner", lty="dashed")
    axis(1, outer=TRUE)
    axis(2, outer=TRUE)
}

## Dotchart test (dotchart() modifies then resets par())
axis5 <- function() {
    dotchart(1:10, cex=1.5)
    axis(1, at=1:9, cex.axis=1.5)
}

## Tests of psychotic behaviour (modifying par() between plot() and axis())
axis6 <- function() {
    plot(1)
    par(cex=2)
    axis(1)
}

axis7 <- function() {
    plot(1)
    par(mex=2)
    axis(1)
}

axis8 <- function() {
    plot(1)
    par(mar=rep(4, 4))
    axis(1)
}

plotdiff(expression(axis1()), "axis-1")
plotdiff(expression(axis2()), "axis-2")
plotdiff(expression(axis3()), "axis-3")
plotdiff(expression(axis4()), "axis-4")
plotdiff(expression(axis5()), "axis-5")
plotdiff(expression(axis6()), "axis-6")
plotdiff(expression(axis7()), "axis-7")
plotdiff(expression(axis8()), "axis-8")

plotdiffResult()
