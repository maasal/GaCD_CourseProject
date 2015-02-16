##Code Book

###Variables
More detailed discription of most variables is included in the data .zip-file
* subject is a list of individuals from 1 to 30
* action is 1 to 6, (Walking, walking up/down, sitting, standing, laying)
* A detailed description of the over 560 variables on Samsung accelerometer documentation:"- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables."

###Data
Data is for 30 individuals for 6 actions with detailed information from the accelometer from a wearable apparatus. Data is combined from a test data and train data. Data for variables of the accelerometer is normalized to between -1 and 1.


###Transformations and editions
For both train and test data the accelometer data is read. The action factors,
 subject identifications and actions are read. These data are combined to neatData. Means and standard deviations of the variables are calculated to measurement_summary. For each subject and each action a dataframe of means of the variables is formed to neatData2. Finally a CourseProjectOutput.txt file is written to disk that contains neatData2.
 
