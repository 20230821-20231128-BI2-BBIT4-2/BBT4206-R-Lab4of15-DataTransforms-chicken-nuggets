#Required packages
## mlbench
## readr 
if (require("readr")) {
  require("readr")
} else {
  install.packages("readr", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## caret 
if (require("caret")) {
  require("caret")
} else {
  install.packages("caret", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## e1071 
if (require("e1071")) {
  require("e1071")
} else {
  install.packages("e1071", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## factoextra 
if (require("factoextra")) {
  require("factoextra")
} else {
  install.packages("factoextra", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

## FactoMineR 
if (require("FactoMineR")) {
  require("FactoMineR")
} else {
  install.packages("FactoMineR", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}

#step 1 : loading dataset

library(readr)
StudentPerformanceDataset <- read_csv("data/StudentPerformanceDataset.csv")
View(StudentPerformanceDataset)


##visualization using histogram----
#Histogram before transformation
summary(StudentPerformanceDataset)
hist(StudentPerformanceDataset$YOB, main = "Bar Plot of gender",
     xlab = "YOB", ylab = "Frequency", col = "purple")

hist(StudentPerformanceDataset$anticipate_test_questions, main = "Bar Plot of Anticipate test questions",
     xlab = "Anticipate test Questions", ylab = "Frequency", col = "blue")

hist(StudentPerformanceDataset$gender, main = "Bar Plot of YOB",
     xlab = "Gender", ylab = "Frequency", col = "yellow")

hist(StudentPerformanceDataset$A1, main = "Bar Plot of enjoyin the Unit",
     xlab = "Bar Plot of enjoying the Unit", ylab = "Frequency", col = "blue")


hist(StudentPerformanceDataset$Average_Rating, main = "Average_Rating",
     xlab = "Average_Rating", ylab = "Frequency", col = "pink")


hist(StudentPerformanceDataset$Quizzes, main = "Bar Plot of Quizzes",
     xlab = "Quizzes", ylab = "Frequency", col = "blue")


hist(StudentPerformanceDataset$LabWork, main = "Bar Plot of LabWork",
     xlab = "LabWork ", ylab = "Frequency", col = "pink")


hist(StudentPerformanceDataset$CAT1, main = "Bar Plot of CAT1",
     xlab = "CAT1", ylab = "Frequency", col = "blue")

hist(StudentPerformanceDataset$CAT2, main = "Bar Plot of CAT 2",
     xlab = "CAT2", ylab = "Frequency", col = "purple")

hist(StudentPerformanceDataset$Coursework, main = "Bar Plot of Coursework",
     xlab = "Coursework", ylab = "Frequency", col = "pink")

hist(StudentPerformanceDataset$EXAM, main = "Bar Plot of EXAM",
     xlab = "EXAM", ylab = "Frequency", col = "blue")

hist(StudentPerformanceDataset$TOTAL, main = "Bar Plot of TOTAL Semester marks",
     xlab = "TOTAL Semester marks", ylab = "Frequency", col = "red")


# transformation
model_of_the_transform <- preProcess(StudentPerformanceDataset, method = c("scale"))
print(model_of_the_transform)
StudentPerformanceDataset_scale_transform <- predict(model_of_the_transform,
                                             StudentPerformanceDataset)

#Histogram after transformation
summary(StudentPerformanceDataset_scale_transform)

hist(StudentPerformanceDataset_scale_transform$YOB, main = "Bar Plot of gender",
     xlab = "YOB", ylab = "Frequency", col = "purple")

hist(StudentPerformanceDataset_scale_transform$anticipate_test_questions, main = "Bar Plot of Anticipate test questions",
     xlab = "Anticipate test Questions", ylab = "Frequency", col = "blue")

hist(StudentPerformanceDataset_scale_transform$gender, main = "Bar Plot of YOB",
     xlab = "Gender", ylab = "Frequency", col = "yellow")

hist(StudentPerformanceDataset_scale_transform$A1, main = "Bar Plot of enjoyin the Unit",
     xlab = "Bar Plot of enjoying the Unit", ylab = "Frequency", col = "blue")


hist(StudentPerformanceDataset_scale_transform$Average_Rating, main = "Average_Rating",
     xlab = "Average_Rating", ylab = "Frequency", col = "pink")


hist(StudentPerformanceDataset_scale_transform$Quizzes, main = "Bar Plot of Quizzes",
     xlab = "Quizzes", ylab = "Frequency", col = "blue")


hist(StudentPerformanceDataset_scale_transform$LabWork, main = "Bar Plot of LabWork",
     xlab = "LabWork ", ylab = "Frequency", col = "pink")


hist(StudentPerformanceDataset_scale_transform$CAT1, main = "Bar Plot of CAT1",
     xlab = "CAT1", ylab = "Frequency", col = "blue")

hist(StudentPerformanceDataset_scale_transform$CAT2, main = "Bar Plot of CAT 2",
     xlab = "CAT2", ylab = "Frequency", col = "purple")

hist(StudentPerformanceDataset_scale_transform$Coursework, main = "Bar Plot of Coursework",
     xlab = "Coursework", ylab = "Frequency", col = "pink")

hist(StudentPerformanceDataset_scale_transform$EXAM, main = "Bar Plot of EXAM",
     xlab = "EXAM", ylab = "Frequency", col = "blue")

hist(StudentPerformanceDatase_scale_transformt$TOTAL, main = "Bar Plot of TOTAL Semester marks",
     xlab = "TOTAL Semester marks", ylab = "Frequency", col = "red")


## The Centre Basic Transform----
#visualization using Boxplot
#Boxplot before transformation
summary(StudentPerformanceDataset)
boxplot(StudentPerformanceDataset$YOB, main = "boxplot of gender",
     xlab = "YOB", ylab = "Frequency", col = "purple")

boxplot(StudentPerformanceDataset$anticipate_test_questions, main = "boxplot of Anticipate test questions",
     xlab = "Anticipate test Questions", ylab = "Frequency", col = "blue")

boxplot(StudentPerformanceDataset$gender, main = "boxplot of YOB",
     xlab = "Gender", ylab = "Frequency", col = "yellow")

boxplot(StudentPerformanceDataset$A1, main = "boxplot of enjoyin the Unit",
     xlab = "Boxplot of enjoying the Unit", ylab = "Frequency", col = "blue")


boxplot(StudentPerformanceDataset$Average_Rating, main = "Average_Rating",
     xlab = "Average_Rating", ylab = "Frequency", col = "pink")


boxplot(StudentPerformanceDataset$Quizzes, main = "Boxplot of Quizzes",
     xlab = "Quizzes", ylab = "Frequency", col = "blue")


boxplot(StudentPerformanceDataset$LabWork, main = "Boxplot of LabWork",
     xlab = "LabWork ", ylab = "Frequency", col = "pink")


boxplot(StudentPerformanceDataset$CAT1, main = "Boxplot of CAT1",
     xlab = "CAT1", ylab = "Frequency", col = "blue")

boxplot(StudentPerformanceDataset$CAT2, main = "Boxplot of CAT 2",
     xlab = "CAT2", ylab = "Frequency", col = "purple")

boxplot(StudentPerformanceDataset$Coursework, main = "Boxplot of Coursework",
     xlab = "Coursework", ylab = "Frequency", col = "pink")

boxplot(StudentPerformanceDataset$EXAM, main = "Boxplot of EXAM",
     xlab = "EXAM", ylab = "Frequency", col = "blue")

boxplot(StudentPerformanceDataset$TOTAL, main = "Boxplot of TOTAL Semester marks",
     xlab = "TOTAL Semester marks", ylab = "Frequency", col = "red")


#Transformation
model_of_the_transform <- preProcess(StudentPerformanceDataset, method = c("center"))
print(model_of_the_transform)
StudentPerformanceDataset_center_transform <- predict(model_of_the_transform, # nolint
                                           StudentPerformanceDataset)




#Boxplot after transformation
summary(StudentPerformanceDataset_center_transform)
boxplot(StudentPerformanceDataset_center_transform$YOB, main = "boxplot of gender",
        xlab = "YOB", ylab = "Frequency", col = "purple")

boxplot(StudentPerformanceDataset_center_transform$anticipate_test_questions, main = "boxplot of Anticipate test questions",
        xlab = "Anticipate test Questions", ylab = "Frequency", col = "blue")

boxplot(StudentPerformanceDataset_center_transform$gender, main = "boxplot of YOB",
        xlab = "Gender", ylab = "Frequency", col = "yellow")

boxplot(StudentPerformanceDataset_center_transform$A1, main = "boxplot of enjoyin the Unit",
        xlab = "Boxplot of enjoying the Unit", ylab = "Frequency", col = "blue")


boxplot(StudentPerformanceDataset_center_transform$Average_Rating, main = "Average_Rating",
        xlab = "Average_Rating", ylab = "Frequency", col = "pink")


boxplot(StudentPerformanceDataset_center_transform$Quizzes, main = "Boxplot of Quizzes",
        xlab = "Quizzes", ylab = "Frequency", col = "blue")


boxplot(StudentPerformanceDataset_center_transform$LabWork, main = "Boxplot of LabWork",
        xlab = "LabWork ", ylab = "Frequency", col = "pink")


boxplot(StudentPerformanceDataset_center_transform$CAT1, main = "Boxplot of CAT1",
        xlab = "CAT1", ylab = "Frequency", col = "blue")

boxplot(StudentPerformanceDataset_center_transform$CAT2, main = "Boxplot of CAT 2",
        xlab = "CAT2", ylab = "Frequency", col = "purple")

boxplot(StudentPerformanceDataset_center_transform$Coursework, main = "Boxplot of Coursework",
        xlab = "Coursework", ylab = "Frequency", col = "pink")

boxplot(StudentPerformanceDataset_center_transform$EXAM, main = "Boxplot of EXAM",
        xlab = "EXAM", ylab = "Frequency", col = "blue")

boxplot(StudentPerformanceDataset_center_transform$TOTAL, main = "Boxplot of TOTAL Semester marks",
        xlab = "TOTAL Semester marks", ylab = "Frequency", col = "red")


##Standardize Data Transform--
summary(StudentPerformanceDataset)
sapply(StudentPerformanceDataset[ ,-1 ], sd)

model_of_the_transform <- preProcess(StudentPerformanceDataset,
                                     method = c("scale", "center"))
print(model_of_the_transform)
StudentPerformanceDataset_standardize_transform <- predict(model_of_the_transform, 
                                                           StudentPerformanceDataset)

# AFTER
summary(StudentPerformanceDataset_standardize_transform)
sapply(StudentPerformanceDataset_standardize_transform[, -1], sd)


## Normalizing Data Transform---
summary(StudentPerformanceDataset)
model_of_the_transform <- preProcess(StudentPerformanceDataset, method = c("range"))
print(model_of_the_transform)
StudentPerformanceDataset_normalize_transform <- predict(model_of_the_transform, 
                                                         StudentPerformanceDataset)
summary(StudentPerformanceDataset_normalize_transform)

## Performing Box-Cox Power Transform----
# BEFORE
summary(StudentPerformanceDataset)

#Calculating the skewness before 
sapply(StudentPerformanceDataset[, -1],  skewness, type = 2)

# histogram to view the skewness before the Box-Cox transform

hist(StudentPerformanceDataset$YOB, main = "Bar Plot of gender",
     xlab = "YOB", ylab = "Frequency", col = "purple")

hist(StudentPerformanceDataset$anticipate_test_questions, main = "Bar Plot of Anticipate test questions",
     xlab = "Anticipate test Questions", ylab = "Frequency", col = "blue")

hist(StudentPerformanceDataset$gender, main = "Bar Plot of YOB",
     xlab = "Gender", ylab = "Frequency", col = "yellow")

hist(StudentPerformanceDataset$A1, main = "Bar Plot of enjoyin the Unit",
     xlab = "Bar Plot of enjoying the Unit", ylab = "Frequency", col = "blue")


hist(StudentPerformanceDataset$Average_Rating, main = "Average_Rating",
     xlab = "Average_Rating", ylab = "Frequency", col = "pink")


hist(StudentPerformanceDataset$Quizzes, main = "Bar Plot of Quizzes",
     xlab = "Quizzes", ylab = "Frequency", col = "blue")


hist(StudentPerformanceDataset$LabWork, main = "Bar Plot of LabWork",
     xlab = "LabWork ", ylab = "Frequency", col = "pink")


hist(StudentPerformanceDataset$CAT1, main = "Bar Plot of CAT1",
     xlab = "CAT1", ylab = "Frequency", col = "blue")

hist(StudentPerformanceDataset$CAT2, main = "Bar Plot of CAT 2",
     xlab = "CAT2", ylab = "Frequency", col = "purple")

hist(StudentPerformanceDataset$Coursework, main = "Bar Plot of Coursework",
     xlab = "Coursework", ylab = "Frequency", col = "pink")

hist(StudentPerformanceDataset$EXAM, main = "Bar Plot of EXAM",
     xlab = "EXAM", ylab = "Frequency", col = "blue")

hist(StudentPerformanceDataset$TOTAL, main = "Bar Plot of TOTAL Semester marks",
     xlab = "TOTAL Semester marks", ylab = "Frequency", col = "red")

#transformation
model_of_the_transform <- preProcess(StudentPerformanceDataset, method = c("BoxCox"))
print(model_of_the_transform)
StudentPerformanceDataset_box_cox_transform <- predict(model_of_the_transform,
                                                       StudentPerformanceDataset)
#After Transformation

summary(StudentPerformanceDataset_box_cox_transform)

sapply(StudentPerformanceDataset_box_cox_transform[, -4],  skewness, type = 2)

hist(StudentPerformanceDataset_box_cox_transform$YOB, main = "Bar Plot of gender",
     xlab = "YOB", ylab = "Frequency", col = "purple")

hist(StudentPerformanceDataset_box_cox_transform$anticipate_test_questions, main = "Bar Plot of Anticipate test questions",
     xlab = "Anticipate test Questions", ylab = "Frequency", col = "blue")

hist(StudentPerformanceDataset_box_cox_transform$gender, main = "Bar Plot of YOB",
     xlab = "Gender", ylab = "Frequency", col = "yellow")

hist(StudentPerformanceDataset_box_cox_transform$A1, main = "Bar Plot of enjoyin the Unit",
     xlab = "Bar Plot of enjoying the Unit", ylab = "Frequency", col = "blue")


hist(StudentPerformanceDataset_box_cox_transform$Average_Rating, main = "Average_Rating",
     xlab = "Average_Rating", ylab = "Frequency", col = "pink")


hist(StudentPerformanceDataset_box_cox_transform$Quizzes, main = "Bar Plot of Quizzes",
     xlab = "Quizzes", ylab = "Frequency", col = "blue")


hist(StudentPerformanceDataset_box_cox_transform$LabWork, main = "Bar Plot of LabWork",
     xlab = "LabWork ", ylab = "Frequency", col = "pink")


hist(StudentPerformanceDataset_box_cox_transform$CAT1, main = "Bar Plot of CAT1",
     xlab = "CAT1", ylab = "Frequency", col = "blue")

hist(StudentPerformanceDataset_box_cox_transform$CAT2, main = "Bar Plot of CAT 2",
     xlab = "CAT2", ylab = "Frequency", col = "purple")

hist(StudentPerformanceDataset_box_cox_transform$Coursework, main = "Bar Plot of Coursework",
     xlab = "Coursework", ylab = "Frequency", col = "pink")

hist(StudentPerformanceDataset_box_cox_transform$EXAM, main = "Bar Plot of EXAM",
     xlab = "EXAM", ylab = "Frequency", col = "blue")

hist(StudentPerformanceDataset_box_cox_transform$TOTAL, main = "Bar Plot of TOTAL Semester marks",
     xlab = "TOTAL Semester marks", ylab = "Frequency", col = "red")


## Applying a Yeo-Johnson Power Transform ----
summary(StudentPerformanceDataset)

#Calculating the skewness before 
sapply(StudentPerformanceDataset[, -1],  skewness, type = 2)

# histogram to view the skewness before the Box-Cox transform

hist(StudentPerformanceDataset$YOB, main = "Bar Plot of gender",
     xlab = "YOB", ylab = "Frequency", col = "purple")

hist(StudentPerformanceDataset$anticipate_test_questions, main = "Bar Plot of Anticipate test questions",
     xlab = "Anticipate test Questions", ylab = "Frequency", col = "blue")

hist(StudentPerformanceDataset$gender, main = "Bar Plot of YOB",
     xlab = "Gender", ylab = "Frequency", col = "yellow")

hist(StudentPerformanceDataset$A1, main = "Bar Plot of enjoyin the Unit",
     xlab = "Bar Plot of enjoying the Unit", ylab = "Frequency", col = "blue")


hist(StudentPerformanceDataset$Average_Rating, main = "Average_Rating",
     xlab = "Average_Rating", ylab = "Frequency", col = "pink")


hist(StudentPerformanceDataset$Quizzes, main = "Bar Plot of Quizzes",
     xlab = "Quizzes", ylab = "Frequency", col = "blue")


hist(StudentPerformanceDataset$LabWork, main = "Bar Plot of LabWork",
     xlab = "LabWork ", ylab = "Frequency", col = "pink")


hist(StudentPerformanceDataset$CAT1, main = "Bar Plot of CAT1",
     xlab = "CAT1", ylab = "Frequency", col = "blue")

hist(StudentPerformanceDataset$CAT2, main = "Bar Plot of CAT 2",
     xlab = "CAT2", ylab = "Frequency", col = "purple")

hist(StudentPerformanceDataset$Coursework, main = "Bar Plot of Coursework",
     xlab = "Coursework", ylab = "Frequency", col = "pink")

hist(StudentPerformanceDataset$EXAM, main = "Bar Plot of EXAM",
     xlab = "EXAM", ylab = "Frequency", col = "blue")

hist(StudentPerformanceDataset$TOTAL, main = "Bar Plot of TOTAL Semester marks",
     xlab = "TOTAL Semester marks", ylab = "Frequency", col = "red")

# Transformation
model_of_the_transform <- preProcess(StudentPerformanceDataset, method = c("YeoJohnson"))
print(model_of_the_transform)
StudentPerformanceDataset_yeo_johnson_transform <- predict(model_of_the_transform,StudentPerformanceDataset)

# AFTER
summary(StudentPerformanceDataset_yeo_johnson_transform)

sapply(StudentPerformanceDataset_yeo_johnson_transform[, -1],  skewness, type = 2)



hist(StudentPerformanceDataset_yeo_johnson_transform$YOB, main = "Bar Plot of gender",
     xlab = "YOB", ylab = "Frequency", col = "purple")

hist(StudentPerformanceDataset_yeo_johnson_transform$anticipate_test_questions, main = "Bar Plot of Anticipate test questions",
     xlab = "Anticipate test Questions", ylab = "Frequency", col = "blue")

hist(StudentPerformanceDataset_yeo_johnson_transform$gender, main = "Bar Plot of YOB",
     xlab = "Gender", ylab = "Frequency", col = "yellow")

hist(StudentPerformanceDataset_yeo_johnson_transform$A1, main = "Bar Plot of enjoyin the Unit",
     xlab = "Bar Plot of enjoying the Unit", ylab = "Frequency", col = "blue")


hist(StudentPerformanceDataset_yeo_johnson_transform$Average_Rating, main = "Average_Rating",
     xlab = "Average_Rating", ylab = "Frequency", col = "pink")


hist(StudentPerformanceDataset_yeo_johnson_transform$Quizzes, main = "Bar Plot of Quizzes",
     xlab = "Quizzes", ylab = "Frequency", col = "blue")


hist(StudentPerformanceDataset_yeo_johnson_transform$LabWork, main = "Bar Plot of LabWork",
     xlab = "LabWork ", ylab = "Frequency", col = "pink")


hist(StudentPerformanceDataset_yeo_johnson_transform$CAT1, main = "Bar Plot of CAT1",
     xlab = "CAT1", ylab = "Frequency", col = "blue")

hist(StudentPerformanceDataset_yeo_johnson_transform$CAT2, main = "Bar Plot of CAT 2",
     xlab = "CAT2", ylab = "Frequency", col = "purple")

hist(StudentPerformanceDataset_yeo_johnson_transform$Coursework, main = "Bar Plot of Coursework",
     xlab = "Coursework", ylab = "Frequency", col = "pink")

hist(StudentPerformanceDataset_yeo_johnson_transform$EXAM, main = "Bar Plot of EXAM",
     xlab = "EXAM", ylab = "Frequency", col = "blue")

hist(StudentPerformanceDataset_yeo_johnson_transform$TOTAL, main = "Bar Plot of TOTAL Semester marks",
     xlab = "TOTAL Semester marks", ylab = "Frequency", col = "red")

