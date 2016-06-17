# check ca vs mg vs k mmol in the data
# calculate mmol of charge

caMmol <- calcium / 40.078 * 2

mgMmol <- magnesium / 24.305 * 2

kMmol <- potassium / 39.0983 

percentCaMost <- sum(caMmol > mgMmol, na.rm = TRUE) / 
                (length(pace$ID) + length(atc$ID)) * 100
