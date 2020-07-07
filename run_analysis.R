# Import files

X_test <- read.table('Dataset/test/X_test.txt')
X_train <- read.table('Dataset/train/X_train.txt')
y_test <- read.table('Dataset/test/y_test.txt')
y_train <- read.table('Dataset/train/y_train.txt')
subject_test <- read.table('Dataset/test/subject_test.txt')
subject_train <- read.table('Dataset/train/subject_train.txt')
features <- read.table('Dataset/features.txt')

# Give names to variables

names(X_test) <- features[,2]
names(X_train) <- features[,2]
names(y_test) <- "Activity"
names(y_train) <- "Activity"
names(subject_test) <- "Subject"
names(subject_train) <- "Subject"

# Merge of all data sets into one

train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)
full_df <- rbind(train,test)

# Extract only measurements of mean and std

features_sub <- grep(("mean|std"), features[,2], value = TRUE)
df_meanstd <- full_df[,c("Subject", "Activity",features_sub)]

# Change values of Activity to descriptive labels

df_meanstd$Activity <- factor(df_meanstd$Activity)
levels(df_meanstd$Activity) <- c("Walking", "Walking-UpStairs", "Walking-DownStairs", "Sitting", "Standing", "Laying")

# Dataframe already has descriptive variable names

# Extract second data set with average per subject and per activity
df_averages <- aggregate(subset(df_meanstd, select=-c(1,2)), list(Activity = df_meanstd$Activity, Subject = df_meanstd$Subject), mean)

write.table(df_averages, file = "tidy_dateset.txt", sep = "\t", row.names = FALSE)