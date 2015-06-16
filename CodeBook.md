#Getting-and-Cleaning-Data-Course-Project/CodeBook.md

You will be required to submit a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md

Was code book submitted to GitHub that modifies and updates the codebooks available to you with the data to indicate all the variables and summaries you calculated, along with units, and any other relevant information?

==============================================================================================================

This document will describe the resulting tidy_data_set.txt which is the final output when running run_analysis.R

The source data was a collection of measurements gathered from a set of 30 volunteers. Each person performed six activities. For more details about how the source data was obtained, please go to: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The resulting data is a summarized subset of the source data. In it for each subject and activity we will have the average of all observations in the source data, but only for the measurements that corresponded to a mean or standard deviation. For more details about how the source data was processed to obtain the resulting data, please go to README.md


The following will describe the columns in the resulting data:

subject - will contain a number identifying the subject who carried out the experiment

activity_names - will contain a text describing the activity that was carried out

The rest of the columns are named using the following notation:
    - The domain of the signal, if the observations correspond to time domain signals (prefix 't' to denote time), or if they are frequency domain signals (prefix 'f' to denote frequency).
    
    - The type of signal
              BodyAcc
              GravityAcc
              BodyAccJerk
              BodyGyro
              BodyGyroJerk
              BodyAccMag
              GravityAccMag
              BodyAccJerkMag
              BodyGyroMag
              BodyGyroJerkMag
    
    - The estimations performed previously for the source data
              mean(): Mean value
              std(): Standard deviation
              meanFreq(): Weighted average of the frequency components to obtain a mean frequency
    
    - The direction or axial, 'X', 'Y', or 'Z'
