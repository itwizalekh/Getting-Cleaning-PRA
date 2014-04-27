#file setup; if the UCI HAR Dataset folder does not exist in the working directory,
# we pull the zip file from the Coursera-provided link and unzip it, cleaning up after
folder <- "UCI HAR Dataset"
if(!file.exists(folder)) {
	zipFile <- "src_data.zip"
	fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	download.file(fileUrl, destfile=zipFile, method="curl")
	unzip(zipFile)
	file.remove(zipFile)
}

#read in relevant source data
testSubjects <- read.table(paste(folder, "/test/subject_test.txt", sep=""))
testActivities <- read.table(paste(folder, "/test/y_test.txt", sep=""))
testMeasurements <- read.table(paste(folder, "/test/X_test.txt", sep=""))

trainingSubjects <- read.table(paste(folder, "/train/subject_train.txt", sep=""))
trainingActivities <- read.table(paste(folder, "/train/y_train.txt", sep=""))
trainingMeasurements <- read.table(paste(folder, "/train/X_train.txt", sep=""))

activityLabels <- read.table(paste(folder, "/activity_labels.txt", sep=""))
featureLabels <- read.table(paste(folder, "/features.txt", sep=""))

#bind together test and training data and clean up
subjects <- rbind(testSubjects, trainingSubjects)
activities <- rbind(testActivities, trainingActivities)
measurements <- rbind(testMeasurements, trainingMeasurements)
rm(testSubjects, testActivities, testMeasurements, trainingSubjects, trainingActivities, trainingMeasurements)

#label activities and measurements and clean up
activities <- sapply(activities, function(x) activityLabels[x, 2])
names(measurements) <- featureLabels[,2]
rm(activityLabels, featureLabels)

#combine subjects and activities and clean up
comp <- data.frame(subjects, activities)
names(comp)[1:2] = c("subject", "activity")
rm(subjects, activities)

#extract and add means and standard deviations to the composite frame and clean up
labelsOfInterest <- (grepl("-mean()", names(measurements)) & !grepl("-meanFreq", names(measurements))) | grepl("-std()", names(measurements))
comp <- cbind(comp, measurements[ , labelsOfInterest ])
rm(measurements)

#melt and cast the composite table, taking the mean of variables for each subject+activity
require("reshape")
library(reshape)
melted <- melt(comp, id=c("subject", "activity"))
tidy <- cast(melted, subject+activity~variable, mean)
rm(comp, melted)

#output new tidy dataset and clean up downloaded data
write.table(tidy, "tidyoutput.txt", row.names=FALSE)
rm(tidy)