

####### Custom Functions ########

readcomb_data <- function(xfilename,yfilename,subfilename) {
      ## Function that imports data and combines the Y and X data into a single data frame. 
      ## It returns the final data frame. 
      
      ## Importing data from files for tests ...
      
      X_file<-read.table(xfilename)
      y_file<-read.table(yfilename)
      sub_filename<-read.table(subfilename)
      
      ## Renaming the columns to avoid confusion with the existing variablesin the X data. 
      names(y_file) <- "activitylabelkey"
      names(sub_filename) <- "subjectkey"
      
      ## Combine x and y to form a single data frame. 
      dt <- data.frame(c(sub_filename,y_file,X_file))
      
      rm(sub_filename,y_file,X_file)
      
      dt
}

getfilestodatasetsDir <- function(destdir = "./datasets") {
      ## Function to get data, unzip and put all files in datasets directory. 
      
      ## Downloading and unziping the data
      
#       fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#       download.file(fileurl,"./dataset.zip", method = "curl")
#       unzip("./dataset.zip")
#       
#       file.remove("./dataset.zip")
#       rm(fileurl)
      
      ## Create a dataset directory if one doesn't already exist
      
      if (!dir.exists(destdir)) {
            dir.create(destdir)
      }
      
      ## Merging the train & test datasets into one ... in the datasets directory. 
      
      file.copy("./UCI HAR Dataset//",destdir, recursive = TRUE)
      file.copy(paste(destdir,"/test//",sep = ""),destdir, recursive = TRUE,copy.mode = TRUE)
      file.copy(paste(destdir,"/train//",sep = ""),destdir, recursive = TRUE,copy.mode = TRUE)
      unlink(paste(destdir,"/test",sep = ""), recursive=TRUE)
      unlink(paste(destdir,"/train//",sep = ""), recursive=TRUE)
}