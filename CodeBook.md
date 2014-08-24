Code Book
========================================================

## Source of Data
The original data are obtained from UCI Machine Learning reporsitory, [UCI Machine Learning Smartphone Data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Data Description
Please refer to the original data set with the README.txt and features.txt files to learn more abou the data set.

The data set was built from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

- The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## Data transformation
The raw data are processed with run_analysis.R script to create a tidy data set.

The "tidy data.txt"contains the following information:
* 6 activity (activity_ID): WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* SubjectID: an identifier for the 30 volunteers.
* 66 variables to indicate the estimated variables for the signal pattern.
* -X, -Y, -Z denote 3-axial signals in the X, Y and Z directions.


Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
