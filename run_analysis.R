run_analysis <- function () {
  if(!file.exists("getdata-projectfiles-UCI HAR Dataset.zip")){
    fileURL="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, destfile="getdata-projectfiles-UCI HAR Dataset.zip")
    
    fileConn<-file("getdata-projectfiles-UCI HAR Dataset_download_info.txt")
    writeLines(c("fileURL:",fileURL,"timestamp:",date()), fileConn)
    
    close(fileConn)
  }
  
  unzip("getdata-projectfiles-UCI HAR Dataset.zip")
    
  ## subject -> who performed 
  test_subject_test<-(read.table("./UCI HAR Dataset/test/subject_test.txt"))
  train_subject_train<-(read.table("./UCI HAR Dataset/train/subject_train.txt"))
    
  ## X test -> features
  test_X_test<-(read.table("./UCI HAR Dataset/test/X_test.txt"))
  train_X_train<-(read.table("./UCI HAR Dataset/train/X_train.txt"))
    
  ## y test -> activity
  test_y_test<-(read.table("./UCI HAR Dataset/test/y_test.txt"))
  train_y_train<-(read.table("./UCI HAR Dataset/train/y_train.txt"))
    
  ## join each set of data frames
  result_subject<-rbind(train_subject_train,test_subject_test)
  result_X<-rbind(train_X_train,test_X_test)
  result_y<-rbind(train_y_train,test_y_test)
    
  ## rename columns
  features<-(read.table("./UCI HAR Dataset/features.txt"))
  ##names<-unlist(features[2])
  colnames(train_subject_train)<-"subject"
  colnames(result_X)<-unlist(features[2])
  colnames(train_y_train)<-"y"
    
  ## create result data frame that will gather all others
  result<-result_X
    
  ## subset of columns (features) to keep
  feature_vector<-as.vector(unlist(features[2]))
  result_cols<-grepl("mean()|std()", feature_vector)
  result<-subset(result, select=grepl("mean()|std()", feature_vector))
    
  ## add activity and subject
  result$y<-as.vector(unlist(result_y))
  result$subject<-as.vector(unlist(result_subject))
  
  ## activity names
  activities<-(read.table("./UCI HAR Dataset/activity_labels.txt"))
  for (a in 1:length(activities$V2)) {
      result$activity_names[result$y==a]<-toString(activities$V2[a])
  }
  
  ## remove y column (activity)
  result<-result[, !(colnames(result) %in% c("y"))]
  
  ## create second data set with average of each variable for each activity and each subject
  tidy_data_set<-as.data.frame(result %>% group_by(activity_names,subject) %>% summarise_each(funs(mean)))
    
  ## print(colnames(result))
  print(head(tidy_data_set))
  
  ##txt file created with tidy data 
  write.table(tidy_data_set, "tidy_data_set.txt", sep="\t", row.name=FALSE)
}
