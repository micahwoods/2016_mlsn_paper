# this reads in the file of data that PACE already cleaned 
# for elimination of not good-performing

pace <- read.csv("data/pace_samples.csv", 
                 sep = ",", header = TRUE)

# for checking date range of samples
# pace$date <- mdy(as.character(pace$Date))

nPace <- length(pace$ID)

# cut to get the data with desired values of pH and TEC
pace <- filter(pace, pH >= 5.5 & pH <= 8.5 & TECM3 <= 6)
