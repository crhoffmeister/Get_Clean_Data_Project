# Run Analysis on the Human Activity Recognition Using 
# Smartphones Dataset Version 1.0
# ==================================================================
# Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
# Smartlab - Non Linear Complex Systems Laboratory
# DITEN - Universit? degli Studi di Genova.
# Via Opera Pia 11A, I-16145, Genoa, Italy.
# activityrecognition@smartlab.ws
# www.smartlab.ws
# ==================================================================

library(dplyr)

# Obtain data from source:

if (!file.exists("./data")) {dir.create("./data")}
source_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

getdata <- function() {
      download.file(source_url, destfile = "./data/data.zip", method="wb")
      dateDownloaded <- date()
      unzip("./data/data.zip", exdir="./data")
}
data <- list.files("./Data", full.names=T, recursive=T, include.dirs=T)

activites <- read.table(data[2])
variables <- read.table(data[3])[,2]

test <- read.table(data[18])
names(test) <- variables
subjects_test <- read.table(data[17], col.names="subject")
test_activities <- read.table(data[19], col.names="activity")

subjects_train <- read.table(data[31])[,1]
train <- read.table(data[32])
names(train) <- variables
train_activites <- read.table(data[19])

# Merges the training and the test sets to create one data set.

merged <- tbl_df(train, test)

# Extracts only the measurements on the mean and standard deviation 
# for each measurement. 


# Uses descriptive activity names to name the activities in the data set.

      # y_test.txt & activity_labels.txt, bind subject_test.txt

# Appropriately labels the data set with descriptive variable names. 

      # features.txt

# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

      # melt by subject & activity
