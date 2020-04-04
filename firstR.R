#loading libs
library(caret)
library(rpart)
library(rattle)
library(partykit)
library(party)
library(ROCR)



# Load data
mydata <- read.csv("/Users/sanyamjain/Desktop/DaysOfDataScience/file.csv")
summary(mydata)

# Data can also be imported/exported from a variett sources instead a .csv (ODBC, HTML, HDFS, .txt, .xlsx etc)

# Open a connection to MS SQL server - Business level enterprise solutions for connectiong data warrehouse of a company

library(RODBC)

MSSQLServer <- odbcConnect(dsn="firstLoad",uid="username", pwd="password")

# This is how to import a table dbo.customer into R as a data frame R.customer

R.Customer <- sqlFetch(MSSQLServer, "Business_Customer")

# This appends data to sql table

sqlUpdate(channel=MSSQLServer, dat=R.Customer, tablename="Business_Customer", index="ID")

# Close the connectiojn to the server

odbcClose(MSSQLServer)

# Once we are loaded in R, we can perform operations on variables and transform them for analytics and operations where
# we address data transformations. changinf variable names, removing vars, cleaning unwanted variables, dummy coding and stuffing


mydata$logPedigree <- log(mydata$DiabetesPedigreeFunction)

mydata$DiabetesPedigreeFunction <- NULL
mydata$BloodPressure <- NULL

# In last example we mathematically applied a log transformation to the pedigree variable and created a new variable "LogPedigree"

#Deleting the blood pressure from the dataset

# The EDA (cobvered later)

# Correlation Matrix 

mcor <- cor(mydata)
round(mcor, digits=2)

# Scatter Plot for all variables

plot(mydata)


set.seed(6789) 
ind <- sample(2, nrow(mydata), replace=TRUE, prob=c(0.7,0.3))
trainData <- mydata[ind==1,]
testData <- mydata[ind==2,]







# The seed function is important and allows for us to recreate the 
# results exactly as R produced them, USE SEEDS BEFORE RANDOM SPLITTING


# Having a good comment and notation in R script, makes a helpful recipe book

# It should contain all the libs and models and applications used in the code

# REcipe Book will be helpfule in long run

# With th rich variety of notation avilable from 3rd party developers, this will make a difference for creating the recipe book to learn the functions later on readuing the code

# THats what create a difference between a good data scioencetist and a great one

# Forgive me for spelling mistakes ;)




# R uses parallel processing and one can use the number of cores to be used in the modelling and learning

# This is very helpful because of the manner in which models are processed in-memory


# If you have complex models, that are having trouble being processed in a timely manner OR 
# take advantage of Big Data and Hadoop File system, it will very helpful using "parallel" package to Horse power

# 
# library(parallel)
# myfun <- dunction(i) {Sys.sleep(1);i}
# mclapply(1:8, myfun, mc.cores = 4)
# 










