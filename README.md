## About the data set

This data set is based on the _Human Activity Recognition Using Smartphones Data Set_ available from the [UCI Machine Learning Archive](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

For each _mean_and _standard deviation_ measurement in the original data set, this data contains per subject / per activity means. Means are taken across the training and test sets. Data in the `Inertial Signals` folders is not included because this is the raw data from which the training and test data is derived.

Mean and standard deviation measurements are those containing 'mean' and 'std' in the variable names as given in the `features.txt` file in the original data. 'angle' features with 'mean' in the name are not included, as these features are derived from means and are not themselves means.

The data contains one row for each subject and activity combination and one column for each measurement. The data is _tidy_ in the sense of Hadley Wickham's [Tidy Data](http://vita.had.co.nz/papers/tidy-data.pdf) paper:

1. Each variable forms a column. The first two columns are identifying varibles; subsequent columns are the measured variables.
2. Each observation forms a row.
3. Each type of observational unit forms a table

The data from Machine Learing Archive was processed as follows:

- The `X_train` and `X_test` tables were read and combined into a single table `X`.
- The `y_train` and `y_test` tables were read and combined into a single table `y`.
- The `subject_train` and `subject_test` tables were read and combined into a single table `subject`.
