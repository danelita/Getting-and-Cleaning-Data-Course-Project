# Getting-and-Cleaning-Data-Course-Project/README.md

=================================================================================
Here you will find details about how the run_analysis.R script works.

Once the run_analysis.R script has been compiled, you will call it's main function run_analysis(). Please note that this funtion does not require any arguments.

The script will initially check for the file "getdata-projectfiles-UCI HAR Dataset.zip" in the current working directory. If this is not found it will download it from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", and will also write the file "project_data_download_info.txt" with details about the downloaded data.

Afterwards we move on to unzipping the dataset zip file and begin reading both test and train data for the subject, X, and y datasets.

Then the script will go on to merging the test and train data for each of the subject, X, and y datasets. 

The next step will be to rename the columns in the data sets. For this we will need to read "features.txt" which contains the variable names for the X data set, for both subject and y data sets we will name them "subject" and "y", which is descriptive of the single variables they each contain.

Then we obtain a subset from the X data set which will only be the columns for whcih the variable is a mean() or std() measurement. In order to do so, we will simply look at the variables names for the X data set, with these names we can distinguish which measurements fit the selection criteria. To the resulting X subset we will add both the y and subject datasets. And then we will create another column calles "activity names" that will contain a textual description of each of the activities that are in the y column (from our y dataset). Once we obtain the textual description for the activities, we will drop the y column from our data set as this is no longer needed.

With the resulting dataset from the previous steps we will create our final tidy data set, to do so we will summarise by getting the mean each of the variables for each by activity and subject. Then, finally, this tidy data set will be written out to the "tidy_data_set.txt" file.





