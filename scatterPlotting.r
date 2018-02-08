#########################################
## cfg								   ##
#########################################
dir = 'data'
nrows = 3; ncols = 3

xlab = 'x label here'; ylab = 'y label here'
plotLab = letters[1:(nrows * ncols)]
########################################
## load data						  ##
########################################
files = list.files(dir, full.names = TRUE)
files = c(files, files, files)


loadFile <- function(file) {
	dat = read.csv(file, stringsAsFactors = FALSE)
	dat = t(dat)
	colnames(dat) = dat[1,]
	dat = dat[-1,]
	return(dat)
}

data = lapply(files, loadFile)
## Same as this:
#data = c()
# for (file in files) data = c(loadFile(file))

########################################
## plot      						  ##
########################################
par(mfrow = c(nrows, ncols), mar = c(4, 4, 0.1, 0.1), oma = c(1, 1, 1, 1)) 

plotScatter <- function(dat, lab){
	x = dat[, 'R2']; y = dat[, 'adj_RMSE']
	plot(x, y, pch = 19, xlab = '', ylab = '')
	grid()
	mtext(lab, side = 3, line = -2, adj = 0.1)
}	

mapply(plotScatter, data, plotLab)
mtext(xlab, side = 1, line = -1, outer = TRUE)
mtext(ylab, side = 2, line = -1,	outer = TRUE)
## Same as this:
# for (dat in 1:length(data)) plotScatter(data[[i]], plotLab[i])