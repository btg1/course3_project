#CodeBook.md

Data processing by run_analysis.R script

The measurements from the test and training subjects are combined in to obtain a single data set. Appropriate column headers are added to the data and information regarding the subjects  and the activity for which the measurement was obtained are added.

The data is checked to ensure that are no missing values for any of the fields and that the values are within expected / stated range.

The data corresponding to the mean value and standard deviation for each of the measurements recorded is extracted as a subset.The mean and standard deviation  of each of these measurements for each subject for each activity is calculated  and the final tidy dataset has the following measurements:

==========================
Col#      |      ColName                
==========================
        1   |   train_test   
        2   |   subject   
        3   |   activity_name   
        4   |   tBodyAccMeanX_mean   
        5   |   tBodyAccMeanY_mean   
        6   |   tBodyAccMeanZ_mean   
        7   |   tBodyAccSTDX_mean   
        8   |   tBodyAccSTDY_mean   
        9   |   tBodyAccSTDZ_mean   
       10   |   tGravityAccMeanX_mean   
       11   |   tGravityAccMeanY_mean   
       12   |   tGravityAccMeanZ_mean   
       13   |   tGravityAccSTDX_mean   
       14   |   tGravityAccSTDY_mean   
       15   |   tGravityAccSTDZ_mean   
       16   |   tBodyAccJerkMeanX_mean   
       17   |   tBodyAccJerkMeanY_mean   
       18   |   tBodyAccJerkMeanZ_mean   
       19   |   tBodyAccJerkSTDX_mean   
       20   |   tBodyAccJerkSTDY_mean   
       21   |   tBodyAccJerkSTDZ_mean   
       22   |   tBodyGyroMeanX_mean   
       23   |   tBodyGyroMeanY_mean   
       24   |   tBodyGyroMeanZ_mean   
       25   |   tBodyGyroSTDX_mean   
       26   |   tBodyGyroSTDY_mean   
       27   |   tBodyGyroSTDZ_mean   
       28   |   tBodyGyroJerkMeanX_mean   
       29   |   tBodyGyroJerkMeanY_mean   
       30   |   tBodyGyroJerkMeanZ_mean   
       31   |   tBodyGyroJerkSTDX_mean   
       32   |   tBodyGyroJerkSTDY_mean   
       33   |   tBodyGyroJerkSTDZ_mean   
       34   |   tBodyAccMagMean_mean   
       35   |   tBodyAccMagSTD_mean   
       36   |   tGravityAccMagMean_mean   
       37   |   tGravityAccMagSTD_mean   
       38   |   tBodyAccJerkMagMean_mean   
       39   |   tBodyAccJerkMagSTD_mean   
       40   |   tBodyGyroMagMean_mean   
       41   |   tBodyGyroMagSTD_mean   
       42   |   tBodyGyroJerkMagMean_mean   
       43   |   tBodyGyroJerkMagSTD_mean   
       44   |   fBodyAccMeanX_mean   
       45   |   fBodyAccMeanY_mean   
       46   |   fBodyAccMeanZ_mean   
       47   |   fBodyAccSTDX_mean   
       48   |   fBodyAccSTDY_mean   
       49   |   fBodyAccSTDZ_mean   
       50   |   fBodyAccJerkMeanX_mean   
       51   |   fBodyAccJerkMeanY_mean   
       52   |   fBodyAccJerkMeanZ_mean   
       53   |   fBodyAccJerkSTDX_mean   
       54   |   fBodyAccJerkSTDY_mean   
       55   |   fBodyAccJerkSTDZ_mean   
       56   |   fBodyGyroMeanX_mean   
       57   |   fBodyGyroMeanY_mean   
       58   |   fBodyGyroMeanZ_mean   
       59   |   fBodyGyroSTDX_mean   
       60   |   fBodyGyroSTDY_mean   
       61   |   fBodyGyroSTDZ_mean   
       62   |   fBodyAccMagMean_mean   
       63   |   fBodyAccMagSTD_mean   
       64   |   fBodyBodyAccJerkMagMean_mean   
       65   |   fBodyBodyAccJerkMagSTD_mean   
       66   |   fBodyBodyGyroMagMean_mean   
       67   |   fBodyBodyGyroMagSTD_mean   
       68   |   fBodyBodyGyroJerkMagMean_mean   
       69   |   fBodyBodyGyroJerkMagSTD_mean   
       70   |   tBodyAccMeanX_sd   
       71   |   tBodyAccMeanY_sd   
       72   |   tBodyAccMeanZ_sd   
       73   |   tBodyAccSTDX_sd   
       74   |   tBodyAccSTDY_sd   
       75   |   tBodyAccSTDZ_sd   
       76   |   tGravityAccMeanX_sd   
       77   |   tGravityAccMeanY_sd   
       78   |   tGravityAccMeanZ_sd   
       79   |   tGravityAccSTDX_sd   
       80   |   tGravityAccSTDY_sd   
       81   |   tGravityAccSTDZ_sd   
       82   |   tBodyAccJerkMeanX_sd   
       83   |   tBodyAccJerkMeanY_sd   
       84   |   tBodyAccJerkMeanZ_sd   
       85   |   tBodyAccJerkSTDX_sd   
       86   |   tBodyAccJerkSTDY_sd   
       87   |   tBodyAccJerkSTDZ_sd   
       88   |   tBodyGyroMeanX_sd   
       89   |   tBodyGyroMeanY_sd   
       90   |   tBodyGyroMeanZ_sd   
       91   |   tBodyGyroSTDX_sd   
       92   |   tBodyGyroSTDY_sd   
       93   |   tBodyGyroSTDZ_sd   
       94   |   tBodyGyroJerkMeanX_sd   
       95   |   tBodyGyroJerkMeanY_sd   
       96   |   tBodyGyroJerkMeanZ_sd   
       97   |   tBodyGyroJerkSTDX_sd   
       98   |   tBodyGyroJerkSTDY_sd   
       99   |   tBodyGyroJerkSTDZ_sd   
      100   |   tBodyAccMagMean_sd   
      101   |   tBodyAccMagSTD_sd   
      102   |   tGravityAccMagMean_sd   
      103   |   tGravityAccMagSTD_sd   
      104   |   tBodyAccJerkMagMean_sd   
      105   |   tBodyAccJerkMagSTD_sd   
      106   |   tBodyGyroMagMean_sd   
      107   |   tBodyGyroMagSTD_sd   
      108   |   tBodyGyroJerkMagMean_sd   
      109   |   tBodyGyroJerkMagSTD_sd   
      110   |   fBodyAccMeanX_sd   
      111   |   fBodyAccMeanY_sd   
      112   |   fBodyAccMeanZ_sd   
      113   |   fBodyAccSTDX_sd   
      114   |   fBodyAccSTDY_sd   
      115   |   fBodyAccSTDZ_sd   
      116   |   fBodyAccJerkMeanX_sd   
      117   |   fBodyAccJerkMeanY_sd   
      118   |   fBodyAccJerkMeanZ_sd   
      119   |   fBodyAccJerkSTDX_sd   
      120   |   fBodyAccJerkSTDY_sd   
      121   |   fBodyAccJerkSTDZ_sd   
      122   |   fBodyGyroMeanX_sd   
      123   |   fBodyGyroMeanY_sd   
      124   |   fBodyGyroMeanZ_sd   
      125   |   fBodyGyroSTDX_sd   
      126   |   fBodyGyroSTDY_sd   
      127   |   fBodyGyroSTDZ_sd   
      128   |   fBodyAccMagMean_sd   
      129   |   fBodyAccMagSTD_sd   
      130   |   fBodyBodyAccJerkMagMean_sd   
      131   |   fBodyBodyAccJerkMagSTD_sd   
      132   |   fBodyBodyGyroMagMean_sd   
      133   |   fBodyBodyGyroMagSTD_sd   
      134   |   fBodyBodyGyroJerkMagMean_sd   
      135   |   fBodyBodyGyroJerkMagSTD_sd   
==========================================

- test_train: indicates of the subject is from the test or train set
- subject: the subject identifier (between 1-30)
- activity_name: can be LAYING,SITTING,STANDING,WALKING,WALKING_DOWNSTAIRS or WALKING_UPSTAIRS
- columns 4:135 are between -1 and +1, _mean : indicates mean value calcuated, _sd : indicates standard deviation calculated

