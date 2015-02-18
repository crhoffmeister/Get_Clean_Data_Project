<h2>Coursera Data Science Getting and Cleaning Data Project</h2>

The project housed in this repository is the final course project for the Coursera Data Science Specialization course, Getting and Cleaning Data. The purpose of this project is to demonstrate an ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

This repo contains two files. 

The first, an R script file called <b>'run_analysis.R'</b>, collects data from the Human Activity Recognition Using Smartphones Dataset, Version 1.0. This data set is available <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">here </a> at the UCI Machine Learning Repository. The file runs a function to retrieve the data file, unzip it into a sub-directory called 'Data' of the current R working directory.

The R script called 'run_analysis.R' does the following:

Obtains the UCI dataset, and unzips the archive file to a specified location in the current R working directory.

The script then pieces together test and training data sets tables, and merges the training and the test sets to create one data set. After the merge, a separate file containing variable names is used to rename the merged set columns. These sets are described in more detail in the codebook.

The script then extracts only the measurements on the mean and standard deviation for each measurement, for each observation.

From the data set in step 4, the script then creates a second, independent tidy data set with the average of each variable for each activity and each subject, and writes the new set to a filed called <b>'tidyUCI.csv.'</b>

The second file in this repository is a codebook called <b>'Codebook.md'</b> which details the tidy dataset created by the 'run_analysis.R' script. The codebook explains what was done to the original data, explains what each variable represents for each observation, and summarizes the tidy data output.
