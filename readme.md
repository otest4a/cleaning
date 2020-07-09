download the file from url 
'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'

then unzip 
to the folder c:/homework/cleaningdata/UCI HAR Dataset.zip

read file into table X_train.txt, Y_train.txt, X_test.txt, Y_test.txt, subject_test.text, subject_train.txt

#1
bind the table train and test into data2

#2
use grep to local word mean and std
and store into data3

#3 update data3$activity with activity information

#4 keyword replace

#5 write table to tidydata.txt
