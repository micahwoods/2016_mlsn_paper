# merge the data and calculate the MLSN guideline
# this is taking all PACE, all ATC, 
# these are already cut by pH & TEC, we then combine the
# vectors and calculate the MLSN guideline

# for K
potassium <- c(pace$KM3, atc$KM3)
mlsn.k <- mlsn(potassium)

# for P
phosphorus <- c(pace$PM3, atc$PM3)
mlsn.p <- mlsn(phosphorus)

# for Ca
# note that normal approximates current data better than fisk
# for guideline pre-2016, generally worked with normal distribution
# for Ca only, however for 2016 switch to log-logistic
calcium <- c(pace$CaM3, atc$CaM3)
# mlsn.ca <- mlsn.normal(calcium)
mlsn.ca <- mlsn(calcium)

# for Mg
magnesium <- c(pace$MgM3, atc$MgM3)
mlsn.mg <- mlsn(magnesium)

# for S
sulfur <- c(pace$SM3, atc$SM3)
mlsn.s <- mlsn(sulfur)
