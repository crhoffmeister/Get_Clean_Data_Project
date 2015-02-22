<h2>Coursera Data Science Getting and Cleaning Data Project</h2>

The project housed in this repository is the final course project for the Coursera Data Science Specialization course, Getting and Cleaning Data. The purpose of this project is to demonstrate an ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

This repo contains two files.

The first, an R script file called <b>'run_analysis.R'</b>, collects data from the Human Activity Recognition Using Smartphones Dataset, Version 1.0. This data set is available <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">here </a> at the UCI Machine Learning Repository. 

The R script called 'run_analysis.R' then does the following:

The script begins by loading the 'dplyr' and 'tidyr' packages into the workspace. These are required for actions later in the script.

Obtains the UCI dataset, and unzips the archive file to a sub-directory in the current working directory called "./data/UCI HAR Dataset/", if this specified location does not already exist.

The data set comprises tables of time and frequency from gyroscope and accelerometer readings of Samsung Galaxy 3 smartphones worn by 30 subjects engaged in six different physical activities. 

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The script pieces together test and training data tables, and merges the training and the test sets to create one data frame. It does this by 'rbinding' 561-variable data frames read from separate .txt files, and 'cbinding' columns containing labels for subjects and physical acticvities for each observation. The subject and activity vectors are located in two separate files in a folder with each data set. 

After the test and training sets are merged, a separate file containing variable names is read into a table and used to rename the merged set columns. The merges data variable names are described in more detail in the source documentation at UCI, and in the codebook located in this repository.

The script then extracts only the measurements on the mean and standard deviation for each time and frequency measurement, for each observation.

From the data set in step 4, the script then creates a second, independent tidy data set with the average of each measurement mean and standard deviation for each activity and each subject, and writes the new set to a filed called <b>'tidyUCI.csv.'</b> The script tidies the data using the dplyr package by:
- 'mutating' the activity column to reflect english labels, instead of a numerical index
- 'arranges' the table by subject, then by activity
- 'gathers' the measurements into two columns, measurement and value
- 'group_by' the table by subject, activity, and measurement
- 'summarizes' the data by mean of each measurement, by subject and activity

The output file is comma separated and easily opened in Excel. As an alternative, the file may be opened in R with read.table(), specifying sep="," and header=TRUE, and otherwise using default values.

The second file in this repository is a codebook called <b>'Codebook.md'</b> which details the tidy dataset created by the 'run_analysis.R' script. The codebook explains what was done to the original data, explains what each variable represents for each observation, and summarizes the tidy data output.
