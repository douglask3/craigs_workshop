fname = 'data/ResultsTransFourComponentsCROPSCAN2.csv'


dat = read.csv(fname,  stringsAsFactors = FALSE)
dat = t(dat)
colnames(dat) = dat[1,]
dat = dat[-1,]

reorderCols <- function(cols) {
	cols = (cols-1):cols
	
	dat = dat[, cols]
	dat = cbind(dat, rownames(dat), tail(dat[,1], 1), tail(dat[,1],2)[1])
	dat = head(dat, -2)
	return(dat)
}

dats = lapply(seq(2, ncol(dat), 2), reorderCols)

dat = c()
for (i in dats) dat = rbind(dat, i)

rownames(dat) = NULL
dat = as.data.frame(dat)
