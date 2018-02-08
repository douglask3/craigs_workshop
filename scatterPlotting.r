#########################################
## cfg								   ##
#########################################
dir = 'data'
nrows = 3; ncols = 3

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
#data = c()
# for (file in files) data = loadFile(file)

########################################
## plot      						  ##
########################################
par(mfrow = c(nrows, ncols), mar = c(4, 4, 0.1, 0.1), oma = c(1, 1, 1, 1)) 

plotScatter <- function(dat){
	x = dat[, 'R2']; y = dat[, 'adj_RMSE']
	plot(x, y, pch = 19)
	grid()
}	

lapply(data, plotScatter)