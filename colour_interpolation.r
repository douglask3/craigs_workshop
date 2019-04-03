library(colorspace)
color_interpolate <- function(col, ncols, ...) {
    ncols = seq(0, 1, length.out = ncols)
    col_fun = colorRamp(col, ...)
    col = col_fun(ncols)/255
    col = hex(colorspace::RGB(col))
    return(col)
}

col = c("red", "green", "yellow", "blue")
ncols = 20


x = 1:ncols
col = color_interpolate(col, ncols)
plot(x, col = col, pch = 19, cex = 5)

