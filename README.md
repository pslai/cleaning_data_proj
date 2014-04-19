##Read Me

This repository contains three files:

1. README.md (this file)
2. run_analysis.R
3. CodeBook.md

#run_analysis.R:

This file is an R script that generates two text data files based on the data in the dataset. It looks for the data in a folder in the working directory called "UCI_HAR_Dataset". The setwd() function has been disabled in the version on gitHub for privacy reasons. It can be enabled and changed to reflect the location of the data folder.

The first text file generated follows from steps 1-4 of the assignment. It is called tidyData.txt. The data sets of X_test.txt and X_train.txt are combined with column headings and three additional columns. The features that contained mean() or std() are included and the others are removed. The added "set" column indicates that the row is from either the training set or the testing set. The "subject" column indicates the subject number (1-30) of the subject associated with the row. The "activity" column gives the activity that the subject was performing when the data was collected in text form from a list of six possibilities. The file is generated using the write.table function with sep=" ". Column names are on, row names are off, and quotes are disabled.

The second text file generated follows step 5 of the assignment. It is called tidyMeans.txt. Starting with the processed data above, the means for each of the included features for each subject-activity combination are provided. Each row is a subject-activity combination (6 activities x 30 subjects = 120 rows). The set that the data are drawn from (test vs. training) is ignored. The columns are the two identifiers, subject and activity, and then the 66 variables. Each numeric value in the table coressponds to the mean of all of the values for rows in tidyData.txt with the same activity and subject.

#CodeBook.md:
This file gives details on the data format of the files tidyData.txt and tidyMeans.txt