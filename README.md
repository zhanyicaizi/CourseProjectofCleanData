# How run_analysis.R works

* 1. Load packages,Read data,rename variables,cblind
    Load dplyr packages first.
    The scripts first read data from X_train,y_train, Subject_train, X_test,y_test, Subject_test. 
    Then, the varibles of Y_train and Y_test were renames as "Trainactivity" and "Testactivity", since the levels of of these two varibles are range from 1 to 6. 
    After renameing, the three table form training files were combined to a new table called "training" by using cblind function.The three table form test files were combined to a new table called "test" by using cblind function.

* 2.  Merge training and test into data1
    The two table, training and test were merged on "Trainactivity" and "Testactivity". The reuslt were assigned to a new table called "data1".

* 3. Extracts mean and st.d of each measurement in dta1
    the measure of mean and std on each measurement were extracted by using select funtion in dplyr package. The reuslt were stored in a new table called "dataex"

* 4. Rename activities with decriptive activity names
    First a new table called "data_recode" was created by assgining dataex to it. Then the value of "Trainactitivity" were transformed from int to factor. Then, the levels of data_recode were transformed to c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"). 

* 5. Label dataex with descriptive variable names
    The variable names of dataex were set as descriptive by using rename function. The results were store in a new talbe called "data_renamed".

* 6. Adding mean of each variable for each subject and activity
    After renameing the first two varibles of data_renamed and save it as data_renamed2, two tables ("activitymean" and "subjectmean") were created by using aggregate function which caulated the mean of each variables on each activity (activitymean) and each subject (subjectmean). The name of the first varible of each table were assgined as "ASMean".And the value of ASMean of subjectmean were transfomred to factors.
    The two new tables then combined into a new talbe called data2 by using rbind function. And data3 selected the varibales expect subject and activity in data2, and the frist varible name was changed from "ASMean" to "AorS". The write.table function output the data3 as a txt file in the working directory.
