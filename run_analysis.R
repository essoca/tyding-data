
# Function to process training and test data sets separately
process <- function(data, directory) {
    ## data is the string "train" or "test".
    ## Returns a dataframe with the variables: subject (character), 
    ## activity (factor), features (numeric)
  
    print(paste("Processing", data, "data set ..."))
    # Extract features from each record in the data set 
    extract_features <- function(record) {
          # record is a character vector of length 1 with all the features
          # corresponding to a single observation
          features <- unlist(strsplit(record, " "))
          as.numeric(features[!(features == "")])
    }
    # Read labels (for features and activity)
    read_label <- function(directory, kind){
          # Read the labels of kind "feature" or "activity" found in directory
          # Returns a character vector with the labels
          if (kind == "activity"){
              file <- paste(directory, "/", "activity_labels.txt", sep = "")
          } else {
              file <- paste(directory, "/", "features.txt", sep = "")
          }
          unname(sapply(readLines(file), function(x){strsplit(x, " ")[[1]][2]}))
    }
    
    # Load the data from the dataset directory
    xdata <- read.delim(paste(directory, "/", data, "/X_", data, ".txt", sep = ""),
                        stringsAsFactors = FALSE)
    if (data == "train") { dim_data <- c(7351, 561)}
    else {dim_data <- c(2946, 561)}
    
    # Extract the features and create data frame
    data_df <- sapply(xdata, extract_features); dim(data_df) <- dim_data
    data_df <- data.frame(data_df)
    
    # Add the subject and labeled-activity variables to the created data frame
    subject <- read.delim(paste(directory, "/", data,"/subject_", data,".txt", sep = ""))
    activity <- unlist(read.delim(paste(directory, "/", data, "/y_", data, ".txt", sep = "")))
    activity_labels <- read_label(directory, "activity")
    features_labels <- read_label(directory, "features")
    activity <- factor(activity, labels = tolower(activity_labels))
    data_df <- cbind(subject, activity, data_df)
    names(data_df)[1] <- "subject"
    names(data_df)[3:ncol(data_df)] <- features_labels
    data_df
}

# Process training and test data sets
train_df <- process("train", getwd())
test_df <- process("test", getwd())

# Merge the data sets
merged_data <- rbind(train_df, test_df)
rm("train_df", "test_df")

# Extract mean and standard deviation of each measurement
mean_std_data <- merged_data[, c(1, 2, grep("mean[^F]|std",names(merged_data)))]

# New data set with average of variables for each subject and activity
average_data <- mean_std_data %>% group_by(subject, activity) %>% summarise_all(mean)

