# Get Labels and Features, mean and std dev for each measurement.
activitylabels <- read.table("activity_labels.txt")[,2]
features <- read.table("features.txt")[,2] 
extract_ftr <- grepl("mean|std", features)

# Load and process X_test & y_test data and get mean and std dev
X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")
names(X_test) = features
X_test = X_test[,extract_ftr]

# Load activity labels
y_test[,2] = activitylabels[y_test[,1]]
names(y_test) = c("ActivityID", "ActivityLabel")
names(subject_test) = "subject"
test_data <- cbind(as.data.table(subject_test), y_test, X_test)

# Load and X_train & y_train data, get mean and standard deviation for each measurement
X_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")
names(X_train) = features
X_train = X_train[,extract_ftr]

# Load activity data
y_train[,2] = activitylabels[y_train[,1]]
names(y_train) = c("ActivityID", "ActivityLabel")
names(subject_train) = "subject"
train_data <- cbind(as.data.table(subject_train), y_train, X_train)

# Merge test and train data
data = rbind(test_data, train_data)
id_labels   = c("subject", "ActivityID", "ActivityLabel")
data_labels = setdiff(colnames(data), id_labels)
melt_data      = melt(data, id = id_labels, measure.vars = data_labels)
clean_data   = dcast(melt_data, subject + ActivityLabel ~ variable, mean)

#Save file Clean Data 
write.table(clean_data, file = "./clean_data.txt")