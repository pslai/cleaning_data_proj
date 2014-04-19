##Code Book

#tidyData.txt
This file is generated from the R command:
	write.table(data2, file="tidyData.txt", row.names=FALSE, col.names=TRUE, quote=FALSE)
The firt line of the file is the name of each column. Each sucessive line corresponds to a row in the table. The columns are seperated by a single space. No quotes are used. There are no row names. The first three columns are as follows:
1."set"
	This is the set that this entry is from, either "test" or "train"

2. "activity"
	This is the activity that the subject was engaged in while the data were recorded. The options are:
		-WALKING
		-WALKING_UPSTAIRS
		-WALKING_DOWNSTAIRS
		-SITTING
		-STANDING
		-LAYING
3. "subject"
	This is the subject number. The range of subject numbers is 1-30, corresponding to the 30 subjects that participated.
	
The remaining 66 columns correspond to the features from the X_test.txt and X_train.txt that contain either "mean()" or "std()" in their labels. These are the means and standard deviations over a specific time window of specific signals from the smart phone. These means and standard deviations were then mapped onto [-1, 1] to aid in there use for machine learning. More information can be found in the file features_info.txt in the main directory of the original dataset.

#tidyMeans.txt
This file is generated from the R command:
	write.table(solid, file="tidyMeans.txt",row.names=FALSE, col.names=TRUE, quote=FALSE)
The firt line of the file is the name of each column. Each sucessive line corresponds to a row in the table. The columns are seperated by a single space. No quotes are used. There are no row names. The first two columns are as follows:
1."set"
	This is the set that this entry is from, either "test" or "train"

2. "activity"
	This is the activity that the subject was engaged in while the data were recorded. The options are:
		-WALKING
		-WALKING_UPSTAIRS
		-WALKING_DOWNSTAIRS
		-SITTING
		-STANDING
		-LAYING

The remaining 66 columns correspond to the columns from tidyData.txt. Each entry in these columns is the mean of all of the data points of that variable with the same subject and activity in tidyData.txt. There are 180 rows corresponding to all of the combinations of six activities and 30 subjects.