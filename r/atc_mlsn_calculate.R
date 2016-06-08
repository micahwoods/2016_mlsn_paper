# read ATC dataset that has already been cleaned 
# for elimination of not good-performing

atc <- read.csv("data/atc_samples.csv",
                header = TRUE)

# for checking date range of samples
# atc$date <- ymd(as.character(atc$DATE))

nAtc <- length(atc$ID)

# cut to get the data with desired values of pH and TEC
atc <- filter(atc, pH >= 5.5 & pH <= 8.5 & TECM3 <= 6)
