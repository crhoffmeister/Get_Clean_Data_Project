<h2>Coursera Data Science Getting and Cleaning Data Project</h2>

The project housed in this repository is the final course project for the Coursera Data Science Specialization course, Getting and Cleaning Data. The purpose of this project is to demonstrate an ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

This repo contains two files.

The first, an R script file called <b>'run_analysis.R'</b>, collects data from the Human Activity Recognition Using Smartphones Dataset, Version 1.0. This data set is available <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">here </a> at the UCI Machine Learning Repository. 

The R script called 'run_analysis.R' then does the following:

The script begins by loading the 'dplyr' and 'tidyr' packages into the workspace. These are required for actions later in the script.

Obtains the UCI dataset, and unzips the archive file to sub-directory in the current working directory called "./data/UCI HAR Dataset/", if this specified location does not already exist.

The script then pieces together test and training data sets tables, and merges the training and the test sets to create one data frame. After the merge, a separate file containing variable names is used to rename the merged set columns. These sets are described in more detail in the source documentation at UCI and in the codebook.

The script then extracts only the measurements on the mean and standard deviation for each measurement, for each observation.

From the data set in step 4, the script then creates a second, independent tidy data set with the average of each measurement mean and standard deviation for each activity and each subject, and writes the new set to a filed called <b>'tidyUCI.csv.'</b> The output file is comma separated and easily opened in Excel. As an alternative, the file may be opened in R with read.table(), specifying sep="," and header=TRUE, and otherwise using default values.

The second file in this repository is a codebook called <b>'Codebook.md'</b> which details the tidy dataset created by the 'run_analysis.R' script. The codebook explains what was done to the original data, explains what each variable represents for each observation, and summarizes the tidy data output.
