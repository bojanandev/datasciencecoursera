## Getting and cleaning data assingment
datasciencecoursera
===================

Repository for Data Science Specialization from Johns Hopkins on Coursera

Explanation of the Getting and Cleaning Data project assignment

The first step is to download and unzip the file from the location.
Second step is to acquire the training and test datasets from the respective location

After getting all the datasets we are merging them with rbind()

Then we extract the features from the features.txt file
Using grepl() for the keywords "std" and "mean" we clean
the features data set to identify only those we need.

After finding the features we clean the merged dataset to
use only this columns.

Then we use the activity_labels.txt merged with the test and train label files
to identify the acivity labels for the referencing rows.

We then extract the labels from the features the we got earlier and set them
as column names for the respective data set.

Unfortunately I had some problems combined with a lack of time for the last task :(
