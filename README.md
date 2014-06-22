## About the data set

This data set is based on the _Human Activity Recognition Using Smartphones Data Set_  (HAR) available from the [UCI Machine Learning Archive](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). For details on the collection and meaning of the original data, please see the `README.txt` file that accompanies the HAR data.

For each mean and standard deviation measurement in the original data set, this data contains aggregate means for every unique combination of subject and activity. See `CodeBook.md` for details.

### Files included

- `README.md` - this file
- `CodeBook.md` - description of the columns of the data set
- `AverageMeanStd.txt` - tab-separated data table
- `run_analysis.R` - R script which creates `AverageMeanStd.txt`.

### Running the script

- The included script requires the `plyr` package; it may be installed with the R command `install.packages("plyr")`. 
- Data may be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
- Place the zip file into the same directory as the script.
- Run the script to re-create the data file.
