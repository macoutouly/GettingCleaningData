run_analysis<-function(directory){
    #You should create one R script called run_analysis.R that does the following. 
    
    #1-Merges the training and the test sets to create one data set.
    #2-Extracts only the measurements on the mean and standard deviation for each measurement. 
    #3-Uses descriptive activity names to name the activities in the data set
    #4-Appropriately labels the data set with descriptive variable names. 
    #5-Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
    
    #Get paths to files of interest
    file_Xtest<-file.path(".",directory,"test","X_test.txt")
    file_Ytest<-file.path(".",directory,"test","Y_test.txt")
    file_Subjecttest<-file.path(".",directory,"test","subject_test.txt")
    
    file_Xtrain<-file.path(".",directory,"train","X_train.txt")
    file_Ytrain<-file.path(".",directory,"train","Y_train.txt")
    file_Subjecttrain<-file.path(".",directory,"train","subject_train.txt")
    
    file_Features<-file.path(".",directory,"features.txt")
    file_activities<-file.path(".",directory,"activity_labels.txt")
    #Read all files
    read.table(file_Subjecttrain) ->subjecttrain
    read.table(file_Xtrain) -> xtrain
    read.table(file_Ytrain) -> ytrain
    
    read.table(file_Subjecttest) ->subjecttest
    read.table(file_Xtest) -> xtest
    read.table(file_Ytest) -> ytest
    
    read.table(file_activities)-> activities
    #Put column names and bind data
    names(activities) =c("ActivityID","ActivityName")
    
    data_subject<-rbind(subjecttest,subjecttrain)
    names(data_subject) =c("Subject")
    data_test<-cbind(xtest,ytest)
    data_train<-cbind(xtrain,ytrain)
    activity<-rbind(ytest,ytrain)
    names(activity) =c("Activity")
    data_set<-rbind(xtest,xtrain)
    
    labels<-merge(activities,activity,by.x="ActivityID",by.y=1)
    Activity = labels[,2]
    
    #extracting mean and standard Dev for each measurement
    features<-read.table(file_Features)
    names(data_set) = (features[,2])
   
    index_mean_std <- grep("mean|std",features[,2])
    data_mean_std = data_set[,index_mean_std]
    
    mean_std_data <-cbind(data_subject,data_mean_std,Activity)
    
    library(reshape2)
    molten <- melt(mean_std_data, id = c("Activity", "Subject"))
    
    tidy <- dcast(molten, Activity + Subject ~ variable, mean)
    file_tidy<-file.path(".",directory,"tidy_data.csv")
    write.csv(tidy,file=file_tidy)
}