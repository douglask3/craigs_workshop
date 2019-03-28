plotTraitBand <- function(dat) {
    x = dat[,1]
    y = dat[,2]
    col = dat[,3]
    type = dat[,4]
    browser()
}
nbands = 16
ntraits = 4
n = nbands * ntraits
x = seq(0, pi, length.out = n)
dat = cbind(sin(x), cos(x), rep(1:nbands, ntraits), rep(1:ntraits, each = nbands)) 

