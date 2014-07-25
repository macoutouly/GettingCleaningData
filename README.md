#Getting and Cleaning Data's source project

## Objective

You should create one R script called run_analysis.R that does the following. 

    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names. 
    5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Input

Data are coming from wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Preparation

Once you have created your work directory and downloaded the data. 
Please unzip the **getdata_projectfiles_Dataset.zip**. You will get a **UCI HAR Dataset** folder. 

Copy the run_analysis.R file in your work directory. 

You should have this architecture:

    Work_directory\
            run_analysis.R
            UCI HAR Dataset\
                    activity_labels.txt
                    features_info.txt
                    features.txt
                    README.txt
                    test\
                    train\

## Usage

Open a R/Rstudio console
set your working directory to Work_directory.

type :  **source(run_analysis.R)**
        **run_analysis("UCI HAR Dataset")**
        
## Output

After a few minutes, you will have a new file showing up in Work_directory **tidy_data.csv**  .

In that file you will find a table .

In the first column you have the activity 
In the second column you have the subject 
The other columns are presenting the average value for the measurement.


        