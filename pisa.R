setwd("C:/Users/DELL/Desktop/ISSMTECHASSIGNMENTS/Kaggle/PISa/")
pisaTrain=read.csv("pisa2009train.csv")
pisaTest=read.csv("pisa2009test.csv")


str(pisaTrain)
# we find avg reading test scores of males and females
with(pisaTrain,tapply(readingScore,male,mean))

# Remove NA
summary(pisaTrain$raceeth)
pisaTrain=na.omit(pisaTrain)

# For unordered variable raceth we select white as reference level (white has highest frequency)
# We create binary variables for all levels except white
# If all binary varibles are 0 then it means the raceth is white
# By default levels for string are ordered alphabeticaly, we reorder the white to level 1 
levels(pisaTrain$raceeth)
pisaTrain$raceeth = relevel(pisaTrain$raceeth, "White")
pisaTest$raceeth = relevel(pisaTest$raceeth, "White")
levels(pisaTrain$raceeth)

lmScore = lm(readingScore ~ ., data = pisaTrain)
