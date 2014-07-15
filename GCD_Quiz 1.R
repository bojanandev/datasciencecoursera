# question 1
# The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
# and load the data into R. The code book, describing the variable names is here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
# How many properties are worth $1,000,000 or more?
#------------------------------------------------------------------------------
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "/home/bojan/Downloads/quiz1dwnld.csv")
list.files("/home/bojan/Downloads")
data <- read.csv("~/Downloads/quiz1dwnld.csv")
data
prop_value <- data["VAL"] == 24
value_data <- data[prop_value,]["VAL"]
value_data_na <- is.na(value_data)
clean_value_data <- value_data[!value_data_na]
length(clean_value_data)
# question 2
#------------------------------------------------------------------------------
data[["FES"]]
#------------------------------------------------------------------------------
# question3
# Download the Excel spreadsheet on Natural Gas Aquisition Program here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx
# Read rows 18-23 and columns 7-15 into R and assign the result to a variable called: dat 
# What is the value of:
# sum(dat$Zip*dat$Ext,na.rm=T) 
# (original data source: http://catalog.data.gov/dataset/natural-gas-acquisition-program)
#------------------------------------------------------------------------------
library(rJava)
library(xlsx)
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = "/home/bojan/Downloads/quiz1dwnld.xlsx")
list.files("/home/bojan/Downloads")
colIndex <- 7:15
rowIndex <- 18:23
DataSubset <- read.xlsx("/home/bojan/Downloads/quiz1dwnld.xlsx",sheetIndex=1,
                              colIndex=colIndex,rowIndex=rowIndex)
DataSubset
sum(DataSubset$Zip*DataSubset$Ext,na.rm=T) 
#------------------------------------------------------------------------------
# question4
# Read the XML data on Baltimore restaurants from here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml
# How many restaurants have zipcode 21231?
#------------------------------------------------------------------------------
library(XML)
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileUrl, destfile = "/home/bojan/Downloads/quiz1dwnld.xml")
list.files("/home/bojan/Downloads")
doc <- xmlTreeParse("quiz1dwnld.xml",useInternal=TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
zipcodes <- xpathSApply(rootNode,"//zipcode",xmlValue)
length(zipcodes[zipcodes == "21231"])
#------------------------------------------------------------------------------
# question5
# The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv
# using the fread() command load the data into an R object DT 
# Which of the following is the fastest way to calculate the average value of the variable pwgtp15 
# broken down by sex using the data.table package?
#------------------------------------------------------------------------------
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "/home/bojan/Downloads/quiz15dwnld.csv")
list.files("/home/bojan/Downloads")
DT <- fread("quiz15dwnld.csv")
DT
#mean(DT$pwgtp15,by=DT$SEX)
date()
for (i in 1:1000){
  DT[,mean(pwgtp15),by=SEX]
}
date()
sapply(split(DT$pwgtp15,DT$SEX),mean) #8
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15) #100
#rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
tapply(DT$pwgtp15,DT$SEX,mean) #15
DT[,mean(pwgtp15),by=SEX]

