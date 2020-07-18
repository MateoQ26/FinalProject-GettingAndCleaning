# FinalProject-GettingAndCleaning

Presentation by Andres Mateo Quevedo / Bogotá, Colombia.

Project to obtain, analyze and clean a data set [1]

- Data set for analysis:

Experimentation of human activity using smartphones

- Records:

*** CodeBook.md
Codebook that describes the variables, and the data used for the analysis of the data set.

*** run_analysis.R
The scrip that parses the dataset, from downloading to cleaning and building an ordered dataset:


1- Download and unzip the data set.

2- Merge the 'training' and 'test' sets.

3- Extract the measurements from the mean and standard deviation for each measurement.

4- Rename the activities with descriptive labels in the new data set

5- Create a second data set ordered with the average of each variable for each activity and each subject.


TidyDataset.txt is the final exported data after parsing and cleaning.



[1]
Human Activity Recognition Using Smartphones Dataset
Version 1.0

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
