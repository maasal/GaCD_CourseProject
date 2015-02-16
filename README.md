## README 

##How the scripts work and are connected
* run_analysis first reads different *.txt files to memory
* then joins them to a single data frame for both train and test data
* after which the data is factorized and named appropriately
* means and standard deviations of the accelometer variables are calculated to measurement_summary
* mean for variables are calculated by subject and actions to form neatData2 dataframe
* Finally a CourseProjectOutput.txt file is written to disk that contains neatData2.

