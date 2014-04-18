#Load necessary libraries
library(reshape2) #needed for melt() and dcast()

# Set the wd to a directory containing the script and the previously downloaded
# data in a directory called "UCI_HAR_Dataset"

#setwd("REDACTED")  # The working directory has been removed for privacy - should be directory with data dir
data_dir <- "UCI_HAR_Dataset/"

# Load the various data files:
# training data and test data:
train           <- read.table(paste0(data_dir,"train/X_train.txt"))      
test            <- read.table(paste0(data_dir,"test/X_test.txt"))

# Column headings for data files:
colLabels       <- read.table(paste0(data_dir,"features.txt"), stringsAsFactors=F)

# Activities for each row in the training and test datasets, as numbers
trainAct        <- read.table(paste0(data_dir,"train/y_train.txt"))
testAct         <- read.table(paste0(data_dir,"test/y_test.txt"))

# Activity names to match the numbers:
activity_names  <- read.table(paste0(data_dir,"activity_labels.txt"))

#The subject numbers for each row in the training and test datasets:
trainSubj       <- read.table(paste0(data_dir,"train/subject_train.txt"))
testSubj        <- read.table(paste0(data_dir,"test/subject_test.txt"))

# End file loading

# Convert the files with only one column of interest into vectors:
colLabels <- colLabels[[2]]
trainAct <- trainAct[[1]]
testAct <- testAct[[1]]
activity_names <- activity_names[[2]]
trainSubj <-trainSubj[[1]]
testSubj <- testSubj[[1]]

# Add new columns to names:
colLabels <- c("set", "activity", "subject", colLabels) 
# Make R compatible names from the labels:
colNames <- make.names(colLabels, unique=T)

# Add columns for set (training vs. test), activity, and subject
# Add column names
train2 <- data.frame(stringsAsFactors= FALSE, 
                rep("train", times=nrow(train)),
                activity_names[trainAct], 
                trainSubj,
                train)
names(train2) <- colNames
# Same for test dataset
test2 <- data.frame(stringsAsFactors= FALSE, 
                rep("test", times=nrow(test)),
                activity_names[testAct],
                testSubj,
                test)
names(test2) <- colNames 

# Combine test and training sets:
data <- rbind(train2, test2)

# Subset only the variables that contain "mean()" or "std()", plus the new variables
# Using colLabels, not colNames as the later has been cleaned of special characters
data2 <- data[,grep("mean\\(\\)|std\\(\\)|activity|subject|set", colLabels)]  

# Write the combined and edited dataset to a .csv file for distribution
write.table(data2, file="tidyData.txt", row.names=FALSE, col.names=TRUE, quote=FALSE)

# Melt cleaned data with activity and subject as id variables and set (the first column) omitted
melted <- melt(data2[,-1], id.vars=c("activity", "subject"))

# Use dcast to get means of the mean() and std() variables by subject and activity combination
solid <- dcast(melted, subject + activity ~ variable, mean)

# Write the summarized data file to a .csv file for distribution
write.table(solid, file="tidyMeans.txt",row.names=FALSE, col.names=TRUE, quote=FALSE)



















