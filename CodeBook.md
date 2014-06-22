## Code book

This data set is based on the _Human Activity Recognition Using Smartphones Data Set_  (HAR) available from the [UCI Machine Learning Archive](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The subject numbers, activity names and variable names from the HAR data have been preserved here. For details on the meaning and derivation of the activities and features please see the `README.txt` and `features_info.txt` files accompanying the HAR data.

For each mean and standard deviation measurement in the original data set, this data contains aggregate means for every unique combination of subject and activity. The data contains 180 rows (6 activities for each of 30 subjects) and 81 columns (subject, activity and the means of 79 measured variables).

Means were taken across the training and test sets. Data in the `Inertial Signals` folders is not included because it is the raw data from which the training and test data is derived.

Mean and standard deviation measurements in the original data are those containing 'mean' and 'std' in the variable names as given in the `features.txt` file in the original data. 'angle' features with 'Mean' in the name are not included, as these features are derived from means and are not themselves means. 'meanFreq' measurements _are_ included.

### Description of the data

The data contains one row for each subject and activity combination and one column for each measurement. The data is _tidy_ in the sense of Hadley Wickham's [Tidy Data](http://vita.had.co.nz/papers/tidy-data.pdf) paper:

1. Each variable forms a column. The first two columns are identifying varibles; subsequent columns are the measured and processed variables.
2. Each observation forms a row. There is one row for each combination of subject and activity.
3. Each type of observational unit forms a table.

#### Subject column

The `subject` column contains the subject numbers from the original study.

#### Activity column

The `activity` column contains the name of the activity. The six activities are LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS. 

#### Measurement columns

The remaining 79 columns contain the means of the 79 mean and standard deviation measurements in the HAR data. The variable names from the HAR data have been preserved so they may easily be related to the HAR data and documentation. For details on the meaning of the individual variables, please refer to the `features_info.txt` file in the HAR distribution.

The 79 variables included in the data set are listed below.
```
tBodyAcc-mean()-X               tBodyAcc-mean()-Y               tBodyAcc-mean()-Z              
tBodyAcc-std()-X                tBodyAcc-std()-Y                tBodyAcc-std()-Z               
tGravityAcc-mean()-X            tGravityAcc-mean()-Y            tGravityAcc-mean()-Z           
tGravityAcc-std()-X             tGravityAcc-std()-Y             tGravityAcc-std()-Z            
tBodyAccJerk-mean()-X           tBodyAccJerk-mean()-Y           tBodyAccJerk-mean()-Z          
tBodyAccJerk-std()-X            tBodyAccJerk-std()-Y            tBodyAccJerk-std()-Z           
tBodyGyro-mean()-X              tBodyGyro-mean()-Y              tBodyGyro-mean()-Z             
tBodyGyro-std()-X               tBodyGyro-std()-Y               tBodyGyro-std()-Z              
tBodyGyroJerk-mean()-X          tBodyGyroJerk-mean()-Y          tBodyGyroJerk-mean()-Z         
tBodyGyroJerk-std()-X           tBodyGyroJerk-std()-Y           tBodyGyroJerk-std()-Z          
tBodyAccMag-mean()              tBodyAccMag-std()               tGravityAccMag-mean()          
tGravityAccMag-std()            tBodyAccJerkMag-mean()          tBodyAccJerkMag-std()          
tBodyGyroMag-mean()             tBodyGyroMag-std()              tBodyGyroJerkMag-mean()        
tBodyGyroJerkMag-std()          fBodyAcc-mean()-X               fBodyAcc-mean()-Y              
fBodyAcc-mean()-Z               fBodyAcc-std()-X                fBodyAcc-std()-Y               
fBodyAcc-std()-Z                fBodyAcc-meanFreq()-X           fBodyAcc-meanFreq()-Y          
fBodyAcc-meanFreq()-Z           fBodyAccJerk-mean()-X           fBodyAccJerk-mean()-Y          
fBodyAccJerk-mean()-Z           fBodyAccJerk-std()-X            fBodyAccJerk-std()-Y           
fBodyAccJerk-std()-Z            fBodyAccJerk-meanFreq()-X       fBodyAccJerk-meanFreq()-Y      
fBodyAccJerk-meanFreq()-Z       fBodyGyro-mean()-X              fBodyGyro-mean()-Y             
fBodyGyro-mean()-Z              fBodyGyro-std()-X               fBodyGyro-std()-Y              
fBodyGyro-std()-Z               fBodyGyro-meanFreq()-X          fBodyGyro-meanFreq()-Y         
fBodyGyro-meanFreq()-Z          fBodyAccMag-mean()              fBodyAccMag-std()              
fBodyAccMag-meanFreq()          fBodyBodyAccJerkMag-mean()      fBodyBodyAccJerkMag-std()      
fBodyBodyAccJerkMag-meanFreq()  fBodyBodyGyroMag-mean()         fBodyBodyGyroMag-std()         
fBodyBodyGyroMag-meanFreq()     fBodyBodyGyroJerkMag-mean()     fBodyBodyGyroJerkMag-std()     
fBodyBodyGyroJerkMag-meanFreq()
```
### Data processing

The HAR data from the Machine Learning Archive was processed as follows:

- The `X_train.txt` and `X_test.txt` tables were read and combined into a single table `X`.
- The `y_train` and `y_test.txt` tables were read and combined into a single table `y`.
- The `subject_train.txt` and `subject_test.txt` tables were read and combined into a single table `subject`.
- The HAR `features.txt` file was read and searched for feature names containing `mean` or `std` (case sensitive).
- The columns of the `X` matrix were subsetted to include only the `mean` and `std` features.
- The HAR `activity_labels.txt` file was read and used to convert the numeric activity labels in the `y` data to meaningful names.
- The `subject`, `activity` and `X` (measured features) tables were combined into a single data frame.
- Per subject and activity means were computed to create the reduced data set.
- The reduced data was written to `AverageMeanStd.txt`.
