#------------------------------------------------------------------------------
# Step One - Download and unzip file
#------------------------------------------------------------------------------
file_url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dest_path <- "/home/bojan/Downloads"
setwd(dest_path)
file_name <- "GCDProject.zip"
dest_file <- paste(dest_path, "/", file_name, sep = "")
download.file(download.file(file_url, destfile = dest_file))
unzip(dest_file, exdir=dest_path)
list.files(dest_path)
#------------------------------------------------------------------------------
# Step Two - Read data
#------------------------------------------------------------------------------
read_path <- paste(dest_path, "/UCI HAR Dataset", sep = "")
test_file_dest <- "/test/X_test.txt"
test_data <-read.table(paste(read_path, test_file_dest, sep = ""))
train_file_dest <- "/train/X_test.txt"
train_data <-read.table(paste(read_path, test_file_dest, sep = ""))
#------------------------------------------------------------------------------
# Step Three - Merge data
#------------------------------------------------------------------------------
merged_data <- rbind(train_data, test_data)
#------------------------------------------------------------------------------
# Step Three - Find features
#------------------------------------------------------------------------------
feature_file_dest <- "/features.txt"
feature_data <- read.table(paste(read_path, feature_file_dest, sep = ""))
mean_data <- feature_data[grepl("mean", feature_data$V2),]
std_data <- feature_data[grepl("std", feature_data$V2),]
mean_std_cols <- c(mean_data[[1]], std_data[[1]])
tidy_data_1 <- merged_data[,mean_std_cols]
#------------------------------------------------------------------------------
# Step Four - Descriptive names
#------------------------------------------------------------------------------
labels_dest <- "/activity_labels.txt"
labels <- read.table(paste(read_path, labels_dest, sep = ""))
test_labels_file_dest <- "/test/y_test.txt"
test_labels_data <-read.table(paste(read_path, test_labels_file_dest, sep = ""))
test_labels_data <- merge(test_labels_data, labels)
train_labels_file_dest <- "/train/y_test.txt"
train_labels_data <-read.table(paste(read_path, test_labels_file_dest, sep = ""))
train_labels_data <- merge(train_labels_data, labels)
train_labels_data$V2
labels_data <- rbind(train_labels_data, test_labels_data)
#------------------------------------------------------------------------------
# Step Five - Column names
#------------------------------------------------------------------------------
mean_std_col_names <- rbind(mean_data, std_data)
col_names <- mean_std_col_names[[2]]
colnames(tidy_data_1) <- col_names
tidy_data_2 <- cbind(labels_data[[2]], tidy_data_1)
colnames(tidy_data_2)[1] <- "activity_labels"
#------------------------------------------------------------------------------
# Step Six - Tidy data
#------------------------------------------------------------------------------
