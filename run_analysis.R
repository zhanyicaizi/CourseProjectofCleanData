## load dplyr packages
library(dplyr)
## Merge training and test into data1

## read train data and combine into training
X_train<-read.table("UCI HAR Dataset/train/X_train.txt")
Y_train<-read.table("UCI HAR Dataset/train/y_train.txt")
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt")
subject_train_rename<-rename(subject_train,Trainsubject=V1)
Y_train_rename<-rename(Y_train,Trainactivity=V1)
training<-cbind(subject_train_rename,Y_train_rename,X_train)

## read test data and combine into test
X_test<-read.table("UCI HAR Dataset/test/X_test.txt")
Y_test<-read.table("UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt")
subject_test_rename<-rename(subject_test,Testsubject=V1)
Y_test_rename<-rename(Y_test,Testactivity=V1)
test<-cbind(subject_test_rename,Y_test_rename,X_test)

## merge training and test on activity and store in data1
data1<-inner_join(training,test,by=c("Trainactivity"="Testactivity"))

##Extracts mean and st.d of each measurement from data1 into dataex
dataex<-select(data1,Trainsubject,Trainactivity,
               V1.x:V6.x, V41.x:V46.x, V81.x:V86.x,V121.x:V126.x,
               V161.x:V166.x,V201.x:V202.x, V215.x:V214.x,V227.x:V228.x,
               V240.x:V241.x,V253.x:V254.x,V266.x:V271.x,V345.x:V350.x,
               V424.x:V429.x,V503.x:V504.x,V516.x:V517.x,V529.x:V530.x,
               V542.x:V543.x,
               V1.y:V6.y, V41.y:V46.y, V81.y:V86.y,V121.y:V126.y,
               V161.y:V166.y,V201.y:V202.y, V215.y:V214.y,V227.y:V228.y,
               V240.y:V241.y,V253.y:V254.y,V266.y:V271.y,V345.y:V350.y,
               V424.y:V429.y,V503.y:V504.y,V516.y:V517.y,V529.y:V530.y,
               V542.y:V543.y
               )

## Rename activities with decriptive activity names
data_recode<-dataex
data_recode$Trainactivity<-as.factor(data_recode$Trainactivity)
levels(data_recode$Trainactivity)<-c("WALKING",
                                "WALKING_UPSTAIRS",
                                "WALKING_DOWNSTAIRS",
                                "SITTING",
                                "STANDING",
                                "LAYING")


