#source("run_analysis.R")
#clean up
rm(list=ls())
#load libraries
library(dplyr)
#check if input data files exists - else download the files from given URL
fileURL="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("./UCI HAR Dataset")){download.file(fileURL,destfile="./UCI HAR Dataset.zip", method="curl"); unzip ("UCI HAR Dataset.zip", exdir = "./")}

#Assuming that the files are now available for use..
#features.txt - has the column names for data in X_test.txt and X_train.txt 
feature_path<-"./UCI HAR Dataset/features.txt"
#acitivity_labels has the labels for the acitivities
activity_path<-"./UCI HAR Dataset/activity_labels.txt"
#data files
test_X_path<-"./UCI HAR Dataset/test/X_test.txt"
train_X_path<-"./UCI HAR Dataset/train/X_train.txt"
#activity names
test_Y_path<-"./UCI HAR Dataset/test/Y_test.txt"
train_Y_path<-"./UCI HAR Dataset/train/Y_train.txt"
#subject identifiers
test_S_path<-"./UCI HAR Dataset/test/subject_test.txt"
train_S_path<-"./UCI HAR Dataset/train/subject_train.txt"

#read features.txt 
col_header<-read.table(feature_path,header = FALSE, sep = "", quote = "\"'")
#read activities table, cassign column names
activities<-read.table(activity_path,header = FALSE, sep = "", quote = "\"'")
names(activities)<-c("activity","activity_name")

#process test data
#read test data file
test_X<-read.table(test_X_path,header = FALSE, sep = "", quote = "\"'")
#set the column names
names(test_X)<-col_header$V2
#sanity check to make sure that the data doesn't contain NAs and that the values are within range
#all(colSums(is.na(test_X))==0)
#all(colSums(test_X > 1 | test_X < -1)==0)
#read test subject data
test_S<-read.table(test_S_path,header = FALSE, sep = "", quote = "\"'")
#read test acitvity data and assign column header
test_Y<-read.table(test_Y_path,header = FALSE, sep = "", quote = "\"'")
names(test_Y)<-c("activity")
#add activity labels
test_Y=left_join(test_Y,activities,by="activity")
#add activity name and label to test data
test_X<-cbind(activity=test_Y$activity,test_X)
test_X<-cbind(activity_name=test_Y$activity_name,test_X)
#add subject identifier to test data 
#subject identifier will be the firt column of the dataframe
test_X<-cbind(subject=test_S$V1,test_X)

#process train data
#read train data file
train_X<-read.table(train_X_path,header = FALSE, sep = "", quote = "\"'")
#set column names
names(train_X)<-col_header$V2
#sanity check - as done for the test data
#all(colSums(is.na(train_X))==0)
#all(colSums(train_X > 1 | train_X < -1)==0)
##read train subject data
train_S<-read.table(train_S_path,header = FALSE, sep = "", quote = "\"'")
#read train acitvity data and assign column header
train_Y<-read.table(train_Y_path,header = FALSE, sep = "", quote = "\"'")
names(train_Y)<-c("activity")
#add activity labels
train_Y=left_join(train_Y,activities,by="activity")
#add activity name and label to train data
train_X<-cbind(activity=train_Y$activity,train_X)
train_X<-cbind(activity_name=train_Y$activity_name,train_X)
#add subject identifier to train data 
#subject identifier will be the firt column of the dataframe
train_X<-cbind(subject=train_S$V1,train_X)

#sanity check - make sure that the column names of test and train data matches
#all(names(test_X)==names(train_X))

#append test and train data
all=rbind(test_X,train_X)
#based on the subject identifier, assign if it belongs to the test or train set 
all<-cbind(train_test=ifelse(all$subject %in% unique(train_X$subject),"TRAIN","TEST"),all)
#extract subset of required columns - mean and sd for each measurement
all_mean_std<-all[,grep("mean\\(|std\\(|activity_name|subject|train_test",colnames(all))]
#rename columns getting rid of special characters
names(all_mean_std) <- sub("-mean\\(\\)-", "Mean", names(all_mean_std))
names(all_mean_std) <- sub("-std\\(\\)-", "STD", names(all_mean_std))
names(all_mean_std) <- sub("-mean\\(\\)", "Mean", names(all_mean_std))
names(all_mean_std) <- sub("-std\\(\\)", "STD", names(all_mean_std))

#summarize dataset - group datasets by train/test status, subject identifer and activity name
all_mean_std_tidy <- all_mean_std %>% group_by(train_test,subject,activity_name) %>% summarise_each(funs(mean,sd))
#output the summarsized data using write.table
write.table(all_mean_std_tidy,file="all_mean_std_tidy.txt",sep="\t",row.name=FALSE,quote=FALSE)
