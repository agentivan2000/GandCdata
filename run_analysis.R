## My home Dir = setwd("~/Dropbox/Coursera/Getting and Cleaning Data/project")

## Sourcing the custom functions that were writen for this program

source("custom_fun.R")

## This function downloads the file from the internet, unzips it, creates a folder 
## called datasets by default... could be changed by passing int the required name as an arguement. 
## Please note that it deletes the dataset.zip file after unziping it. 

## In case you've already downloaded the files and placed them into ./datasets .. you can 
## comment out the function to save on time.

getfilestodatasetsDir()

## Importing test and training data // the function adds the activity label key on each data set.
## and renames the column accordingly to avoid confusion

###### Merging the datasets ...................

dt_test <- readcomb_data("./datasets/X_test.txt","./datasets/y_test.txt","./datasets/subject_test.txt")
dt_train <- readcomb_data("./datasets/X_train.txt","./datasets/y_train.txt","./datasets/subject_train.txt")

dat <- rbind(dt_test, dt_train)
rm(dt_test,dt_train)

## Import other relevant data 

activity_labels <- read.table("./datasets/activity_labels.txt")
features <- read.table("./datasets/features.txt")

names(activity_labels) <- c("activitylabelkey","activityname")
names(features) <- c("featurekey","featurename")

####### Selecting the required columns with only Means and std ..............

meansd_features <- features[grep("mean|std",features$featurename),]
fl <- paste("V",meansd_features$featurekey, sep = "")
req_fields <- c("subjectkey","activitylabelkey",fl)

dat2 <- dat[,req_fields]
rm(dat)

## Combining the descriptive data with the main table and naming columns 

## Joining the tables to add activity name  and organizing the columns ##### 

dat3 <- merge(x = dat2, y = activity_labels, by = "activitylabelkey", all.x = TRUE)
final_data <- dat3[,c(1,82,2:81)]

fl <- paste(meansd_features$featurename)
req_fieldnames <- c("activitylabelkey","activityname","subjectkey",fl)

## assigning readable column names to the final dataset

names(final_data) <- req_fieldnames

######## group data by activityname, subjectkey, returning the average of the other colums ...... 

final_data2 <- aggregate(final_data[, 4:82], list(subjectkey=final_data$subjectkey,activityname=final_data$activityname), mean)

write.table(final_data2, file = "./tidydataset2.txt", row.name=FALSE)

######## The second set of grouped data can be found in the object final_data2