## Label dataex with descriptive variable names and sotre the result into data_renamed
data_renamed<-rename(data_recode,
                     TraintBodyAccMeanX=V1.x,TraintBodyAccMeanY=V2.x,TraintBodyAccMeanZ=V3.x,
                     TraintBodyAccStdX=V4.x,TraintBodyAccStdY=V5.x,TraintBodyAccStdZ=V6.x,
                     TraintGravAccMeanX=V41.x,TraintGravAccMeanY=V42.x,TraintGravAccMeanZ=V43.x,
                     TraintGravAccStdX=V44.x,TraintGravAccStdY=V45.x,TraintGravAccStdZ=V46.x,
                     TraintBodyACCJMeanX=V81.x,TraintBodyACCJMeanY=V82.x,TraintBodyACCJMeanZ=V83.x,
                     TraintBodyACCJStdX=V84.x,TraintBodyACCJStdY=V85.x,TraintBodyACCJStdZ=V86.x,
                     TraintBodyGyroMeanX=V121.x,TraintBodyGyroMeanY=V122.x,TraintBodyGyroMeanZ=V123.x,
                     TraintBodyGyroStdX=V124.x,TraintBodyGyroStdY=V125.x,TraintBodyGyroStdZ=V126.x,
                     TraintBodyGyroJMeanX=V161.x,TraintBodyGyroJMeanY=V162.x,TraintBodyGyroJMeanZ=V163.x,
                     TraintBodyGyroJStdX=V164.x,TraintBodyGyroJStdY=V165.x,TraintBodyGyroJStdZ=V166.x,
                     TraintBodyAccMMean=V201.x,TraintBodyAccMStd=V202.x,
                     TraintGravAccMMean=V214.x,TraintGravAccMStd=V215.x,
                     TraintBodyAccJMMean=V227.x,TraintBodyAccJMStd=V228.x,
                     TraintBodyGyroMMean=V240.x,TraintBodyGyroMStd=V241.x,
                     TraintBodyGyroJMMean=V253.x,TraintBodyGyroJMStd=V254.x,
                     TrainfBodyAccMeanX=V266.x,TrainfBodyAccMeaY=V267.x, TrainfBodyAccMeaZ=V268.x,
                     TrainfBodyAccStdX=V269.x,TrainfBodyAccStdY=V270.x,TrainfBodyAccStdZ=V271.x,
                     TrainfBodyAccJMeanX=V345.x,TrainfBodyAccJMeanY=V346.x,TrainfBodyAccJMeanZ=V347.x,
                     TrainfBodyAccJStdX=V348.x,TrainfBodyAccJStdY=V349.x,TrainfBodyAccJStdZ=V350.x,
                     TrainfBodyGryroMeanX=V424.x,TrainfBodyGryroMeanY=V425.x,TrainfBodyGryroMeanZ=V426.x,
                     TrainfBodyGryroStdX=V427.x,TrainfBodyGryroStdY=V428.x,TrainfBodyGryroStdZ=V429.x,
                     TrainfBodyAccMMean=V503.x,TrainfBodyAccMStd=V504.x,
                     TrainfBody2AccJMMean=V516.x,TrainfBody2AccJMStd=V517.x,
                     TrainfBody2GyroMMean=V529.x,TrainfBody2GyroMStd=V530.x,
                     TrainfBody2GyroJMMean=V542.x,TrainfBody2GyroJMStd=V543.x,
                     TesttBodyAccMeanX=V1.y,TesttBodyAccMeanY=V2.y,TesttBodyAccMeanZ=V3.y,
                     TesttBodyAccStdX=V4.y,TesttBodyAccStdY=V5.y,TesttBodyAccStdZ=V6.y,
                     TesttGravAccMeanX=V41.y,TesttGravAccMeanY=V42.y,TesttGravAccMeanZ=V43.y,
                     TesttGravAccStdX=V44.y,TesttGravAccStdY=V45.y,TesttGravAccStdZ=V46.y,
                     TesttBodyACCJMeanX=V81.y,TesttBodyACCJMeanY=V82.y,TesttBodyACCJMeanZ=V83.y,
                     TesttBodyACCJStdX=V84.y,TesttBodyACCJStdY=V85.y,TesttBodyACCJStdZ=V86.y,
                     TesttBodyGyroMeanX=V121.y,TesttBodyGyroMeanY=V122.y,TesttBodyGyroMeanZ=V123.y,
                     TesttBodyGyroStdX=V124.y,TesttBodyGyroStdY=V125.y,TesttBodyGyroStdZ=V126.y,
                     TesttBodyGyroJMeanX=V161.y,TesttBodyGyroJMeanY=V162.y,TesttBodyGyroJMeanZ=V163.y,
                     TesttBodyGyroJStdX=V164.y,TesttBodyGyroJStdY=V165.y,TesttBodyGyroJStdZ=V166.y,
                     TesttBodyAccMMean=V201.y,TesttBodyAccMStd=V202.y,
                     TesttGravAccMMean=V214.y,TesttGravAccMStd=V215.y,
                     TesttBodyAccJMMean=V227.y,TesttBodyAccJMStd=V228.y,
                     TesttBodyGyroMMean=V240.y,TesttBodyGyroMStd=V241.y,
                     TesttBodyGyroJMMean=V253.y,TesttBodyGyroJMStd=V254.y,
                     TestfBodyAccMeanX=V266.y,TestfBodyAccMeaY=V267.y, TestfBodyAccMeaZ=V268.y,
                     TestfBodyAccStdX=V269.y,TestfBodyAccStdY=V270.y,TestfBodyAccStdZ=V271.y,
                     TestfBodyAccJMeanX=V345.y,TestfBodyAccJMeanY=V346.y,TestfBodyAccJMeanZ=V347.y,
                     TestfBodyAccJStdX=V348.y,TestfBodyAccJStdY=V349.y,TestfBodyAccJStdZ=V350.y,
                     TestfBodyGryroMeanX=V424.y,TestfBodyGryroMeanY=V425.y,TestfBodyGryroMeanZ=V426.y,
                     TestfBodyGryroStdX=V427.y,TestfBodyGryroStdY=V428.y,TestfBodyGryroStdZ=V429.y,
                     TestfBodyAccMMean=V503.y,TestfBodyAccMStd=V504.y,
                     TestfBody2AccJMMean=V516.y,TestfBody2AccJMStd=V517.y,
                     TestfBody2GyroMMean=V529.y,TestfBody2GyroMStd=V530.y,
                     TestfBody2GyroJMMean=V542.y,TestfBody2GyroJMStd=V543.y
                     )

## Create data2 from data_renamed adding mean for each variable in each activity and subject
data_renamed2<-rename(data_renamed,subject=Trainsubject,activity=Trainactivity)
activitymean<-aggregate(data_renamed2,
                        list(activitymean=data_renamed2[,"activity"]),
                        mean)
activitymean<-rename(activitymean,ASMean =activitymean)
subjectmean<-aggregate(data_renamed2,
                        list(subjectean=data_renamed2[,"subject"]),
                        mean)
subjectmean<-rename(subjectmean,ASMean =subjectean)
subjectmean$ASMean<-as.factor(subjectmean$ASMean)
data2<-rbind(activitymean,subjectmean)
data3<-select(data2,-(subject:activity))
data3<-rename(data3,AorS=ASMean)
write.table(data3,file="tidydata.txt",row.name=FALSE)