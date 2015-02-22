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
library(tidyr)

# Obtain data from source:

if (!file.exists("./data")) {dir.create("./data")}
source_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

getdata <- function() {
      download.file(source_url, destfile = "data.zip", method="auto")
      dateDownloaded <- date()
      unzip("./data.zip", exdir="./data")
}

if (!file.exists("./data/UCI HAR Dataset")) {
      getdata()
}

data <- list.files("./Data", full.names=T, recursive=T, include.dirs=T)

# Read descriptive variable and activity names from features.txt and activity_labels.txt.

activities <- read.table(data[2])
variables <- read.table(data[3])[,2]

# Bind together measurements with subject and activity variables.
# Label variables at each step.

test <- read.table(data[18])
names(test) <- variables
test_subjects <- read.table(data[17], col.names="subject")
test_activities <- read.table(data[19], col.names="activity")
test_data <- cbind(test_subjects, test_activities, test)
test_data <- tbl_df(test_data)

train <- read.table(data[32])
names(train) <- variables
train_subjects <- read.table(data[31], col.names="subject")
train_activities <- read.table(data[33], col.names="activity")
train_data <- cbind(train_subjects, train_activities, train)
train_data <- tbl_df(train_data)

# Merge the training and the test sets to create one data set.
# Bind subject_test.txt column.

merged_data <- bind_rows(test_data, train_data)

# Extract only the measurements on the mean and standard deviation 
# for each measurement. 
# Use descriptive activity names to name the activities in the data set.

extracted_data <- merged_data[,c(1,2,grep("mean\\()|std\\()", colnames(merged_data)))] %>%
      mutate(activity = factor(activity, levels=activities[,1], labels = activities[,2]))

# From the data set in step 4, create a second, independent tidy data set 
# with the average of each variable for each activity and each subject.


# Create a second, independent tidy data set, with the average 
# of each variable for each activity and each subject.

tidy_data <- merged_data[,c(1,2,grep("mean\\()|std\\()", colnames(merged_data)))] %>%
      tbl_df %>%
      mutate(activity = factor(activity, levels=activities[,1], labels = activities[,2])) %>%
      arrange(subject, activity) %>%
      gather(measurement, value, -(subject:activity)) %>%
      group_by(subject, activity, measurement) %>%
      summarize(measurementMean = mean(value)) %>%
      write.table("tidyUCI.txt", sep=",", row.names=F)
