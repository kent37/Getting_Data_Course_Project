## About the data set

This data set is based on the _Human Activity Recognition Using Smartphones Data Set_  (HAR) available from the [UCI Machine Learning Archive](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). For details on the collection and meaning of the original data, please see the `README.txt` file that accompanies the HAR data.

For each _mean_ and _standard deviation_ measurement in the original data set, this data contains aggregate means for every unique combination of subject and activity . Means were taken across the training and test sets. Data in the `Inertial Signals` folders is not included because this is the raw data from which the training and test data is derived.

Mean and standard deviation measurements in the original data are those containing 'mean' and 'std' in the variable names as given in the `features.txt` file in the original data. 'angle' features with 'Mean' in the name are not included, as these features are derived from means and are not themselves means.

### Files included

- README.md - this file
- CodeBook.md - description of the columns of the data set
- AverageMeanStd.txt - tab-separated data table

### Description of the data

The data contains one row for each subject and activity combination and one column for each measurement. The data is _tidy_ in the sense of Hadley Wickham's [Tidy Data](http://vita.had.co.nz/papers/tidy-data.pdf) paper:

1. Each variable forms a column. The first two columns are identifying varibles; subsequent columns are the measured and processed variables.
2. Each observation forms a row. There is one row for each combination of subject and activity.
3. Each type of observational unit forms a table.

Details of the data columns may be found in `CodeBook.md`.

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

