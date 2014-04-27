if(!file.exists("data")) {
	dir.create("data")
}

filePath <- "./data/src_data.zip"
if(!file.exists(filePath)) {
	fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
	download.file(fileUrl, destfile=filePath, method="curl")
}

#countryData <- read.csv("./data/countries.csv", skip=4)[,4:5]
#educationalData <- read.csv("./data/educational.csv", header=TRUE)[,30]

#merged <- merge(countryData, educationalData, by.x="X.3", by.y="" all.x=FALSE, all.y=FALSE)