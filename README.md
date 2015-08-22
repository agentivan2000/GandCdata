----------Getting and Cleaning Data Project ------
--------------------------------------------------

The script starts by sourcing a file that contains the custom functions that were writen 
for this program

---------------------------------------------------------------------------------------
The custom functions file custom_fun.R contains two functions; 
1/ getfilestodatasetsDir(): creates a folder called datasets by default... could be
 changed by passing the required name as an arguement. 
It moves the data files into this new folder leaving the raw data intact. and puts 
everything in just one folder. 

2/ readcomb_data(xfilename,yfilename,subfilename): it takes 3 arguments, the x file name 
(X_test.txt/X_train.txt), the y file name (y_test.txt/y_train.txt) and the subject file 
name (subject_test.txt/subject_train.txt). It marges the three tables and returns a 
data frame. The function adds the activity label key and the subjectkey on each  
data set and renames the column accordingly to avoid confusion.

--------------------------------------------------------------------------------------

The script calls the readcomb_data() function on both the test and training data sets and 
then combine both frames into one using rbind function

The script imports other relevant data i.e. activity labels and features/variable 
descriptions

The script then goes on to select the required columns with only Means and std ..............

Followed by merging descriptive data with the main table and naming columns. 
Assigning names to the different variables  

It finalizes by grouping the data by activityname, subjectkey, returning the average of 
the other columns and exporting the information to tidydataset.txt ...... 


-----------Final note -------------------------

In case you are copying the script, don't forget to copy the custom_fun.R file too. 
Place both files in the same directory before running