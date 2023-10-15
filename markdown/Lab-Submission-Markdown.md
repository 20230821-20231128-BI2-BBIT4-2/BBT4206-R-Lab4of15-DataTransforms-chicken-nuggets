Business Intelligence Lab 4
================
Chicken-nuggets
15th october 2023

- [Student Details](#student-details)

# Student Details

<table style="width:90%;">
<colgroup>
<col style="width: 45%" />
<col style="width: 44%" />
</colgroup>
<tbody>
<tr class="odd">
<td><strong>Student ID Number and Name</strong></td>
<td><ol type="1">
<li>137118 Fatoumata Camara</li>
<li>127039 Ayan Ahmed</li>
<li>136869 Birkanwal Bhambra</li>
<li>127602 Trevor Anjere</li>
<li>133824 Habiba Siba</li>
</ol></td>
</tr>
<tr class="even">
<td><strong>BBIT 4.2 Group</strong></td>
<td>Chicken-nuggets</td>
</tr>
</tbody>
</table>

``` r
if (require("readr")) {
  require("readr")
} else {
  install.packages("readr", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

    ## Loading required package: readr

``` r
if (require("caret")) {
  require("caret")
} else {
  install.packages("caret", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

    ## Loading required package: caret

    ## Loading required package: ggplot2

    ## Loading required package: lattice

``` r
if (require("e1071")) {
  require("e1071")
} else {
  install.packages("e1071", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

    ## Loading required package: e1071

``` r
if (require("factoextra")) {
  require("factoextra")
} else {
  install.packages("factoextra", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

    ## Loading required package: factoextra

    ## Welcome! Want to learn more? See two factoextra-related books at https://goo.gl/ve3WBa

``` r
if (require("FactoMineR")) {
  require("FactoMineR")
} else {
  install.packages("FactoMineR", dependencies = TRUE,
                   repos = "https://cloud.r-project.org")
}
```

    ## Loading required package: FactoMineR

``` r
library(readr)
StudentPerformanceDataset <- read_csv("data/StudentPerformanceDataset.csv")
```

    ## Rows: 101 Columns: 91
    ## ── Column specification ────────────────────────────────────────────────────────
    ## Delimiter: ","
    ## dbl (91): gender, YOB, motivator, read_content_before_lecture, anticipate_te...
    ## 
    ## ℹ Use `spec()` to retrieve the full column specification for this data.
    ## ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
View(StudentPerformanceDataset)
```

``` r
##visualization using histogram----
#Histogram before transformation
summary(StudentPerformanceDataset)
```

    ##      gender            YOB         motivator      read_content_before_lecture
    ##  Min.   :0.0000   Min.   :1998   Min.   :0.0000   Min.   :1.000              
    ##  1st Qu.:0.0000   1st Qu.:2000   1st Qu.:1.0000   1st Qu.:2.000              
    ##  Median :1.0000   Median :2001   Median :1.0000   Median :3.000              
    ##  Mean   :0.5743   Mean   :2001   Mean   :0.7525   Mean   :2.752              
    ##  3rd Qu.:1.0000   3rd Qu.:2002   3rd Qu.:1.0000   3rd Qu.:3.000              
    ##  Max.   :1.0000   Max.   :2003   Max.   :1.0000   Max.   :5.000              
    ##  anticipate_test_questions answer_rhetorical_questions find_terms_I_do_not_know
    ##  Min.   :1.000             Min.   :1.000               Min.   :1.000           
    ##  1st Qu.:3.000             1st Qu.:3.000               1st Qu.:3.000           
    ##  Median :4.000             Median :4.000               Median :4.000           
    ##  Mean   :3.584             Mean   :3.426               Mean   :3.743           
    ##  3rd Qu.:4.000             3rd Qu.:4.000               3rd Qu.:5.000           
    ##  Max.   :5.000             Max.   :5.000               Max.   :5.000           
    ##  copy_new_terms_in_reading_notebook take_quizzes_and_use_results
    ##  Min.   :1.000                      Min.   :1.000               
    ##  1st Qu.:3.000                      1st Qu.:3.000               
    ##  Median :4.000                      Median :4.000               
    ##  Mean   :3.663                      Mean   :3.941               
    ##  3rd Qu.:4.000                      3rd Qu.:5.000               
    ##  Max.   :5.000                      Max.   :5.000               
    ##  reorganise_course_outline write_down_important_points space_out_revision
    ##  Min.   :1.000             Min.   :1.000               Min.   :1.000     
    ##  1st Qu.:3.000             1st Qu.:3.000               1st Qu.:3.000     
    ##  Median :3.000             Median :4.000               Median :3.000     
    ##  Mean   :3.376             Mean   :3.832               Mean   :3.228     
    ##  3rd Qu.:4.000             3rd Qu.:5.000               3rd Qu.:4.000     
    ##  Max.   :5.000             Max.   :5.000               Max.   :5.000     
    ##  studying_in_study_group schedule_appointments goal_oriented  
    ##  Min.   :1.000           Min.   :1.000         Min.   :0.000  
    ##  1st Qu.:1.000           1st Qu.:1.000         1st Qu.:0.000  
    ##  Median :2.000           Median :2.000         Median :0.000  
    ##  Mean   :2.455           Mean   :1.931         Mean   :0.198  
    ##  3rd Qu.:3.000           3rd Qu.:2.000         3rd Qu.:0.000  
    ##  Max.   :5.000           Max.   :5.000         Max.   :1.000  
    ##  spaced_repetition testing_and_active_recall  interleaving    categorizing  
    ##  Min.   :1.000     Min.   :1.000             Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:2.000     1st Qu.:3.000             1st Qu.:2.000   1st Qu.:2.000  
    ##  Median :3.000     Median :3.000             Median :2.000   Median :3.000  
    ##  Mean   :2.554     Mean   :3.059             Mean   :2.257   Mean   :2.713  
    ##  3rd Qu.:3.000     3rd Qu.:4.000             3rd Qu.:3.000   3rd Qu.:3.000  
    ##  Max.   :4.000     Max.   :4.000             Max.   :4.000   Max.   :4.000  
    ##  retrospective_timetable cornell_notes        sq3r          commute     
    ##  Min.   :1.000           Min.   :1.000   Min.   :1.000   Min.   :0.000  
    ##  1st Qu.:2.000           1st Qu.:2.000   1st Qu.:2.000   1st Qu.:2.000  
    ##  Median :2.000           Median :3.000   Median :3.000   Median :3.000  
    ##  Mean   :2.406           Mean   :2.545   Mean   :2.614   Mean   :2.703  
    ##  3rd Qu.:3.000           3rd Qu.:3.000   3rd Qu.:3.000   3rd Qu.:4.000  
    ##  Max.   :4.000           Max.   :4.000   Max.   :4.000   Max.   :4.000  
    ##    study_time    repeats_since_Y1  paid_tuition     free_tuition   
    ##  Min.   :0.000   Min.   : 0.00    Min.   :0.0000   Min.   :0.0000  
    ##  1st Qu.:1.000   1st Qu.: 0.00    1st Qu.:0.0000   1st Qu.:0.0000  
    ##  Median :2.000   Median : 2.00    Median :0.0000   Median :0.0000  
    ##  Mean   :1.733   Mean   : 2.03    Mean   :0.1089   Mean   :0.2673  
    ##  3rd Qu.:2.000   3rd Qu.: 3.00    3rd Qu.:0.0000   3rd Qu.:1.0000  
    ##  Max.   :4.000   Max.   :10.00    Max.   :1.0000   Max.   :1.0000  
    ##  extra_curricular sports_extra_curricular exercise_per_week    meditate     
    ##  Min.   :0.0000   Min.   :0.0000          Min.   :0.000     Min.   :0.0000  
    ##  1st Qu.:0.0000   1st Qu.:0.0000          1st Qu.:1.000     1st Qu.:0.0000  
    ##  Median :1.0000   Median :0.0000          Median :1.000     Median :1.0000  
    ##  Mean   :0.5248   Mean   :0.3564          Mean   :1.089     Mean   :0.7525  
    ##  3rd Qu.:1.0000   3rd Qu.:1.0000          3rd Qu.:2.000     3rd Qu.:1.0000  
    ##  Max.   :1.0000   Max.   :1.0000          Max.   :3.000     Max.   :3.0000  
    ##       pray          internet      family_relationships  friendships  
    ##  Min.   :0.000   Min.   :0.0000   Min.   :0.000        Min.   :0.00  
    ##  1st Qu.:1.000   1st Qu.:1.0000   1st Qu.:4.000        1st Qu.:4.00  
    ##  Median :2.000   Median :1.0000   Median :4.000        Median :4.00  
    ##  Mean   :2.069   Mean   :0.8614   Mean   :4.149        Mean   :3.97  
    ##  3rd Qu.:3.000   3rd Qu.:1.0000   3rd Qu.:5.000        3rd Qu.:4.00  
    ##  Max.   :3.000   Max.   :1.0000   Max.   :5.000        Max.   :5.00  
    ##  romantic_relationships spiritual_wellnes financial_wellness     health 
    ##  Min.   :0.000          Min.   :0.000     Min.   :0          Min.   :0  
    ##  1st Qu.:0.000          1st Qu.:3.000     1st Qu.:2          1st Qu.:3  
    ##  Median :0.000          Median :4.000     Median :3          Median :4  
    ##  Mean   :1.356          Mean   :3.614     Mean   :3          Mean   :4  
    ##  3rd Qu.:3.000          3rd Qu.:4.000     3rd Qu.:4          3rd Qu.:5  
    ##  Max.   :4.000          Max.   :5.000     Max.   :5          Max.   :5  
    ##     day_out         night_out     alcohol_or_narcotics     mentor      
    ##  Min.   :0.0000   Min.   :0.000   Min.   :0.0000       Min.   :0.0000  
    ##  1st Qu.:0.0000   1st Qu.:0.000   1st Qu.:0.0000       1st Qu.:0.0000  
    ##  Median :1.0000   Median :0.000   Median :0.0000       Median :0.0000  
    ##  Mean   :0.7921   Mean   :0.505   Mean   :0.3465       Mean   :0.4059  
    ##  3rd Qu.:1.0000   3rd Qu.:1.000   3rd Qu.:1.0000       3rd Qu.:1.0000  
    ##  Max.   :3.0000   Max.   :3.000   Max.   :3.0000       Max.   :1.0000  
    ##  mentor_meetings        A1        A - 2. Classes start and end on time
    ##  Min.   :0.0000   Min.   :0.000   Min.   :0.000                       
    ##  1st Qu.:0.0000   1st Qu.:4.000   1st Qu.:4.000                       
    ##  Median :0.0000   Median :5.000   Median :5.000                       
    ##  Mean   :0.6733   Mean   :4.446   Mean   :4.634                       
    ##  3rd Qu.:1.0000   3rd Qu.:5.000   3rd Qu.:5.000                       
    ##  Max.   :3.0000   Max.   :5.000   Max.   :5.000                       
    ##  A - 3. The learning environment is participative, involves learning by doing and is group-based
    ##  Min.   :0.000                                                                                  
    ##  1st Qu.:4.000                                                                                  
    ##  Median :4.000                                                                                  
    ##  Mean   :4.307                                                                                  
    ##  3rd Qu.:5.000                                                                                  
    ##  Max.   :5.000                                                                                  
    ##  A - 4. The subject content is delivered according to the course outline and meets my expectations
    ##  Min.   :0.000                                                                                    
    ##  1st Qu.:4.000                                                                                    
    ##  Median :5.000                                                                                    
    ##  Mean   :4.693                                                                                    
    ##  3rd Qu.:5.000                                                                                    
    ##  Max.   :5.000                                                                                    
    ##  A - 5. The topics are clear and logically developed
    ##  Min.   :0.000                                      
    ##  1st Qu.:4.000                                      
    ##  Median :5.000                                      
    ##  Mean   :4.604                                      
    ##  3rd Qu.:5.000                                      
    ##  Max.   :5.000                                      
    ##  A - 6. I am developing my oral and writing skills
    ##  Min.   :0.000                                    
    ##  1st Qu.:4.000                                    
    ##  Median :4.000                                    
    ##  Mean   :4.069                                    
    ##  3rd Qu.:5.000                                    
    ##  Max.   :5.000                                    
    ##  A - 7. I am developing my reflective and critical reasoning skills
    ##  Min.   :0.000                                                     
    ##  1st Qu.:4.000                                                     
    ##  Median :4.000                                                     
    ##  Mean   :4.337                                                     
    ##  3rd Qu.:5.000                                                     
    ##  Max.   :5.000                                                     
    ##  A - 8. The assessment methods are assisting me to learn
    ##  Min.   :0.000                                          
    ##  1st Qu.:4.000                                          
    ##  Median :5.000                                          
    ##  Mean   :4.564                                          
    ##  3rd Qu.:5.000                                          
    ##  Max.   :5.000                                          
    ##  A - 9. I receive relevant feedback
    ##  Min.   :0.000                     
    ##  1st Qu.:4.000                     
    ##  Median :5.000                     
    ##  Mean   :4.535                     
    ##  3rd Qu.:5.000                     
    ##  Max.   :5.000                     
    ##  A - 10. I read the recommended readings and notes
    ##  Min.   :0.000                                    
    ##  1st Qu.:4.000                                    
    ##  Median :5.000                                    
    ##  Mean   :4.505                                    
    ##  3rd Qu.:5.000                                    
    ##  Max.   :5.000                                    
    ##  A - 11. I use the eLearning material posted
    ##  Min.   :0.000                              
    ##  1st Qu.:4.000                              
    ##  Median :5.000                              
    ##  Mean   :4.653                              
    ##  3rd Qu.:5.000                              
    ##  Max.   :5.000                              
    ##  B - 1. Concept 1 of 6: Principles of Business Intelligence and the DataOps Philosophy
    ##  Min.   :0.000                                                                        
    ##  1st Qu.:4.000                                                                        
    ##  Median :4.000                                                                        
    ##  Mean   :4.208                                                                        
    ##  3rd Qu.:5.000                                                                        
    ##  Max.   :5.000                                                                        
    ##  B - 2. Concept 3 of 6: Linear Algorithms for Predictive Analytics
    ##  Min.   :0.000                                                    
    ##  1st Qu.:3.000                                                    
    ##  Median :4.000                                                    
    ##  Mean   :3.901                                                    
    ##  3rd Qu.:5.000                                                    
    ##  Max.   :5.000                                                    
    ##  C - 2. Quizzes at the end of each concept
    ##  Min.   :0.000                            
    ##  1st Qu.:4.000                            
    ##  Median :5.000                            
    ##  Mean   :4.545                            
    ##  3rd Qu.:5.000                            
    ##  Max.   :5.000                            
    ##  C - 3. Lab manuals that outline the steps to follow during the labs
    ##  Min.   :0.000                                                      
    ##  1st Qu.:4.000                                                      
    ##  Median :5.000                                                      
    ##  Mean   :4.564                                                      
    ##  3rd Qu.:5.000                                                      
    ##  Max.   :5.000                                                      
    ##  C - 4. Required lab work submissions at the end of each lab manual that outline the activity to be done on your own
    ##  Min.   :0.000                                                                                                      
    ##  1st Qu.:4.000                                                                                                      
    ##  Median :5.000                                                                                                      
    ##  Mean   :4.505                                                                                                      
    ##  3rd Qu.:5.000                                                                                                      
    ##  Max.   :5.000                                                                                                      
    ##  C - 5. Supplementary videos to watch
    ##  Min.   :0.000                       
    ##  1st Qu.:4.000                       
    ##  Median :4.000                       
    ##  Mean   :4.149                       
    ##  3rd Qu.:5.000                       
    ##  Max.   :5.000                       
    ##  C - 6. Supplementary podcasts to listen to
    ##  Min.   :0.00                              
    ##  1st Qu.:4.00                              
    ##  Median :4.00                              
    ##  Mean   :4.04                              
    ##  3rd Qu.:5.00                              
    ##  Max.   :5.00                              
    ##  C - 7. Supplementary content to read C - 8. Lectures slides
    ##  Min.   :0.000                        Min.   :0.000         
    ##  1st Qu.:4.000                        1st Qu.:4.000         
    ##  Median :4.000                        Median :5.000         
    ##  Mean   :4.129                        Mean   :4.554         
    ##  3rd Qu.:5.000                        3rd Qu.:5.000         
    ##  Max.   :5.000                        Max.   :5.000         
    ##  C - 9. Lecture notes on some of the lecture slides
    ##  Min.   :0.000                                     
    ##  1st Qu.:4.000                                     
    ##  Median :5.000                                     
    ##  Mean   :4.554                                     
    ##  3rd Qu.:5.000                                     
    ##  Max.   :5.000                                     
    ##  C - 10. The quality of the lectures given (quality measured by the breadth (the full span of knowledge of a subject) and depth (the extent to which specific topics are focused upon, amplified, and explored) of learning - NOT quality measured by how fun/co
    ##  Min.   :0.000                                                                                                                                                                                                                                                  
    ##  1st Qu.:4.000                                                                                                                                                                                                                                                  
    ##  Median :5.000                                                                                                                                                                                                                                                  
    ##  Mean   :4.495                                                                                                                                                                                                                                                  
    ##  3rd Qu.:5.000                                                                                                                                                                                                                                                  
    ##  Max.   :5.000                                                                                                                                                                                                                                                  
    ##  C - 11. The division of theory and practice such that most of the theory is done during the recorded online classes and most of the practice is done during the physical classes
    ##  Min.   :0.000                                                                                                                                                                   
    ##  1st Qu.:4.000                                                                                                                                                                   
    ##  Median :5.000                                                                                                                                                                   
    ##  Mean   :4.446                                                                                                                                                                   
    ##  3rd Qu.:5.000                                                                                                                                                                   
    ##  Max.   :5.000                                                                                                                                                                   
    ##  C - 12. The recordings of online classes Average Course Evaluation Rating
    ##  Min.   :0.000                            Min.   :0.000                   
    ##  1st Qu.:4.000                            1st Qu.:4.273                   
    ##  Median :5.000                            Median :4.545                   
    ##  Mean   :4.287                            Mean   :4.486                   
    ##  3rd Qu.:5.000                            3rd Qu.:4.909                   
    ##  Max.   :5.000                            Max.   :5.000                   
    ##  Average Level of Learning Attained Rating Average_Rating 
    ##  Min.   :0.000                             Min.   :0.000  
    ##  1st Qu.:3.500                             1st Qu.:4.000  
    ##  Median :4.000                             Median :4.545  
    ##  Mean   :4.054                             Mean   :4.388  
    ##  3rd Qu.:4.500                             3rd Qu.:4.909  
    ##  Max.   :5.000                             Max.   :5.000  
    ##  Project: Section 1-4: (20%) x/10 Project: Section 5-11: (50%) x/10
    ##  Min.   : 0.000                   Min.   : 0.000                   
    ##  1st Qu.: 7.400                   1st Qu.: 6.000                   
    ##  Median : 8.500                   Median : 7.800                   
    ##  Mean   : 8.011                   Mean   : 6.582                   
    ##  3rd Qu.: 9.000                   3rd Qu.: 8.300                   
    ##  Max.   :10.000                   Max.   :10.000                   
    ##  Project: Section 12: (30%) x/5 Project: (10%): x/30 x 100 TOTAL
    ##  Min.   :0.000                  Min.   :  0.00                  
    ##  1st Qu.:0.000                  1st Qu.: 56.00                  
    ##  Median :0.000                  Median : 66.40                  
    ##  Mean   :1.005                  Mean   : 62.39                  
    ##  3rd Qu.:1.000                  3rd Qu.: 71.60                  
    ##  Max.   :5.000                  Max.   :100.00                  
    ##  Quiz 1 on Concept 1 (Introduction) x/32 Quiz 3 on Concept 3 (Linear) x/15
    ##  Min.   : 4.75                           Min.   : 0.000                   
    ##  1st Qu.:11.53                           1st Qu.: 7.000                   
    ##  Median :15.33                           Median : 9.000                   
    ##  Mean   :16.36                           Mean   : 9.342                   
    ##  3rd Qu.:19.63                           3rd Qu.:12.000                   
    ##  Max.   :31.25                           Max.   :15.000                   
    ##  Quiz 4 on Concept 4 (Non-Linear) x/22 Quiz 5 on Concept 5 (Dashboarding) x/10
    ##  Min.   : 0.00                         Min.   : 0.000                         
    ##  1st Qu.:10.17                         1st Qu.: 4.330                         
    ##  Median :13.08                         Median : 6.000                         
    ##  Mean   :13.11                         Mean   : 5.611                         
    ##  3rd Qu.:17.50                         3rd Qu.: 7.670                         
    ##  Max.   :22.00                         Max.   :12.670                         
    ##     Quizzes      Lab 1 - 2.c. - (Simple Linear Regression) x/5
    ##  Min.   :26.26   Min.   :0.000                                
    ##  1st Qu.:43.82   1st Qu.:5.000                                
    ##  Median :55.31   Median :5.000                                
    ##  Mean   :56.22   Mean   :4.752                                
    ##  3rd Qu.:65.16   3rd Qu.:5.000                                
    ##  Max.   :95.25   Max.   :5.000                                
    ##  Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5
    ##  Min.   :0.000                                                  
    ##  1st Qu.:4.850                                                  
    ##  Median :4.850                                                  
    ##  Mean   :4.218                                                  
    ##  3rd Qu.:4.850                                                  
    ##  Max.   :5.000                                                  
    ##  Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5
    ##  Min.   :0.000                                    
    ##  1st Qu.:2.850                                    
    ##  Median :4.850                                    
    ##  Mean   :3.636                                    
    ##  3rd Qu.:5.000                                    
    ##  Max.   :5.000                                    
    ##  Lab 5 - Chart JS Dashboard Setup x/5    LabWork            CAT1      
    ##  Min.   :0.000                        Min.   : 17.80   Min.   : 0.00  
    ##  1st Qu.:0.000                        1st Qu.: 70.80   1st Qu.:57.89  
    ##  Median :5.000                        Median : 80.00   Median :68.42  
    ##  Mean   :3.404                        Mean   : 79.72   Mean   :66.65  
    ##  3rd Qu.:5.000                        3rd Qu.: 97.20   3rd Qu.:82.89  
    ##  Max.   :5.000                        Max.   :100.00   Max.   :97.36  
    ##       CAT2        Absenteeism Percentage   Coursework         EXAM      
    ##  Min.   :  0.00   Min.   : 0.00          Min.   : 7.47   Min.   : 0.00  
    ##  1st Qu.:  0.00   1st Qu.: 7.41          1st Qu.:20.44   1st Qu.:25.00  
    ##  Median : 52.00   Median :14.81          Median :24.58   Median :33.00  
    ##  Mean   : 43.06   Mean   :15.42          Mean   :24.53   Mean   :32.59  
    ##  3rd Qu.: 68.00   3rd Qu.:22.22          3rd Qu.:29.31   3rd Qu.:42.00  
    ##  Max.   :100.00   Max.   :51.85          Max.   :35.08   Max.   :56.00  
    ##      TOTAL      
    ##  Min.   : 7.47  
    ##  1st Qu.:45.54  
    ##  Median :58.69  
    ##  Mean   :57.12  
    ##  3rd Qu.:68.83  
    ##  Max.   :87.72

``` r
hist(StudentPerformanceDataset$YOB, main = "Bar Plot of gender",
     xlab = "YOB", ylab = "Frequency", col = "purple")
```

![](Lab-Submission-Markdown_files/figure-gfm/Scale%20Data%20Transform-1.png)<!-- -->

``` r
hist(StudentPerformanceDataset$anticipate_test_questions, main = "Bar Plot of Anticipate test questions",
     xlab = "Anticipate test Questions", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/Scale%20Data%20Transform-2.png)<!-- -->

``` r
hist(StudentPerformanceDataset$gender, main = "Bar Plot of YOB",
     xlab = "Gender", ylab = "Frequency", col = "yellow")
```

![](Lab-Submission-Markdown_files/figure-gfm/Scale%20Data%20Transform-3.png)<!-- -->

``` r
hist(StudentPerformanceDataset$A1, main = "Bar Plot of enjoyin the Unit",
     xlab = "Bar Plot of enjoying the Unit", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/Scale%20Data%20Transform-4.png)<!-- -->

``` r
hist(StudentPerformanceDataset$Average_Rating, main = "Average_Rating",
     xlab = "Average_Rating", ylab = "Frequency", col = "pink")
```

![](Lab-Submission-Markdown_files/figure-gfm/Scale%20Data%20Transform-5.png)<!-- -->

``` r
hist(StudentPerformanceDataset$Quizzes, main = "Bar Plot of Quizzes",
     xlab = "Quizzes", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/Scale%20Data%20Transform-6.png)<!-- -->

``` r
hist(StudentPerformanceDataset$LabWork, main = "Bar Plot of LabWork",
     xlab = "LabWork ", ylab = "Frequency", col = "pink")
```

![](Lab-Submission-Markdown_files/figure-gfm/Scale%20Data%20Transform-7.png)<!-- -->

``` r
hist(StudentPerformanceDataset$CAT1, main = "Bar Plot of CAT1",
     xlab = "CAT1", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/Scale%20Data%20Transform-8.png)<!-- -->

``` r
hist(StudentPerformanceDataset$CAT2, main = "Bar Plot of CAT 2",
     xlab = "CAT2", ylab = "Frequency", col = "purple")
```

![](Lab-Submission-Markdown_files/figure-gfm/Scale%20Data%20Transform-9.png)<!-- -->

``` r
hist(StudentPerformanceDataset$Coursework, main = "Bar Plot of Coursework",
     xlab = "Coursework", ylab = "Frequency", col = "pink")
```

![](Lab-Submission-Markdown_files/figure-gfm/Scale%20Data%20Transform-10.png)<!-- -->

``` r
hist(StudentPerformanceDataset$EXAM, main = "Bar Plot of EXAM",
     xlab = "EXAM", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/Scale%20Data%20Transform-11.png)<!-- -->

``` r
hist(StudentPerformanceDataset$TOTAL, main = "Bar Plot of TOTAL Semester marks",
     xlab = "TOTAL Semester marks", ylab = "Frequency", col = "red")
```

![](Lab-Submission-Markdown_files/figure-gfm/Scale%20Data%20Transform-12.png)<!-- -->

``` r
# transformation
model_of_the_transform <- preProcess(StudentPerformanceDataset, method = c("scale"))
print(model_of_the_transform)
```

    ## Created from 101 samples and 91 variables
    ## 
    ## Pre-processing:
    ##   - ignored (0)
    ##   - scaled (91)

``` r
StudentPerformanceDataset_scale_transform <- predict(model_of_the_transform,
                                             StudentPerformanceDataset)

#Histogram after transformation
summary(StudentPerformanceDataset_scale_transform)
```

    ##      gender           YOB         motivator     read_content_before_lecture
    ##  Min.   :0.000   Min.   :2008   Min.   :0.000   Min.   :1.038              
    ##  1st Qu.:0.000   1st Qu.:2010   1st Qu.:2.306   1st Qu.:2.076              
    ##  Median :2.012   Median :2011   Median :2.306   Median :3.114              
    ##  Mean   :1.156   Mean   :2011   Mean   :1.735   Mean   :2.857              
    ##  3rd Qu.:2.012   3rd Qu.:2012   3rd Qu.:2.306   3rd Qu.:3.114              
    ##  Max.   :2.012   Max.   :2013   Max.   :2.306   Max.   :5.190              
    ##  anticipate_test_questions answer_rhetorical_questions find_terms_I_do_not_know
    ##  Min.   :1.007             Min.   :1.007               Min.   :0.9478          
    ##  1st Qu.:3.022             1st Qu.:3.020               1st Qu.:2.8435          
    ##  Median :4.030             Median :4.026               Median :3.7914          
    ##  Mean   :3.611             Mean   :3.448               Mean   :3.5474          
    ##  3rd Qu.:4.030             3rd Qu.:4.026               3rd Qu.:4.7392          
    ##  Max.   :5.037             Max.   :5.033               Max.   :4.7392          
    ##  copy_new_terms_in_reading_notebook take_quizzes_and_use_results
    ##  Min.   :0.9033                     Min.   :0.9299              
    ##  1st Qu.:2.7099                     1st Qu.:2.7897              
    ##  Median :3.6132                     Median :3.7196              
    ##  Mean   :3.3091                     Mean   :3.6644              
    ##  3rd Qu.:3.6132                     3rd Qu.:4.6495              
    ##  Max.   :4.5165                     Max.   :4.6495              
    ##  reorganise_course_outline write_down_important_points space_out_revision
    ##  Min.   :0.8648            Min.   :0.9279              Min.   :0.8847    
    ##  1st Qu.:2.5945            1st Qu.:2.7838              1st Qu.:2.6541    
    ##  Median :2.5945            Median :3.7117              Median :2.6541    
    ##  Mean   :2.9199            Mean   :3.5555              Mean   :2.8556    
    ##  3rd Qu.:3.4593            3rd Qu.:4.6396              3rd Qu.:3.5388    
    ##  Max.   :4.3241            Max.   :4.6396              Max.   :4.4235    
    ##  studying_in_study_group schedule_appointments goal_oriented   
    ##  Min.   :0.7473          Min.   :0.9782        Min.   :0.0000  
    ##  1st Qu.:0.7473          1st Qu.:0.9782        1st Qu.:0.0000  
    ##  Median :1.4947          Median :1.9563        Median :0.0000  
    ##  Mean   :1.8350          Mean   :1.8885        Mean   :0.4944  
    ##  3rd Qu.:2.2420          3rd Qu.:1.9563        3rd Qu.:0.0000  
    ##  Max.   :3.7367          Max.   :4.8908        Max.   :2.4969  
    ##  spaced_repetition testing_and_active_recall  interleaving    categorizing  
    ##  Min.   :1.204     Min.   :1.392             Min.   :1.345   Min.   :1.352  
    ##  1st Qu.:2.409     1st Qu.:4.175             1st Qu.:2.689   1st Qu.:2.705  
    ##  Median :3.613     Median :4.175             Median :2.689   Median :4.057  
    ##  Mean   :3.076     Mean   :4.257             Mean   :3.035   Mean   :3.669  
    ##  3rd Qu.:3.613     3rd Qu.:5.566             3rd Qu.:4.034   3rd Qu.:4.057  
    ##  Max.   :4.817     Max.   :5.566             Max.   :5.379   Max.   :5.410  
    ##  retrospective_timetable cornell_notes        sq3r           commute     
    ##  Min.   :1.130           Min.   :1.005   Min.   :0.9537   Min.   :0.000  
    ##  1st Qu.:2.259           1st Qu.:2.010   1st Qu.:1.9074   1st Qu.:1.864  
    ##  Median :2.259           Median :3.014   Median :2.8612   Median :2.796  
    ##  Mean   :2.718           Mean   :2.557   Mean   :2.4929   Mean   :2.520  
    ##  3rd Qu.:3.389           3rd Qu.:3.014   3rd Qu.:2.8612   3rd Qu.:3.729  
    ##  Max.   :4.519           Max.   :4.019   Max.   :3.8149   Max.   :3.729  
    ##    study_time    repeats_since_Y1  paid_tuition     free_tuition  
    ##  Min.   :0.000   Min.   :0.0000   Min.   :0.0000   Min.   :0.000  
    ##  1st Qu.:1.197   1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:0.000  
    ##  Median :2.394   Median :0.9482   Median :0.0000   Median :0.000  
    ##  Mean   :2.074   Mean   :0.9623   Mean   :0.3479   Mean   :0.601  
    ##  3rd Qu.:2.394   3rd Qu.:1.4223   3rd Qu.:0.0000   3rd Qu.:2.248  
    ##  Max.   :4.788   Max.   :4.7409   Max.   :3.1941   Max.   :2.248  
    ##  extra_curricular sports_extra_curricular exercise_per_week    meditate     
    ##  Min.   :0.000    Min.   :0.0000          Min.   :0.000     Min.   :0.0000  
    ##  1st Qu.:0.000    1st Qu.:0.0000          1st Qu.:1.229     1st Qu.:0.0000  
    ##  Median :1.993    Median :0.0000          Median :1.229     Median :1.0733  
    ##  Mean   :1.046    Mean   :0.7405          Mean   :1.339     Mean   :0.8076  
    ##  3rd Qu.:1.993    3rd Qu.:2.0776          3rd Qu.:2.458     3rd Qu.:1.0733  
    ##  Max.   :1.993    Max.   :2.0776          Max.   :3.687     Max.   :3.2198  
    ##       pray          internet    family_relationships  friendships   
    ##  Min.   :0.000   Min.   :0.00   Min.   :0.000        Min.   :0.000  
    ##  1st Qu.:0.960   1st Qu.:2.88   1st Qu.:4.451        1st Qu.:4.819  
    ##  Median :1.920   Median :2.88   Median :4.451        Median :4.819  
    ##  Mean   :1.986   Mean   :2.48   Mean   :4.616        Mean   :4.783  
    ##  3rd Qu.:2.880   3rd Qu.:2.88   3rd Qu.:5.563        3rd Qu.:4.819  
    ##  Max.   :2.880   Max.   :2.88   Max.   :5.563        Max.   :6.023  
    ##  romantic_relationships spiritual_wellnes financial_wellness     health     
    ##  Min.   :0.0000         Min.   :0.000     Min.   :0.000      Min.   :0.000  
    ##  1st Qu.:0.0000         1st Qu.:3.001     1st Qu.:1.768      1st Qu.:2.914  
    ##  Median :0.0000         Median :4.001     Median :2.652      Median :3.885  
    ##  Mean   :0.8458         Mean   :3.615     Mean   :2.652      Mean   :3.885  
    ##  3rd Qu.:1.8707         3rd Qu.:4.001     3rd Qu.:3.536      3rd Qu.:4.856  
    ##  Max.   :2.4943         Max.   :5.001     Max.   :4.419      Max.   :4.856  
    ##     day_out        night_out      alcohol_or_narcotics     mentor      
    ##  Min.   :0.000   Min.   :0.0000   Min.   :0.0000       Min.   :0.0000  
    ##  1st Qu.:0.000   1st Qu.:0.0000   1st Qu.:0.0000       1st Qu.:0.0000  
    ##  Median :1.751   Median :0.0000   Median :0.0000       Median :0.0000  
    ##  Mean   :1.387   Mean   :0.7862   Mean   :0.6237       Mean   :0.8225  
    ##  3rd Qu.:1.751   3rd Qu.:1.5570   3rd Qu.:1.7998       3rd Qu.:2.0263  
    ##  Max.   :5.252   Max.   :4.6711   Max.   :5.3994       Max.   :2.0263  
    ##  mentor_meetings        A1        A - 2. Classes start and end on time
    ##  Min.   :0.0000   Min.   :0.000   Min.   :0.000                       
    ##  1st Qu.:0.0000   1st Qu.:5.396   1st Qu.:5.934                       
    ##  Median :0.0000   Median :6.745   Median :7.417                       
    ##  Mean   :0.8035   Mean   :5.997   Mean   :6.874                       
    ##  3rd Qu.:1.1934   3rd Qu.:6.745   3rd Qu.:7.417                       
    ##  Max.   :3.5801   Max.   :6.745   Max.   :7.417                       
    ##  A - 3. The learning environment is participative, involves learning by doing and is group-based
    ##  Min.   :0.000                                                                                  
    ##  1st Qu.:5.101                                                                                  
    ##  Median :5.101                                                                                  
    ##  Mean   :5.493                                                                                  
    ##  3rd Qu.:6.377                                                                                  
    ##  Max.   :6.377                                                                                  
    ##  A - 4. The subject content is delivered according to the course outline and meets my expectations
    ##  Min.   :0.000                                                                                    
    ##  1st Qu.:6.066                                                                                    
    ##  Median :7.582                                                                                    
    ##  Mean   :7.117                                                                                    
    ##  3rd Qu.:7.582                                                                                    
    ##  Max.   :7.582                                                                                    
    ##  A - 5. The topics are clear and logically developed
    ##  Min.   :0.000                                      
    ##  1st Qu.:5.435                                      
    ##  Median :6.794                                      
    ##  Mean   :6.256                                      
    ##  3rd Qu.:6.794                                      
    ##  Max.   :6.794                                      
    ##  A - 6. I am developing my oral and writing skills
    ##  Min.   :0.000                                    
    ##  1st Qu.:4.159                                    
    ##  Median :4.159                                    
    ##  Mean   :4.231                                    
    ##  3rd Qu.:5.198                                    
    ##  Max.   :5.198                                    
    ##  A - 7. I am developing my reflective and critical reasoning skills
    ##  Min.   :0.000                                                     
    ##  1st Qu.:4.903                                                     
    ##  Median :4.903                                                     
    ##  Mean   :5.316                                                     
    ##  3rd Qu.:6.129                                                     
    ##  Max.   :6.129                                                     
    ##  A - 8. The assessment methods are assisting me to learn
    ##  Min.   :0.000                                          
    ##  1st Qu.:5.046                                          
    ##  Median :6.308                                          
    ##  Mean   :5.758                                          
    ##  3rd Qu.:6.308                                          
    ##  Max.   :6.308                                          
    ##  A - 9. I receive relevant feedback
    ##  Min.   :0.000                     
    ##  1st Qu.:5.594                     
    ##  Median :6.993                     
    ##  Mean   :6.342                     
    ##  3rd Qu.:6.993                     
    ##  Max.   :6.993                     
    ##  A - 10. I read the recommended readings and notes
    ##  Min.   :0.000                                    
    ##  1st Qu.:5.197                                    
    ##  Median :6.496                                    
    ##  Mean   :5.853                                    
    ##  3rd Qu.:6.496                                    
    ##  Max.   :6.496                                    
    ##  A - 11. I use the eLearning material posted
    ##  Min.   :0.000                              
    ##  1st Qu.:5.722                              
    ##  Median :7.152                              
    ##  Mean   :6.657                              
    ##  3rd Qu.:7.152                              
    ##  Max.   :7.152                              
    ##  B - 1. Concept 1 of 6: Principles of Business Intelligence and the DataOps Philosophy
    ##  Min.   :0.000                                                                        
    ##  1st Qu.:4.511                                                                        
    ##  Median :4.511                                                                        
    ##  Mean   :4.745                                                                        
    ##  3rd Qu.:5.639                                                                        
    ##  Max.   :5.639                                                                        
    ##  B - 2. Concept 3 of 6: Linear Algorithms for Predictive Analytics
    ##  Min.   :0.000                                                    
    ##  1st Qu.:3.180                                                    
    ##  Median :4.240                                                    
    ##  Mean   :4.135                                                    
    ##  3rd Qu.:5.300                                                    
    ##  Max.   :5.300                                                    
    ##  C - 2. Quizzes at the end of each concept
    ##  Min.   :0.000                            
    ##  1st Qu.:5.205                            
    ##  Median :6.507                            
    ##  Mean   :5.914                            
    ##  3rd Qu.:6.507                            
    ##  Max.   :6.507                            
    ##  C - 3. Lab manuals that outline the steps to follow during the labs
    ##  Min.   :0.000                                                      
    ##  1st Qu.:5.306                                                      
    ##  Median :6.632                                                      
    ##  Mean   :6.055                                                      
    ##  3rd Qu.:6.632                                                      
    ##  Max.   :6.632                                                      
    ##  C - 4. Required lab work submissions at the end of each lab manual that outline the activity to be done on your own
    ##  Min.   :0.000                                                                                                      
    ##  1st Qu.:5.287                                                                                                      
    ##  Median :6.608                                                                                                      
    ##  Mean   :5.954                                                                                                      
    ##  3rd Qu.:6.608                                                                                                      
    ##  Max.   :6.608                                                                                                      
    ##  C - 5. Supplementary videos to watch
    ##  Min.   :0.000                       
    ##  1st Qu.:4.109                       
    ##  Median :4.109                       
    ##  Mean   :4.261                       
    ##  3rd Qu.:5.136                       
    ##  Max.   :5.136                       
    ##  C - 6. Supplementary podcasts to listen to
    ##  Min.   :0.000                             
    ##  1st Qu.:3.749                             
    ##  Median :3.749                             
    ##  Mean   :3.786                             
    ##  3rd Qu.:4.686                             
    ##  Max.   :4.686                             
    ##  C - 7. Supplementary content to read C - 8. Lectures slides
    ##  Min.   :0.000                        Min.   :0.000         
    ##  1st Qu.:3.826                        1st Qu.:4.683         
    ##  Median :3.826                        Median :5.854         
    ##  Mean   :3.949                        Mean   :5.332         
    ##  3rd Qu.:4.782                        3rd Qu.:5.854         
    ##  Max.   :4.782                        Max.   :5.854         
    ##  C - 9. Lecture notes on some of the lecture slides
    ##  Min.   :0.000                                     
    ##  1st Qu.:5.124                                     
    ##  Median :6.404                                     
    ##  Mean   :5.834                                     
    ##  3rd Qu.:6.404                                     
    ##  Max.   :6.404                                     
    ##  C - 10. The quality of the lectures given (quality measured by the breadth (the full span of knowledge of a subject) and depth (the extent to which specific topics are focused upon, amplified, and explored) of learning - NOT quality measured by how fun/co
    ##  Min.   :0.000                                                                                                                                                                                                                                                  
    ##  1st Qu.:5.030                                                                                                                                                                                                                                                  
    ##  Median :6.287                                                                                                                                                                                                                                                  
    ##  Mean   :5.652                                                                                                                                                                                                                                                  
    ##  3rd Qu.:6.287                                                                                                                                                                                                                                                  
    ##  Max.   :6.287                                                                                                                                                                                                                                                  
    ##  C - 11. The division of theory and practice such that most of the theory is done during the recorded online classes and most of the practice is done during the physical classes
    ##  Min.   :0.000                                                                                                                                                                   
    ##  1st Qu.:4.889                                                                                                                                                                   
    ##  Median :6.111                                                                                                                                                                   
    ##  Mean   :5.433                                                                                                                                                                   
    ##  3rd Qu.:6.111                                                                                                                                                                   
    ##  Max.   :6.111                                                                                                                                                                   
    ##  C - 12. The recordings of online classes Average Course Evaluation Rating
    ##  Min.   :0.000                            Min.   :0.000                   
    ##  1st Qu.:4.201                            1st Qu.:7.102                   
    ##  Median :5.251                            Median :7.556                   
    ##  Mean   :4.502                            Mean   :7.457                   
    ##  3rd Qu.:5.251                            3rd Qu.:8.160                   
    ##  Max.   :5.251                            Max.   :8.311                   
    ##  Average Level of Learning Attained Rating Average_Rating 
    ##  Min.   :0.000                             Min.   :0.000  
    ##  1st Qu.:4.310                             1st Qu.:5.981  
    ##  Median :4.926                             Median :6.797  
    ##  Mean   :4.993                             Mean   :6.561  
    ##  3rd Qu.:5.541                             3rd Qu.:7.340  
    ##  Max.   :6.157                             Max.   :7.476  
    ##  Project: Section 1-4: (20%) x/10 Project: Section 5-11: (50%) x/10
    ##  Min.   :0.000                    Min.   :0.000                    
    ##  1st Qu.:3.521                    1st Qu.:2.151                    
    ##  Median :4.044                    Median :2.797                    
    ##  Mean   :3.811                    Mean   :2.360                    
    ##  3rd Qu.:4.282                    3rd Qu.:2.976                    
    ##  Max.   :4.758                    Max.   :3.585                    
    ##  Project: Section 12: (30%) x/5 Project: (10%): x/30 x 100 TOTAL
    ##  Min.   :0.0000                 Min.   :0.000                   
    ##  1st Qu.:0.0000                 1st Qu.:2.779                   
    ##  Median :0.0000                 Median :3.295                   
    ##  Mean   :0.5646                 Mean   :3.096                   
    ##  3rd Qu.:0.5618                 3rd Qu.:3.553                   
    ##  Max.   :2.8089                 Max.   :4.962                   
    ##  Quiz 1 on Concept 1 (Introduction) x/32 Quiz 3 on Concept 3 (Linear) x/15
    ##  Min.   :0.7302                          Min.   :0.000                    
    ##  1st Qu.:1.7724                          1st Qu.:2.089                    
    ##  Median :2.3565                          Median :2.686                    
    ##  Mean   :2.5144                          Mean   :2.788                    
    ##  3rd Qu.:3.0175                          3rd Qu.:3.581                    
    ##  Max.   :4.8038                          Max.   :4.476                    
    ##  Quiz 4 on Concept 4 (Non-Linear) x/22 Quiz 5 on Concept 5 (Dashboarding) x/10
    ##  Min.   :0.000                         Min.   :0.000                          
    ##  1st Qu.:1.875                         1st Qu.:1.515                          
    ##  Median :2.411                         Median :2.099                          
    ##  Mean   :2.416                         Mean   :1.963                          
    ##  3rd Qu.:3.226                         3rd Qu.:2.684                          
    ##  Max.   :4.056                         Max.   :4.433                          
    ##     Quizzes      Lab 1 - 2.c. - (Simple Linear Regression) x/5
    ##  Min.   :1.592   Min.   :0.000                                
    ##  1st Qu.:2.657   1st Qu.:5.429                                
    ##  Median :3.353   Median :5.429                                
    ##  Mean   :3.408   Mean   :5.160                                
    ##  3rd Qu.:3.951   3rd Qu.:5.429                                
    ##  Max.   :5.775   Max.   :5.429                                
    ##  Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5
    ##  Min.   :0.000                                                  
    ##  1st Qu.:3.322                                                  
    ##  Median :3.322                                                  
    ##  Mean   :2.889                                                  
    ##  3rd Qu.:3.322                                                  
    ##  Max.   :3.425                                                  
    ##  Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5
    ##  Min.   :0.000                                    
    ##  1st Qu.:1.510                                    
    ##  Median :2.570                                    
    ##  Mean   :1.927                                    
    ##  3rd Qu.:2.650                                    
    ##  Max.   :2.650                                    
    ##  Lab 5 - Chart JS Dashboard Setup x/5    LabWork            CAT1      
    ##  Min.   :0.000                        Min.   :0.9221   Min.   :0.000  
    ##  1st Qu.:0.000                        1st Qu.:3.6678   1st Qu.:2.878  
    ##  Median :2.143                        Median :4.1444   Median :3.402  
    ##  Mean   :1.459                        Mean   :4.1297   Mean   :3.313  
    ##  3rd Qu.:2.143                        3rd Qu.:5.0355   3rd Qu.:4.121  
    ##  Max.   :2.143                        Max.   :5.1805   Max.   :4.840  
    ##       CAT2       Absenteeism Percentage   Coursework         EXAM      
    ##  Min.   :0.000   Min.   :0.0000         Min.   :1.200   Min.   :0.000  
    ##  1st Qu.:0.000   1st Qu.:0.8153         1st Qu.:3.284   1st Qu.:1.941  
    ##  Median :1.471   Median :1.6295         Median :3.949   Median :2.562  
    ##  Mean   :1.218   Mean   :1.6961         Mean   :3.941   Mean   :2.530  
    ##  3rd Qu.:1.924   3rd Qu.:2.4448         3rd Qu.:4.709   3rd Qu.:3.261  
    ##  Max.   :2.829   Max.   :5.7049         Max.   :5.636   Max.   :4.347  
    ##      TOTAL      
    ##  Min.   :0.475  
    ##  1st Qu.:2.896  
    ##  Median :3.732  
    ##  Mean   :3.632  
    ##  3rd Qu.:4.377  
    ##  Max.   :5.578

``` r
hist(StudentPerformanceDataset_scale_transform$YOB, main = "Bar Plot of gender",
     xlab = "YOB", ylab = "Frequency", col = "purple")
```

![](Lab-Submission-Markdown_files/figure-gfm/Scale%20Data%20Transform-13.png)<!-- -->

``` r
hist(StudentPerformanceDataset_scale_transform$anticipate_test_questions, main = "Bar Plot of Anticipate test questions",
     xlab = "Anticipate test Questions", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/Scale%20Data%20Transform-14.png)<!-- -->

``` r
hist(StudentPerformanceDataset_scale_transform$gender, main = "Bar Plot of YOB",
     xlab = "Gender", ylab = "Frequency", col = "yellow")
```

![](Lab-Submission-Markdown_files/figure-gfm/Scale%20Data%20Transform-15.png)<!-- -->

``` r
hist(StudentPerformanceDataset_scale_transform$A1, main = "Bar Plot of enjoyin the Unit",
     xlab = "Bar Plot of enjoying the Unit", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/Scale%20Data%20Transform-16.png)<!-- -->

``` r
hist(StudentPerformanceDataset_scale_transform$Average_Rating, main = "Average_Rating",
     xlab = "Average_Rating", ylab = "Frequency", col = "pink")
```

![](Lab-Submission-Markdown_files/figure-gfm/Scale%20Data%20Transform-17.png)<!-- -->

``` r
hist(StudentPerformanceDataset_scale_transform$Quizzes, main = "Bar Plot of Quizzes",
     xlab = "Quizzes", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/Scale%20Data%20Transform-18.png)<!-- -->

``` r
hist(StudentPerformanceDataset_scale_transform$LabWork, main = "Bar Plot of LabWork",
     xlab = "LabWork ", ylab = "Frequency", col = "pink")
```

![](Lab-Submission-Markdown_files/figure-gfm/Scale%20Data%20Transform-19.png)<!-- -->

``` r
hist(StudentPerformanceDataset_scale_transform$CAT1, main = "Bar Plot of CAT1",
     xlab = "CAT1", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/Scale%20Data%20Transform-20.png)<!-- -->

``` r
hist(StudentPerformanceDataset_scale_transform$CAT2, main = "Bar Plot of CAT 2",
     xlab = "CAT2", ylab = "Frequency", col = "purple")
```

![](Lab-Submission-Markdown_files/figure-gfm/Scale%20Data%20Transform-21.png)<!-- -->

``` r
hist(StudentPerformanceDataset_scale_transform$Coursework, main = "Bar Plot of Coursework",
     xlab = "Coursework", ylab = "Frequency", col = "pink")
```

![](Lab-Submission-Markdown_files/figure-gfm/Scale%20Data%20Transform-22.png)<!-- -->

``` r
hist(StudentPerformanceDataset_scale_transform$EXAM, main = "Bar Plot of EXAM",
     xlab = "EXAM", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/Scale%20Data%20Transform-23.png)<!-- -->

``` r
hist(StudentPerformanceDataset_scale_transform$TOTAL, main = "Bar Plot of TOTAL Semester marks",
     xlab = "TOTAL Semester marks", ylab = "Frequency", col = "red")
```

![](Lab-Submission-Markdown_files/figure-gfm/Scale%20Data%20Transform-24.png)<!-- -->

``` r
#visualization using Boxplot
#Boxplot before transformation
summary(StudentPerformanceDataset)
```

    ##      gender            YOB         motivator      read_content_before_lecture
    ##  Min.   :0.0000   Min.   :1998   Min.   :0.0000   Min.   :1.000              
    ##  1st Qu.:0.0000   1st Qu.:2000   1st Qu.:1.0000   1st Qu.:2.000              
    ##  Median :1.0000   Median :2001   Median :1.0000   Median :3.000              
    ##  Mean   :0.5743   Mean   :2001   Mean   :0.7525   Mean   :2.752              
    ##  3rd Qu.:1.0000   3rd Qu.:2002   3rd Qu.:1.0000   3rd Qu.:3.000              
    ##  Max.   :1.0000   Max.   :2003   Max.   :1.0000   Max.   :5.000              
    ##  anticipate_test_questions answer_rhetorical_questions find_terms_I_do_not_know
    ##  Min.   :1.000             Min.   :1.000               Min.   :1.000           
    ##  1st Qu.:3.000             1st Qu.:3.000               1st Qu.:3.000           
    ##  Median :4.000             Median :4.000               Median :4.000           
    ##  Mean   :3.584             Mean   :3.426               Mean   :3.743           
    ##  3rd Qu.:4.000             3rd Qu.:4.000               3rd Qu.:5.000           
    ##  Max.   :5.000             Max.   :5.000               Max.   :5.000           
    ##  copy_new_terms_in_reading_notebook take_quizzes_and_use_results
    ##  Min.   :1.000                      Min.   :1.000               
    ##  1st Qu.:3.000                      1st Qu.:3.000               
    ##  Median :4.000                      Median :4.000               
    ##  Mean   :3.663                      Mean   :3.941               
    ##  3rd Qu.:4.000                      3rd Qu.:5.000               
    ##  Max.   :5.000                      Max.   :5.000               
    ##  reorganise_course_outline write_down_important_points space_out_revision
    ##  Min.   :1.000             Min.   :1.000               Min.   :1.000     
    ##  1st Qu.:3.000             1st Qu.:3.000               1st Qu.:3.000     
    ##  Median :3.000             Median :4.000               Median :3.000     
    ##  Mean   :3.376             Mean   :3.832               Mean   :3.228     
    ##  3rd Qu.:4.000             3rd Qu.:5.000               3rd Qu.:4.000     
    ##  Max.   :5.000             Max.   :5.000               Max.   :5.000     
    ##  studying_in_study_group schedule_appointments goal_oriented  
    ##  Min.   :1.000           Min.   :1.000         Min.   :0.000  
    ##  1st Qu.:1.000           1st Qu.:1.000         1st Qu.:0.000  
    ##  Median :2.000           Median :2.000         Median :0.000  
    ##  Mean   :2.455           Mean   :1.931         Mean   :0.198  
    ##  3rd Qu.:3.000           3rd Qu.:2.000         3rd Qu.:0.000  
    ##  Max.   :5.000           Max.   :5.000         Max.   :1.000  
    ##  spaced_repetition testing_and_active_recall  interleaving    categorizing  
    ##  Min.   :1.000     Min.   :1.000             Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:2.000     1st Qu.:3.000             1st Qu.:2.000   1st Qu.:2.000  
    ##  Median :3.000     Median :3.000             Median :2.000   Median :3.000  
    ##  Mean   :2.554     Mean   :3.059             Mean   :2.257   Mean   :2.713  
    ##  3rd Qu.:3.000     3rd Qu.:4.000             3rd Qu.:3.000   3rd Qu.:3.000  
    ##  Max.   :4.000     Max.   :4.000             Max.   :4.000   Max.   :4.000  
    ##  retrospective_timetable cornell_notes        sq3r          commute     
    ##  Min.   :1.000           Min.   :1.000   Min.   :1.000   Min.   :0.000  
    ##  1st Qu.:2.000           1st Qu.:2.000   1st Qu.:2.000   1st Qu.:2.000  
    ##  Median :2.000           Median :3.000   Median :3.000   Median :3.000  
    ##  Mean   :2.406           Mean   :2.545   Mean   :2.614   Mean   :2.703  
    ##  3rd Qu.:3.000           3rd Qu.:3.000   3rd Qu.:3.000   3rd Qu.:4.000  
    ##  Max.   :4.000           Max.   :4.000   Max.   :4.000   Max.   :4.000  
    ##    study_time    repeats_since_Y1  paid_tuition     free_tuition   
    ##  Min.   :0.000   Min.   : 0.00    Min.   :0.0000   Min.   :0.0000  
    ##  1st Qu.:1.000   1st Qu.: 0.00    1st Qu.:0.0000   1st Qu.:0.0000  
    ##  Median :2.000   Median : 2.00    Median :0.0000   Median :0.0000  
    ##  Mean   :1.733   Mean   : 2.03    Mean   :0.1089   Mean   :0.2673  
    ##  3rd Qu.:2.000   3rd Qu.: 3.00    3rd Qu.:0.0000   3rd Qu.:1.0000  
    ##  Max.   :4.000   Max.   :10.00    Max.   :1.0000   Max.   :1.0000  
    ##  extra_curricular sports_extra_curricular exercise_per_week    meditate     
    ##  Min.   :0.0000   Min.   :0.0000          Min.   :0.000     Min.   :0.0000  
    ##  1st Qu.:0.0000   1st Qu.:0.0000          1st Qu.:1.000     1st Qu.:0.0000  
    ##  Median :1.0000   Median :0.0000          Median :1.000     Median :1.0000  
    ##  Mean   :0.5248   Mean   :0.3564          Mean   :1.089     Mean   :0.7525  
    ##  3rd Qu.:1.0000   3rd Qu.:1.0000          3rd Qu.:2.000     3rd Qu.:1.0000  
    ##  Max.   :1.0000   Max.   :1.0000          Max.   :3.000     Max.   :3.0000  
    ##       pray          internet      family_relationships  friendships  
    ##  Min.   :0.000   Min.   :0.0000   Min.   :0.000        Min.   :0.00  
    ##  1st Qu.:1.000   1st Qu.:1.0000   1st Qu.:4.000        1st Qu.:4.00  
    ##  Median :2.000   Median :1.0000   Median :4.000        Median :4.00  
    ##  Mean   :2.069   Mean   :0.8614   Mean   :4.149        Mean   :3.97  
    ##  3rd Qu.:3.000   3rd Qu.:1.0000   3rd Qu.:5.000        3rd Qu.:4.00  
    ##  Max.   :3.000   Max.   :1.0000   Max.   :5.000        Max.   :5.00  
    ##  romantic_relationships spiritual_wellnes financial_wellness     health 
    ##  Min.   :0.000          Min.   :0.000     Min.   :0          Min.   :0  
    ##  1st Qu.:0.000          1st Qu.:3.000     1st Qu.:2          1st Qu.:3  
    ##  Median :0.000          Median :4.000     Median :3          Median :4  
    ##  Mean   :1.356          Mean   :3.614     Mean   :3          Mean   :4  
    ##  3rd Qu.:3.000          3rd Qu.:4.000     3rd Qu.:4          3rd Qu.:5  
    ##  Max.   :4.000          Max.   :5.000     Max.   :5          Max.   :5  
    ##     day_out         night_out     alcohol_or_narcotics     mentor      
    ##  Min.   :0.0000   Min.   :0.000   Min.   :0.0000       Min.   :0.0000  
    ##  1st Qu.:0.0000   1st Qu.:0.000   1st Qu.:0.0000       1st Qu.:0.0000  
    ##  Median :1.0000   Median :0.000   Median :0.0000       Median :0.0000  
    ##  Mean   :0.7921   Mean   :0.505   Mean   :0.3465       Mean   :0.4059  
    ##  3rd Qu.:1.0000   3rd Qu.:1.000   3rd Qu.:1.0000       3rd Qu.:1.0000  
    ##  Max.   :3.0000   Max.   :3.000   Max.   :3.0000       Max.   :1.0000  
    ##  mentor_meetings        A1        A - 2. Classes start and end on time
    ##  Min.   :0.0000   Min.   :0.000   Min.   :0.000                       
    ##  1st Qu.:0.0000   1st Qu.:4.000   1st Qu.:4.000                       
    ##  Median :0.0000   Median :5.000   Median :5.000                       
    ##  Mean   :0.6733   Mean   :4.446   Mean   :4.634                       
    ##  3rd Qu.:1.0000   3rd Qu.:5.000   3rd Qu.:5.000                       
    ##  Max.   :3.0000   Max.   :5.000   Max.   :5.000                       
    ##  A - 3. The learning environment is participative, involves learning by doing and is group-based
    ##  Min.   :0.000                                                                                  
    ##  1st Qu.:4.000                                                                                  
    ##  Median :4.000                                                                                  
    ##  Mean   :4.307                                                                                  
    ##  3rd Qu.:5.000                                                                                  
    ##  Max.   :5.000                                                                                  
    ##  A - 4. The subject content is delivered according to the course outline and meets my expectations
    ##  Min.   :0.000                                                                                    
    ##  1st Qu.:4.000                                                                                    
    ##  Median :5.000                                                                                    
    ##  Mean   :4.693                                                                                    
    ##  3rd Qu.:5.000                                                                                    
    ##  Max.   :5.000                                                                                    
    ##  A - 5. The topics are clear and logically developed
    ##  Min.   :0.000                                      
    ##  1st Qu.:4.000                                      
    ##  Median :5.000                                      
    ##  Mean   :4.604                                      
    ##  3rd Qu.:5.000                                      
    ##  Max.   :5.000                                      
    ##  A - 6. I am developing my oral and writing skills
    ##  Min.   :0.000                                    
    ##  1st Qu.:4.000                                    
    ##  Median :4.000                                    
    ##  Mean   :4.069                                    
    ##  3rd Qu.:5.000                                    
    ##  Max.   :5.000                                    
    ##  A - 7. I am developing my reflective and critical reasoning skills
    ##  Min.   :0.000                                                     
    ##  1st Qu.:4.000                                                     
    ##  Median :4.000                                                     
    ##  Mean   :4.337                                                     
    ##  3rd Qu.:5.000                                                     
    ##  Max.   :5.000                                                     
    ##  A - 8. The assessment methods are assisting me to learn
    ##  Min.   :0.000                                          
    ##  1st Qu.:4.000                                          
    ##  Median :5.000                                          
    ##  Mean   :4.564                                          
    ##  3rd Qu.:5.000                                          
    ##  Max.   :5.000                                          
    ##  A - 9. I receive relevant feedback
    ##  Min.   :0.000                     
    ##  1st Qu.:4.000                     
    ##  Median :5.000                     
    ##  Mean   :4.535                     
    ##  3rd Qu.:5.000                     
    ##  Max.   :5.000                     
    ##  A - 10. I read the recommended readings and notes
    ##  Min.   :0.000                                    
    ##  1st Qu.:4.000                                    
    ##  Median :5.000                                    
    ##  Mean   :4.505                                    
    ##  3rd Qu.:5.000                                    
    ##  Max.   :5.000                                    
    ##  A - 11. I use the eLearning material posted
    ##  Min.   :0.000                              
    ##  1st Qu.:4.000                              
    ##  Median :5.000                              
    ##  Mean   :4.653                              
    ##  3rd Qu.:5.000                              
    ##  Max.   :5.000                              
    ##  B - 1. Concept 1 of 6: Principles of Business Intelligence and the DataOps Philosophy
    ##  Min.   :0.000                                                                        
    ##  1st Qu.:4.000                                                                        
    ##  Median :4.000                                                                        
    ##  Mean   :4.208                                                                        
    ##  3rd Qu.:5.000                                                                        
    ##  Max.   :5.000                                                                        
    ##  B - 2. Concept 3 of 6: Linear Algorithms for Predictive Analytics
    ##  Min.   :0.000                                                    
    ##  1st Qu.:3.000                                                    
    ##  Median :4.000                                                    
    ##  Mean   :3.901                                                    
    ##  3rd Qu.:5.000                                                    
    ##  Max.   :5.000                                                    
    ##  C - 2. Quizzes at the end of each concept
    ##  Min.   :0.000                            
    ##  1st Qu.:4.000                            
    ##  Median :5.000                            
    ##  Mean   :4.545                            
    ##  3rd Qu.:5.000                            
    ##  Max.   :5.000                            
    ##  C - 3. Lab manuals that outline the steps to follow during the labs
    ##  Min.   :0.000                                                      
    ##  1st Qu.:4.000                                                      
    ##  Median :5.000                                                      
    ##  Mean   :4.564                                                      
    ##  3rd Qu.:5.000                                                      
    ##  Max.   :5.000                                                      
    ##  C - 4. Required lab work submissions at the end of each lab manual that outline the activity to be done on your own
    ##  Min.   :0.000                                                                                                      
    ##  1st Qu.:4.000                                                                                                      
    ##  Median :5.000                                                                                                      
    ##  Mean   :4.505                                                                                                      
    ##  3rd Qu.:5.000                                                                                                      
    ##  Max.   :5.000                                                                                                      
    ##  C - 5. Supplementary videos to watch
    ##  Min.   :0.000                       
    ##  1st Qu.:4.000                       
    ##  Median :4.000                       
    ##  Mean   :4.149                       
    ##  3rd Qu.:5.000                       
    ##  Max.   :5.000                       
    ##  C - 6. Supplementary podcasts to listen to
    ##  Min.   :0.00                              
    ##  1st Qu.:4.00                              
    ##  Median :4.00                              
    ##  Mean   :4.04                              
    ##  3rd Qu.:5.00                              
    ##  Max.   :5.00                              
    ##  C - 7. Supplementary content to read C - 8. Lectures slides
    ##  Min.   :0.000                        Min.   :0.000         
    ##  1st Qu.:4.000                        1st Qu.:4.000         
    ##  Median :4.000                        Median :5.000         
    ##  Mean   :4.129                        Mean   :4.554         
    ##  3rd Qu.:5.000                        3rd Qu.:5.000         
    ##  Max.   :5.000                        Max.   :5.000         
    ##  C - 9. Lecture notes on some of the lecture slides
    ##  Min.   :0.000                                     
    ##  1st Qu.:4.000                                     
    ##  Median :5.000                                     
    ##  Mean   :4.554                                     
    ##  3rd Qu.:5.000                                     
    ##  Max.   :5.000                                     
    ##  C - 10. The quality of the lectures given (quality measured by the breadth (the full span of knowledge of a subject) and depth (the extent to which specific topics are focused upon, amplified, and explored) of learning - NOT quality measured by how fun/co
    ##  Min.   :0.000                                                                                                                                                                                                                                                  
    ##  1st Qu.:4.000                                                                                                                                                                                                                                                  
    ##  Median :5.000                                                                                                                                                                                                                                                  
    ##  Mean   :4.495                                                                                                                                                                                                                                                  
    ##  3rd Qu.:5.000                                                                                                                                                                                                                                                  
    ##  Max.   :5.000                                                                                                                                                                                                                                                  
    ##  C - 11. The division of theory and practice such that most of the theory is done during the recorded online classes and most of the practice is done during the physical classes
    ##  Min.   :0.000                                                                                                                                                                   
    ##  1st Qu.:4.000                                                                                                                                                                   
    ##  Median :5.000                                                                                                                                                                   
    ##  Mean   :4.446                                                                                                                                                                   
    ##  3rd Qu.:5.000                                                                                                                                                                   
    ##  Max.   :5.000                                                                                                                                                                   
    ##  C - 12. The recordings of online classes Average Course Evaluation Rating
    ##  Min.   :0.000                            Min.   :0.000                   
    ##  1st Qu.:4.000                            1st Qu.:4.273                   
    ##  Median :5.000                            Median :4.545                   
    ##  Mean   :4.287                            Mean   :4.486                   
    ##  3rd Qu.:5.000                            3rd Qu.:4.909                   
    ##  Max.   :5.000                            Max.   :5.000                   
    ##  Average Level of Learning Attained Rating Average_Rating 
    ##  Min.   :0.000                             Min.   :0.000  
    ##  1st Qu.:3.500                             1st Qu.:4.000  
    ##  Median :4.000                             Median :4.545  
    ##  Mean   :4.054                             Mean   :4.388  
    ##  3rd Qu.:4.500                             3rd Qu.:4.909  
    ##  Max.   :5.000                             Max.   :5.000  
    ##  Project: Section 1-4: (20%) x/10 Project: Section 5-11: (50%) x/10
    ##  Min.   : 0.000                   Min.   : 0.000                   
    ##  1st Qu.: 7.400                   1st Qu.: 6.000                   
    ##  Median : 8.500                   Median : 7.800                   
    ##  Mean   : 8.011                   Mean   : 6.582                   
    ##  3rd Qu.: 9.000                   3rd Qu.: 8.300                   
    ##  Max.   :10.000                   Max.   :10.000                   
    ##  Project: Section 12: (30%) x/5 Project: (10%): x/30 x 100 TOTAL
    ##  Min.   :0.000                  Min.   :  0.00                  
    ##  1st Qu.:0.000                  1st Qu.: 56.00                  
    ##  Median :0.000                  Median : 66.40                  
    ##  Mean   :1.005                  Mean   : 62.39                  
    ##  3rd Qu.:1.000                  3rd Qu.: 71.60                  
    ##  Max.   :5.000                  Max.   :100.00                  
    ##  Quiz 1 on Concept 1 (Introduction) x/32 Quiz 3 on Concept 3 (Linear) x/15
    ##  Min.   : 4.75                           Min.   : 0.000                   
    ##  1st Qu.:11.53                           1st Qu.: 7.000                   
    ##  Median :15.33                           Median : 9.000                   
    ##  Mean   :16.36                           Mean   : 9.342                   
    ##  3rd Qu.:19.63                           3rd Qu.:12.000                   
    ##  Max.   :31.25                           Max.   :15.000                   
    ##  Quiz 4 on Concept 4 (Non-Linear) x/22 Quiz 5 on Concept 5 (Dashboarding) x/10
    ##  Min.   : 0.00                         Min.   : 0.000                         
    ##  1st Qu.:10.17                         1st Qu.: 4.330                         
    ##  Median :13.08                         Median : 6.000                         
    ##  Mean   :13.11                         Mean   : 5.611                         
    ##  3rd Qu.:17.50                         3rd Qu.: 7.670                         
    ##  Max.   :22.00                         Max.   :12.670                         
    ##     Quizzes      Lab 1 - 2.c. - (Simple Linear Regression) x/5
    ##  Min.   :26.26   Min.   :0.000                                
    ##  1st Qu.:43.82   1st Qu.:5.000                                
    ##  Median :55.31   Median :5.000                                
    ##  Mean   :56.22   Mean   :4.752                                
    ##  3rd Qu.:65.16   3rd Qu.:5.000                                
    ##  Max.   :95.25   Max.   :5.000                                
    ##  Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5
    ##  Min.   :0.000                                                  
    ##  1st Qu.:4.850                                                  
    ##  Median :4.850                                                  
    ##  Mean   :4.218                                                  
    ##  3rd Qu.:4.850                                                  
    ##  Max.   :5.000                                                  
    ##  Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5
    ##  Min.   :0.000                                    
    ##  1st Qu.:2.850                                    
    ##  Median :4.850                                    
    ##  Mean   :3.636                                    
    ##  3rd Qu.:5.000                                    
    ##  Max.   :5.000                                    
    ##  Lab 5 - Chart JS Dashboard Setup x/5    LabWork            CAT1      
    ##  Min.   :0.000                        Min.   : 17.80   Min.   : 0.00  
    ##  1st Qu.:0.000                        1st Qu.: 70.80   1st Qu.:57.89  
    ##  Median :5.000                        Median : 80.00   Median :68.42  
    ##  Mean   :3.404                        Mean   : 79.72   Mean   :66.65  
    ##  3rd Qu.:5.000                        3rd Qu.: 97.20   3rd Qu.:82.89  
    ##  Max.   :5.000                        Max.   :100.00   Max.   :97.36  
    ##       CAT2        Absenteeism Percentage   Coursework         EXAM      
    ##  Min.   :  0.00   Min.   : 0.00          Min.   : 7.47   Min.   : 0.00  
    ##  1st Qu.:  0.00   1st Qu.: 7.41          1st Qu.:20.44   1st Qu.:25.00  
    ##  Median : 52.00   Median :14.81          Median :24.58   Median :33.00  
    ##  Mean   : 43.06   Mean   :15.42          Mean   :24.53   Mean   :32.59  
    ##  3rd Qu.: 68.00   3rd Qu.:22.22          3rd Qu.:29.31   3rd Qu.:42.00  
    ##  Max.   :100.00   Max.   :51.85          Max.   :35.08   Max.   :56.00  
    ##      TOTAL      
    ##  Min.   : 7.47  
    ##  1st Qu.:45.54  
    ##  Median :58.69  
    ##  Mean   :57.12  
    ##  3rd Qu.:68.83  
    ##  Max.   :87.72

``` r
boxplot(StudentPerformanceDataset$YOB, main = "boxplot of gender",
     xlab = "YOB", ylab = "Frequency", col = "purple")
```

![](Lab-Submission-Markdown_files/figure-gfm/The%20Centre%20Basic%20Transform-1.png)<!-- -->

``` r
boxplot(StudentPerformanceDataset$anticipate_test_questions, main = "boxplot of Anticipate test questions",
     xlab = "Anticipate test Questions", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/The%20Centre%20Basic%20Transform-2.png)<!-- -->

``` r
boxplot(StudentPerformanceDataset$gender, main = "boxplot of YOB",
     xlab = "Gender", ylab = "Frequency", col = "yellow")
```

![](Lab-Submission-Markdown_files/figure-gfm/The%20Centre%20Basic%20Transform-3.png)<!-- -->

``` r
boxplot(StudentPerformanceDataset$A1, main = "boxplot of enjoyin the Unit",
     xlab = "Boxplot of enjoying the Unit", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/The%20Centre%20Basic%20Transform-4.png)<!-- -->

``` r
boxplot(StudentPerformanceDataset$Average_Rating, main = "Average_Rating",
     xlab = "Average_Rating", ylab = "Frequency", col = "pink")
```

![](Lab-Submission-Markdown_files/figure-gfm/The%20Centre%20Basic%20Transform-5.png)<!-- -->

``` r
boxplot(StudentPerformanceDataset$Quizzes, main = "Boxplot of Quizzes",
     xlab = "Quizzes", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/The%20Centre%20Basic%20Transform-6.png)<!-- -->

``` r
boxplot(StudentPerformanceDataset$LabWork, main = "Boxplot of LabWork",
     xlab = "LabWork ", ylab = "Frequency", col = "pink")
```

![](Lab-Submission-Markdown_files/figure-gfm/The%20Centre%20Basic%20Transform-7.png)<!-- -->

``` r
boxplot(StudentPerformanceDataset$CAT1, main = "Boxplot of CAT1",
     xlab = "CAT1", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/The%20Centre%20Basic%20Transform-8.png)<!-- -->

``` r
boxplot(StudentPerformanceDataset$CAT2, main = "Boxplot of CAT 2",
     xlab = "CAT2", ylab = "Frequency", col = "purple")
```

![](Lab-Submission-Markdown_files/figure-gfm/The%20Centre%20Basic%20Transform-9.png)<!-- -->

``` r
boxplot(StudentPerformanceDataset$Coursework, main = "Boxplot of Coursework",
     xlab = "Coursework", ylab = "Frequency", col = "pink")
```

![](Lab-Submission-Markdown_files/figure-gfm/The%20Centre%20Basic%20Transform-10.png)<!-- -->

``` r
boxplot(StudentPerformanceDataset$EXAM, main = "Boxplot of EXAM",
     xlab = "EXAM", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/The%20Centre%20Basic%20Transform-11.png)<!-- -->

``` r
boxplot(StudentPerformanceDataset$TOTAL, main = "Boxplot of TOTAL Semester marks",
     xlab = "TOTAL Semester marks", ylab = "Frequency", col = "red")
```

![](Lab-Submission-Markdown_files/figure-gfm/The%20Centre%20Basic%20Transform-12.png)<!-- -->

``` r
#Transformation
model_of_the_transform <- preProcess(StudentPerformanceDataset, method = c("center"))
print(model_of_the_transform)
```

    ## Created from 101 samples and 91 variables
    ## 
    ## Pre-processing:
    ##   - centered (91)
    ##   - ignored (0)

``` r
StudentPerformanceDataset_center_transform <- predict(model_of_the_transform, # nolint
                                           StudentPerformanceDataset)




#Boxplot after transformation
summary(StudentPerformanceDataset_center_transform)
```

    ##      gender             YOB             motivator      
    ##  Min.   :-0.5743   Min.   :-2.90099   Min.   :-0.7525  
    ##  1st Qu.:-0.5743   1st Qu.:-0.90099   1st Qu.: 0.2475  
    ##  Median : 0.4257   Median : 0.09901   Median : 0.2475  
    ##  Mean   : 0.0000   Mean   : 0.00000   Mean   : 0.0000  
    ##  3rd Qu.: 0.4257   3rd Qu.: 1.09901   3rd Qu.: 0.2475  
    ##  Max.   : 0.4257   Max.   : 2.09901   Max.   : 0.2475  
    ##  read_content_before_lecture anticipate_test_questions
    ##  Min.   :-1.7525             Min.   :-2.5842          
    ##  1st Qu.:-0.7525             1st Qu.:-0.5842          
    ##  Median : 0.2475             Median : 0.4158          
    ##  Mean   : 0.0000             Mean   : 0.0000          
    ##  3rd Qu.: 0.2475             3rd Qu.: 0.4158          
    ##  Max.   : 2.2475             Max.   : 1.4158          
    ##  answer_rhetorical_questions find_terms_I_do_not_know
    ##  Min.   :-2.4257             Min.   :-2.7426         
    ##  1st Qu.:-0.4257             1st Qu.:-0.7426         
    ##  Median : 0.5743             Median : 0.2574         
    ##  Mean   : 0.0000             Mean   : 0.0000         
    ##  3rd Qu.: 0.5743             3rd Qu.: 1.2574         
    ##  Max.   : 1.5743             Max.   : 1.2574         
    ##  copy_new_terms_in_reading_notebook take_quizzes_and_use_results
    ##  Min.   :-2.6634                    Min.   :-2.94059            
    ##  1st Qu.:-0.6634                    1st Qu.:-0.94059            
    ##  Median : 0.3366                    Median : 0.05941            
    ##  Mean   : 0.0000                    Mean   : 0.00000            
    ##  3rd Qu.: 0.3366                    3rd Qu.: 1.05941            
    ##  Max.   : 1.3366                    Max.   : 1.05941            
    ##  reorganise_course_outline write_down_important_points space_out_revision
    ##  Min.   :-2.3762           Min.   :-2.8317             Min.   :-2.2277   
    ##  1st Qu.:-0.3762           1st Qu.:-0.8317             1st Qu.:-0.2277   
    ##  Median :-0.3762           Median : 0.1683             Median :-0.2277   
    ##  Mean   : 0.0000           Mean   : 0.0000             Mean   : 0.0000   
    ##  3rd Qu.: 0.6238           3rd Qu.: 1.1683             3rd Qu.: 0.7723   
    ##  Max.   : 1.6238           Max.   : 1.1683             Max.   : 1.7723   
    ##  studying_in_study_group schedule_appointments goal_oriented   
    ##  Min.   :-1.4554         Min.   :-0.93069      Min.   :-0.198  
    ##  1st Qu.:-1.4554         1st Qu.:-0.93069      1st Qu.:-0.198  
    ##  Median :-0.4554         Median : 0.06931      Median :-0.198  
    ##  Mean   : 0.0000         Mean   : 0.00000      Mean   : 0.000  
    ##  3rd Qu.: 0.5446         3rd Qu.: 0.06931      3rd Qu.:-0.198  
    ##  Max.   : 2.5446         Max.   : 3.06931      Max.   : 0.802  
    ##  spaced_repetition testing_and_active_recall  interleaving    
    ##  Min.   :-1.5545   Min.   :-2.05941          Min.   :-1.2574  
    ##  1st Qu.:-0.5545   1st Qu.:-0.05941          1st Qu.:-0.2574  
    ##  Median : 0.4455   Median :-0.05941          Median :-0.2574  
    ##  Mean   : 0.0000   Mean   : 0.00000          Mean   : 0.0000  
    ##  3rd Qu.: 0.4455   3rd Qu.: 0.94059          3rd Qu.: 0.7426  
    ##  Max.   : 1.4455   Max.   : 0.94059          Max.   : 1.7426  
    ##   categorizing     retrospective_timetable cornell_notes          sq3r        
    ##  Min.   :-1.7129   Min.   :-1.4059         Min.   :-1.5446   Min.   :-1.6139  
    ##  1st Qu.:-0.7129   1st Qu.:-0.4059         1st Qu.:-0.5446   1st Qu.:-0.6139  
    ##  Median : 0.2871   Median :-0.4059         Median : 0.4554   Median : 0.3861  
    ##  Mean   : 0.0000   Mean   : 0.0000         Mean   : 0.0000   Mean   : 0.0000  
    ##  3rd Qu.: 0.2871   3rd Qu.: 0.5941         3rd Qu.: 0.4554   3rd Qu.: 0.3861  
    ##  Max.   : 1.2871   Max.   : 1.5941         Max.   : 1.4554   Max.   : 1.3861  
    ##     commute         study_time      repeats_since_Y1   paid_tuition    
    ##  Min.   :-2.703   Min.   :-1.7327   Min.   :-2.0297   Min.   :-0.1089  
    ##  1st Qu.:-0.703   1st Qu.:-0.7327   1st Qu.:-2.0297   1st Qu.:-0.1089  
    ##  Median : 0.297   Median : 0.2673   Median :-0.0297   Median :-0.1089  
    ##  Mean   : 0.000   Mean   : 0.0000   Mean   : 0.0000   Mean   : 0.0000  
    ##  3rd Qu.: 1.297   3rd Qu.: 0.2673   3rd Qu.: 0.9703   3rd Qu.:-0.1089  
    ##  Max.   : 1.297   Max.   : 2.2673   Max.   : 7.9703   Max.   : 0.8911  
    ##   free_tuition     extra_curricular  sports_extra_curricular exercise_per_week 
    ##  Min.   :-0.2673   Min.   :-0.5248   Min.   :-0.3564         Min.   :-1.08911  
    ##  1st Qu.:-0.2673   1st Qu.:-0.5248   1st Qu.:-0.3564         1st Qu.:-0.08911  
    ##  Median :-0.2673   Median : 0.4752   Median :-0.3564         Median :-0.08911  
    ##  Mean   : 0.0000   Mean   : 0.0000   Mean   : 0.0000         Mean   : 0.00000  
    ##  3rd Qu.: 0.7327   3rd Qu.: 0.4752   3rd Qu.: 0.6436         3rd Qu.: 0.91089  
    ##  Max.   : 0.7327   Max.   : 0.4752   Max.   : 0.6436         Max.   : 1.91089  
    ##     meditate            pray             internet       family_relationships
    ##  Min.   :-0.7525   Min.   :-2.06931   Min.   :-0.8614   Min.   :-4.1485     
    ##  1st Qu.:-0.7525   1st Qu.:-1.06931   1st Qu.: 0.1386   1st Qu.:-0.1485     
    ##  Median : 0.2475   Median :-0.06931   Median : 0.1386   Median :-0.1485     
    ##  Mean   : 0.0000   Mean   : 0.00000   Mean   : 0.0000   Mean   : 0.0000     
    ##  3rd Qu.: 0.2475   3rd Qu.: 0.93069   3rd Qu.: 0.1386   3rd Qu.: 0.8515     
    ##  Max.   : 2.2475   Max.   : 0.93069   Max.   : 0.1386   Max.   : 0.8515     
    ##   friendships      romantic_relationships spiritual_wellnes financial_wellness
    ##  Min.   :-3.9703   Min.   :-1.356         Min.   :-3.6139   Min.   :-3        
    ##  1st Qu.: 0.0297   1st Qu.:-1.356         1st Qu.:-0.6139   1st Qu.:-1        
    ##  Median : 0.0297   Median :-1.356         Median : 0.3861   Median : 0        
    ##  Mean   : 0.0000   Mean   : 0.000         Mean   : 0.0000   Mean   : 0        
    ##  3rd Qu.: 0.0297   3rd Qu.: 1.644         3rd Qu.: 0.3861   3rd Qu.: 1        
    ##  Max.   : 1.0297   Max.   : 2.644         Max.   : 1.3861   Max.   : 2        
    ##      health      day_out          night_out      alcohol_or_narcotics
    ##  Min.   :-4   Min.   :-0.7921   Min.   :-0.505   Min.   :-0.3465     
    ##  1st Qu.:-1   1st Qu.:-0.7921   1st Qu.:-0.505   1st Qu.:-0.3465     
    ##  Median : 0   Median : 0.2079   Median :-0.505   Median :-0.3465     
    ##  Mean   : 0   Mean   : 0.0000   Mean   : 0.000   Mean   : 0.0000     
    ##  3rd Qu.: 1   3rd Qu.: 0.2079   3rd Qu.: 0.495   3rd Qu.: 0.6535     
    ##  Max.   : 1   Max.   : 2.2079   Max.   : 2.495   Max.   : 2.6535     
    ##      mentor        mentor_meetings         A1         
    ##  Min.   :-0.4059   Min.   :-0.6733   Min.   :-4.4455  
    ##  1st Qu.:-0.4059   1st Qu.:-0.6733   1st Qu.:-0.4455  
    ##  Median :-0.4059   Median :-0.6733   Median : 0.5545  
    ##  Mean   : 0.0000   Mean   : 0.0000   Mean   : 0.0000  
    ##  3rd Qu.: 0.5941   3rd Qu.: 0.3267   3rd Qu.: 0.5545  
    ##  Max.   : 0.5941   Max.   : 2.3267   Max.   : 0.5545  
    ##  A - 2. Classes start and end on time
    ##  Min.   :-4.6337                     
    ##  1st Qu.:-0.6337                     
    ##  Median : 0.3663                     
    ##  Mean   : 0.0000                     
    ##  3rd Qu.: 0.3663                     
    ##  Max.   : 0.3663                     
    ##  A - 3. The learning environment is participative, involves learning by doing and is group-based
    ##  Min.   :-4.3069                                                                                
    ##  1st Qu.:-0.3069                                                                                
    ##  Median :-0.3069                                                                                
    ##  Mean   : 0.0000                                                                                
    ##  3rd Qu.: 0.6931                                                                                
    ##  Max.   : 0.6931                                                                                
    ##  A - 4. The subject content is delivered according to the course outline and meets my expectations
    ##  Min.   :-4.6931                                                                                  
    ##  1st Qu.:-0.6931                                                                                  
    ##  Median : 0.3069                                                                                  
    ##  Mean   : 0.0000                                                                                  
    ##  3rd Qu.: 0.3069                                                                                  
    ##  Max.   : 0.3069                                                                                  
    ##  A - 5. The topics are clear and logically developed
    ##  Min.   :-4.604                                     
    ##  1st Qu.:-0.604                                     
    ##  Median : 0.396                                     
    ##  Mean   : 0.000                                     
    ##  3rd Qu.: 0.396                                     
    ##  Max.   : 0.396                                     
    ##  A - 6. I am developing my oral and writing skills
    ##  Min.   :-4.06931                                 
    ##  1st Qu.:-0.06931                                 
    ##  Median :-0.06931                                 
    ##  Mean   : 0.00000                                 
    ##  3rd Qu.: 0.93069                                 
    ##  Max.   : 0.93069                                 
    ##  A - 7. I am developing my reflective and critical reasoning skills
    ##  Min.   :-4.3366                                                   
    ##  1st Qu.:-0.3366                                                   
    ##  Median :-0.3366                                                   
    ##  Mean   : 0.0000                                                   
    ##  3rd Qu.: 0.6634                                                   
    ##  Max.   : 0.6634                                                   
    ##  A - 8. The assessment methods are assisting me to learn
    ##  Min.   :-4.5644                                        
    ##  1st Qu.:-0.5644                                        
    ##  Median : 0.4356                                        
    ##  Mean   : 0.0000                                        
    ##  3rd Qu.: 0.4356                                        
    ##  Max.   : 0.4356                                        
    ##  A - 9. I receive relevant feedback
    ##  Min.   :-4.5347                   
    ##  1st Qu.:-0.5347                   
    ##  Median : 0.4653                   
    ##  Mean   : 0.0000                   
    ##  3rd Qu.: 0.4653                   
    ##  Max.   : 0.4653                   
    ##  A - 10. I read the recommended readings and notes
    ##  Min.   :-4.505                                   
    ##  1st Qu.:-0.505                                   
    ##  Median : 0.495                                   
    ##  Mean   : 0.000                                   
    ##  3rd Qu.: 0.495                                   
    ##  Max.   : 0.495                                   
    ##  A - 11. I use the eLearning material posted
    ##  Min.   :-4.6535                            
    ##  1st Qu.:-0.6535                            
    ##  Median : 0.3465                            
    ##  Mean   : 0.0000                            
    ##  3rd Qu.: 0.3465                            
    ##  Max.   : 0.3465                            
    ##  B - 1. Concept 1 of 6: Principles of Business Intelligence and the DataOps Philosophy
    ##  Min.   :-4.2079                                                                      
    ##  1st Qu.:-0.2079                                                                      
    ##  Median :-0.2079                                                                      
    ##  Mean   : 0.0000                                                                      
    ##  3rd Qu.: 0.7921                                                                      
    ##  Max.   : 0.7921                                                                      
    ##  B - 2. Concept 3 of 6: Linear Algorithms for Predictive Analytics
    ##  Min.   :-3.90099                                                 
    ##  1st Qu.:-0.90099                                                 
    ##  Median : 0.09901                                                 
    ##  Mean   : 0.00000                                                 
    ##  3rd Qu.: 1.09901                                                 
    ##  Max.   : 1.09901                                                 
    ##  C - 2. Quizzes at the end of each concept
    ##  Min.   :-4.5446                          
    ##  1st Qu.:-0.5446                          
    ##  Median : 0.4554                          
    ##  Mean   : 0.0000                          
    ##  3rd Qu.: 0.4554                          
    ##  Max.   : 0.4554                          
    ##  C - 3. Lab manuals that outline the steps to follow during the labs
    ##  Min.   :-4.5644                                                    
    ##  1st Qu.:-0.5644                                                    
    ##  Median : 0.4356                                                    
    ##  Mean   : 0.0000                                                    
    ##  3rd Qu.: 0.4356                                                    
    ##  Max.   : 0.4356                                                    
    ##  C - 4. Required lab work submissions at the end of each lab manual that outline the activity to be done on your own
    ##  Min.   :-4.505                                                                                                     
    ##  1st Qu.:-0.505                                                                                                     
    ##  Median : 0.495                                                                                                     
    ##  Mean   : 0.000                                                                                                     
    ##  3rd Qu.: 0.495                                                                                                     
    ##  Max.   : 0.495                                                                                                     
    ##  C - 5. Supplementary videos to watch
    ##  Min.   :-4.1485                     
    ##  1st Qu.:-0.1485                     
    ##  Median :-0.1485                     
    ##  Mean   : 0.0000                     
    ##  3rd Qu.: 0.8515                     
    ##  Max.   : 0.8515                     
    ##  C - 6. Supplementary podcasts to listen to
    ##  Min.   :-4.0396                           
    ##  1st Qu.:-0.0396                           
    ##  Median :-0.0396                           
    ##  Mean   : 0.0000                           
    ##  3rd Qu.: 0.9604                           
    ##  Max.   : 0.9604                           
    ##  C - 7. Supplementary content to read C - 8. Lectures slides
    ##  Min.   :-4.1287                      Min.   :-4.5545       
    ##  1st Qu.:-0.1287                      1st Qu.:-0.5545       
    ##  Median :-0.1287                      Median : 0.4455       
    ##  Mean   : 0.0000                      Mean   : 0.0000       
    ##  3rd Qu.: 0.8713                      3rd Qu.: 0.4455       
    ##  Max.   : 0.8713                      Max.   : 0.4455       
    ##  C - 9. Lecture notes on some of the lecture slides
    ##  Min.   :-4.5545                                   
    ##  1st Qu.:-0.5545                                   
    ##  Median : 0.4455                                   
    ##  Mean   : 0.0000                                   
    ##  3rd Qu.: 0.4455                                   
    ##  Max.   : 0.4455                                   
    ##  C - 10. The quality of the lectures given (quality measured by the breadth (the full span of knowledge of a subject) and depth (the extent to which specific topics are focused upon, amplified, and explored) of learning - NOT quality measured by how fun/co
    ##  Min.   :-4.495                                                                                                                                                                                                                                                 
    ##  1st Qu.:-0.495                                                                                                                                                                                                                                                 
    ##  Median : 0.505                                                                                                                                                                                                                                                 
    ##  Mean   : 0.000                                                                                                                                                                                                                                                 
    ##  3rd Qu.: 0.505                                                                                                                                                                                                                                                 
    ##  Max.   : 0.505                                                                                                                                                                                                                                                 
    ##  C - 11. The division of theory and practice such that most of the theory is done during the recorded online classes and most of the practice is done during the physical classes
    ##  Min.   :-4.4455                                                                                                                                                                 
    ##  1st Qu.:-0.4455                                                                                                                                                                 
    ##  Median : 0.5545                                                                                                                                                                 
    ##  Mean   : 0.0000                                                                                                                                                                 
    ##  3rd Qu.: 0.5545                                                                                                                                                                 
    ##  Max.   : 0.5545                                                                                                                                                                 
    ##  C - 12. The recordings of online classes Average Course Evaluation Rating
    ##  Min.   :-4.2871                          Min.   :-4.48605                
    ##  1st Qu.:-0.2871                          1st Qu.:-0.21335                
    ##  Median : 0.7129                          Median : 0.05945                
    ##  Mean   : 0.0000                          Mean   : 0.00000                
    ##  3rd Qu.: 0.7129                          3rd Qu.: 0.42305                
    ##  Max.   : 0.7129                          Max.   : 0.51395                
    ##  Average Level of Learning Attained Rating Average_Rating   
    ##  Min.   :-4.05445                          Min.   :-4.3879  
    ##  1st Qu.:-0.55446                          1st Qu.:-0.3879  
    ##  Median :-0.05446                          Median : 0.1576  
    ##  Mean   : 0.00000                          Mean   : 0.0000  
    ##  3rd Qu.: 0.44555                          3rd Qu.: 0.5212  
    ##  Max.   : 0.94554                          Max.   : 0.6121  
    ##  Project: Section 1-4: (20%) x/10 Project: Section 5-11: (50%) x/10
    ##  Min.   :-8.0109                  Min.   :-6.5822                  
    ##  1st Qu.:-0.6109                  1st Qu.:-0.5822                  
    ##  Median : 0.4891                  Median : 1.2178                  
    ##  Mean   : 0.0000                  Mean   : 0.0000                  
    ##  3rd Qu.: 0.9891                  3rd Qu.: 1.7178                  
    ##  Max.   : 1.9891                  Max.   : 3.4178                  
    ##  Project: Section 12: (30%) x/5 Project: (10%): x/30 x 100 TOTAL
    ##  Min.   :-1.00495               Min.   :-62.392                 
    ##  1st Qu.:-1.00495               1st Qu.: -6.392                 
    ##  Median :-1.00495               Median :  4.008                 
    ##  Mean   : 0.00000               Mean   :  0.000                 
    ##  3rd Qu.:-0.00495               3rd Qu.:  9.208                 
    ##  Max.   : 3.99505               Max.   : 37.608                 
    ##  Quiz 1 on Concept 1 (Introduction) x/32 Quiz 3 on Concept 3 (Linear) x/15
    ##  Min.   :-11.607                         Min.   :-9.3416                  
    ##  1st Qu.: -4.827                         1st Qu.:-2.3416                  
    ##  Median : -1.027                         Median :-0.3416                  
    ##  Mean   :  0.000                         Mean   : 0.0000                  
    ##  3rd Qu.:  3.273                         3rd Qu.: 2.6584                  
    ##  Max.   : 14.893                         Max.   : 5.6584                  
    ##  Quiz 4 on Concept 4 (Non-Linear) x/22 Quiz 5 on Concept 5 (Dashboarding) x/10
    ##  Min.   :-13.10782                     Min.   :-5.6109                        
    ##  1st Qu.: -2.93782                     1st Qu.:-1.2809                        
    ##  Median : -0.02782                     Median : 0.3891                        
    ##  Mean   :  0.00000                     Mean   : 0.0000                        
    ##  3rd Qu.:  4.39218                     3rd Qu.: 2.0591                        
    ##  Max.   :  8.89218                     Max.   : 7.0591                        
    ##     Quizzes         Lab 1 - 2.c. - (Simple Linear Regression) x/5
    ##  Min.   :-29.9592   Min.   :-4.7525                              
    ##  1st Qu.:-12.3992   1st Qu.: 0.2475                              
    ##  Median : -0.9092   Median : 0.2475                              
    ##  Mean   :  0.0000   Mean   : 0.0000                              
    ##  3rd Qu.:  8.9408   3rd Qu.: 0.2475                              
    ##  Max.   : 39.0308   Max.   : 0.2475                              
    ##  Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5
    ##  Min.   :-4.2176                                                
    ##  1st Qu.: 0.6324                                                
    ##  Median : 0.6324                                                
    ##  Mean   : 0.0000                                                
    ##  3rd Qu.: 0.6324                                                
    ##  Max.   : 0.7824                                                
    ##  Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5
    ##  Min.   :-3.6361                                  
    ##  1st Qu.:-0.7861                                  
    ##  Median : 1.2139                                  
    ##  Mean   : 0.0000                                  
    ##  3rd Qu.: 1.3639                                  
    ##  Max.   : 1.3639                                  
    ##  Lab 5 - Chart JS Dashboard Setup x/5    LabWork             CAT1        
    ##  Min.   :-3.404                       Min.   :-61.916   Min.   :-66.645  
    ##  1st Qu.:-3.404                       1st Qu.: -8.916   1st Qu.: -8.755  
    ##  Median : 1.596                       Median :  0.284   Median :  1.775  
    ##  Mean   : 0.000                       Mean   :  0.000   Mean   :  0.000  
    ##  3rd Qu.: 1.596                       3rd Qu.: 17.484   3rd Qu.: 16.245  
    ##  Max.   : 1.596                       Max.   : 20.284   Max.   : 30.715  
    ##       CAT2         Absenteeism Percentage   Coursework       
    ##  Min.   :-43.059   Min.   :-15.4155       Min.   :-17.05604  
    ##  1st Qu.:-43.059   1st Qu.: -8.0055       1st Qu.: -4.08604  
    ##  Median :  8.941   Median : -0.6055       Median :  0.05396  
    ##  Mean   :  0.000   Mean   :  0.0000       Mean   :  0.00000  
    ##  3rd Qu.: 24.941   3rd Qu.:  6.8045       3rd Qu.:  4.78396  
    ##  Max.   : 56.941   Max.   : 36.4345       Max.   : 10.55396  
    ##       EXAM              TOTAL       
    ##  Min.   :-32.5941   Min.   :-49.65  
    ##  1st Qu.: -7.5941   1st Qu.:-11.58  
    ##  Median :  0.4059   Median :  1.57  
    ##  Mean   :  0.0000   Mean   :  0.00  
    ##  3rd Qu.:  9.4059   3rd Qu.: 11.71  
    ##  Max.   : 23.4059   Max.   : 30.60

``` r
boxplot(StudentPerformanceDataset_center_transform$YOB, main = "boxplot of gender",
        xlab = "YOB", ylab = "Frequency", col = "purple")
```

![](Lab-Submission-Markdown_files/figure-gfm/The%20Centre%20Basic%20Transform-13.png)<!-- -->

``` r
boxplot(StudentPerformanceDataset_center_transform$anticipate_test_questions, main = "boxplot of Anticipate test questions",
        xlab = "Anticipate test Questions", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/The%20Centre%20Basic%20Transform-14.png)<!-- -->

``` r
boxplot(StudentPerformanceDataset_center_transform$gender, main = "boxplot of YOB",
        xlab = "Gender", ylab = "Frequency", col = "yellow")
```

![](Lab-Submission-Markdown_files/figure-gfm/The%20Centre%20Basic%20Transform-15.png)<!-- -->

``` r
boxplot(StudentPerformanceDataset_center_transform$A1, main = "boxplot of enjoyin the Unit",
        xlab = "Boxplot of enjoying the Unit", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/The%20Centre%20Basic%20Transform-16.png)<!-- -->

``` r
boxplot(StudentPerformanceDataset_center_transform$Average_Rating, main = "Average_Rating",
        xlab = "Average_Rating", ylab = "Frequency", col = "pink")
```

![](Lab-Submission-Markdown_files/figure-gfm/The%20Centre%20Basic%20Transform-17.png)<!-- -->

``` r
boxplot(StudentPerformanceDataset_center_transform$Quizzes, main = "Boxplot of Quizzes",
        xlab = "Quizzes", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/The%20Centre%20Basic%20Transform-18.png)<!-- -->

``` r
boxplot(StudentPerformanceDataset_center_transform$LabWork, main = "Boxplot of LabWork",
        xlab = "LabWork ", ylab = "Frequency", col = "pink")
```

![](Lab-Submission-Markdown_files/figure-gfm/The%20Centre%20Basic%20Transform-19.png)<!-- -->

``` r
boxplot(StudentPerformanceDataset_center_transform$CAT1, main = "Boxplot of CAT1",
        xlab = "CAT1", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/The%20Centre%20Basic%20Transform-20.png)<!-- -->

``` r
boxplot(StudentPerformanceDataset_center_transform$CAT2, main = "Boxplot of CAT 2",
        xlab = "CAT2", ylab = "Frequency", col = "purple")
```

![](Lab-Submission-Markdown_files/figure-gfm/The%20Centre%20Basic%20Transform-21.png)<!-- -->

``` r
boxplot(StudentPerformanceDataset_center_transform$Coursework, main = "Boxplot of Coursework",
        xlab = "Coursework", ylab = "Frequency", col = "pink")
```

![](Lab-Submission-Markdown_files/figure-gfm/The%20Centre%20Basic%20Transform-22.png)<!-- -->

``` r
boxplot(StudentPerformanceDataset_center_transform$EXAM, main = "Boxplot of EXAM",
        xlab = "EXAM", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/The%20Centre%20Basic%20Transform-23.png)<!-- -->

``` r
boxplot(StudentPerformanceDataset_center_transform$TOTAL, main = "Boxplot of TOTAL Semester marks",
        xlab = "TOTAL Semester marks", ylab = "Frequency", col = "red")
```

![](Lab-Submission-Markdown_files/figure-gfm/The%20Centre%20Basic%20Transform-24.png)<!-- -->

``` r
#ensures that each numeric attribute has a mean value of 0 and a standard deviation of 1
summary(StudentPerformanceDataset)
```

    ##      gender            YOB         motivator      read_content_before_lecture
    ##  Min.   :0.0000   Min.   :1998   Min.   :0.0000   Min.   :1.000              
    ##  1st Qu.:0.0000   1st Qu.:2000   1st Qu.:1.0000   1st Qu.:2.000              
    ##  Median :1.0000   Median :2001   Median :1.0000   Median :3.000              
    ##  Mean   :0.5743   Mean   :2001   Mean   :0.7525   Mean   :2.752              
    ##  3rd Qu.:1.0000   3rd Qu.:2002   3rd Qu.:1.0000   3rd Qu.:3.000              
    ##  Max.   :1.0000   Max.   :2003   Max.   :1.0000   Max.   :5.000              
    ##  anticipate_test_questions answer_rhetorical_questions find_terms_I_do_not_know
    ##  Min.   :1.000             Min.   :1.000               Min.   :1.000           
    ##  1st Qu.:3.000             1st Qu.:3.000               1st Qu.:3.000           
    ##  Median :4.000             Median :4.000               Median :4.000           
    ##  Mean   :3.584             Mean   :3.426               Mean   :3.743           
    ##  3rd Qu.:4.000             3rd Qu.:4.000               3rd Qu.:5.000           
    ##  Max.   :5.000             Max.   :5.000               Max.   :5.000           
    ##  copy_new_terms_in_reading_notebook take_quizzes_and_use_results
    ##  Min.   :1.000                      Min.   :1.000               
    ##  1st Qu.:3.000                      1st Qu.:3.000               
    ##  Median :4.000                      Median :4.000               
    ##  Mean   :3.663                      Mean   :3.941               
    ##  3rd Qu.:4.000                      3rd Qu.:5.000               
    ##  Max.   :5.000                      Max.   :5.000               
    ##  reorganise_course_outline write_down_important_points space_out_revision
    ##  Min.   :1.000             Min.   :1.000               Min.   :1.000     
    ##  1st Qu.:3.000             1st Qu.:3.000               1st Qu.:3.000     
    ##  Median :3.000             Median :4.000               Median :3.000     
    ##  Mean   :3.376             Mean   :3.832               Mean   :3.228     
    ##  3rd Qu.:4.000             3rd Qu.:5.000               3rd Qu.:4.000     
    ##  Max.   :5.000             Max.   :5.000               Max.   :5.000     
    ##  studying_in_study_group schedule_appointments goal_oriented  
    ##  Min.   :1.000           Min.   :1.000         Min.   :0.000  
    ##  1st Qu.:1.000           1st Qu.:1.000         1st Qu.:0.000  
    ##  Median :2.000           Median :2.000         Median :0.000  
    ##  Mean   :2.455           Mean   :1.931         Mean   :0.198  
    ##  3rd Qu.:3.000           3rd Qu.:2.000         3rd Qu.:0.000  
    ##  Max.   :5.000           Max.   :5.000         Max.   :1.000  
    ##  spaced_repetition testing_and_active_recall  interleaving    categorizing  
    ##  Min.   :1.000     Min.   :1.000             Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:2.000     1st Qu.:3.000             1st Qu.:2.000   1st Qu.:2.000  
    ##  Median :3.000     Median :3.000             Median :2.000   Median :3.000  
    ##  Mean   :2.554     Mean   :3.059             Mean   :2.257   Mean   :2.713  
    ##  3rd Qu.:3.000     3rd Qu.:4.000             3rd Qu.:3.000   3rd Qu.:3.000  
    ##  Max.   :4.000     Max.   :4.000             Max.   :4.000   Max.   :4.000  
    ##  retrospective_timetable cornell_notes        sq3r          commute     
    ##  Min.   :1.000           Min.   :1.000   Min.   :1.000   Min.   :0.000  
    ##  1st Qu.:2.000           1st Qu.:2.000   1st Qu.:2.000   1st Qu.:2.000  
    ##  Median :2.000           Median :3.000   Median :3.000   Median :3.000  
    ##  Mean   :2.406           Mean   :2.545   Mean   :2.614   Mean   :2.703  
    ##  3rd Qu.:3.000           3rd Qu.:3.000   3rd Qu.:3.000   3rd Qu.:4.000  
    ##  Max.   :4.000           Max.   :4.000   Max.   :4.000   Max.   :4.000  
    ##    study_time    repeats_since_Y1  paid_tuition     free_tuition   
    ##  Min.   :0.000   Min.   : 0.00    Min.   :0.0000   Min.   :0.0000  
    ##  1st Qu.:1.000   1st Qu.: 0.00    1st Qu.:0.0000   1st Qu.:0.0000  
    ##  Median :2.000   Median : 2.00    Median :0.0000   Median :0.0000  
    ##  Mean   :1.733   Mean   : 2.03    Mean   :0.1089   Mean   :0.2673  
    ##  3rd Qu.:2.000   3rd Qu.: 3.00    3rd Qu.:0.0000   3rd Qu.:1.0000  
    ##  Max.   :4.000   Max.   :10.00    Max.   :1.0000   Max.   :1.0000  
    ##  extra_curricular sports_extra_curricular exercise_per_week    meditate     
    ##  Min.   :0.0000   Min.   :0.0000          Min.   :0.000     Min.   :0.0000  
    ##  1st Qu.:0.0000   1st Qu.:0.0000          1st Qu.:1.000     1st Qu.:0.0000  
    ##  Median :1.0000   Median :0.0000          Median :1.000     Median :1.0000  
    ##  Mean   :0.5248   Mean   :0.3564          Mean   :1.089     Mean   :0.7525  
    ##  3rd Qu.:1.0000   3rd Qu.:1.0000          3rd Qu.:2.000     3rd Qu.:1.0000  
    ##  Max.   :1.0000   Max.   :1.0000          Max.   :3.000     Max.   :3.0000  
    ##       pray          internet      family_relationships  friendships  
    ##  Min.   :0.000   Min.   :0.0000   Min.   :0.000        Min.   :0.00  
    ##  1st Qu.:1.000   1st Qu.:1.0000   1st Qu.:4.000        1st Qu.:4.00  
    ##  Median :2.000   Median :1.0000   Median :4.000        Median :4.00  
    ##  Mean   :2.069   Mean   :0.8614   Mean   :4.149        Mean   :3.97  
    ##  3rd Qu.:3.000   3rd Qu.:1.0000   3rd Qu.:5.000        3rd Qu.:4.00  
    ##  Max.   :3.000   Max.   :1.0000   Max.   :5.000        Max.   :5.00  
    ##  romantic_relationships spiritual_wellnes financial_wellness     health 
    ##  Min.   :0.000          Min.   :0.000     Min.   :0          Min.   :0  
    ##  1st Qu.:0.000          1st Qu.:3.000     1st Qu.:2          1st Qu.:3  
    ##  Median :0.000          Median :4.000     Median :3          Median :4  
    ##  Mean   :1.356          Mean   :3.614     Mean   :3          Mean   :4  
    ##  3rd Qu.:3.000          3rd Qu.:4.000     3rd Qu.:4          3rd Qu.:5  
    ##  Max.   :4.000          Max.   :5.000     Max.   :5          Max.   :5  
    ##     day_out         night_out     alcohol_or_narcotics     mentor      
    ##  Min.   :0.0000   Min.   :0.000   Min.   :0.0000       Min.   :0.0000  
    ##  1st Qu.:0.0000   1st Qu.:0.000   1st Qu.:0.0000       1st Qu.:0.0000  
    ##  Median :1.0000   Median :0.000   Median :0.0000       Median :0.0000  
    ##  Mean   :0.7921   Mean   :0.505   Mean   :0.3465       Mean   :0.4059  
    ##  3rd Qu.:1.0000   3rd Qu.:1.000   3rd Qu.:1.0000       3rd Qu.:1.0000  
    ##  Max.   :3.0000   Max.   :3.000   Max.   :3.0000       Max.   :1.0000  
    ##  mentor_meetings        A1        A - 2. Classes start and end on time
    ##  Min.   :0.0000   Min.   :0.000   Min.   :0.000                       
    ##  1st Qu.:0.0000   1st Qu.:4.000   1st Qu.:4.000                       
    ##  Median :0.0000   Median :5.000   Median :5.000                       
    ##  Mean   :0.6733   Mean   :4.446   Mean   :4.634                       
    ##  3rd Qu.:1.0000   3rd Qu.:5.000   3rd Qu.:5.000                       
    ##  Max.   :3.0000   Max.   :5.000   Max.   :5.000                       
    ##  A - 3. The learning environment is participative, involves learning by doing and is group-based
    ##  Min.   :0.000                                                                                  
    ##  1st Qu.:4.000                                                                                  
    ##  Median :4.000                                                                                  
    ##  Mean   :4.307                                                                                  
    ##  3rd Qu.:5.000                                                                                  
    ##  Max.   :5.000                                                                                  
    ##  A - 4. The subject content is delivered according to the course outline and meets my expectations
    ##  Min.   :0.000                                                                                    
    ##  1st Qu.:4.000                                                                                    
    ##  Median :5.000                                                                                    
    ##  Mean   :4.693                                                                                    
    ##  3rd Qu.:5.000                                                                                    
    ##  Max.   :5.000                                                                                    
    ##  A - 5. The topics are clear and logically developed
    ##  Min.   :0.000                                      
    ##  1st Qu.:4.000                                      
    ##  Median :5.000                                      
    ##  Mean   :4.604                                      
    ##  3rd Qu.:5.000                                      
    ##  Max.   :5.000                                      
    ##  A - 6. I am developing my oral and writing skills
    ##  Min.   :0.000                                    
    ##  1st Qu.:4.000                                    
    ##  Median :4.000                                    
    ##  Mean   :4.069                                    
    ##  3rd Qu.:5.000                                    
    ##  Max.   :5.000                                    
    ##  A - 7. I am developing my reflective and critical reasoning skills
    ##  Min.   :0.000                                                     
    ##  1st Qu.:4.000                                                     
    ##  Median :4.000                                                     
    ##  Mean   :4.337                                                     
    ##  3rd Qu.:5.000                                                     
    ##  Max.   :5.000                                                     
    ##  A - 8. The assessment methods are assisting me to learn
    ##  Min.   :0.000                                          
    ##  1st Qu.:4.000                                          
    ##  Median :5.000                                          
    ##  Mean   :4.564                                          
    ##  3rd Qu.:5.000                                          
    ##  Max.   :5.000                                          
    ##  A - 9. I receive relevant feedback
    ##  Min.   :0.000                     
    ##  1st Qu.:4.000                     
    ##  Median :5.000                     
    ##  Mean   :4.535                     
    ##  3rd Qu.:5.000                     
    ##  Max.   :5.000                     
    ##  A - 10. I read the recommended readings and notes
    ##  Min.   :0.000                                    
    ##  1st Qu.:4.000                                    
    ##  Median :5.000                                    
    ##  Mean   :4.505                                    
    ##  3rd Qu.:5.000                                    
    ##  Max.   :5.000                                    
    ##  A - 11. I use the eLearning material posted
    ##  Min.   :0.000                              
    ##  1st Qu.:4.000                              
    ##  Median :5.000                              
    ##  Mean   :4.653                              
    ##  3rd Qu.:5.000                              
    ##  Max.   :5.000                              
    ##  B - 1. Concept 1 of 6: Principles of Business Intelligence and the DataOps Philosophy
    ##  Min.   :0.000                                                                        
    ##  1st Qu.:4.000                                                                        
    ##  Median :4.000                                                                        
    ##  Mean   :4.208                                                                        
    ##  3rd Qu.:5.000                                                                        
    ##  Max.   :5.000                                                                        
    ##  B - 2. Concept 3 of 6: Linear Algorithms for Predictive Analytics
    ##  Min.   :0.000                                                    
    ##  1st Qu.:3.000                                                    
    ##  Median :4.000                                                    
    ##  Mean   :3.901                                                    
    ##  3rd Qu.:5.000                                                    
    ##  Max.   :5.000                                                    
    ##  C - 2. Quizzes at the end of each concept
    ##  Min.   :0.000                            
    ##  1st Qu.:4.000                            
    ##  Median :5.000                            
    ##  Mean   :4.545                            
    ##  3rd Qu.:5.000                            
    ##  Max.   :5.000                            
    ##  C - 3. Lab manuals that outline the steps to follow during the labs
    ##  Min.   :0.000                                                      
    ##  1st Qu.:4.000                                                      
    ##  Median :5.000                                                      
    ##  Mean   :4.564                                                      
    ##  3rd Qu.:5.000                                                      
    ##  Max.   :5.000                                                      
    ##  C - 4. Required lab work submissions at the end of each lab manual that outline the activity to be done on your own
    ##  Min.   :0.000                                                                                                      
    ##  1st Qu.:4.000                                                                                                      
    ##  Median :5.000                                                                                                      
    ##  Mean   :4.505                                                                                                      
    ##  3rd Qu.:5.000                                                                                                      
    ##  Max.   :5.000                                                                                                      
    ##  C - 5. Supplementary videos to watch
    ##  Min.   :0.000                       
    ##  1st Qu.:4.000                       
    ##  Median :4.000                       
    ##  Mean   :4.149                       
    ##  3rd Qu.:5.000                       
    ##  Max.   :5.000                       
    ##  C - 6. Supplementary podcasts to listen to
    ##  Min.   :0.00                              
    ##  1st Qu.:4.00                              
    ##  Median :4.00                              
    ##  Mean   :4.04                              
    ##  3rd Qu.:5.00                              
    ##  Max.   :5.00                              
    ##  C - 7. Supplementary content to read C - 8. Lectures slides
    ##  Min.   :0.000                        Min.   :0.000         
    ##  1st Qu.:4.000                        1st Qu.:4.000         
    ##  Median :4.000                        Median :5.000         
    ##  Mean   :4.129                        Mean   :4.554         
    ##  3rd Qu.:5.000                        3rd Qu.:5.000         
    ##  Max.   :5.000                        Max.   :5.000         
    ##  C - 9. Lecture notes on some of the lecture slides
    ##  Min.   :0.000                                     
    ##  1st Qu.:4.000                                     
    ##  Median :5.000                                     
    ##  Mean   :4.554                                     
    ##  3rd Qu.:5.000                                     
    ##  Max.   :5.000                                     
    ##  C - 10. The quality of the lectures given (quality measured by the breadth (the full span of knowledge of a subject) and depth (the extent to which specific topics are focused upon, amplified, and explored) of learning - NOT quality measured by how fun/co
    ##  Min.   :0.000                                                                                                                                                                                                                                                  
    ##  1st Qu.:4.000                                                                                                                                                                                                                                                  
    ##  Median :5.000                                                                                                                                                                                                                                                  
    ##  Mean   :4.495                                                                                                                                                                                                                                                  
    ##  3rd Qu.:5.000                                                                                                                                                                                                                                                  
    ##  Max.   :5.000                                                                                                                                                                                                                                                  
    ##  C - 11. The division of theory and practice such that most of the theory is done during the recorded online classes and most of the practice is done during the physical classes
    ##  Min.   :0.000                                                                                                                                                                   
    ##  1st Qu.:4.000                                                                                                                                                                   
    ##  Median :5.000                                                                                                                                                                   
    ##  Mean   :4.446                                                                                                                                                                   
    ##  3rd Qu.:5.000                                                                                                                                                                   
    ##  Max.   :5.000                                                                                                                                                                   
    ##  C - 12. The recordings of online classes Average Course Evaluation Rating
    ##  Min.   :0.000                            Min.   :0.000                   
    ##  1st Qu.:4.000                            1st Qu.:4.273                   
    ##  Median :5.000                            Median :4.545                   
    ##  Mean   :4.287                            Mean   :4.486                   
    ##  3rd Qu.:5.000                            3rd Qu.:4.909                   
    ##  Max.   :5.000                            Max.   :5.000                   
    ##  Average Level of Learning Attained Rating Average_Rating 
    ##  Min.   :0.000                             Min.   :0.000  
    ##  1st Qu.:3.500                             1st Qu.:4.000  
    ##  Median :4.000                             Median :4.545  
    ##  Mean   :4.054                             Mean   :4.388  
    ##  3rd Qu.:4.500                             3rd Qu.:4.909  
    ##  Max.   :5.000                             Max.   :5.000  
    ##  Project: Section 1-4: (20%) x/10 Project: Section 5-11: (50%) x/10
    ##  Min.   : 0.000                   Min.   : 0.000                   
    ##  1st Qu.: 7.400                   1st Qu.: 6.000                   
    ##  Median : 8.500                   Median : 7.800                   
    ##  Mean   : 8.011                   Mean   : 6.582                   
    ##  3rd Qu.: 9.000                   3rd Qu.: 8.300                   
    ##  Max.   :10.000                   Max.   :10.000                   
    ##  Project: Section 12: (30%) x/5 Project: (10%): x/30 x 100 TOTAL
    ##  Min.   :0.000                  Min.   :  0.00                  
    ##  1st Qu.:0.000                  1st Qu.: 56.00                  
    ##  Median :0.000                  Median : 66.40                  
    ##  Mean   :1.005                  Mean   : 62.39                  
    ##  3rd Qu.:1.000                  3rd Qu.: 71.60                  
    ##  Max.   :5.000                  Max.   :100.00                  
    ##  Quiz 1 on Concept 1 (Introduction) x/32 Quiz 3 on Concept 3 (Linear) x/15
    ##  Min.   : 4.75                           Min.   : 0.000                   
    ##  1st Qu.:11.53                           1st Qu.: 7.000                   
    ##  Median :15.33                           Median : 9.000                   
    ##  Mean   :16.36                           Mean   : 9.342                   
    ##  3rd Qu.:19.63                           3rd Qu.:12.000                   
    ##  Max.   :31.25                           Max.   :15.000                   
    ##  Quiz 4 on Concept 4 (Non-Linear) x/22 Quiz 5 on Concept 5 (Dashboarding) x/10
    ##  Min.   : 0.00                         Min.   : 0.000                         
    ##  1st Qu.:10.17                         1st Qu.: 4.330                         
    ##  Median :13.08                         Median : 6.000                         
    ##  Mean   :13.11                         Mean   : 5.611                         
    ##  3rd Qu.:17.50                         3rd Qu.: 7.670                         
    ##  Max.   :22.00                         Max.   :12.670                         
    ##     Quizzes      Lab 1 - 2.c. - (Simple Linear Regression) x/5
    ##  Min.   :26.26   Min.   :0.000                                
    ##  1st Qu.:43.82   1st Qu.:5.000                                
    ##  Median :55.31   Median :5.000                                
    ##  Mean   :56.22   Mean   :4.752                                
    ##  3rd Qu.:65.16   3rd Qu.:5.000                                
    ##  Max.   :95.25   Max.   :5.000                                
    ##  Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5
    ##  Min.   :0.000                                                  
    ##  1st Qu.:4.850                                                  
    ##  Median :4.850                                                  
    ##  Mean   :4.218                                                  
    ##  3rd Qu.:4.850                                                  
    ##  Max.   :5.000                                                  
    ##  Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5
    ##  Min.   :0.000                                    
    ##  1st Qu.:2.850                                    
    ##  Median :4.850                                    
    ##  Mean   :3.636                                    
    ##  3rd Qu.:5.000                                    
    ##  Max.   :5.000                                    
    ##  Lab 5 - Chart JS Dashboard Setup x/5    LabWork            CAT1      
    ##  Min.   :0.000                        Min.   : 17.80   Min.   : 0.00  
    ##  1st Qu.:0.000                        1st Qu.: 70.80   1st Qu.:57.89  
    ##  Median :5.000                        Median : 80.00   Median :68.42  
    ##  Mean   :3.404                        Mean   : 79.72   Mean   :66.65  
    ##  3rd Qu.:5.000                        3rd Qu.: 97.20   3rd Qu.:82.89  
    ##  Max.   :5.000                        Max.   :100.00   Max.   :97.36  
    ##       CAT2        Absenteeism Percentage   Coursework         EXAM      
    ##  Min.   :  0.00   Min.   : 0.00          Min.   : 7.47   Min.   : 0.00  
    ##  1st Qu.:  0.00   1st Qu.: 7.41          1st Qu.:20.44   1st Qu.:25.00  
    ##  Median : 52.00   Median :14.81          Median :24.58   Median :33.00  
    ##  Mean   : 43.06   Mean   :15.42          Mean   :24.53   Mean   :32.59  
    ##  3rd Qu.: 68.00   3rd Qu.:22.22          3rd Qu.:29.31   3rd Qu.:42.00  
    ##  Max.   :100.00   Max.   :51.85          Max.   :35.08   Max.   :56.00  
    ##      TOTAL      
    ##  Min.   : 7.47  
    ##  1st Qu.:45.54  
    ##  Median :58.69  
    ##  Mean   :57.12  
    ##  3rd Qu.:68.83  
    ##  Max.   :87.72

``` r
sapply(StudentPerformanceDataset[ ,-1 ], sd)
```

    ##                                                                                                                                                                                                                                                             YOB 
    ##                                                                                                                                                                                                                                                       0.9950372 
    ##                                                                                                                                                                                                                                                       motivator 
    ##                                                                                                                                                                                                                                                       0.4337267 
    ##                                                                                                                                                                                                                                     read_content_before_lecture 
    ##                                                                                                                                                                                                                                                       0.9633892 
    ##                                                                                                                                                                                                                                       anticipate_test_questions 
    ##                                                                                                                                                                                                                                                       0.9926462 
    ##                                                                                                                                                                                                                                     answer_rhetorical_questions 
    ##                                                                                                                                                                                                                                                       0.9934439 
    ##                                                                                                                                                                                                                                        find_terms_I_do_not_know 
    ##                                                                                                                                                                                                                                                       1.0550210 
    ##                                                                                                                                                                                                                              copy_new_terms_in_reading_notebook 
    ##                                                                                                                                                                                                                                                       1.1070432 
    ##                                                                                                                                                                                                                                    take_quizzes_and_use_results 
    ##                                                                                                                                                                                                                                                       1.0753770 
    ##                                                                                                                                                                                                                                       reorganise_course_outline 
    ##                                                                                                                                                                                                                                                       1.1563000 
    ##                                                                                                                                                                                                                                     write_down_important_points 
    ##                                                                                                                                                                                                                                                       1.0776763 
    ##                                                                                                                                                                                                                                              space_out_revision 
    ##                                                                                                                                                                                                                                                       1.1303202 
    ##                                                                                                                                                                                                                                         studying_in_study_group 
    ##                                                                                                                                                                                                                                                       1.3380938 
    ##                                                                                                                                                                                                                                           schedule_appointments 
    ##                                                                                                                                                                                                                                                       1.0223251 
    ##                                                                                                                                                                                                                                                   goal_oriented 
    ##                                                                                                                                                                                                                                                       0.4004947 
    ##                                                                                                                                                                                                                                               spaced_repetition 
    ##                                                                                                                                                                                                                                                       0.8303643 
    ##                                                                                                                                                                                                                                       testing_and_active_recall 
    ##                                                                                                                                                                                                                                                       0.7186346 
    ##                                                                                                                                                                                                                                                    interleaving 
    ##                                                                                                                                                                                                                                                       0.7436863 
    ##                                                                                                                                                                                                                                                    categorizing 
    ##                                                                                                                                                                                                                                                       0.7394137 
    ##                                                                                                                                                                                                                                         retrospective_timetable 
    ##                                                                                                                                                                                                                                                       0.8851917 
    ##                                                                                                                                                                                                                                                   cornell_notes 
    ##                                                                                                                                                                                                                                                       0.9952362 
    ##                                                                                                                                                                                                                                                            sq3r 
    ##                                                                                                                                                                                                                                                       1.0485256 
    ##                                                                                                                                                                                                                                                         commute 
    ##                                                                                                                                                                                                                                                       1.0727959 
    ##                                                                                                                                                                                                                                                      study_time 
    ##                                                                                                                                                                                                                                                       0.8353573 
    ##                                                                                                                                                                                                                                                repeats_since_Y1 
    ##                                                                                                                                                                                                                                                       2.1092911 
    ##                                                                                                                                                                                                                                                    paid_tuition 
    ##                                                                                                                                                                                                                                                       0.3130811 
    ##                                                                                                                                                                                                                                                    free_tuition 
    ##                                                                                                                                                                                                                                                       0.4447716 
    ##                                                                                                                                                                                                                                                extra_curricular 
    ##                                                                                                                                                                                                                                                       0.5018777 
    ##                                                                                                                                                                                                                                         sports_extra_curricular 
    ##                                                                                                                                                                                                                                                       0.4813348 
    ##                                                                                                                                                                                                                                               exercise_per_week 
    ##                                                                                                                                                                                                                                                       0.8136217 
    ##                                                                                                                                                                                                                                                        meditate 
    ##                                                                                                                                                                                                                                                       0.9317289 
    ##                                                                                                                                                                                                                                                            pray 
    ##                                                                                                                                                                                                                                                       1.0417046 
    ##                                                                                                                                                                                                                                                        internet 
    ##                                                                                                                                                                                                                                                       0.3472666 
    ##                                                                                                                                                                                                                                            family_relationships 
    ##                                                                                                                                                                                                                                                       0.8987340 
    ##                                                                                                                                                                                                                                                     friendships 
    ##                                                                                                                                                                                                                                                       0.8301258 
    ##                                                                                                                                                                                                                                          romantic_relationships 
    ##                                                                                                                                                                                                                                                       1.6036468 
    ##                                                                                                                                                                                                                                               spiritual_wellnes 
    ##                                                                                                                                                                                                                                                       0.9997029 
    ##                                                                                                                                                                                                                                              financial_wellness 
    ##                                                                                                                                                                                                                                                       1.1313708 
    ##                                                                                                                                                                                                                                                          health 
    ##                                                                                                                                                                                                                                                       1.0295630 
    ##                                                                                                                                                                                                                                                         day_out 
    ##                                                                                                                                                                                                                                                       0.5712588 
    ##                                                                                                                                                                                                                                                       night_out 
    ##                                                                                                                                                                                                                                                       0.6422424 
    ##                                                                                                                                                                                                                                            alcohol_or_narcotics 
    ##                                                                                                                                                                                                                                                       0.5556194 
    ##                                                                                                                                                                                                                                                          mentor 
    ##                                                                                                                                                                                                                                                       0.4935224 
    ##                                                                                                                                                                                                                                                 mentor_meetings 
    ##                                                                                                                                                                                                                                                       0.8379607 
    ##                                                                                                                                                                                                                                                              A1 
    ##                                                                                                                                                                                                                                                       0.7412860 
    ##                                                                                                                                                                                                                            A - 2. Classes start and end on time 
    ##                                                                                                                                                                                                                                                       0.6741331 
    ##                                                                                                                                                                 A - 3. The learning environment is participative, involves learning by doing and is group-based 
    ##                                                                                                                                                                                                                                                       0.7841247 
    ##                                                                                                                                                               A - 4. The subject content is delivered according to the course outline and meets my expectations 
    ##                                                                                                                                                                                                                                                       0.6594327 
    ##                                                                                                                                                                                                             A - 5. The topics are clear and logically developed 
    ##                                                                                                                                                                                                                                                       0.7359240 
    ##                                                                                                                                                                                                               A - 6. I am developing my oral and writing skills 
    ##                                                                                                                                                                                                                                                       0.9618464 
    ##                                                                                                                                                                                              A - 7. I am developing my reflective and critical reasoning skills 
    ##                                                                                                                                                                                                                                                       0.8158091 
    ##                                                                                                                                                                                                         A - 8. The assessment methods are assisting me to learn 
    ##                                                                                                                                                                                                                                                       0.7926644 
    ##                                                                                                                                                                                                                              A - 9. I receive relevant feedback 
    ##                                                                                                                                                                                                                                                       0.7150434 
    ##                                                                                                                                                                                                               A - 10. I read the recommended readings and notes 
    ##                                                                                                                                                                                                                                                       0.7697241 
    ##                                                                                                                                                                                                                     A - 11. I use the eLearning material posted 
    ##                                                                                                                                                                                                                                                       0.6990800 
    ##                                                                                                                                                                           B - 1. Concept 1 of 6: Principles of Business Intelligence and the DataOps Philosophy 
    ##                                                                                                                                                                                                                                                       0.8867562 
    ##                                                                                                                                                                                               B - 2. Concept 3 of 6: Linear Algorithms for Predictive Analytics 
    ##                                                                                                                                                                                                                                                       0.9434506 
    ##                                                                                                                                                                                                                       C - 2. Quizzes at the end of each concept 
    ##                                                                                                                                                                                                                                                       0.7684368 
    ##                                                                                                                                                                                             C - 3. Lab manuals that outline the steps to follow during the labs 
    ##                                                                                                                                                                                                                                                       0.7538679 
    ##                                                                                                                                             C - 4. Required lab work submissions at the end of each lab manual that outline the activity to be done on your own 
    ##                                                                                                                                                                                                                                                       0.7566209 
    ##                                                                                                                                                                                                                            C - 5. Supplementary videos to watch 
    ##                                                                                                                                                                                                                                                       0.9735105 
    ##                                                                                                                                                                                                                      C - 6. Supplementary podcasts to listen to 
    ##                                                                                                                                                                                                                                                       1.0669657 
    ##                                                                                                                                                                                                                            C - 7. Supplementary content to read 
    ##                                                                                                                                                                                                                                                       1.0455942 
    ##                                                                                                                                                                                                                                          C - 8. Lectures slides 
    ##                                                                                                                                                                                                                                                       0.8541106 
    ##                                                                                                                                                                                                              C - 9. Lecture notes on some of the lecture slides 
    ##                                                                                                                                                                                                                                                       0.7807080 
    ## C - 10. The quality of the lectures given (quality measured by the breadth (the full span of knowledge of a subject) and depth (the extent to which specific topics are focused upon, amplified, and explored) of learning - NOT quality measured by how fun/co 
    ##                                                                                                                                                                                                                                                       0.7952831 
    ##                                                                                C - 11. The division of theory and practice such that most of the theory is done during the recorded online classes and most of the practice is done during the physical classes 
    ##                                                                                                                                                                                                                                                       0.8182328 
    ##                                                                                                                                                                                                                        C - 12. The recordings of online classes 
    ##                                                                                                                                                                                                                                                       0.9522251 
    ##                                                                                                                                                                                                                                Average Course Evaluation Rating 
    ##                                                                                                                                                                                                                                                       0.6015774 
    ##                                                                                                                                                                                                                       Average Level of Learning Attained Rating 
    ##                                                                                                                                                                                                                                                       0.8120991 
    ##                                                                                                                                                                                                                                                  Average_Rating 
    ##                                                                                                                                                                                                                                                       0.6687733 
    ##                                                                                                                                                                                                                                Project: Section 1-4: (20%) x/10 
    ##                                                                                                                                                                                                                                                       2.1018040 
    ##                                                                                                                                                                                                                               Project: Section 5-11: (50%) x/10 
    ##                                                                                                                                                                                                                                                       2.7890284 
    ##                                                                                                                                                                                                                                  Project: Section 12: (30%) x/5 
    ##                                                                                                                                                                                                                                                       1.7800773 
    ##                                                                                                                                                                                                                                Project: (10%): x/30 x 100 TOTAL 
    ##                                                                                                                                                                                                                                                      20.1517428 
    ##                                                                                                                                                                                                                         Quiz 1 on Concept 1 (Introduction) x/32 
    ##                                                                                                                                                                                                                                                       6.5052771 
    ##                                                                                                                                                                                                                               Quiz 3 on Concept 3 (Linear) x/15 
    ##                                                                                                                                                                                                                                                       3.3510675 
    ##                                                                                                                                                                                                                           Quiz 4 on Concept 4 (Non-Linear) x/22 
    ##                                                                                                                                                                                                                                                       5.4243345 
    ##                                                                                                                                                                                                                         Quiz 5 on Concept 5 (Dashboarding) x/10 
    ##                                                                                                                                                                                                                                                       2.8581165 
    ##                                                                                                                                                                                                                                                         Quizzes 
    ##                                                                                                                                                                                                                                                      16.4938796 
    ##                                                                                                                                                                                                                   Lab 1 - 2.c. - (Simple Linear Regression) x/5 
    ##                                                                                                                                                                                                                                                       0.9209337 
    ##                                                                                                                                                                                                 Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5 
    ##                                                                                                                                                                                                                                                       1.4597604 
    ##                                                                                                                                                                                                               Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5 
    ##                                                                                                                                                                                                                                                       1.8871158 
    ##                                                                                                                                                                                                                            Lab 5 - Chart JS Dashboard Setup x/5 
    ##                                                                                                                                                                                                                                                       2.3327203 
    ##                                                                                                                                                                                                                                                         LabWork 
    ##                                                                                                                                                                                                                                                      19.3031268 
    ##                                                                                                                                                                                                                                                            CAT1 
    ##                                                                                                                                                                                                                                                      20.1145364 
    ##                                                                                                                                                                                                                                                            CAT2 
    ##                                                                                                                                                                                                                                                      35.3456707 
    ##                                                                                                                                                                                                                                          Absenteeism Percentage 
    ##                                                                                                                                                                                                                                                       9.0886796 
    ##                                                                                                                                                                                                                                                      Coursework 
    ##                                                                                                                                                                                                                                                       6.2240076 
    ##                                                                                                                                                                                                                                                            EXAM 
    ##                                                                                                                                                                                                                                                      12.8811321 
    ##                                                                                                                                                                                                                                                           TOTAL 
    ##                                                                                                                                                                                                                                                      15.7253295

``` r
model_of_the_transform <- preProcess(StudentPerformanceDataset,
                                     method = c("scale", "center"))
print(model_of_the_transform)
```

    ## Created from 101 samples and 91 variables
    ## 
    ## Pre-processing:
    ##   - centered (91)
    ##   - ignored (0)
    ##   - scaled (91)

``` r
StudentPerformanceDataset_standardize_transform <- predict(model_of_the_transform, 
                                                           StudentPerformanceDataset)

# AFTER
summary(StudentPerformanceDataset_standardize_transform)
```

    ##      gender             YOB            motivator      
    ##  Min.   :-1.1556   Min.   :-2.9155   Min.   :-1.7349  
    ##  1st Qu.:-1.1556   1st Qu.:-0.9055   1st Qu.: 0.5707  
    ##  Median : 0.8568   Median : 0.0995   Median : 0.5707  
    ##  Mean   : 0.0000   Mean   : 0.0000   Mean   : 0.0000  
    ##  3rd Qu.: 0.8568   3rd Qu.: 1.1045   3rd Qu.: 0.5707  
    ##  Max.   : 0.8568   Max.   : 2.1095   Max.   : 0.5707  
    ##  read_content_before_lecture anticipate_test_questions
    ##  Min.   :-1.8191             Min.   :-2.6033          
    ##  1st Qu.:-0.7811             1st Qu.:-0.5885          
    ##  Median : 0.2569             Median : 0.4189          
    ##  Mean   : 0.0000             Mean   : 0.0000          
    ##  3rd Qu.: 0.2569             3rd Qu.: 0.4189          
    ##  Max.   : 2.3329             Max.   : 1.4263          
    ##  answer_rhetorical_questions find_terms_I_do_not_know
    ##  Min.   :-2.4418             Min.   :-2.5995         
    ##  1st Qu.:-0.4286             1st Qu.:-0.7038         
    ##  Median : 0.5780             Median : 0.2440         
    ##  Mean   : 0.0000             Mean   : 0.0000         
    ##  3rd Qu.: 0.5780             3rd Qu.: 1.1918         
    ##  Max.   : 1.5846             Max.   : 1.1918         
    ##  copy_new_terms_in_reading_notebook take_quizzes_and_use_results
    ##  Min.   :-2.4058                    Min.   :-2.73448            
    ##  1st Qu.:-0.5992                    1st Qu.:-0.87466            
    ##  Median : 0.3041                    Median : 0.05524            
    ##  Mean   : 0.0000                    Mean   : 0.00000            
    ##  3rd Qu.: 0.3041                    3rd Qu.: 0.98515            
    ##  Max.   : 1.2074                    Max.   : 0.98515            
    ##  reorganise_course_outline write_down_important_points space_out_revision
    ##  Min.   :-2.0550           Min.   :-2.6276             Min.   :-1.9709   
    ##  1st Qu.:-0.3254           1st Qu.:-0.7717             1st Qu.:-0.2015   
    ##  Median :-0.3254           Median : 0.1562             Median :-0.2015   
    ##  Mean   : 0.0000           Mean   : 0.0000             Mean   : 0.0000   
    ##  3rd Qu.: 0.5394           3rd Qu.: 1.0841             3rd Qu.: 0.6832   
    ##  Max.   : 1.4043           Max.   : 1.0841             Max.   : 1.5679   
    ##  studying_in_study_group schedule_appointments goal_oriented    
    ##  Min.   :-1.0877         Min.   :-0.91037      Min.   :-0.4944  
    ##  1st Qu.:-1.0877         1st Qu.:-0.91037      1st Qu.:-0.4944  
    ##  Median :-0.3404         Median : 0.06779      Median :-0.4944  
    ##  Mean   : 0.0000         Mean   : 0.00000      Mean   : 0.0000  
    ##  3rd Qu.: 0.4070         3rd Qu.: 0.06779      3rd Qu.:-0.4944  
    ##  Max.   : 1.9016         Max.   : 3.00228      Max.   : 2.0025  
    ##  spaced_repetition testing_and_active_recall  interleaving    
    ##  Min.   :-1.8720   Min.   :-2.86572          Min.   :-1.6908  
    ##  1st Qu.:-0.6677   1st Qu.:-0.08267          1st Qu.:-0.3461  
    ##  Median : 0.5366   Median :-0.08267          Median :-0.3461  
    ##  Mean   : 0.0000   Mean   : 0.00000          Mean   : 0.0000  
    ##  3rd Qu.: 0.5366   3rd Qu.: 1.30886          3rd Qu.: 0.9985  
    ##  Max.   : 1.7409   Max.   : 1.30886          Max.   : 2.3432  
    ##   categorizing     retrospective_timetable cornell_notes          sq3r        
    ##  Min.   :-2.3165   Min.   :-1.5883         Min.   :-1.5519   Min.   :-1.5392  
    ##  1st Qu.:-0.9641   1st Qu.:-0.4586         1st Qu.:-0.5472   1st Qu.:-0.5855  
    ##  Median : 0.3883   Median :-0.4586         Median : 0.4576   Median : 0.3683  
    ##  Mean   : 0.0000   Mean   : 0.0000         Mean   : 0.0000   Mean   : 0.0000  
    ##  3rd Qu.: 0.3883   3rd Qu.: 0.6711         3rd Qu.: 0.4576   3rd Qu.: 0.3683  
    ##  Max.   : 1.7407   Max.   : 1.8008         Max.   : 1.4624   Max.   : 1.3220  
    ##     commute          study_time      repeats_since_Y1    paid_tuition    
    ##  Min.   :-2.5196   Min.   :-2.0742   Min.   :-0.96227   Min.   :-0.3479  
    ##  1st Qu.:-0.6553   1st Qu.:-0.8771   1st Qu.:-0.96227   1st Qu.:-0.3479  
    ##  Median : 0.2769   Median : 0.3200   Median :-0.01408   Median :-0.3479  
    ##  Mean   : 0.0000   Mean   : 0.0000   Mean   : 0.00000   Mean   : 0.0000  
    ##  3rd Qu.: 1.2090   3rd Qu.: 0.3200   3rd Qu.: 0.46001   3rd Qu.:-0.3479  
    ##  Max.   : 1.2090   Max.   : 2.7142   Max.   : 3.77866   Max.   : 2.8462  
    ##   free_tuition    extra_curricular  sports_extra_curricular exercise_per_week
    ##  Min.   :-0.601   Min.   :-1.0456   Min.   :-0.7405         Min.   :-1.3386  
    ##  1st Qu.:-0.601   1st Qu.:-1.0456   1st Qu.:-0.7405         1st Qu.:-0.1095  
    ##  Median :-0.601   Median : 0.9469   Median :-0.7405         Median :-0.1095  
    ##  Mean   : 0.000   Mean   : 0.0000   Mean   : 0.0000         Mean   : 0.0000  
    ##  3rd Qu.: 1.647   3rd Qu.: 0.9469   3rd Qu.: 1.3370         3rd Qu.: 1.1196  
    ##  Max.   : 1.647   Max.   : 0.9469   Max.   : 1.3370         Max.   : 2.3486  
    ##     meditate            pray             internet       family_relationships
    ##  Min.   :-0.8076   Min.   :-1.98646   Min.   :-2.4805   Min.   :-4.6160     
    ##  1st Qu.:-0.8076   1st Qu.:-1.02650   1st Qu.: 0.3992   1st Qu.:-0.1652     
    ##  Median : 0.2657   Median :-0.06653   Median : 0.3992   Median :-0.1652     
    ##  Mean   : 0.0000   Mean   : 0.00000   Mean   : 0.0000   Mean   : 0.0000     
    ##  3rd Qu.: 0.2657   3rd Qu.: 0.89343   3rd Qu.: 0.3992   3rd Qu.: 0.9474     
    ##  Max.   : 2.4122   Max.   : 0.89343   Max.   : 0.3992   Max.   : 0.9474     
    ##   friendships       romantic_relationships spiritual_wellnes financial_wellness
    ##  Min.   :-4.78277   Min.   :-0.8458        Min.   :-3.6149   Min.   :-2.6517   
    ##  1st Qu.: 0.03578   1st Qu.:-0.8458        1st Qu.:-0.6140   1st Qu.:-0.8839   
    ##  Median : 0.03578   Median :-0.8458        Median : 0.3863   Median : 0.0000   
    ##  Mean   : 0.00000   Mean   : 0.0000        Mean   : 0.0000   Mean   : 0.0000   
    ##  3rd Qu.: 0.03578   3rd Qu.: 1.0249        3rd Qu.: 0.3863   3rd Qu.: 0.8839   
    ##  Max.   : 1.24042   Max.   : 1.6485        Max.   : 1.3866   Max.   : 1.7678   
    ##      health           day_out         night_out       alcohol_or_narcotics
    ##  Min.   :-3.8851   Min.   :-1.387   Min.   :-0.7862   Min.   :-0.6237     
    ##  1st Qu.:-0.9713   1st Qu.:-1.387   1st Qu.:-0.7862   1st Qu.:-0.6237     
    ##  Median : 0.0000   Median : 0.364   Median :-0.7862   Median :-0.6237     
    ##  Mean   : 0.0000   Mean   : 0.000   Mean   : 0.0000   Mean   : 0.0000     
    ##  3rd Qu.: 0.9713   3rd Qu.: 0.364   3rd Qu.: 0.7708   3rd Qu.: 1.1761     
    ##  Max.   : 0.9713   Max.   : 3.865   Max.   : 3.8849   Max.   : 4.7757     
    ##      mentor        mentor_meetings         A1        
    ##  Min.   :-0.8225   Min.   :-0.8035   Min.   :-5.997  
    ##  1st Qu.:-0.8225   1st Qu.:-0.8035   1st Qu.:-0.601  
    ##  Median :-0.8225   Median :-0.8035   Median : 0.748  
    ##  Mean   : 0.0000   Mean   : 0.0000   Mean   : 0.000  
    ##  3rd Qu.: 1.2037   3rd Qu.: 0.3899   3rd Qu.: 0.748  
    ##  Max.   : 1.2037   Max.   : 2.7767   Max.   : 0.748  
    ##  A - 2. Classes start and end on time
    ##  Min.   :-6.8735                     
    ##  1st Qu.:-0.9400                     
    ##  Median : 0.5434                     
    ##  Mean   : 0.0000                     
    ##  3rd Qu.: 0.5434                     
    ##  Max.   : 0.5434                     
    ##  A - 3. The learning environment is participative, involves learning by doing and is group-based
    ##  Min.   :-5.4927                                                                                
    ##  1st Qu.:-0.3914                                                                                
    ##  Median :-0.3914                                                                                
    ##  Mean   : 0.0000                                                                                
    ##  3rd Qu.: 0.8839                                                                                
    ##  Max.   : 0.8839                                                                                
    ##  A - 4. The subject content is delivered according to the course outline and meets my expectations
    ##  Min.   :-7.1168                                                                                  
    ##  1st Qu.:-1.0510                                                                                  
    ##  Median : 0.4654                                                                                  
    ##  Mean   : 0.0000                                                                                  
    ##  3rd Qu.: 0.4654                                                                                  
    ##  Max.   : 0.4654                                                                                  
    ##  A - 5. The topics are clear and logically developed
    ##  Min.   :-6.2560                                    
    ##  1st Qu.:-0.8207                                    
    ##  Median : 0.5382                                    
    ##  Mean   : 0.0000                                    
    ##  3rd Qu.: 0.5382                                    
    ##  Max.   : 0.5382                                    
    ##  A - 6. I am developing my oral and writing skills
    ##  Min.   :-4.23072                                 
    ##  1st Qu.:-0.07206                                 
    ##  Median :-0.07206                                 
    ##  Mean   : 0.00000                                 
    ##  3rd Qu.: 0.96761                                 
    ##  Max.   : 0.96761                                 
    ##  A - 7. I am developing my reflective and critical reasoning skills
    ##  Min.   :-5.3157                                                   
    ##  1st Qu.:-0.4126                                                   
    ##  Median :-0.4126                                                   
    ##  Mean   : 0.0000                                                   
    ##  3rd Qu.: 0.8131                                                   
    ##  Max.   : 0.8131                                                   
    ##  A - 8. The assessment methods are assisting me to learn
    ##  Min.   :-5.7582                                        
    ##  1st Qu.:-0.7120                                        
    ##  Median : 0.5496                                        
    ##  Mean   : 0.0000                                        
    ##  3rd Qu.: 0.5496                                        
    ##  Max.   : 0.5496                                        
    ##  A - 9. I receive relevant feedback
    ##  Min.   :-6.3418                   
    ##  1st Qu.:-0.7477                   
    ##  Median : 0.6508                   
    ##  Mean   : 0.0000                   
    ##  3rd Qu.: 0.6508                   
    ##  Max.   : 0.6508                   
    ##  A - 10. I read the recommended readings and notes
    ##  Min.   :-5.8527                                  
    ##  1st Qu.:-0.6560                                  
    ##  Median : 0.6432                                  
    ##  Mean   : 0.0000                                  
    ##  3rd Qu.: 0.6432                                  
    ##  Max.   : 0.6432                                  
    ##  A - 11. I use the eLearning material posted
    ##  Min.   :-6.6566                            
    ##  1st Qu.:-0.9347                            
    ##  Median : 0.4957                            
    ##  Mean   : 0.0000                            
    ##  3rd Qu.: 0.4957                            
    ##  Max.   : 0.4957                            
    ##  B - 1. Concept 1 of 6: Principles of Business Intelligence and the DataOps Philosophy
    ##  Min.   :-4.7453                                                                      
    ##  1st Qu.:-0.2345                                                                      
    ##  Median :-0.2345                                                                      
    ##  Mean   : 0.0000                                                                      
    ##  3rd Qu.: 0.8932                                                                      
    ##  Max.   : 0.8932                                                                      
    ##  B - 2. Concept 3 of 6: Linear Algorithms for Predictive Analytics
    ##  Min.   :-4.1348                                                  
    ##  1st Qu.:-0.9550                                                  
    ##  Median : 0.1049                                                  
    ##  Mean   : 0.0000                                                  
    ##  3rd Qu.: 1.1649                                                  
    ##  Max.   : 1.1649                                                  
    ##  C - 2. Quizzes at the end of each concept
    ##  Min.   :-5.9140                          
    ##  1st Qu.:-0.7087                          
    ##  Median : 0.5927                          
    ##  Mean   : 0.0000                          
    ##  3rd Qu.: 0.5927                          
    ##  Max.   : 0.5927                          
    ##  C - 3. Lab manuals that outline the steps to follow during the labs
    ##  Min.   :-6.0546                                                    
    ##  1st Qu.:-0.7486                                                    
    ##  Median : 0.5779                                                    
    ##  Mean   : 0.0000                                                    
    ##  3rd Qu.: 0.5779                                                    
    ##  Max.   : 0.5779                                                    
    ##  C - 4. Required lab work submissions at the end of each lab manual that outline the activity to be done on your own
    ##  Min.   :-5.9540                                                                                                    
    ##  1st Qu.:-0.6674                                                                                                    
    ##  Median : 0.6543                                                                                                    
    ##  Mean   : 0.0000                                                                                                    
    ##  3rd Qu.: 0.6543                                                                                                    
    ##  Max.   : 0.6543                                                                                                    
    ##  C - 5. Supplementary videos to watch
    ##  Min.   :-4.2614                     
    ##  1st Qu.:-0.1526                     
    ##  Median :-0.1526                     
    ##  Mean   : 0.0000                     
    ##  3rd Qu.: 0.8747                     
    ##  Max.   : 0.8747                     
    ##  C - 6. Supplementary podcasts to listen to
    ##  Min.   :-3.78607                          
    ##  1st Qu.:-0.03712                          
    ##  Median :-0.03712                          
    ##  Mean   : 0.00000                          
    ##  3rd Qu.: 0.90012                          
    ##  Max.   : 0.90012                          
    ##  C - 7. Supplementary content to read C - 8. Lectures slides
    ##  Min.   :-3.9487                      Min.   :-5.3324       
    ##  1st Qu.:-0.1231                      1st Qu.:-0.6492       
    ##  Median :-0.1231                      Median : 0.5216       
    ##  Mean   : 0.0000                      Mean   : 0.0000       
    ##  3rd Qu.: 0.8333                      3rd Qu.: 0.5216       
    ##  Max.   : 0.8333                      Max.   : 0.5216       
    ##  C - 9. Lecture notes on some of the lecture slides
    ##  Min.   :-5.8338                                   
    ##  1st Qu.:-0.7102                                   
    ##  Median : 0.5707                                   
    ##  Mean   : 0.0000                                   
    ##  3rd Qu.: 0.5707                                   
    ##  Max.   : 0.5707                                   
    ##  C - 10. The quality of the lectures given (quality measured by the breadth (the full span of knowledge of a subject) and depth (the extent to which specific topics are focused upon, amplified, and explored) of learning - NOT quality measured by how fun/co
    ##  Min.   :-5.6521                                                                                                                                                                                                                                                
    ##  1st Qu.:-0.6225                                                                                                                                                                                                                                                
    ##  Median : 0.6349                                                                                                                                                                                                                                                
    ##  Mean   : 0.0000                                                                                                                                                                                                                                                
    ##  3rd Qu.: 0.6349                                                                                                                                                                                                                                                
    ##  Max.   : 0.6349                                                                                                                                                                                                                                                
    ##  C - 11. The division of theory and practice such that most of the theory is done during the recorded online classes and most of the practice is done during the physical classes
    ##  Min.   :-5.4331                                                                                                                                                                 
    ##  1st Qu.:-0.5445                                                                                                                                                                 
    ##  Median : 0.6776                                                                                                                                                                 
    ##  Mean   : 0.0000                                                                                                                                                                 
    ##  3rd Qu.: 0.6776                                                                                                                                                                 
    ##  Max.   : 0.6776                                                                                                                                                                 
    ##  C - 12. The recordings of online classes Average Course Evaluation Rating
    ##  Min.   :-4.5022                          Min.   :-7.45714                
    ##  1st Qu.:-0.3015                          1st Qu.:-0.35465                
    ##  Median : 0.7486                          Median : 0.09882                
    ##  Mean   : 0.0000                          Mean   : 0.00000                
    ##  3rd Qu.: 0.7486                          3rd Qu.: 0.70324                
    ##  Max.   : 0.7486                          Max.   : 0.85434                
    ##  Average Level of Learning Attained Rating Average_Rating   
    ##  Min.   :-4.99256                          Min.   :-6.5612  
    ##  1st Qu.:-0.68274                          1st Qu.:-0.5801  
    ##  Median :-0.06706                          Median : 0.2356  
    ##  Mean   : 0.00000                          Mean   : 0.0000  
    ##  3rd Qu.: 0.54863                          3rd Qu.: 0.7793  
    ##  Max.   : 1.16432                          Max.   : 0.9152  
    ##  Project: Section 1-4: (20%) x/10 Project: Section 5-11: (50%) x/10
    ##  Min.   :-3.8114                  Min.   :-2.3600                  
    ##  1st Qu.:-0.2907                  1st Qu.:-0.2087                  
    ##  Median : 0.2327                  Median : 0.4366                  
    ##  Mean   : 0.0000                  Mean   : 0.0000                  
    ##  3rd Qu.: 0.4706                  3rd Qu.: 0.6159                  
    ##  Max.   : 0.9464                  Max.   : 1.2255                  
    ##  Project: Section 12: (30%) x/5 Project: (10%): x/30 x 100 TOTAL
    ##  Min.   :-0.564554              Min.   :-3.0961                 
    ##  1st Qu.:-0.564554              1st Qu.:-0.3172                 
    ##  Median :-0.564554              Median : 0.1989                 
    ##  Mean   : 0.000000              Mean   : 0.0000                 
    ##  3rd Qu.:-0.002781              3rd Qu.: 0.4569                 
    ##  Max.   : 2.244312              Max.   : 1.8662                 
    ##  Quiz 1 on Concept 1 (Introduction) x/32 Quiz 3 on Concept 3 (Linear) x/15
    ##  Min.   :-1.7842                         Min.   :-2.7876                  
    ##  1st Qu.:-0.7420                         1st Qu.:-0.6988                  
    ##  Median :-0.1578                         Median :-0.1019                  
    ##  Mean   : 0.0000                         Mean   : 0.0000                  
    ##  3rd Qu.: 0.5032                         3rd Qu.: 0.7933                  
    ##  Max.   : 2.2894                         Max.   : 1.6885                  
    ##  Quiz 4 on Concept 4 (Non-Linear) x/22 Quiz 5 on Concept 5 (Dashboarding) x/10
    ##  Min.   :-2.416485                     Min.   :-1.9631                        
    ##  1st Qu.:-0.541600                     1st Qu.:-0.4482                        
    ##  Median :-0.005129                     Median : 0.1361                        
    ##  Mean   : 0.000000                     Mean   : 0.0000                        
    ##  3rd Qu.: 0.809717                     3rd Qu.: 0.7204                        
    ##  Max.   : 1.639312                     Max.   : 2.4698                        
    ##     Quizzes         Lab 1 - 2.c. - (Simple Linear Regression) x/5
    ##  Min.   :-1.81638   Min.   :-5.1605                              
    ##  1st Qu.:-0.75175   1st Qu.: 0.2688                              
    ##  Median :-0.05512   Median : 0.2688                              
    ##  Mean   : 0.00000   Mean   : 0.0000                              
    ##  3rd Qu.: 0.54207   3rd Qu.: 0.2688                              
    ##  Max.   : 2.36638   Max.   : 0.2688                              
    ##  Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5
    ##  Min.   :-2.8893                                                
    ##  1st Qu.: 0.4332                                                
    ##  Median : 0.4332                                                
    ##  Mean   : 0.0000                                                
    ##  3rd Qu.: 0.4332                                                
    ##  Max.   : 0.5360                                                
    ##  Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5
    ##  Min.   :-1.9268                                  
    ##  1st Qu.:-0.4166                                  
    ##  Median : 0.6432                                  
    ##  Mean   : 0.0000                                  
    ##  3rd Qu.: 0.7227                                  
    ##  Max.   : 0.7227                                  
    ##  Lab 5 - Chart JS Dashboard Setup x/5    LabWork              CAT1         
    ##  Min.   :-1.4592                      Min.   :-3.20757   Min.   :-3.31328  
    ##  1st Qu.:-1.4592                      1st Qu.:-0.46190   1st Qu.:-0.43526  
    ##  Median : 0.6842                      Median : 0.01471   Median : 0.08824  
    ##  Mean   : 0.0000                      Mean   : 0.00000   Mean   : 0.00000  
    ##  3rd Qu.: 0.6842                      3rd Qu.: 0.90576   3rd Qu.: 0.80762  
    ##  Max.   : 0.6842                      Max.   : 1.05081   Max.   : 1.52700  
    ##       CAT2         Absenteeism Percentage   Coursework            EXAM         
    ##  Min.   :-1.2182   Min.   :-1.69613       Min.   :-2.74036   Min.   :-2.53037  
    ##  1st Qu.:-1.2182   1st Qu.:-0.88083       1st Qu.:-0.65650   1st Qu.:-0.58955  
    ##  Median : 0.2529   Median :-0.06663       Median : 0.00867   Median : 0.03151  
    ##  Mean   : 0.0000   Mean   : 0.00000       Mean   : 0.00000   Mean   : 0.00000  
    ##  3rd Qu.: 0.7056   3rd Qu.: 0.74867       3rd Qu.: 0.76863   3rd Qu.: 0.73021  
    ##  Max.   : 1.6110   Max.   : 4.00877       Max.   : 1.69569   Max.   : 1.81707  
    ##      TOTAL         
    ##  Min.   :-3.15733  
    ##  1st Qu.:-0.73640  
    ##  Median : 0.09983  
    ##  Mean   : 0.00000  
    ##  3rd Qu.: 0.74465  
    ##  Max.   : 1.94590

``` r
sapply(StudentPerformanceDataset_standardize_transform[, -1], sd)
```

    ##                                                                                                                                                                                                                                                             YOB 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                       motivator 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                     read_content_before_lecture 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                       anticipate_test_questions 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                     answer_rhetorical_questions 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                        find_terms_I_do_not_know 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                              copy_new_terms_in_reading_notebook 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                    take_quizzes_and_use_results 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                       reorganise_course_outline 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                     write_down_important_points 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                              space_out_revision 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                         studying_in_study_group 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                           schedule_appointments 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                   goal_oriented 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                               spaced_repetition 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                       testing_and_active_recall 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                    interleaving 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                    categorizing 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                         retrospective_timetable 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                   cornell_notes 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                            sq3r 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                         commute 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                      study_time 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                repeats_since_Y1 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                    paid_tuition 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                    free_tuition 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                extra_curricular 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                         sports_extra_curricular 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                               exercise_per_week 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                        meditate 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                            pray 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                        internet 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                            family_relationships 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                     friendships 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                          romantic_relationships 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                               spiritual_wellnes 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                              financial_wellness 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                          health 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                         day_out 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                       night_out 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                            alcohol_or_narcotics 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                          mentor 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                 mentor_meetings 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                              A1 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                            A - 2. Classes start and end on time 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                 A - 3. The learning environment is participative, involves learning by doing and is group-based 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                               A - 4. The subject content is delivered according to the course outline and meets my expectations 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                             A - 5. The topics are clear and logically developed 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                               A - 6. I am developing my oral and writing skills 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                              A - 7. I am developing my reflective and critical reasoning skills 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                         A - 8. The assessment methods are assisting me to learn 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                              A - 9. I receive relevant feedback 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                               A - 10. I read the recommended readings and notes 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                     A - 11. I use the eLearning material posted 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                           B - 1. Concept 1 of 6: Principles of Business Intelligence and the DataOps Philosophy 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                               B - 2. Concept 3 of 6: Linear Algorithms for Predictive Analytics 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                       C - 2. Quizzes at the end of each concept 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                             C - 3. Lab manuals that outline the steps to follow during the labs 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                             C - 4. Required lab work submissions at the end of each lab manual that outline the activity to be done on your own 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                            C - 5. Supplementary videos to watch 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                      C - 6. Supplementary podcasts to listen to 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                            C - 7. Supplementary content to read 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                          C - 8. Lectures slides 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                              C - 9. Lecture notes on some of the lecture slides 
    ##                                                                                                                                                                                                                                                               1 
    ## C - 10. The quality of the lectures given (quality measured by the breadth (the full span of knowledge of a subject) and depth (the extent to which specific topics are focused upon, amplified, and explored) of learning - NOT quality measured by how fun/co 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                C - 11. The division of theory and practice such that most of the theory is done during the recorded online classes and most of the practice is done during the physical classes 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                        C - 12. The recordings of online classes 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                Average Course Evaluation Rating 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                       Average Level of Learning Attained Rating 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                  Average_Rating 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                Project: Section 1-4: (20%) x/10 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                               Project: Section 5-11: (50%) x/10 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                  Project: Section 12: (30%) x/5 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                Project: (10%): x/30 x 100 TOTAL 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                         Quiz 1 on Concept 1 (Introduction) x/32 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                               Quiz 3 on Concept 3 (Linear) x/15 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                           Quiz 4 on Concept 4 (Non-Linear) x/22 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                         Quiz 5 on Concept 5 (Dashboarding) x/10 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                         Quizzes 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                   Lab 1 - 2.c. - (Simple Linear Regression) x/5 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                 Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                               Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                            Lab 5 - Chart JS Dashboard Setup x/5 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                         LabWork 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                            CAT1 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                            CAT2 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                          Absenteeism Percentage 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                      Coursework 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                            EXAM 
    ##                                                                                                                                                                                                                                                               1 
    ##                                                                                                                                                                                                                                                           TOTAL 
    ##                                                                                                                                                                                                                                                               1

``` r
summary(StudentPerformanceDataset)
```

    ##      gender            YOB         motivator      read_content_before_lecture
    ##  Min.   :0.0000   Min.   :1998   Min.   :0.0000   Min.   :1.000              
    ##  1st Qu.:0.0000   1st Qu.:2000   1st Qu.:1.0000   1st Qu.:2.000              
    ##  Median :1.0000   Median :2001   Median :1.0000   Median :3.000              
    ##  Mean   :0.5743   Mean   :2001   Mean   :0.7525   Mean   :2.752              
    ##  3rd Qu.:1.0000   3rd Qu.:2002   3rd Qu.:1.0000   3rd Qu.:3.000              
    ##  Max.   :1.0000   Max.   :2003   Max.   :1.0000   Max.   :5.000              
    ##  anticipate_test_questions answer_rhetorical_questions find_terms_I_do_not_know
    ##  Min.   :1.000             Min.   :1.000               Min.   :1.000           
    ##  1st Qu.:3.000             1st Qu.:3.000               1st Qu.:3.000           
    ##  Median :4.000             Median :4.000               Median :4.000           
    ##  Mean   :3.584             Mean   :3.426               Mean   :3.743           
    ##  3rd Qu.:4.000             3rd Qu.:4.000               3rd Qu.:5.000           
    ##  Max.   :5.000             Max.   :5.000               Max.   :5.000           
    ##  copy_new_terms_in_reading_notebook take_quizzes_and_use_results
    ##  Min.   :1.000                      Min.   :1.000               
    ##  1st Qu.:3.000                      1st Qu.:3.000               
    ##  Median :4.000                      Median :4.000               
    ##  Mean   :3.663                      Mean   :3.941               
    ##  3rd Qu.:4.000                      3rd Qu.:5.000               
    ##  Max.   :5.000                      Max.   :5.000               
    ##  reorganise_course_outline write_down_important_points space_out_revision
    ##  Min.   :1.000             Min.   :1.000               Min.   :1.000     
    ##  1st Qu.:3.000             1st Qu.:3.000               1st Qu.:3.000     
    ##  Median :3.000             Median :4.000               Median :3.000     
    ##  Mean   :3.376             Mean   :3.832               Mean   :3.228     
    ##  3rd Qu.:4.000             3rd Qu.:5.000               3rd Qu.:4.000     
    ##  Max.   :5.000             Max.   :5.000               Max.   :5.000     
    ##  studying_in_study_group schedule_appointments goal_oriented  
    ##  Min.   :1.000           Min.   :1.000         Min.   :0.000  
    ##  1st Qu.:1.000           1st Qu.:1.000         1st Qu.:0.000  
    ##  Median :2.000           Median :2.000         Median :0.000  
    ##  Mean   :2.455           Mean   :1.931         Mean   :0.198  
    ##  3rd Qu.:3.000           3rd Qu.:2.000         3rd Qu.:0.000  
    ##  Max.   :5.000           Max.   :5.000         Max.   :1.000  
    ##  spaced_repetition testing_and_active_recall  interleaving    categorizing  
    ##  Min.   :1.000     Min.   :1.000             Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:2.000     1st Qu.:3.000             1st Qu.:2.000   1st Qu.:2.000  
    ##  Median :3.000     Median :3.000             Median :2.000   Median :3.000  
    ##  Mean   :2.554     Mean   :3.059             Mean   :2.257   Mean   :2.713  
    ##  3rd Qu.:3.000     3rd Qu.:4.000             3rd Qu.:3.000   3rd Qu.:3.000  
    ##  Max.   :4.000     Max.   :4.000             Max.   :4.000   Max.   :4.000  
    ##  retrospective_timetable cornell_notes        sq3r          commute     
    ##  Min.   :1.000           Min.   :1.000   Min.   :1.000   Min.   :0.000  
    ##  1st Qu.:2.000           1st Qu.:2.000   1st Qu.:2.000   1st Qu.:2.000  
    ##  Median :2.000           Median :3.000   Median :3.000   Median :3.000  
    ##  Mean   :2.406           Mean   :2.545   Mean   :2.614   Mean   :2.703  
    ##  3rd Qu.:3.000           3rd Qu.:3.000   3rd Qu.:3.000   3rd Qu.:4.000  
    ##  Max.   :4.000           Max.   :4.000   Max.   :4.000   Max.   :4.000  
    ##    study_time    repeats_since_Y1  paid_tuition     free_tuition   
    ##  Min.   :0.000   Min.   : 0.00    Min.   :0.0000   Min.   :0.0000  
    ##  1st Qu.:1.000   1st Qu.: 0.00    1st Qu.:0.0000   1st Qu.:0.0000  
    ##  Median :2.000   Median : 2.00    Median :0.0000   Median :0.0000  
    ##  Mean   :1.733   Mean   : 2.03    Mean   :0.1089   Mean   :0.2673  
    ##  3rd Qu.:2.000   3rd Qu.: 3.00    3rd Qu.:0.0000   3rd Qu.:1.0000  
    ##  Max.   :4.000   Max.   :10.00    Max.   :1.0000   Max.   :1.0000  
    ##  extra_curricular sports_extra_curricular exercise_per_week    meditate     
    ##  Min.   :0.0000   Min.   :0.0000          Min.   :0.000     Min.   :0.0000  
    ##  1st Qu.:0.0000   1st Qu.:0.0000          1st Qu.:1.000     1st Qu.:0.0000  
    ##  Median :1.0000   Median :0.0000          Median :1.000     Median :1.0000  
    ##  Mean   :0.5248   Mean   :0.3564          Mean   :1.089     Mean   :0.7525  
    ##  3rd Qu.:1.0000   3rd Qu.:1.0000          3rd Qu.:2.000     3rd Qu.:1.0000  
    ##  Max.   :1.0000   Max.   :1.0000          Max.   :3.000     Max.   :3.0000  
    ##       pray          internet      family_relationships  friendships  
    ##  Min.   :0.000   Min.   :0.0000   Min.   :0.000        Min.   :0.00  
    ##  1st Qu.:1.000   1st Qu.:1.0000   1st Qu.:4.000        1st Qu.:4.00  
    ##  Median :2.000   Median :1.0000   Median :4.000        Median :4.00  
    ##  Mean   :2.069   Mean   :0.8614   Mean   :4.149        Mean   :3.97  
    ##  3rd Qu.:3.000   3rd Qu.:1.0000   3rd Qu.:5.000        3rd Qu.:4.00  
    ##  Max.   :3.000   Max.   :1.0000   Max.   :5.000        Max.   :5.00  
    ##  romantic_relationships spiritual_wellnes financial_wellness     health 
    ##  Min.   :0.000          Min.   :0.000     Min.   :0          Min.   :0  
    ##  1st Qu.:0.000          1st Qu.:3.000     1st Qu.:2          1st Qu.:3  
    ##  Median :0.000          Median :4.000     Median :3          Median :4  
    ##  Mean   :1.356          Mean   :3.614     Mean   :3          Mean   :4  
    ##  3rd Qu.:3.000          3rd Qu.:4.000     3rd Qu.:4          3rd Qu.:5  
    ##  Max.   :4.000          Max.   :5.000     Max.   :5          Max.   :5  
    ##     day_out         night_out     alcohol_or_narcotics     mentor      
    ##  Min.   :0.0000   Min.   :0.000   Min.   :0.0000       Min.   :0.0000  
    ##  1st Qu.:0.0000   1st Qu.:0.000   1st Qu.:0.0000       1st Qu.:0.0000  
    ##  Median :1.0000   Median :0.000   Median :0.0000       Median :0.0000  
    ##  Mean   :0.7921   Mean   :0.505   Mean   :0.3465       Mean   :0.4059  
    ##  3rd Qu.:1.0000   3rd Qu.:1.000   3rd Qu.:1.0000       3rd Qu.:1.0000  
    ##  Max.   :3.0000   Max.   :3.000   Max.   :3.0000       Max.   :1.0000  
    ##  mentor_meetings        A1        A - 2. Classes start and end on time
    ##  Min.   :0.0000   Min.   :0.000   Min.   :0.000                       
    ##  1st Qu.:0.0000   1st Qu.:4.000   1st Qu.:4.000                       
    ##  Median :0.0000   Median :5.000   Median :5.000                       
    ##  Mean   :0.6733   Mean   :4.446   Mean   :4.634                       
    ##  3rd Qu.:1.0000   3rd Qu.:5.000   3rd Qu.:5.000                       
    ##  Max.   :3.0000   Max.   :5.000   Max.   :5.000                       
    ##  A - 3. The learning environment is participative, involves learning by doing and is group-based
    ##  Min.   :0.000                                                                                  
    ##  1st Qu.:4.000                                                                                  
    ##  Median :4.000                                                                                  
    ##  Mean   :4.307                                                                                  
    ##  3rd Qu.:5.000                                                                                  
    ##  Max.   :5.000                                                                                  
    ##  A - 4. The subject content is delivered according to the course outline and meets my expectations
    ##  Min.   :0.000                                                                                    
    ##  1st Qu.:4.000                                                                                    
    ##  Median :5.000                                                                                    
    ##  Mean   :4.693                                                                                    
    ##  3rd Qu.:5.000                                                                                    
    ##  Max.   :5.000                                                                                    
    ##  A - 5. The topics are clear and logically developed
    ##  Min.   :0.000                                      
    ##  1st Qu.:4.000                                      
    ##  Median :5.000                                      
    ##  Mean   :4.604                                      
    ##  3rd Qu.:5.000                                      
    ##  Max.   :5.000                                      
    ##  A - 6. I am developing my oral and writing skills
    ##  Min.   :0.000                                    
    ##  1st Qu.:4.000                                    
    ##  Median :4.000                                    
    ##  Mean   :4.069                                    
    ##  3rd Qu.:5.000                                    
    ##  Max.   :5.000                                    
    ##  A - 7. I am developing my reflective and critical reasoning skills
    ##  Min.   :0.000                                                     
    ##  1st Qu.:4.000                                                     
    ##  Median :4.000                                                     
    ##  Mean   :4.337                                                     
    ##  3rd Qu.:5.000                                                     
    ##  Max.   :5.000                                                     
    ##  A - 8. The assessment methods are assisting me to learn
    ##  Min.   :0.000                                          
    ##  1st Qu.:4.000                                          
    ##  Median :5.000                                          
    ##  Mean   :4.564                                          
    ##  3rd Qu.:5.000                                          
    ##  Max.   :5.000                                          
    ##  A - 9. I receive relevant feedback
    ##  Min.   :0.000                     
    ##  1st Qu.:4.000                     
    ##  Median :5.000                     
    ##  Mean   :4.535                     
    ##  3rd Qu.:5.000                     
    ##  Max.   :5.000                     
    ##  A - 10. I read the recommended readings and notes
    ##  Min.   :0.000                                    
    ##  1st Qu.:4.000                                    
    ##  Median :5.000                                    
    ##  Mean   :4.505                                    
    ##  3rd Qu.:5.000                                    
    ##  Max.   :5.000                                    
    ##  A - 11. I use the eLearning material posted
    ##  Min.   :0.000                              
    ##  1st Qu.:4.000                              
    ##  Median :5.000                              
    ##  Mean   :4.653                              
    ##  3rd Qu.:5.000                              
    ##  Max.   :5.000                              
    ##  B - 1. Concept 1 of 6: Principles of Business Intelligence and the DataOps Philosophy
    ##  Min.   :0.000                                                                        
    ##  1st Qu.:4.000                                                                        
    ##  Median :4.000                                                                        
    ##  Mean   :4.208                                                                        
    ##  3rd Qu.:5.000                                                                        
    ##  Max.   :5.000                                                                        
    ##  B - 2. Concept 3 of 6: Linear Algorithms for Predictive Analytics
    ##  Min.   :0.000                                                    
    ##  1st Qu.:3.000                                                    
    ##  Median :4.000                                                    
    ##  Mean   :3.901                                                    
    ##  3rd Qu.:5.000                                                    
    ##  Max.   :5.000                                                    
    ##  C - 2. Quizzes at the end of each concept
    ##  Min.   :0.000                            
    ##  1st Qu.:4.000                            
    ##  Median :5.000                            
    ##  Mean   :4.545                            
    ##  3rd Qu.:5.000                            
    ##  Max.   :5.000                            
    ##  C - 3. Lab manuals that outline the steps to follow during the labs
    ##  Min.   :0.000                                                      
    ##  1st Qu.:4.000                                                      
    ##  Median :5.000                                                      
    ##  Mean   :4.564                                                      
    ##  3rd Qu.:5.000                                                      
    ##  Max.   :5.000                                                      
    ##  C - 4. Required lab work submissions at the end of each lab manual that outline the activity to be done on your own
    ##  Min.   :0.000                                                                                                      
    ##  1st Qu.:4.000                                                                                                      
    ##  Median :5.000                                                                                                      
    ##  Mean   :4.505                                                                                                      
    ##  3rd Qu.:5.000                                                                                                      
    ##  Max.   :5.000                                                                                                      
    ##  C - 5. Supplementary videos to watch
    ##  Min.   :0.000                       
    ##  1st Qu.:4.000                       
    ##  Median :4.000                       
    ##  Mean   :4.149                       
    ##  3rd Qu.:5.000                       
    ##  Max.   :5.000                       
    ##  C - 6. Supplementary podcasts to listen to
    ##  Min.   :0.00                              
    ##  1st Qu.:4.00                              
    ##  Median :4.00                              
    ##  Mean   :4.04                              
    ##  3rd Qu.:5.00                              
    ##  Max.   :5.00                              
    ##  C - 7. Supplementary content to read C - 8. Lectures slides
    ##  Min.   :0.000                        Min.   :0.000         
    ##  1st Qu.:4.000                        1st Qu.:4.000         
    ##  Median :4.000                        Median :5.000         
    ##  Mean   :4.129                        Mean   :4.554         
    ##  3rd Qu.:5.000                        3rd Qu.:5.000         
    ##  Max.   :5.000                        Max.   :5.000         
    ##  C - 9. Lecture notes on some of the lecture slides
    ##  Min.   :0.000                                     
    ##  1st Qu.:4.000                                     
    ##  Median :5.000                                     
    ##  Mean   :4.554                                     
    ##  3rd Qu.:5.000                                     
    ##  Max.   :5.000                                     
    ##  C - 10. The quality of the lectures given (quality measured by the breadth (the full span of knowledge of a subject) and depth (the extent to which specific topics are focused upon, amplified, and explored) of learning - NOT quality measured by how fun/co
    ##  Min.   :0.000                                                                                                                                                                                                                                                  
    ##  1st Qu.:4.000                                                                                                                                                                                                                                                  
    ##  Median :5.000                                                                                                                                                                                                                                                  
    ##  Mean   :4.495                                                                                                                                                                                                                                                  
    ##  3rd Qu.:5.000                                                                                                                                                                                                                                                  
    ##  Max.   :5.000                                                                                                                                                                                                                                                  
    ##  C - 11. The division of theory and practice such that most of the theory is done during the recorded online classes and most of the practice is done during the physical classes
    ##  Min.   :0.000                                                                                                                                                                   
    ##  1st Qu.:4.000                                                                                                                                                                   
    ##  Median :5.000                                                                                                                                                                   
    ##  Mean   :4.446                                                                                                                                                                   
    ##  3rd Qu.:5.000                                                                                                                                                                   
    ##  Max.   :5.000                                                                                                                                                                   
    ##  C - 12. The recordings of online classes Average Course Evaluation Rating
    ##  Min.   :0.000                            Min.   :0.000                   
    ##  1st Qu.:4.000                            1st Qu.:4.273                   
    ##  Median :5.000                            Median :4.545                   
    ##  Mean   :4.287                            Mean   :4.486                   
    ##  3rd Qu.:5.000                            3rd Qu.:4.909                   
    ##  Max.   :5.000                            Max.   :5.000                   
    ##  Average Level of Learning Attained Rating Average_Rating 
    ##  Min.   :0.000                             Min.   :0.000  
    ##  1st Qu.:3.500                             1st Qu.:4.000  
    ##  Median :4.000                             Median :4.545  
    ##  Mean   :4.054                             Mean   :4.388  
    ##  3rd Qu.:4.500                             3rd Qu.:4.909  
    ##  Max.   :5.000                             Max.   :5.000  
    ##  Project: Section 1-4: (20%) x/10 Project: Section 5-11: (50%) x/10
    ##  Min.   : 0.000                   Min.   : 0.000                   
    ##  1st Qu.: 7.400                   1st Qu.: 6.000                   
    ##  Median : 8.500                   Median : 7.800                   
    ##  Mean   : 8.011                   Mean   : 6.582                   
    ##  3rd Qu.: 9.000                   3rd Qu.: 8.300                   
    ##  Max.   :10.000                   Max.   :10.000                   
    ##  Project: Section 12: (30%) x/5 Project: (10%): x/30 x 100 TOTAL
    ##  Min.   :0.000                  Min.   :  0.00                  
    ##  1st Qu.:0.000                  1st Qu.: 56.00                  
    ##  Median :0.000                  Median : 66.40                  
    ##  Mean   :1.005                  Mean   : 62.39                  
    ##  3rd Qu.:1.000                  3rd Qu.: 71.60                  
    ##  Max.   :5.000                  Max.   :100.00                  
    ##  Quiz 1 on Concept 1 (Introduction) x/32 Quiz 3 on Concept 3 (Linear) x/15
    ##  Min.   : 4.75                           Min.   : 0.000                   
    ##  1st Qu.:11.53                           1st Qu.: 7.000                   
    ##  Median :15.33                           Median : 9.000                   
    ##  Mean   :16.36                           Mean   : 9.342                   
    ##  3rd Qu.:19.63                           3rd Qu.:12.000                   
    ##  Max.   :31.25                           Max.   :15.000                   
    ##  Quiz 4 on Concept 4 (Non-Linear) x/22 Quiz 5 on Concept 5 (Dashboarding) x/10
    ##  Min.   : 0.00                         Min.   : 0.000                         
    ##  1st Qu.:10.17                         1st Qu.: 4.330                         
    ##  Median :13.08                         Median : 6.000                         
    ##  Mean   :13.11                         Mean   : 5.611                         
    ##  3rd Qu.:17.50                         3rd Qu.: 7.670                         
    ##  Max.   :22.00                         Max.   :12.670                         
    ##     Quizzes      Lab 1 - 2.c. - (Simple Linear Regression) x/5
    ##  Min.   :26.26   Min.   :0.000                                
    ##  1st Qu.:43.82   1st Qu.:5.000                                
    ##  Median :55.31   Median :5.000                                
    ##  Mean   :56.22   Mean   :4.752                                
    ##  3rd Qu.:65.16   3rd Qu.:5.000                                
    ##  Max.   :95.25   Max.   :5.000                                
    ##  Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5
    ##  Min.   :0.000                                                  
    ##  1st Qu.:4.850                                                  
    ##  Median :4.850                                                  
    ##  Mean   :4.218                                                  
    ##  3rd Qu.:4.850                                                  
    ##  Max.   :5.000                                                  
    ##  Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5
    ##  Min.   :0.000                                    
    ##  1st Qu.:2.850                                    
    ##  Median :4.850                                    
    ##  Mean   :3.636                                    
    ##  3rd Qu.:5.000                                    
    ##  Max.   :5.000                                    
    ##  Lab 5 - Chart JS Dashboard Setup x/5    LabWork            CAT1      
    ##  Min.   :0.000                        Min.   : 17.80   Min.   : 0.00  
    ##  1st Qu.:0.000                        1st Qu.: 70.80   1st Qu.:57.89  
    ##  Median :5.000                        Median : 80.00   Median :68.42  
    ##  Mean   :3.404                        Mean   : 79.72   Mean   :66.65  
    ##  3rd Qu.:5.000                        3rd Qu.: 97.20   3rd Qu.:82.89  
    ##  Max.   :5.000                        Max.   :100.00   Max.   :97.36  
    ##       CAT2        Absenteeism Percentage   Coursework         EXAM      
    ##  Min.   :  0.00   Min.   : 0.00          Min.   : 7.47   Min.   : 0.00  
    ##  1st Qu.:  0.00   1st Qu.: 7.41          1st Qu.:20.44   1st Qu.:25.00  
    ##  Median : 52.00   Median :14.81          Median :24.58   Median :33.00  
    ##  Mean   : 43.06   Mean   :15.42          Mean   :24.53   Mean   :32.59  
    ##  3rd Qu.: 68.00   3rd Qu.:22.22          3rd Qu.:29.31   3rd Qu.:42.00  
    ##  Max.   :100.00   Max.   :51.85          Max.   :35.08   Max.   :56.00  
    ##      TOTAL      
    ##  Min.   : 7.47  
    ##  1st Qu.:45.54  
    ##  Median :58.69  
    ##  Mean   :57.12  
    ##  3rd Qu.:68.83  
    ##  Max.   :87.72

``` r
model_of_the_transform <- preProcess(StudentPerformanceDataset, method = c("range"))
print(model_of_the_transform)
```

    ## Created from 101 samples and 91 variables
    ## 
    ## Pre-processing:
    ##   - ignored (0)
    ##   - re-scaling to [0, 1] (91)

``` r
StudentPerformanceDataset_normalize_transform <- predict(model_of_the_transform, 
                                                         StudentPerformanceDataset)
summary(StudentPerformanceDataset_normalize_transform)
```

    ##      gender            YOB           motivator      read_content_before_lecture
    ##  Min.   :0.0000   Min.   :0.0000   Min.   :0.0000   Min.   :0.0000             
    ##  1st Qu.:0.0000   1st Qu.:0.4000   1st Qu.:1.0000   1st Qu.:0.2500             
    ##  Median :1.0000   Median :0.6000   Median :1.0000   Median :0.5000             
    ##  Mean   :0.5743   Mean   :0.5802   Mean   :0.7525   Mean   :0.4381             
    ##  3rd Qu.:1.0000   3rd Qu.:0.8000   3rd Qu.:1.0000   3rd Qu.:0.5000             
    ##  Max.   :1.0000   Max.   :1.0000   Max.   :1.0000   Max.   :1.0000             
    ##  anticipate_test_questions answer_rhetorical_questions find_terms_I_do_not_know
    ##  Min.   :0.000             Min.   :0.0000              Min.   :0.0000          
    ##  1st Qu.:0.500             1st Qu.:0.5000              1st Qu.:0.5000          
    ##  Median :0.750             Median :0.7500              Median :0.7500          
    ##  Mean   :0.646             Mean   :0.6064              Mean   :0.6856          
    ##  3rd Qu.:0.750             3rd Qu.:0.7500              3rd Qu.:1.0000          
    ##  Max.   :1.000             Max.   :1.0000              Max.   :1.0000          
    ##  copy_new_terms_in_reading_notebook take_quizzes_and_use_results
    ##  Min.   :0.0000                     Min.   :0.0000              
    ##  1st Qu.:0.5000                     1st Qu.:0.5000              
    ##  Median :0.7500                     Median :0.7500              
    ##  Mean   :0.6658                     Mean   :0.7351              
    ##  3rd Qu.:0.7500                     3rd Qu.:1.0000              
    ##  Max.   :1.0000                     Max.   :1.0000              
    ##  reorganise_course_outline write_down_important_points space_out_revision
    ##  Min.   :0.0000            Min.   :0.0000              Min.   :0.0000    
    ##  1st Qu.:0.5000            1st Qu.:0.5000              1st Qu.:0.5000    
    ##  Median :0.5000            Median :0.7500              Median :0.5000    
    ##  Mean   :0.5941            Mean   :0.7079              Mean   :0.5569    
    ##  3rd Qu.:0.7500            3rd Qu.:1.0000              3rd Qu.:0.7500    
    ##  Max.   :1.0000            Max.   :1.0000              Max.   :1.0000    
    ##  studying_in_study_group schedule_appointments goal_oriented  
    ##  Min.   :0.0000          Min.   :0.0000        Min.   :0.000  
    ##  1st Qu.:0.0000          1st Qu.:0.0000        1st Qu.:0.000  
    ##  Median :0.2500          Median :0.2500        Median :0.000  
    ##  Mean   :0.3639          Mean   :0.2327        Mean   :0.198  
    ##  3rd Qu.:0.5000          3rd Qu.:0.2500        3rd Qu.:0.000  
    ##  Max.   :1.0000          Max.   :1.0000        Max.   :1.000  
    ##  spaced_repetition testing_and_active_recall  interleaving     categorizing   
    ##  Min.   :0.0000    Min.   :0.0000            Min.   :0.0000   Min.   :0.0000  
    ##  1st Qu.:0.3333    1st Qu.:0.6667            1st Qu.:0.3333   1st Qu.:0.3333  
    ##  Median :0.6667    Median :0.6667            Median :0.3333   Median :0.6667  
    ##  Mean   :0.5182    Mean   :0.6865            Mean   :0.4191   Mean   :0.5710  
    ##  3rd Qu.:0.6667    3rd Qu.:1.0000            3rd Qu.:0.6667   3rd Qu.:0.6667  
    ##  Max.   :1.0000    Max.   :1.0000            Max.   :1.0000   Max.   :1.0000  
    ##  retrospective_timetable cornell_notes         sq3r           commute      
    ##  Min.   :0.0000          Min.   :0.0000   Min.   :0.0000   Min.   :0.0000  
    ##  1st Qu.:0.3333          1st Qu.:0.3333   1st Qu.:0.3333   1st Qu.:0.5000  
    ##  Median :0.3333          Median :0.6667   Median :0.6667   Median :0.7500  
    ##  Mean   :0.4686          Mean   :0.5149   Mean   :0.5380   Mean   :0.6757  
    ##  3rd Qu.:0.6667          3rd Qu.:0.6667   3rd Qu.:0.6667   3rd Qu.:1.0000  
    ##  Max.   :1.0000          Max.   :1.0000   Max.   :1.0000   Max.   :1.0000  
    ##    study_time     repeats_since_Y1  paid_tuition     free_tuition   
    ##  Min.   :0.0000   Min.   :0.000    Min.   :0.0000   Min.   :0.0000  
    ##  1st Qu.:0.2500   1st Qu.:0.000    1st Qu.:0.0000   1st Qu.:0.0000  
    ##  Median :0.5000   Median :0.200    Median :0.0000   Median :0.0000  
    ##  Mean   :0.4332   Mean   :0.203    Mean   :0.1089   Mean   :0.2673  
    ##  3rd Qu.:0.5000   3rd Qu.:0.300    3rd Qu.:0.0000   3rd Qu.:1.0000  
    ##  Max.   :1.0000   Max.   :1.000    Max.   :1.0000   Max.   :1.0000  
    ##  extra_curricular sports_extra_curricular exercise_per_week    meditate     
    ##  Min.   :0.0000   Min.   :0.0000          Min.   :0.0000    Min.   :0.0000  
    ##  1st Qu.:0.0000   1st Qu.:0.0000          1st Qu.:0.3333    1st Qu.:0.0000  
    ##  Median :1.0000   Median :0.0000          Median :0.3333    Median :0.3333  
    ##  Mean   :0.5248   Mean   :0.3564          Mean   :0.3630    Mean   :0.2508  
    ##  3rd Qu.:1.0000   3rd Qu.:1.0000          3rd Qu.:0.6667    3rd Qu.:0.3333  
    ##  Max.   :1.0000   Max.   :1.0000          Max.   :1.0000    Max.   :1.0000  
    ##       pray           internet      family_relationships  friendships    
    ##  Min.   :0.0000   Min.   :0.0000   Min.   :0.0000       Min.   :0.0000  
    ##  1st Qu.:0.3333   1st Qu.:1.0000   1st Qu.:0.8000       1st Qu.:0.8000  
    ##  Median :0.6667   Median :1.0000   Median :0.8000       Median :0.8000  
    ##  Mean   :0.6898   Mean   :0.8614   Mean   :0.8297       Mean   :0.7941  
    ##  3rd Qu.:1.0000   3rd Qu.:1.0000   3rd Qu.:1.0000       3rd Qu.:0.8000  
    ##  Max.   :1.0000   Max.   :1.0000   Max.   :1.0000       Max.   :1.0000  
    ##  romantic_relationships spiritual_wellnes financial_wellness     health   
    ##  Min.   :0.0000         Min.   :0.0000    Min.   :0.0        Min.   :0.0  
    ##  1st Qu.:0.0000         1st Qu.:0.6000    1st Qu.:0.4        1st Qu.:0.6  
    ##  Median :0.0000         Median :0.8000    Median :0.6        Median :0.8  
    ##  Mean   :0.3391         Mean   :0.7228    Mean   :0.6        Mean   :0.8  
    ##  3rd Qu.:0.7500         3rd Qu.:0.8000    3rd Qu.:0.8        3rd Qu.:1.0  
    ##  Max.   :1.0000         Max.   :1.0000    Max.   :1.0        Max.   :1.0  
    ##     day_out         night_out      alcohol_or_narcotics     mentor      
    ##  Min.   :0.0000   Min.   :0.0000   Min.   :0.0000       Min.   :0.0000  
    ##  1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:0.0000       1st Qu.:0.0000  
    ##  Median :0.3333   Median :0.0000   Median :0.0000       Median :0.0000  
    ##  Mean   :0.2640   Mean   :0.1683   Mean   :0.1155       Mean   :0.4059  
    ##  3rd Qu.:0.3333   3rd Qu.:0.3333   3rd Qu.:0.3333       3rd Qu.:1.0000  
    ##  Max.   :1.0000   Max.   :1.0000   Max.   :1.0000       Max.   :1.0000  
    ##  mentor_meetings        A1         A - 2. Classes start and end on time
    ##  Min.   :0.0000   Min.   :0.0000   Min.   :0.0000                      
    ##  1st Qu.:0.0000   1st Qu.:0.8000   1st Qu.:0.8000                      
    ##  Median :0.0000   Median :1.0000   Median :1.0000                      
    ##  Mean   :0.2244   Mean   :0.8891   Mean   :0.9267                      
    ##  3rd Qu.:0.3333   3rd Qu.:1.0000   3rd Qu.:1.0000                      
    ##  Max.   :1.0000   Max.   :1.0000   Max.   :1.0000                      
    ##  A - 3. The learning environment is participative, involves learning by doing and is group-based
    ##  Min.   :0.0000                                                                                 
    ##  1st Qu.:0.8000                                                                                 
    ##  Median :0.8000                                                                                 
    ##  Mean   :0.8614                                                                                 
    ##  3rd Qu.:1.0000                                                                                 
    ##  Max.   :1.0000                                                                                 
    ##  A - 4. The subject content is delivered according to the course outline and meets my expectations
    ##  Min.   :0.0000                                                                                   
    ##  1st Qu.:0.8000                                                                                   
    ##  Median :1.0000                                                                                   
    ##  Mean   :0.9386                                                                                   
    ##  3rd Qu.:1.0000                                                                                   
    ##  Max.   :1.0000                                                                                   
    ##  A - 5. The topics are clear and logically developed
    ##  Min.   :0.0000                                     
    ##  1st Qu.:0.8000                                     
    ##  Median :1.0000                                     
    ##  Mean   :0.9208                                     
    ##  3rd Qu.:1.0000                                     
    ##  Max.   :1.0000                                     
    ##  A - 6. I am developing my oral and writing skills
    ##  Min.   :0.0000                                   
    ##  1st Qu.:0.8000                                   
    ##  Median :0.8000                                   
    ##  Mean   :0.8139                                   
    ##  3rd Qu.:1.0000                                   
    ##  Max.   :1.0000                                   
    ##  A - 7. I am developing my reflective and critical reasoning skills
    ##  Min.   :0.0000                                                    
    ##  1st Qu.:0.8000                                                    
    ##  Median :0.8000                                                    
    ##  Mean   :0.8673                                                    
    ##  3rd Qu.:1.0000                                                    
    ##  Max.   :1.0000                                                    
    ##  A - 8. The assessment methods are assisting me to learn
    ##  Min.   :0.0000                                         
    ##  1st Qu.:0.8000                                         
    ##  Median :1.0000                                         
    ##  Mean   :0.9129                                         
    ##  3rd Qu.:1.0000                                         
    ##  Max.   :1.0000                                         
    ##  A - 9. I receive relevant feedback
    ##  Min.   :0.0000                    
    ##  1st Qu.:0.8000                    
    ##  Median :1.0000                    
    ##  Mean   :0.9069                    
    ##  3rd Qu.:1.0000                    
    ##  Max.   :1.0000                    
    ##  A - 10. I read the recommended readings and notes
    ##  Min.   :0.000                                    
    ##  1st Qu.:0.800                                    
    ##  Median :1.000                                    
    ##  Mean   :0.901                                    
    ##  3rd Qu.:1.000                                    
    ##  Max.   :1.000                                    
    ##  A - 11. I use the eLearning material posted
    ##  Min.   :0.0000                             
    ##  1st Qu.:0.8000                             
    ##  Median :1.0000                             
    ##  Mean   :0.9307                             
    ##  3rd Qu.:1.0000                             
    ##  Max.   :1.0000                             
    ##  B - 1. Concept 1 of 6: Principles of Business Intelligence and the DataOps Philosophy
    ##  Min.   :0.0000                                                                       
    ##  1st Qu.:0.8000                                                                       
    ##  Median :0.8000                                                                       
    ##  Mean   :0.8416                                                                       
    ##  3rd Qu.:1.0000                                                                       
    ##  Max.   :1.0000                                                                       
    ##  B - 2. Concept 3 of 6: Linear Algorithms for Predictive Analytics
    ##  Min.   :0.0000                                                   
    ##  1st Qu.:0.6000                                                   
    ##  Median :0.8000                                                   
    ##  Mean   :0.7802                                                   
    ##  3rd Qu.:1.0000                                                   
    ##  Max.   :1.0000                                                   
    ##  C - 2. Quizzes at the end of each concept
    ##  Min.   :0.0000                           
    ##  1st Qu.:0.8000                           
    ##  Median :1.0000                           
    ##  Mean   :0.9089                           
    ##  3rd Qu.:1.0000                           
    ##  Max.   :1.0000                           
    ##  C - 3. Lab manuals that outline the steps to follow during the labs
    ##  Min.   :0.0000                                                     
    ##  1st Qu.:0.8000                                                     
    ##  Median :1.0000                                                     
    ##  Mean   :0.9129                                                     
    ##  3rd Qu.:1.0000                                                     
    ##  Max.   :1.0000                                                     
    ##  C - 4. Required lab work submissions at the end of each lab manual that outline the activity to be done on your own
    ##  Min.   :0.000                                                                                                      
    ##  1st Qu.:0.800                                                                                                      
    ##  Median :1.000                                                                                                      
    ##  Mean   :0.901                                                                                                      
    ##  3rd Qu.:1.000                                                                                                      
    ##  Max.   :1.000                                                                                                      
    ##  C - 5. Supplementary videos to watch
    ##  Min.   :0.0000                      
    ##  1st Qu.:0.8000                      
    ##  Median :0.8000                      
    ##  Mean   :0.8297                      
    ##  3rd Qu.:1.0000                      
    ##  Max.   :1.0000                      
    ##  C - 6. Supplementary podcasts to listen to
    ##  Min.   :0.0000                            
    ##  1st Qu.:0.8000                            
    ##  Median :0.8000                            
    ##  Mean   :0.8079                            
    ##  3rd Qu.:1.0000                            
    ##  Max.   :1.0000                            
    ##  C - 7. Supplementary content to read C - 8. Lectures slides
    ##  Min.   :0.0000                       Min.   :0.0000        
    ##  1st Qu.:0.8000                       1st Qu.:0.8000        
    ##  Median :0.8000                       Median :1.0000        
    ##  Mean   :0.8257                       Mean   :0.9109        
    ##  3rd Qu.:1.0000                       3rd Qu.:1.0000        
    ##  Max.   :1.0000                       Max.   :1.0000        
    ##  C - 9. Lecture notes on some of the lecture slides
    ##  Min.   :0.0000                                    
    ##  1st Qu.:0.8000                                    
    ##  Median :1.0000                                    
    ##  Mean   :0.9109                                    
    ##  3rd Qu.:1.0000                                    
    ##  Max.   :1.0000                                    
    ##  C - 10. The quality of the lectures given (quality measured by the breadth (the full span of knowledge of a subject) and depth (the extent to which specific topics are focused upon, amplified, and explored) of learning - NOT quality measured by how fun/co
    ##  Min.   :0.000                                                                                                                                                                                                                                                  
    ##  1st Qu.:0.800                                                                                                                                                                                                                                                  
    ##  Median :1.000                                                                                                                                                                                                                                                  
    ##  Mean   :0.899                                                                                                                                                                                                                                                  
    ##  3rd Qu.:1.000                                                                                                                                                                                                                                                  
    ##  Max.   :1.000                                                                                                                                                                                                                                                  
    ##  C - 11. The division of theory and practice such that most of the theory is done during the recorded online classes and most of the practice is done during the physical classes
    ##  Min.   :0.0000                                                                                                                                                                  
    ##  1st Qu.:0.8000                                                                                                                                                                  
    ##  Median :1.0000                                                                                                                                                                  
    ##  Mean   :0.8891                                                                                                                                                                  
    ##  3rd Qu.:1.0000                                                                                                                                                                  
    ##  Max.   :1.0000                                                                                                                                                                  
    ##  C - 12. The recordings of online classes Average Course Evaluation Rating
    ##  Min.   :0.0000                           Min.   :0.0000                  
    ##  1st Qu.:0.8000                           1st Qu.:0.8545                  
    ##  Median :1.0000                           Median :0.9091                  
    ##  Mean   :0.8574                           Mean   :0.8972                  
    ##  3rd Qu.:1.0000                           3rd Qu.:0.9818                  
    ##  Max.   :1.0000                           Max.   :1.0000                  
    ##  Average Level of Learning Attained Rating Average_Rating  
    ##  Min.   :0.0000                            Min.   :0.0000  
    ##  1st Qu.:0.7000                            1st Qu.:0.8000  
    ##  Median :0.8000                            Median :0.9091  
    ##  Mean   :0.8109                            Mean   :0.8776  
    ##  3rd Qu.:0.9000                            3rd Qu.:0.9818  
    ##  Max.   :1.0000                            Max.   :1.0000  
    ##  Project: Section 1-4: (20%) x/10 Project: Section 5-11: (50%) x/10
    ##  Min.   :0.0000                   Min.   :0.0000                   
    ##  1st Qu.:0.7400                   1st Qu.:0.6000                   
    ##  Median :0.8500                   Median :0.7800                   
    ##  Mean   :0.8011                   Mean   :0.6582                   
    ##  3rd Qu.:0.9000                   3rd Qu.:0.8300                   
    ##  Max.   :1.0000                   Max.   :1.0000                   
    ##  Project: Section 12: (30%) x/5 Project: (10%): x/30 x 100 TOTAL
    ##  Min.   :0.000                  Min.   :0.0000                  
    ##  1st Qu.:0.000                  1st Qu.:0.5600                  
    ##  Median :0.000                  Median :0.6640                  
    ##  Mean   :0.201                  Mean   :0.6239                  
    ##  3rd Qu.:0.200                  3rd Qu.:0.7160                  
    ##  Max.   :1.000                  Max.   :1.0000                  
    ##  Quiz 1 on Concept 1 (Introduction) x/32 Quiz 3 on Concept 3 (Linear) x/15
    ##  Min.   :0.0000                          Min.   :0.0000                   
    ##  1st Qu.:0.2558                          1st Qu.:0.4667                   
    ##  Median :0.3992                          Median :0.6000                   
    ##  Mean   :0.4380                          Mean   :0.6228                   
    ##  3rd Qu.:0.5615                          3rd Qu.:0.8000                   
    ##  Max.   :1.0000                          Max.   :1.0000                   
    ##  Quiz 4 on Concept 4 (Non-Linear) x/22 Quiz 5 on Concept 5 (Dashboarding) x/10
    ##  Min.   :0.0000                        Min.   :0.0000                         
    ##  1st Qu.:0.4623                        1st Qu.:0.3418                         
    ##  Median :0.5945                        Median :0.4736                         
    ##  Mean   :0.5958                        Mean   :0.4428                         
    ##  3rd Qu.:0.7955                        3rd Qu.:0.6054                         
    ##  Max.   :1.0000                        Max.   :1.0000                         
    ##     Quizzes       Lab 1 - 2.c. - (Simple Linear Regression) x/5
    ##  Min.   :0.0000   Min.   :0.0000                               
    ##  1st Qu.:0.2545   1st Qu.:1.0000                               
    ##  Median :0.4211   Median :1.0000                               
    ##  Mean   :0.4343   Mean   :0.9505                               
    ##  3rd Qu.:0.5638   3rd Qu.:1.0000                               
    ##  Max.   :1.0000   Max.   :1.0000                               
    ##  Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5
    ##  Min.   :0.0000                                                 
    ##  1st Qu.:0.9700                                                 
    ##  Median :0.9700                                                 
    ##  Mean   :0.8435                                                 
    ##  3rd Qu.:0.9700                                                 
    ##  Max.   :1.0000                                                 
    ##  Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5
    ##  Min.   :0.0000                                   
    ##  1st Qu.:0.5700                                   
    ##  Median :0.9700                                   
    ##  Mean   :0.7272                                   
    ##  3rd Qu.:1.0000                                   
    ##  Max.   :1.0000                                   
    ##  Lab 5 - Chart JS Dashboard Setup x/5    LabWork            CAT1       
    ##  Min.   :0.0000                       Min.   :0.0000   Min.   :0.0000  
    ##  1st Qu.:0.0000                       1st Qu.:0.6448   1st Qu.:0.5946  
    ##  Median :1.0000                       Median :0.7567   Median :0.7028  
    ##  Mean   :0.6808                       Mean   :0.7532   Mean   :0.6845  
    ##  3rd Qu.:1.0000                       3rd Qu.:0.9659   3rd Qu.:0.8514  
    ##  Max.   :1.0000                       Max.   :1.0000   Max.   :1.0000  
    ##       CAT2        Absenteeism Percentage   Coursework          EXAM       
    ##  Min.   :0.0000   Min.   :0.0000         Min.   :0.0000   Min.   :0.0000  
    ##  1st Qu.:0.0000   1st Qu.:0.1429         1st Qu.:0.4698   1st Qu.:0.4464  
    ##  Median :0.5200   Median :0.2856         Median :0.6197   Median :0.5893  
    ##  Mean   :0.4306   Mean   :0.2973         Mean   :0.6177   Mean   :0.5820  
    ##  3rd Qu.:0.6800   3rd Qu.:0.4285         3rd Qu.:0.7910   3rd Qu.:0.7500  
    ##  Max.   :1.0000   Max.   :1.0000         Max.   :1.0000   Max.   :1.0000  
    ##      TOTAL       
    ##  Min.   :0.0000  
    ##  1st Qu.:0.4744  
    ##  Median :0.6383  
    ##  Mean   :0.6187  
    ##  3rd Qu.:0.7646  
    ##  Max.   :1.0000

``` r
summary(StudentPerformanceDataset)
```

    ##      gender            YOB         motivator      read_content_before_lecture
    ##  Min.   :0.0000   Min.   :1998   Min.   :0.0000   Min.   :1.000              
    ##  1st Qu.:0.0000   1st Qu.:2000   1st Qu.:1.0000   1st Qu.:2.000              
    ##  Median :1.0000   Median :2001   Median :1.0000   Median :3.000              
    ##  Mean   :0.5743   Mean   :2001   Mean   :0.7525   Mean   :2.752              
    ##  3rd Qu.:1.0000   3rd Qu.:2002   3rd Qu.:1.0000   3rd Qu.:3.000              
    ##  Max.   :1.0000   Max.   :2003   Max.   :1.0000   Max.   :5.000              
    ##  anticipate_test_questions answer_rhetorical_questions find_terms_I_do_not_know
    ##  Min.   :1.000             Min.   :1.000               Min.   :1.000           
    ##  1st Qu.:3.000             1st Qu.:3.000               1st Qu.:3.000           
    ##  Median :4.000             Median :4.000               Median :4.000           
    ##  Mean   :3.584             Mean   :3.426               Mean   :3.743           
    ##  3rd Qu.:4.000             3rd Qu.:4.000               3rd Qu.:5.000           
    ##  Max.   :5.000             Max.   :5.000               Max.   :5.000           
    ##  copy_new_terms_in_reading_notebook take_quizzes_and_use_results
    ##  Min.   :1.000                      Min.   :1.000               
    ##  1st Qu.:3.000                      1st Qu.:3.000               
    ##  Median :4.000                      Median :4.000               
    ##  Mean   :3.663                      Mean   :3.941               
    ##  3rd Qu.:4.000                      3rd Qu.:5.000               
    ##  Max.   :5.000                      Max.   :5.000               
    ##  reorganise_course_outline write_down_important_points space_out_revision
    ##  Min.   :1.000             Min.   :1.000               Min.   :1.000     
    ##  1st Qu.:3.000             1st Qu.:3.000               1st Qu.:3.000     
    ##  Median :3.000             Median :4.000               Median :3.000     
    ##  Mean   :3.376             Mean   :3.832               Mean   :3.228     
    ##  3rd Qu.:4.000             3rd Qu.:5.000               3rd Qu.:4.000     
    ##  Max.   :5.000             Max.   :5.000               Max.   :5.000     
    ##  studying_in_study_group schedule_appointments goal_oriented  
    ##  Min.   :1.000           Min.   :1.000         Min.   :0.000  
    ##  1st Qu.:1.000           1st Qu.:1.000         1st Qu.:0.000  
    ##  Median :2.000           Median :2.000         Median :0.000  
    ##  Mean   :2.455           Mean   :1.931         Mean   :0.198  
    ##  3rd Qu.:3.000           3rd Qu.:2.000         3rd Qu.:0.000  
    ##  Max.   :5.000           Max.   :5.000         Max.   :1.000  
    ##  spaced_repetition testing_and_active_recall  interleaving    categorizing  
    ##  Min.   :1.000     Min.   :1.000             Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:2.000     1st Qu.:3.000             1st Qu.:2.000   1st Qu.:2.000  
    ##  Median :3.000     Median :3.000             Median :2.000   Median :3.000  
    ##  Mean   :2.554     Mean   :3.059             Mean   :2.257   Mean   :2.713  
    ##  3rd Qu.:3.000     3rd Qu.:4.000             3rd Qu.:3.000   3rd Qu.:3.000  
    ##  Max.   :4.000     Max.   :4.000             Max.   :4.000   Max.   :4.000  
    ##  retrospective_timetable cornell_notes        sq3r          commute     
    ##  Min.   :1.000           Min.   :1.000   Min.   :1.000   Min.   :0.000  
    ##  1st Qu.:2.000           1st Qu.:2.000   1st Qu.:2.000   1st Qu.:2.000  
    ##  Median :2.000           Median :3.000   Median :3.000   Median :3.000  
    ##  Mean   :2.406           Mean   :2.545   Mean   :2.614   Mean   :2.703  
    ##  3rd Qu.:3.000           3rd Qu.:3.000   3rd Qu.:3.000   3rd Qu.:4.000  
    ##  Max.   :4.000           Max.   :4.000   Max.   :4.000   Max.   :4.000  
    ##    study_time    repeats_since_Y1  paid_tuition     free_tuition   
    ##  Min.   :0.000   Min.   : 0.00    Min.   :0.0000   Min.   :0.0000  
    ##  1st Qu.:1.000   1st Qu.: 0.00    1st Qu.:0.0000   1st Qu.:0.0000  
    ##  Median :2.000   Median : 2.00    Median :0.0000   Median :0.0000  
    ##  Mean   :1.733   Mean   : 2.03    Mean   :0.1089   Mean   :0.2673  
    ##  3rd Qu.:2.000   3rd Qu.: 3.00    3rd Qu.:0.0000   3rd Qu.:1.0000  
    ##  Max.   :4.000   Max.   :10.00    Max.   :1.0000   Max.   :1.0000  
    ##  extra_curricular sports_extra_curricular exercise_per_week    meditate     
    ##  Min.   :0.0000   Min.   :0.0000          Min.   :0.000     Min.   :0.0000  
    ##  1st Qu.:0.0000   1st Qu.:0.0000          1st Qu.:1.000     1st Qu.:0.0000  
    ##  Median :1.0000   Median :0.0000          Median :1.000     Median :1.0000  
    ##  Mean   :0.5248   Mean   :0.3564          Mean   :1.089     Mean   :0.7525  
    ##  3rd Qu.:1.0000   3rd Qu.:1.0000          3rd Qu.:2.000     3rd Qu.:1.0000  
    ##  Max.   :1.0000   Max.   :1.0000          Max.   :3.000     Max.   :3.0000  
    ##       pray          internet      family_relationships  friendships  
    ##  Min.   :0.000   Min.   :0.0000   Min.   :0.000        Min.   :0.00  
    ##  1st Qu.:1.000   1st Qu.:1.0000   1st Qu.:4.000        1st Qu.:4.00  
    ##  Median :2.000   Median :1.0000   Median :4.000        Median :4.00  
    ##  Mean   :2.069   Mean   :0.8614   Mean   :4.149        Mean   :3.97  
    ##  3rd Qu.:3.000   3rd Qu.:1.0000   3rd Qu.:5.000        3rd Qu.:4.00  
    ##  Max.   :3.000   Max.   :1.0000   Max.   :5.000        Max.   :5.00  
    ##  romantic_relationships spiritual_wellnes financial_wellness     health 
    ##  Min.   :0.000          Min.   :0.000     Min.   :0          Min.   :0  
    ##  1st Qu.:0.000          1st Qu.:3.000     1st Qu.:2          1st Qu.:3  
    ##  Median :0.000          Median :4.000     Median :3          Median :4  
    ##  Mean   :1.356          Mean   :3.614     Mean   :3          Mean   :4  
    ##  3rd Qu.:3.000          3rd Qu.:4.000     3rd Qu.:4          3rd Qu.:5  
    ##  Max.   :4.000          Max.   :5.000     Max.   :5          Max.   :5  
    ##     day_out         night_out     alcohol_or_narcotics     mentor      
    ##  Min.   :0.0000   Min.   :0.000   Min.   :0.0000       Min.   :0.0000  
    ##  1st Qu.:0.0000   1st Qu.:0.000   1st Qu.:0.0000       1st Qu.:0.0000  
    ##  Median :1.0000   Median :0.000   Median :0.0000       Median :0.0000  
    ##  Mean   :0.7921   Mean   :0.505   Mean   :0.3465       Mean   :0.4059  
    ##  3rd Qu.:1.0000   3rd Qu.:1.000   3rd Qu.:1.0000       3rd Qu.:1.0000  
    ##  Max.   :3.0000   Max.   :3.000   Max.   :3.0000       Max.   :1.0000  
    ##  mentor_meetings        A1        A - 2. Classes start and end on time
    ##  Min.   :0.0000   Min.   :0.000   Min.   :0.000                       
    ##  1st Qu.:0.0000   1st Qu.:4.000   1st Qu.:4.000                       
    ##  Median :0.0000   Median :5.000   Median :5.000                       
    ##  Mean   :0.6733   Mean   :4.446   Mean   :4.634                       
    ##  3rd Qu.:1.0000   3rd Qu.:5.000   3rd Qu.:5.000                       
    ##  Max.   :3.0000   Max.   :5.000   Max.   :5.000                       
    ##  A - 3. The learning environment is participative, involves learning by doing and is group-based
    ##  Min.   :0.000                                                                                  
    ##  1st Qu.:4.000                                                                                  
    ##  Median :4.000                                                                                  
    ##  Mean   :4.307                                                                                  
    ##  3rd Qu.:5.000                                                                                  
    ##  Max.   :5.000                                                                                  
    ##  A - 4. The subject content is delivered according to the course outline and meets my expectations
    ##  Min.   :0.000                                                                                    
    ##  1st Qu.:4.000                                                                                    
    ##  Median :5.000                                                                                    
    ##  Mean   :4.693                                                                                    
    ##  3rd Qu.:5.000                                                                                    
    ##  Max.   :5.000                                                                                    
    ##  A - 5. The topics are clear and logically developed
    ##  Min.   :0.000                                      
    ##  1st Qu.:4.000                                      
    ##  Median :5.000                                      
    ##  Mean   :4.604                                      
    ##  3rd Qu.:5.000                                      
    ##  Max.   :5.000                                      
    ##  A - 6. I am developing my oral and writing skills
    ##  Min.   :0.000                                    
    ##  1st Qu.:4.000                                    
    ##  Median :4.000                                    
    ##  Mean   :4.069                                    
    ##  3rd Qu.:5.000                                    
    ##  Max.   :5.000                                    
    ##  A - 7. I am developing my reflective and critical reasoning skills
    ##  Min.   :0.000                                                     
    ##  1st Qu.:4.000                                                     
    ##  Median :4.000                                                     
    ##  Mean   :4.337                                                     
    ##  3rd Qu.:5.000                                                     
    ##  Max.   :5.000                                                     
    ##  A - 8. The assessment methods are assisting me to learn
    ##  Min.   :0.000                                          
    ##  1st Qu.:4.000                                          
    ##  Median :5.000                                          
    ##  Mean   :4.564                                          
    ##  3rd Qu.:5.000                                          
    ##  Max.   :5.000                                          
    ##  A - 9. I receive relevant feedback
    ##  Min.   :0.000                     
    ##  1st Qu.:4.000                     
    ##  Median :5.000                     
    ##  Mean   :4.535                     
    ##  3rd Qu.:5.000                     
    ##  Max.   :5.000                     
    ##  A - 10. I read the recommended readings and notes
    ##  Min.   :0.000                                    
    ##  1st Qu.:4.000                                    
    ##  Median :5.000                                    
    ##  Mean   :4.505                                    
    ##  3rd Qu.:5.000                                    
    ##  Max.   :5.000                                    
    ##  A - 11. I use the eLearning material posted
    ##  Min.   :0.000                              
    ##  1st Qu.:4.000                              
    ##  Median :5.000                              
    ##  Mean   :4.653                              
    ##  3rd Qu.:5.000                              
    ##  Max.   :5.000                              
    ##  B - 1. Concept 1 of 6: Principles of Business Intelligence and the DataOps Philosophy
    ##  Min.   :0.000                                                                        
    ##  1st Qu.:4.000                                                                        
    ##  Median :4.000                                                                        
    ##  Mean   :4.208                                                                        
    ##  3rd Qu.:5.000                                                                        
    ##  Max.   :5.000                                                                        
    ##  B - 2. Concept 3 of 6: Linear Algorithms for Predictive Analytics
    ##  Min.   :0.000                                                    
    ##  1st Qu.:3.000                                                    
    ##  Median :4.000                                                    
    ##  Mean   :3.901                                                    
    ##  3rd Qu.:5.000                                                    
    ##  Max.   :5.000                                                    
    ##  C - 2. Quizzes at the end of each concept
    ##  Min.   :0.000                            
    ##  1st Qu.:4.000                            
    ##  Median :5.000                            
    ##  Mean   :4.545                            
    ##  3rd Qu.:5.000                            
    ##  Max.   :5.000                            
    ##  C - 3. Lab manuals that outline the steps to follow during the labs
    ##  Min.   :0.000                                                      
    ##  1st Qu.:4.000                                                      
    ##  Median :5.000                                                      
    ##  Mean   :4.564                                                      
    ##  3rd Qu.:5.000                                                      
    ##  Max.   :5.000                                                      
    ##  C - 4. Required lab work submissions at the end of each lab manual that outline the activity to be done on your own
    ##  Min.   :0.000                                                                                                      
    ##  1st Qu.:4.000                                                                                                      
    ##  Median :5.000                                                                                                      
    ##  Mean   :4.505                                                                                                      
    ##  3rd Qu.:5.000                                                                                                      
    ##  Max.   :5.000                                                                                                      
    ##  C - 5. Supplementary videos to watch
    ##  Min.   :0.000                       
    ##  1st Qu.:4.000                       
    ##  Median :4.000                       
    ##  Mean   :4.149                       
    ##  3rd Qu.:5.000                       
    ##  Max.   :5.000                       
    ##  C - 6. Supplementary podcasts to listen to
    ##  Min.   :0.00                              
    ##  1st Qu.:4.00                              
    ##  Median :4.00                              
    ##  Mean   :4.04                              
    ##  3rd Qu.:5.00                              
    ##  Max.   :5.00                              
    ##  C - 7. Supplementary content to read C - 8. Lectures slides
    ##  Min.   :0.000                        Min.   :0.000         
    ##  1st Qu.:4.000                        1st Qu.:4.000         
    ##  Median :4.000                        Median :5.000         
    ##  Mean   :4.129                        Mean   :4.554         
    ##  3rd Qu.:5.000                        3rd Qu.:5.000         
    ##  Max.   :5.000                        Max.   :5.000         
    ##  C - 9. Lecture notes on some of the lecture slides
    ##  Min.   :0.000                                     
    ##  1st Qu.:4.000                                     
    ##  Median :5.000                                     
    ##  Mean   :4.554                                     
    ##  3rd Qu.:5.000                                     
    ##  Max.   :5.000                                     
    ##  C - 10. The quality of the lectures given (quality measured by the breadth (the full span of knowledge of a subject) and depth (the extent to which specific topics are focused upon, amplified, and explored) of learning - NOT quality measured by how fun/co
    ##  Min.   :0.000                                                                                                                                                                                                                                                  
    ##  1st Qu.:4.000                                                                                                                                                                                                                                                  
    ##  Median :5.000                                                                                                                                                                                                                                                  
    ##  Mean   :4.495                                                                                                                                                                                                                                                  
    ##  3rd Qu.:5.000                                                                                                                                                                                                                                                  
    ##  Max.   :5.000                                                                                                                                                                                                                                                  
    ##  C - 11. The division of theory and practice such that most of the theory is done during the recorded online classes and most of the practice is done during the physical classes
    ##  Min.   :0.000                                                                                                                                                                   
    ##  1st Qu.:4.000                                                                                                                                                                   
    ##  Median :5.000                                                                                                                                                                   
    ##  Mean   :4.446                                                                                                                                                                   
    ##  3rd Qu.:5.000                                                                                                                                                                   
    ##  Max.   :5.000                                                                                                                                                                   
    ##  C - 12. The recordings of online classes Average Course Evaluation Rating
    ##  Min.   :0.000                            Min.   :0.000                   
    ##  1st Qu.:4.000                            1st Qu.:4.273                   
    ##  Median :5.000                            Median :4.545                   
    ##  Mean   :4.287                            Mean   :4.486                   
    ##  3rd Qu.:5.000                            3rd Qu.:4.909                   
    ##  Max.   :5.000                            Max.   :5.000                   
    ##  Average Level of Learning Attained Rating Average_Rating 
    ##  Min.   :0.000                             Min.   :0.000  
    ##  1st Qu.:3.500                             1st Qu.:4.000  
    ##  Median :4.000                             Median :4.545  
    ##  Mean   :4.054                             Mean   :4.388  
    ##  3rd Qu.:4.500                             3rd Qu.:4.909  
    ##  Max.   :5.000                             Max.   :5.000  
    ##  Project: Section 1-4: (20%) x/10 Project: Section 5-11: (50%) x/10
    ##  Min.   : 0.000                   Min.   : 0.000                   
    ##  1st Qu.: 7.400                   1st Qu.: 6.000                   
    ##  Median : 8.500                   Median : 7.800                   
    ##  Mean   : 8.011                   Mean   : 6.582                   
    ##  3rd Qu.: 9.000                   3rd Qu.: 8.300                   
    ##  Max.   :10.000                   Max.   :10.000                   
    ##  Project: Section 12: (30%) x/5 Project: (10%): x/30 x 100 TOTAL
    ##  Min.   :0.000                  Min.   :  0.00                  
    ##  1st Qu.:0.000                  1st Qu.: 56.00                  
    ##  Median :0.000                  Median : 66.40                  
    ##  Mean   :1.005                  Mean   : 62.39                  
    ##  3rd Qu.:1.000                  3rd Qu.: 71.60                  
    ##  Max.   :5.000                  Max.   :100.00                  
    ##  Quiz 1 on Concept 1 (Introduction) x/32 Quiz 3 on Concept 3 (Linear) x/15
    ##  Min.   : 4.75                           Min.   : 0.000                   
    ##  1st Qu.:11.53                           1st Qu.: 7.000                   
    ##  Median :15.33                           Median : 9.000                   
    ##  Mean   :16.36                           Mean   : 9.342                   
    ##  3rd Qu.:19.63                           3rd Qu.:12.000                   
    ##  Max.   :31.25                           Max.   :15.000                   
    ##  Quiz 4 on Concept 4 (Non-Linear) x/22 Quiz 5 on Concept 5 (Dashboarding) x/10
    ##  Min.   : 0.00                         Min.   : 0.000                         
    ##  1st Qu.:10.17                         1st Qu.: 4.330                         
    ##  Median :13.08                         Median : 6.000                         
    ##  Mean   :13.11                         Mean   : 5.611                         
    ##  3rd Qu.:17.50                         3rd Qu.: 7.670                         
    ##  Max.   :22.00                         Max.   :12.670                         
    ##     Quizzes      Lab 1 - 2.c. - (Simple Linear Regression) x/5
    ##  Min.   :26.26   Min.   :0.000                                
    ##  1st Qu.:43.82   1st Qu.:5.000                                
    ##  Median :55.31   Median :5.000                                
    ##  Mean   :56.22   Mean   :4.752                                
    ##  3rd Qu.:65.16   3rd Qu.:5.000                                
    ##  Max.   :95.25   Max.   :5.000                                
    ##  Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5
    ##  Min.   :0.000                                                  
    ##  1st Qu.:4.850                                                  
    ##  Median :4.850                                                  
    ##  Mean   :4.218                                                  
    ##  3rd Qu.:4.850                                                  
    ##  Max.   :5.000                                                  
    ##  Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5
    ##  Min.   :0.000                                    
    ##  1st Qu.:2.850                                    
    ##  Median :4.850                                    
    ##  Mean   :3.636                                    
    ##  3rd Qu.:5.000                                    
    ##  Max.   :5.000                                    
    ##  Lab 5 - Chart JS Dashboard Setup x/5    LabWork            CAT1      
    ##  Min.   :0.000                        Min.   : 17.80   Min.   : 0.00  
    ##  1st Qu.:0.000                        1st Qu.: 70.80   1st Qu.:57.89  
    ##  Median :5.000                        Median : 80.00   Median :68.42  
    ##  Mean   :3.404                        Mean   : 79.72   Mean   :66.65  
    ##  3rd Qu.:5.000                        3rd Qu.: 97.20   3rd Qu.:82.89  
    ##  Max.   :5.000                        Max.   :100.00   Max.   :97.36  
    ##       CAT2        Absenteeism Percentage   Coursework         EXAM      
    ##  Min.   :  0.00   Min.   : 0.00          Min.   : 7.47   Min.   : 0.00  
    ##  1st Qu.:  0.00   1st Qu.: 7.41          1st Qu.:20.44   1st Qu.:25.00  
    ##  Median : 52.00   Median :14.81          Median :24.58   Median :33.00  
    ##  Mean   : 43.06   Mean   :15.42          Mean   :24.53   Mean   :32.59  
    ##  3rd Qu.: 68.00   3rd Qu.:22.22          3rd Qu.:29.31   3rd Qu.:42.00  
    ##  Max.   :100.00   Max.   :51.85          Max.   :35.08   Max.   :56.00  
    ##      TOTAL      
    ##  Min.   : 7.47  
    ##  1st Qu.:45.54  
    ##  Median :58.69  
    ##  Mean   :57.12  
    ##  3rd Qu.:68.83  
    ##  Max.   :87.72

``` r
#Calculating the skewness before 
sapply(StudentPerformanceDataset[, -1],  skewness, type = 2)
```

    ##                                                                                                                                                                                                                                                             YOB 
    ##                                                                                                                                                                                                                                                     -0.54358864 
    ##                                                                                                                                                                                                                                                       motivator 
    ##                                                                                                                                                                                                                                                     -1.18773312 
    ##                                                                                                                                                                                                                                     read_content_before_lecture 
    ##                                                                                                                                                                                                                                                      0.03938034 
    ##                                                                                                                                                                                                                                       anticipate_test_questions 
    ##                                                                                                                                                                                                                                                     -0.70731706 
    ##                                                                                                                                                                                                                                     answer_rhetorical_questions 
    ##                                                                                                                                                                                                                                                     -0.32097933 
    ##                                                                                                                                                                                                                                        find_terms_I_do_not_know 
    ##                                                                                                                                                                                                                                                     -0.81939607 
    ##                                                                                                                                                                                                                              copy_new_terms_in_reading_notebook 
    ##                                                                                                                                                                                                                                                     -0.64953356 
    ##                                                                                                                                                                                                                                    take_quizzes_and_use_results 
    ##                                                                                                                                                                                                                                                     -0.91362634 
    ##                                                                                                                                                                                                                                       reorganise_course_outline 
    ##                                                                                                                                                                                                                                                     -0.34506777 
    ##                                                                                                                                                                                                                                     write_down_important_points 
    ##                                                                                                                                                                                                                                                     -0.83039578 
    ##                                                                                                                                                                                                                                              space_out_revision 
    ##                                                                                                                                                                                                                                                     -0.20823287 
    ##                                                                                                                                                                                                                                         studying_in_study_group 
    ##                                                                                                                                                                                                                                                      0.44207098 
    ##                                                                                                                                                                                                                                           schedule_appointments 
    ##                                                                                                                                                                                                                                                      1.11488417 
    ##                                                                                                                                                                                                                                                   goal_oriented 
    ##                                                                                                                                                                                                                                                      1.53850113 
    ##                                                                                                                                                                                                                                               spaced_repetition 
    ##                                                                                                                                                                                                                                                     -0.28341799 
    ##                                                                                                                                                                                                                                       testing_and_active_recall 
    ##                                                                                                                                                                                                                                                     -0.41852224 
    ##                                                                                                                                                                                                                                                    interleaving 
    ##                                                                                                                                                                                                                                                      0.13802647 
    ##                                                                                                                                                                                                                                                    categorizing 
    ##                                                                                                                                                                                                                                                     -0.39152323 
    ##                                                                                                                                                                                                                                         retrospective_timetable 
    ##                                                                                                                                                                                                                                                     -0.01736321 
    ##                                                                                                                                                                                                                                                   cornell_notes 
    ##                                                                                                                                                                                                                                                     -0.15651360 
    ##                                                                                                                                                                                                                                                            sq3r 
    ##                                                                                                                                                                                                                                                     -0.12237993 
    ##                                                                                                                                                                                                                                                         commute 
    ##                                                                                                                                                                                                                                                     -0.37016793 
    ##                                                                                                                                                                                                                                                      study_time 
    ##                                                                                                                                                                                                                                                      0.85569700 
    ##                                                                                                                                                                                                                                                repeats_since_Y1 
    ##                                                                                                                                                                                                                                                      1.12120097 
    ##                                                                                                                                                                                                                                                    paid_tuition 
    ##                                                                                                                                                                                                                                                      2.54879547 
    ##                                                                                                                                                                                                                                                    free_tuition 
    ##                                                                                                                                                                                                                                                      1.06739609 
    ##                                                                                                                                                                                                                                                extra_curricular 
    ##                                                                                                                                                                                                                                                     -0.10063219 
    ##                                                                                                                                                                                                                                         sports_extra_curricular 
    ##                                                                                                                                                                                                                                                      0.60857704 
    ##                                                                                                                                                                                                                                               exercise_per_week 
    ##                                                                                                                                                                                                                                                      0.40217061 
    ##                                                                                                                                                                                                                                                        meditate 
    ##                                                                                                                                                                                                                                                      1.19818164 
    ##                                                                                                                                                                                                                                                            pray 
    ##                                                                                                                                                                                                                                                     -0.62811248 
    ##                                                                                                                                                                                                                                                        internet 
    ##                                                                                                                                                                                                                                                     -2.12336526 
    ##                                                                                                                                                                                                                                            family_relationships 
    ##                                                                                                                                                                                                                                                     -1.31147625 
    ##                                                                                                                                                                                                                                                     friendships 
    ##                                                                                                                                                                                                                                                     -1.33501306 
    ##                                                                                                                                                                                                                                          romantic_relationships 
    ##                                                                                                                                                                                                                                                      0.45130161 
    ##                                                                                                                                                                                                                                               spiritual_wellnes 
    ##                                                                                                                                                                                                                                                     -0.50455395 
    ##                                                                                                                                                                                                                                              financial_wellness 
    ##                                                                                                                                                                                                                                                     -0.16907620 
    ##                                                                                                                                                                                                                                                          health 
    ##                                                                                                                                                                                                                                                     -1.17787153 
    ##                                                                                                                                                                                                                                                         day_out 
    ##                                                                                                                                                                                                                                                      0.34277155 
    ##                                                                                                                                                                                                                                                       night_out 
    ##                                                                                                                                                                                                                                                      1.36763238 
    ##                                                                                                                                                                                                                                            alcohol_or_narcotics 
    ##                                                                                                                                                                                                                                                      1.70719212 
    ##                                                                                                                                                                                                                                                          mentor 
    ##                                                                                                                                                                                                                                                      0.38887636 
    ##                                                                                                                                                                                                                                                 mentor_meetings 
    ##                                                                                                                                                                                                                                                      0.99437578 
    ##                                                                                                                                                                                                                                                              A1 
    ##                                                                                                                                                                                                                                                     -2.43896631 
    ##                                                                                                                                                                                                                            A - 2. Classes start and end on time 
    ##                                                                                                                                                                                                                                                     -3.59941838 
    ##                                                                                                                                                                 A - 3. The learning environment is participative, involves learning by doing and is group-based 
    ##                                                                                                                                                                                                                                                     -1.87347533 
    ##                                                                                                                                                               A - 4. The subject content is delivered according to the course outline and meets my expectations 
    ##                                                                                                                                                                                                                                                     -4.05720971 
    ##                                                                                                                                                                                                             A - 5. The topics are clear and logically developed 
    ##                                                                                                                                                                                                                                                     -3.20932492 
    ##                                                                                                                                                                                                               A - 6. I am developing my oral and writing skills 
    ##                                                                                                                                                                                                                                                     -1.58524002 
    ##                                                                                                                                                                                              A - 7. I am developing my reflective and critical reasoning skills 
    ##                                                                                                                                                                                                                                                     -2.04932728 
    ##                                                                                                                                                                                                         A - 8. The assessment methods are assisting me to learn 
    ##                                                                                                                                                                                                                                                     -3.10402178 
    ##                                                                                                                                                                                                                              A - 9. I receive relevant feedback 
    ##                                                                                                                                                                                                                                                     -2.88666618 
    ##                                                                                                                                                                                                               A - 10. I read the recommended readings and notes 
    ##                                                                                                                                                                                                                                                     -2.50004334 
    ##                                                                                                                                                                                                                     A - 11. I use the eLearning material posted 
    ##                                                                                                                                                                                                                                                     -3.52331473 
    ##                                                                                                                                                                           B - 1. Concept 1 of 6: Principles of Business Intelligence and the DataOps Philosophy 
    ##                                                                                                                                                                                                                                                     -1.74045124 
    ##                                                                                                                                                                                               B - 2. Concept 3 of 6: Linear Algorithms for Predictive Analytics 
    ##                                                                                                                                                                                                                                                     -0.89248237 
    ##                                                                                                                                                                                                                       C - 2. Quizzes at the end of each concept 
    ##                                                                                                                                                                                                                                                     -2.78291952 
    ##                                                                                                                                                                                             C - 3. Lab manuals that outline the steps to follow during the labs 
    ##                                                                                                                                                                                                                                                     -2.79494776 
    ##                                                                                                                                             C - 4. Required lab work submissions at the end of each lab manual that outline the activity to be done on your own 
    ##                                                                                                                                                                                                                                                     -2.56083393 
    ##                                                                                                                                                                                                                            C - 5. Supplementary videos to watch 
    ##                                                                                                                                                                                                                                                     -1.56528297 
    ##                                                                                                                                                                                                                      C - 6. Supplementary podcasts to listen to 
    ##                                                                                                                                                                                                                                                     -1.33993154 
    ##                                                                                                                                                                                                                            C - 7. Supplementary content to read 
    ##                                                                                                                                                                                                                                                     -1.49427859 
    ##                                                                                                                                                                                                                                          C - 8. Lectures slides 
    ##                                                                                                                                                                                                                                                     -2.62892607 
    ##                                                                                                                                                                                                              C - 9. Lecture notes on some of the lecture slides 
    ##                                                                                                                                                                                                                                                     -2.75712501 
    ## C - 10. The quality of the lectures given (quality measured by the breadth (the full span of knowledge of a subject) and depth (the extent to which specific topics are focused upon, amplified, and explored) of learning - NOT quality measured by how fun/co 
    ##                                                                                                                                                                                                                                                     -2.47822735 
    ##                                                                                C - 11. The division of theory and practice such that most of the theory is done during the recorded online classes and most of the practice is done during the physical classes 
    ##                                                                                                                                                                                                                                                     -2.22401157 
    ##                                                                                                                                                                                                                        C - 12. The recordings of online classes 
    ##                                                                                                                                                                                                                                                     -1.60100350 
    ##                                                                                                                                                                                                                                Average Course Evaluation Rating 
    ##                                                                                                                                                                                                                                                     -4.43139004 
    ##                                                                                                                                                                                                                       Average Level of Learning Attained Rating 
    ##                                                                                                                                                                                                                                                     -1.43654466 
    ##                                                                                                                                                                                                                                                  Average_Rating 
    ##                                                                                                                                                                                                                                                     -3.04787522 
    ##                                                                                                                                                                                                                                Project: Section 1-4: (20%) x/10 
    ##                                                                                                                                                                                                                                                     -2.47918217 
    ##                                                                                                                                                                                                                               Project: Section 5-11: (50%) x/10 
    ##                                                                                                                                                                                                                                                     -1.26267471 
    ##                                                                                                                                                                                                                                  Project: Section 12: (30%) x/5 
    ##                                                                                                                                                                                                                                                      1.42153428 
    ##                                                                                                                                                                                                                                Project: (10%): x/30 x 100 TOTAL 
    ##                                                                                                                                                                                                                                                     -1.30068265 
    ##                                                                                                                                                                                                                         Quiz 1 on Concept 1 (Introduction) x/32 
    ##                                                                                                                                                                                                                                                      0.71020660 
    ##                                                                                                                                                                                                                               Quiz 3 on Concept 3 (Linear) x/15 
    ##                                                                                                                                                                                                                                                     -0.20947210 
    ##                                                                                                                                                                                                                           Quiz 4 on Concept 4 (Non-Linear) x/22 
    ##                                                                                                                                                                                                                                                     -0.60380472 
    ##                                                                                                                                                                                                                         Quiz 5 on Concept 5 (Dashboarding) x/10 
    ##                                                                                                                                                                                                                                                     -0.55872153 
    ##                                                                                                                                                                                                                                                         Quizzes 
    ##                                                                                                                                                                                                                                                      0.37694131 
    ##                                                                                                                                                                                                                   Lab 1 - 2.c. - (Simple Linear Regression) x/5 
    ##                                                                                                                                                                                                                                                     -4.42125852 
    ##                                                                                                                                                                                                 Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5 
    ##                                                                                                                                                                                                                                                     -2.21454391 
    ##                                                                                                                                                                                                               Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5 
    ##                                                                                                                                                                                                                                                     -1.13999860 
    ##                                                                                                                                                                                                                            Lab 5 - Chart JS Dashboard Setup x/5 
    ##                                                                                                                                                                                                                                                     -0.79213536 
    ##                                                                                                                                                                                                                                                         LabWork 
    ##                                                                                                                                                                                                                                                     -1.17909334 
    ##                                                                                                                                                                                                                                                            CAT1 
    ##                                                                                                                                                                                                                                                     -1.35307489 
    ##                                                                                                                                                                                                                                                            CAT2 
    ##                                                                                                                                                                                                                                                     -0.06273129 
    ##                                                                                                                                                                                                                                          Absenteeism Percentage 
    ##                                                                                                                                                                                                                                                      0.65243781 
    ##                                                                                                                                                                                                                                                      Coursework 
    ##                                                                                                                                                                                                                                                     -0.43640028 
    ##                                                                                                                                                                                                                                                            EXAM 
    ##                                                                                                                                                                                                                                                     -0.52104891 
    ##                                                                                                                                                                                                                                                           TOTAL 
    ##                                                                                                                                                                                                                                                     -0.47138413

``` r
# histogram to view the skewness before the Box-Cox transform

hist(StudentPerformanceDataset$YOB, main = "Bar Plot of gender",
     xlab = "YOB", ylab = "Frequency", col = "purple")
```

![](Lab-Submission-Markdown_files/figure-gfm/Applying%20a%20Yeo-Johnson%20Power%20Transform-1.png)<!-- -->

``` r
hist(StudentPerformanceDataset$anticipate_test_questions, main = "Bar Plot of Anticipate test questions",
     xlab = "Anticipate test Questions", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/Applying%20a%20Yeo-Johnson%20Power%20Transform-2.png)<!-- -->

``` r
hist(StudentPerformanceDataset$gender, main = "Bar Plot of YOB",
     xlab = "Gender", ylab = "Frequency", col = "yellow")
```

![](Lab-Submission-Markdown_files/figure-gfm/Applying%20a%20Yeo-Johnson%20Power%20Transform-3.png)<!-- -->

``` r
hist(StudentPerformanceDataset$A1, main = "Bar Plot of enjoyin the Unit",
     xlab = "Bar Plot of enjoying the Unit", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/Applying%20a%20Yeo-Johnson%20Power%20Transform-4.png)<!-- -->

``` r
hist(StudentPerformanceDataset$Average_Rating, main = "Average_Rating",
     xlab = "Average_Rating", ylab = "Frequency", col = "pink")
```

![](Lab-Submission-Markdown_files/figure-gfm/Applying%20a%20Yeo-Johnson%20Power%20Transform-5.png)<!-- -->

``` r
hist(StudentPerformanceDataset$Quizzes, main = "Bar Plot of Quizzes",
     xlab = "Quizzes", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/Applying%20a%20Yeo-Johnson%20Power%20Transform-6.png)<!-- -->

``` r
hist(StudentPerformanceDataset$LabWork, main = "Bar Plot of LabWork",
     xlab = "LabWork ", ylab = "Frequency", col = "pink")
```

![](Lab-Submission-Markdown_files/figure-gfm/Applying%20a%20Yeo-Johnson%20Power%20Transform-7.png)<!-- -->

``` r
hist(StudentPerformanceDataset$CAT1, main = "Bar Plot of CAT1",
     xlab = "CAT1", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/Applying%20a%20Yeo-Johnson%20Power%20Transform-8.png)<!-- -->

``` r
hist(StudentPerformanceDataset$CAT2, main = "Bar Plot of CAT 2",
     xlab = "CAT2", ylab = "Frequency", col = "purple")
```

![](Lab-Submission-Markdown_files/figure-gfm/Applying%20a%20Yeo-Johnson%20Power%20Transform-9.png)<!-- -->

``` r
hist(StudentPerformanceDataset$Coursework, main = "Bar Plot of Coursework",
     xlab = "Coursework", ylab = "Frequency", col = "pink")
```

![](Lab-Submission-Markdown_files/figure-gfm/Applying%20a%20Yeo-Johnson%20Power%20Transform-10.png)<!-- -->

``` r
hist(StudentPerformanceDataset$EXAM, main = "Bar Plot of EXAM",
     xlab = "EXAM", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/Applying%20a%20Yeo-Johnson%20Power%20Transform-11.png)<!-- -->

``` r
hist(StudentPerformanceDataset$TOTAL, main = "Bar Plot of TOTAL Semester marks",
     xlab = "TOTAL Semester marks", ylab = "Frequency", col = "red")
```

![](Lab-Submission-Markdown_files/figure-gfm/Applying%20a%20Yeo-Johnson%20Power%20Transform-12.png)<!-- -->

``` r
# Transformation
model_of_the_transform <- preProcess(StudentPerformanceDataset, method = c("YeoJohnson"))
print(model_of_the_transform)
```

    ## Created from 101 samples and 55 variables
    ## 
    ## Pre-processing:
    ##   - ignored (0)
    ##   - Yeo-Johnson transformation (55)
    ## 
    ## Lambda estimates for Yeo-Johnson transformation:
    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ## -2.0569  0.6816  1.3829  1.1853  1.9436  2.9222

``` r
StudentPerformanceDataset_yeo_johnson_transform <- predict(model_of_the_transform,StudentPerformanceDataset)

# AFTER
summary(StudentPerformanceDataset_yeo_johnson_transform)
```

    ##      gender            YOB         motivator      read_content_before_lecture
    ##  Min.   :0.0000   Min.   :1998   Min.   :0.0000   Min.   :0.9688             
    ##  1st Qu.:0.0000   1st Qu.:2000   1st Qu.:1.0000   1st Qu.:1.8967             
    ##  Median :1.0000   Median :2001   Median :1.0000   Median :2.7990             
    ##  Mean   :0.5743   Mean   :2001   Mean   :0.7525   Mean   :2.5682             
    ##  3rd Qu.:1.0000   3rd Qu.:2002   3rd Qu.:1.0000   3rd Qu.:2.7990             
    ##  Max.   :1.0000   Max.   :2003   Max.   :1.0000   Max.   :4.5518             
    ##  anticipate_test_questions answer_rhetorical_questions find_terms_I_do_not_know
    ##  Min.   : 1.470            Min.   :1.197               Min.   : 1.559          
    ##  1st Qu.: 7.163            1st Qu.:4.477               1st Qu.: 8.199          
    ##  Median :11.355            Median :6.457               Median :13.357          
    ##  Mean   : 9.938            Mean   :5.396               Mean   :12.597          
    ##  3rd Qu.:11.355            3rd Qu.:6.457               3rd Qu.:19.776          
    ##  Max.   :16.431            Max.   :8.626               Max.   :19.776          
    ##  copy_new_terms_in_reading_notebook take_quizzes_and_use_results
    ##  Min.   : 1.464                     Min.   : 1.851              
    ##  1st Qu.: 7.095                     1st Qu.:12.221              
    ##  Median :11.226                     Median :21.581              
    ##  Mean   :10.265                     Mean   :22.721              
    ##  3rd Qu.:11.226                     3rd Qu.:34.187              
    ##  Max.   :16.217                     Max.   :34.187              
    ##  reorganise_course_outline write_down_important_points space_out_revision
    ##  Min.   :1.177             Min.   : 1.708              Min.   :1.083     
    ##  1st Qu.:4.315             1st Qu.:10.128              1st Qu.:3.575     
    ##  Median :4.315             Median :17.219              Median :3.575     
    ##  Mean   :5.114             Mean   :17.059              Mean   :3.921     
    ##  3rd Qu.:6.178             3rd Qu.:26.424              3rd Qu.:4.932     
    ##  Max.   :8.202             Max.   :26.424              Max.   :6.346     
    ##  studying_in_study_group schedule_appointments goal_oriented  
    ##  Min.   :0.6719          Min.   :0.5085        Min.   :0.000  
    ##  1st Qu.:0.6719          1st Qu.:0.5085        1st Qu.:0.000  
    ##  Median :1.0459          Median :0.6834        Median :0.000  
    ##  Mean   :1.0993          Mean   :0.6372        Mean   :0.198  
    ##  3rd Qu.:1.3030          3rd Qu.:0.6834        3rd Qu.:0.000  
    ##  Max.   :1.6543          Max.   :0.8634        Max.   :1.000  
    ##  spaced_repetition testing_and_active_recall  interleaving     categorizing  
    ##  Min.   :1.163     Min.   :1.353             Min.   :0.9012   Min.   :1.273  
    ##  1st Qu.:2.581     1st Qu.:5.920             1st Qu.:1.6817   1st Qu.:3.014  
    ##  Median :4.195     Median :5.920             Median :1.6817   Median :5.151  
    ##  Mean   :3.515     Mean   :6.228             Mean   :1.8532   Mean   :4.599  
    ##  3rd Qu.:4.195     3rd Qu.:9.030             3rd Qu.:2.3928   3rd Qu.:5.151  
    ##  Max.   :5.973     Max.   :9.030             Max.   :3.0565   Max.   :7.640  
    ##  retrospective_timetable cornell_notes        sq3r           commute     
    ##  Min.   :0.9607          Min.   :1.031   Min.   :0.9953   Min.   :0.000  
    ##  1st Qu.:1.8703          1st Qu.:2.104   1st Qu.:1.9842   1st Qu.:2.623  
    ##  Median :1.8703          Median :3.207   Median :2.9689   Median :4.286  
    ##  Mean   :2.2190          Mean   :2.714   Mean   :2.5872   Mean   :3.882  
    ##  3rd Qu.:2.7481          3rd Qu.:3.207   3rd Qu.:2.9689   3rd Qu.:6.128  
    ##  Max.   :3.6031          Max.   :4.331   Max.   :3.9507   Max.   :6.128  
    ##    study_time     repeats_since_Y1  paid_tuition     free_tuition   
    ##  Min.   :0.0000   Min.   :0.000    Min.   :0.0000   Min.   :0.0000  
    ##  1st Qu.:0.6567   1st Qu.:0.000    1st Qu.:0.0000   1st Qu.:0.0000  
    ##  Median :1.0090   Median :1.066    Median :0.0000   Median :0.0000  
    ##  Mean   :0.8865   Mean   :0.833    Mean   :0.1089   Mean   :0.2673  
    ##  3rd Qu.:1.0090   3rd Qu.:1.334    3rd Qu.:0.0000   3rd Qu.:1.0000  
    ##  Max.   :1.4220   Max.   :2.245    Max.   :1.0000   Max.   :1.0000  
    ##  extra_curricular sports_extra_curricular exercise_per_week    meditate     
    ##  Min.   :0.0000   Min.   :0.0000          Min.   :0.0000    Min.   :0.0000  
    ##  1st Qu.:0.0000   1st Qu.:0.0000          1st Qu.:0.8152    1st Qu.:0.0000  
    ##  Median :1.0000   Median :0.0000          Median :0.8152    Median :0.5253  
    ##  Mean   :0.5248   Mean   :0.3564          Mean   :0.8159    Mean   :0.3047  
    ##  3rd Qu.:1.0000   3rd Qu.:1.0000          3rd Qu.:1.4260    3rd Qu.:0.5253  
    ##  Max.   :1.0000   Max.   :1.0000          Max.   :1.9332    Max.   :0.8186  
    ##       pray          internet      family_relationships  friendships   
    ##  Min.   :0.000   Min.   :0.0000   Min.   : 0.00        Min.   : 0.00  
    ##  1st Qu.:1.317   1st Qu.:1.0000   1st Qu.:32.23        1st Qu.:20.47  
    ##  Median :3.196   Median :1.0000   Median :32.23        Median :20.47  
    ##  Mean   :3.616   Mean   :0.8614   Mean   :37.55        Mean   :21.13  
    ##  3rd Qu.:5.568   3rd Qu.:1.0000   3rd Qu.:53.99        3rd Qu.:20.47  
    ##  Max.   :5.568   Max.   :1.0000   Max.   :53.99        Max.   :32.19  
    ##  romantic_relationships spiritual_wellnes financial_wellness     health     
    ##  Min.   :0.0000         Min.   : 0.000    Min.   :0.000      Min.   : 0.00  
    ##  1st Qu.:0.0000         1st Qu.: 5.078    1st Qu.:2.201      1st Qu.:13.13  
    ##  Median :0.0000         Median : 7.512    Median :3.401      Median :23.51  
    ##  Mean   :0.4080         Mean   : 6.695    Mean   :3.431      Mean   :25.41  
    ##  3rd Qu.:0.9327         3rd Qu.: 7.512    3rd Qu.:4.647      3rd Qu.:37.70  
    ##  Max.   :1.0215         Max.   :10.252    Max.   :5.930      Max.   :37.70  
    ##     day_out         night_out      alcohol_or_narcotics     mentor      
    ##  Min.   :0.0000   Min.   :0.0000   Min.   :0.0000       Min.   :0.0000  
    ##  1st Qu.:0.0000   1st Qu.:0.0000   1st Qu.:0.0000       1st Qu.:0.0000  
    ##  Median :0.8929   Median :0.0000   Median :0.0000       Median :0.0000  
    ##  Mean   :0.6976   Mean   :0.2156   Mean   :0.3465       Mean   :0.4059  
    ##  3rd Qu.:0.8929   3rd Qu.:0.4688   3rd Qu.:1.0000       3rd Qu.:1.0000  
    ##  Max.   :2.3459   Max.   :0.6711   Max.   :3.0000       Max.   :1.0000  
    ##  mentor_meetings        A1        A - 2. Classes start and end on time
    ##  Min.   :0.0000   Min.   :0.000   Min.   :0.000                       
    ##  1st Qu.:0.0000   1st Qu.:4.000   1st Qu.:4.000                       
    ##  Median :0.0000   Median :5.000   Median :5.000                       
    ##  Mean   :0.2639   Mean   :4.446   Mean   :4.634                       
    ##  3rd Qu.:0.4985   3rd Qu.:5.000   3rd Qu.:5.000                       
    ##  Max.   :0.7462   Max.   :5.000   Max.   :5.000                       
    ##  A - 3. The learning environment is participative, involves learning by doing and is group-based
    ##  Min.   :0.000                                                                                  
    ##  1st Qu.:4.000                                                                                  
    ##  Median :4.000                                                                                  
    ##  Mean   :4.307                                                                                  
    ##  3rd Qu.:5.000                                                                                  
    ##  Max.   :5.000                                                                                  
    ##  A - 4. The subject content is delivered according to the course outline and meets my expectations
    ##  Min.   :0.000                                                                                    
    ##  1st Qu.:4.000                                                                                    
    ##  Median :5.000                                                                                    
    ##  Mean   :4.693                                                                                    
    ##  3rd Qu.:5.000                                                                                    
    ##  Max.   :5.000                                                                                    
    ##  A - 5. The topics are clear and logically developed
    ##  Min.   :0.000                                      
    ##  1st Qu.:4.000                                      
    ##  Median :5.000                                      
    ##  Mean   :4.604                                      
    ##  3rd Qu.:5.000                                      
    ##  Max.   :5.000                                      
    ##  A - 6. I am developing my oral and writing skills
    ##  Min.   : 0.00                                    
    ##  1st Qu.:37.40                                    
    ##  Median :37.40                                    
    ##  Mean   :42.52                                    
    ##  3rd Qu.:63.95                                    
    ##  Max.   :63.95                                    
    ##  A - 7. I am developing my reflective and critical reasoning skills
    ##  Min.   :0.000                                                     
    ##  1st Qu.:4.000                                                     
    ##  Median :4.000                                                     
    ##  Mean   :4.337                                                     
    ##  3rd Qu.:5.000                                                     
    ##  Max.   :5.000                                                     
    ##  A - 8. The assessment methods are assisting me to learn
    ##  Min.   :0.000                                          
    ##  1st Qu.:4.000                                          
    ##  Median :5.000                                          
    ##  Mean   :4.564                                          
    ##  3rd Qu.:5.000                                          
    ##  Max.   :5.000                                          
    ##  A - 9. I receive relevant feedback
    ##  Min.   :0.000                     
    ##  1st Qu.:4.000                     
    ##  Median :5.000                     
    ##  Mean   :4.535                     
    ##  3rd Qu.:5.000                     
    ##  Max.   :5.000                     
    ##  A - 10. I read the recommended readings and notes
    ##  Min.   :0.000                                    
    ##  1st Qu.:4.000                                    
    ##  Median :5.000                                    
    ##  Mean   :4.505                                    
    ##  3rd Qu.:5.000                                    
    ##  Max.   :5.000                                    
    ##  A - 11. I use the eLearning material posted
    ##  Min.   :0.000                              
    ##  1st Qu.:4.000                              
    ##  Median :5.000                              
    ##  Mean   :4.653                              
    ##  3rd Qu.:5.000                              
    ##  Max.   :5.000                              
    ##  B - 1. Concept 1 of 6: Principles of Business Intelligence and the DataOps Philosophy
    ##  Min.   :0.000                                                                        
    ##  1st Qu.:4.000                                                                        
    ##  Median :4.000                                                                        
    ##  Mean   :4.208                                                                        
    ##  3rd Qu.:5.000                                                                        
    ##  Max.   :5.000                                                                        
    ##  B - 2. Concept 3 of 6: Linear Algorithms for Predictive Analytics
    ##  Min.   : 0.000                                                   
    ##  1st Qu.: 8.539                                                   
    ##  Median :14.026                                                   
    ##  Mean   :14.029                                                   
    ##  3rd Qu.:20.910                                                   
    ##  Max.   :20.910                                                   
    ##  C - 2. Quizzes at the end of each concept
    ##  Min.   :0.000                            
    ##  1st Qu.:4.000                            
    ##  Median :5.000                            
    ##  Mean   :4.545                            
    ##  3rd Qu.:5.000                            
    ##  Max.   :5.000                            
    ##  C - 3. Lab manuals that outline the steps to follow during the labs
    ##  Min.   :0.000                                                      
    ##  1st Qu.:4.000                                                      
    ##  Median :5.000                                                      
    ##  Mean   :4.564                                                      
    ##  3rd Qu.:5.000                                                      
    ##  Max.   :5.000                                                      
    ##  C - 4. Required lab work submissions at the end of each lab manual that outline the activity to be done on your own
    ##  Min.   :0.000                                                                                                      
    ##  1st Qu.:4.000                                                                                                      
    ##  Median :5.000                                                                                                      
    ##  Mean   :4.505                                                                                                      
    ##  3rd Qu.:5.000                                                                                                      
    ##  Max.   :5.000                                                                                                      
    ##  C - 5. Supplementary videos to watch
    ##  Min.   :0.000                       
    ##  1st Qu.:4.000                       
    ##  Median :4.000                       
    ##  Mean   :4.149                       
    ##  3rd Qu.:5.000                       
    ##  Max.   :5.000                       
    ##  C - 6. Supplementary podcasts to listen to
    ##  Min.   : 0.00                             
    ##  1st Qu.:32.42                             
    ##  Median :32.42                             
    ##  Mean   :36.64                             
    ##  3rd Qu.:54.36                             
    ##  Max.   :54.36                             
    ##  C - 7. Supplementary content to read C - 8. Lectures slides
    ##  Min.   :0.000                        Min.   :0.000         
    ##  1st Qu.:4.000                        1st Qu.:4.000         
    ##  Median :4.000                        Median :5.000         
    ##  Mean   :4.129                        Mean   :4.554         
    ##  3rd Qu.:5.000                        3rd Qu.:5.000         
    ##  Max.   :5.000                        Max.   :5.000         
    ##  C - 9. Lecture notes on some of the lecture slides
    ##  Min.   :0.000                                     
    ##  1st Qu.:4.000                                     
    ##  Median :5.000                                     
    ##  Mean   :4.554                                     
    ##  3rd Qu.:5.000                                     
    ##  Max.   :5.000                                     
    ##  C - 10. The quality of the lectures given (quality measured by the breadth (the full span of knowledge of a subject) and depth (the extent to which specific topics are focused upon, amplified, and explored) of learning - NOT quality measured by how fun/co
    ##  Min.   :0.000                                                                                                                                                                                                                                                  
    ##  1st Qu.:4.000                                                                                                                                                                                                                                                  
    ##  Median :5.000                                                                                                                                                                                                                                                  
    ##  Mean   :4.495                                                                                                                                                                                                                                                  
    ##  3rd Qu.:5.000                                                                                                                                                                                                                                                  
    ##  Max.   :5.000                                                                                                                                                                                                                                                  
    ##  C - 11. The division of theory and practice such that most of the theory is done during the recorded online classes and most of the practice is done during the physical classes
    ##  Min.   :0.000                                                                                                                                                                   
    ##  1st Qu.:4.000                                                                                                                                                                   
    ##  Median :5.000                                                                                                                                                                   
    ##  Mean   :4.446                                                                                                                                                                   
    ##  3rd Qu.:5.000                                                                                                                                                                   
    ##  Max.   :5.000                                                                                                                                                                   
    ##  C - 12. The recordings of online classes Average Course Evaluation Rating
    ##  Min.   :0.000                            Min.   :0.000                   
    ##  1st Qu.:4.000                            1st Qu.:4.273                   
    ##  Median :5.000                            Median :4.545                   
    ##  Mean   :4.287                            Mean   :4.486                   
    ##  3rd Qu.:5.000                            3rd Qu.:4.909                   
    ##  Max.   :5.000                            Max.   :5.000                   
    ##  Average Level of Learning Attained Rating Average_Rating 
    ##  Min.   : 0.00                             Min.   :0.000  
    ##  1st Qu.:19.07                             1st Qu.:4.000  
    ##  Median :25.23                             Median :4.545  
    ##  Mean   :27.31                             Mean   :4.388  
    ##  3rd Qu.:32.47                             3rd Qu.:4.909  
    ##  Max.   :40.85                             Max.   :5.000  
    ##  Project: Section 1-4: (20%) x/10 Project: Section 5-11: (50%) x/10
    ##  Min.   :  0.0                    Min.   : 0.00                    
    ##  1st Qu.:169.8                    1st Qu.:20.43                    
    ##  Median :243.2                    Median :31.77                    
    ##  Mean   :234.3                    Mean   :26.66                    
    ##  3rd Qu.:282.5                    3rd Qu.:35.33                    
    ##  Max.   :373.1                    Max.   :48.73                    
    ##  Project: Section 12: (30%) x/5 Project: (10%): x/30 x 100 TOTAL
    ##  Min.   :0.0000                 Min.   :  0.0                   
    ##  1st Qu.:0.0000                 1st Qu.:269.9                   
    ##  Median :0.0000                 Median :346.2                   
    ##  Mean   :0.1259                 Mean   :329.0                   
    ##  3rd Qu.:0.3693                 3rd Qu.:386.6                   
    ##  Max.   :0.4740                 Max.   :631.1                   
    ##  Quiz 1 on Concept 1 (Introduction) x/32 Quiz 3 on Concept 3 (Linear) x/15
    ##  Min.   :1.972                           Min.   : 0.000                   
    ##  1st Qu.:3.010                           1st Qu.: 8.402                   
    ##  Median :3.389                           Median :11.067                   
    ##  Mean   :3.391                           Mean   :11.633                   
    ##  3rd Qu.:3.735                           3rd Qu.:15.194                   
    ##  Max.   :4.426                           Max.   :19.450                   
    ##  Quiz 4 on Concept 4 (Non-Linear) x/22 Quiz 5 on Concept 5 (Dashboarding) x/10
    ##  Min.   : 0.00                         Min.   : 0.000                         
    ##  1st Qu.:15.32                         1st Qu.: 5.444                         
    ##  Median :20.68                         Median : 7.897                         
    ##  Mean   :21.29                         Mean   : 7.539                         
    ##  3rd Qu.:29.36                         3rd Qu.:10.479                         
    ##  Max.   :38.72                         Max.   :18.802                         
    ##     Quizzes       Lab 1 - 2.c. - (Simple Linear Regression) x/5
    ##  Min.   : 5.998   Min.   :0.000                                
    ##  1st Qu.: 7.611   1st Qu.:5.000                                
    ##  Median : 8.444   Median :5.000                                
    ##  Mean   : 8.399   Mean   :4.752                                
    ##  3rd Qu.: 9.072   3rd Qu.:5.000                                
    ##  Max.   :10.669   Max.   :5.000                                
    ##  Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5
    ##  Min.   :0.000                                                  
    ##  1st Qu.:4.850                                                  
    ##  Median :4.850                                                  
    ##  Mean   :4.218                                                  
    ##  3rd Qu.:4.850                                                  
    ##  Max.   :5.000                                                  
    ##  Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5
    ##  Min.   : 0.000                                   
    ##  1st Qu.: 6.557                                   
    ##  Median :15.434                                   
    ##  Mean   :11.179                                   
    ##  3rd Qu.:16.239                                   
    ##  Max.   :16.239                                   
    ##  Lab 5 - Chart JS Dashboard Setup x/5    LabWork             CAT1      
    ##  Min.   :0.000                        Min.   :  487.6   Min.   :  0.0  
    ##  1st Qu.:0.000                        1st Qu.:12326.1   1st Qu.:297.9  
    ##  Median :7.400                        Median :16481.8   Median :381.3  
    ##  Mean   :5.035                        Mean   :17845.7   Mean   :380.4  
    ##  3rd Qu.:7.400                        3rd Qu.:26213.8   3rd Qu.:506.5  
    ##  Max.   :7.400                        Max.   :28051.3   Max.   :643.0  
    ##       CAT2        Absenteeism Percentage   Coursework          EXAM      
    ##  Min.   : 0.000   Min.   : 0.000         Min.   : 17.21   Min.   : 0.00  
    ##  1st Qu.: 0.000   1st Qu.: 4.668         1st Qu.: 75.11   1st Qu.:37.19  
    ##  Median : 9.054   Median : 7.867         Median : 99.06   Median :51.13  
    ##  Mean   : 6.515   Mean   : 7.726         Mean   :101.33   Mean   :51.24  
    ##  3rd Qu.:10.261   3rd Qu.:10.580         3rd Qu.:129.18   3rd Qu.:67.47  
    ##  Max.   :12.226   Max.   :19.312         Max.   :169.62   Max.   :93.98  
    ##      TOTAL       
    ##  Min.   : 14.21  
    ##  1st Qu.:170.57  
    ##  Median :243.94  
    ##  Mean   :240.33  
    ##  3rd Qu.:305.62  
    ##  Max.   :430.99

``` r
sapply(StudentPerformanceDataset_yeo_johnson_transform[, -1],  skewness, type = 2)
```

    ##                                                                                                                                                                                                                                                             YOB 
    ##                                                                                                                                                                                                                                                   -0.5435886361 
    ##                                                                                                                                                                                                                                                       motivator 
    ##                                                                                                                                                                                                                                                   -1.1877331226 
    ##                                                                                                                                                                                                                                     read_content_before_lecture 
    ##                                                                                                                                                                                                                                                   -0.0220291176 
    ##                                                                                                                                                                                                                                       anticipate_test_questions 
    ##                                                                                                                                                                                                                                                   -0.0880646590 
    ##                                                                                                                                                                                                                                     answer_rhetorical_questions 
    ##                                                                                                                                                                                                                                                   -0.0784123061 
    ##                                                                                                                                                                                                                                        find_terms_I_do_not_know 
    ##                                                                                                                                                                                                                                                   -0.1460382092 
    ##                                                                                                                                                                                                                              copy_new_terms_in_reading_notebook 
    ##                                                                                                                                                                                                                                                   -0.1789551262 
    ##                                                                                                                                                                                                                                    take_quizzes_and_use_results 
    ##                                                                                                                                                                                                                                                   -0.2689934521 
    ##                                                                                                                                                                                                                                       reorganise_course_outline 
    ##                                                                                                                                                                                                                                                   -0.1322382977 
    ##                                                                                                                                                                                                                                     write_down_important_points 
    ##                                                                                                                                                                                                                                                   -0.2238123358 
    ##                                                                                                                                                                                                                                              space_out_revision 
    ##                                                                                                                                                                                                                                                   -0.0909727009 
    ##                                                                                                                                                                                                                                         studying_in_study_group 
    ##                                                                                                                                                                                                                                                    0.0168921462 
    ##                                                                                                                                                                                                                                           schedule_appointments 
    ##                                                                                                                                                                                                                                                    0.1373876044 
    ##                                                                                                                                                                                                                                                   goal_oriented 
    ##                                                                                                                                                                                                                                                    1.5385011317 
    ##                                                                                                                                                                                                                                               spaced_repetition 
    ##                                                                                                                                                                                                                                                   -0.0787842698 
    ##                                                                                                                                                                                                                                       testing_and_active_recall 
    ##                                                                                                                                                                                                                                                   -0.0566936935 
    ##                                                                                                                                                                                                                                                    interleaving 
    ##                                                                                                                                                                                                                                                   -0.0221436175 
    ##                                                                                                                                                                                                                                                    categorizing 
    ##                                                                                                                                                                                                                                                   -0.0337296840 
    ##                                                                                                                                                                                                                                         retrospective_timetable 
    ##                                                                                                                                                                                                                                                   -0.0695052136 
    ##                                                                                                                                                                                                                                                   cornell_notes 
    ##                                                                                                                                                                                                                                                   -0.1232210318 
    ##                                                                                                                                                                                                                                                            sq3r 
    ##                                                                                                                                                                                                                                                   -0.1270777248 
    ##                                                                                                                                                                                                                                                         commute 
    ##                                                                                                                                                                                                                                                   -0.1877713377 
    ##                                                                                                                                                                                                                                                      study_time 
    ##                                                                                                                                                                                                                                                   -0.0007509264 
    ##                                                                                                                                                                                                                                                repeats_since_Y1 
    ##                                                                                                                                                                                                                                                    0.0175732474 
    ##                                                                                                                                                                                                                                                    paid_tuition 
    ##                                                                                                                                                                                                                                                    2.5487954683 
    ##                                                                                                                                                                                                                                                    free_tuition 
    ##                                                                                                                                                                                                                                                    1.0673960917 
    ##                                                                                                                                                                                                                                                extra_curricular 
    ##                                                                                                                                                                                                                                                   -0.1006321944 
    ##                                                                                                                                                                                                                                         sports_extra_curricular 
    ##                                                                                                                                                                                                                                                    0.6085770371 
    ##                                                                                                                                                                                                                                               exercise_per_week 
    ##                                                                                                                                                                                                                                                   -0.0500989875 
    ##                                                                                                                                                                                                                                                        meditate 
    ##                                                                                                                                                                                                                                                    0.2204286319 
    ##                                                                                                                                                                                                                                                            pray 
    ##                                                                                                                                                                                                                                                   -0.3981651826 
    ##                                                                                                                                                                                                                                                        internet 
    ##                                                                                                                                                                                                                                                   -2.1233652629 
    ##                                                                                                                                                                                                                                            family_relationships 
    ##                                                                                                                                                                                                                                                   -0.2522903571 
    ##                                                                                                                                                                                                                                                     friendships 
    ##                                                                                                                                                                                                                                                   -0.0624720916 
    ##                                                                                                                                                                                                                                          romantic_relationships 
    ##                                                                                                                                                                                                                                                    0.2896134691 
    ##                                                                                                                                                                                                                                               spiritual_wellnes 
    ##                                                                                                                                                                                                                                                   -0.0473358548 
    ##                                                                                                                                                                                                                                              financial_wellness 
    ##                                                                                                                                                                                                                                                   -0.0539337979 
    ##                                                                                                                                                                                                                                                          health 
    ##                                                                                                                                                                                                                                                   -0.2659711203 
    ##                                                                                                                                                                                                                                                         day_out 
    ##                                                                                                                                                                                                                                                   -0.0107860308 
    ##                                                                                                                                                                                                                                                       night_out 
    ##                                                                                                                                                                                                                                                    0.2900714078 
    ##                                                                                                                                                                                                                                            alcohol_or_narcotics 
    ##                                                                                                                                                                                                                                                    1.7071921236 
    ##                                                                                                                                                                                                                                                          mentor 
    ##                                                                                                                                                                                                                                                    0.3888763571 
    ##                                                                                                                                                                                                                                                 mentor_meetings 
    ##                                                                                                                                                                                                                                                    0.2814724007 
    ##                                                                                                                                                                                                                                                              A1 
    ##                                                                                                                                                                                                                                                   -2.4389663106 
    ##                                                                                                                                                                                                                            A - 2. Classes start and end on time 
    ##                                                                                                                                                                                                                                                   -3.5994183775 
    ##                                                                                                                                                                 A - 3. The learning environment is participative, involves learning by doing and is group-based 
    ##                                                                                                                                                                                                                                                   -1.8734753284 
    ##                                                                                                                                                               A - 4. The subject content is delivered according to the course outline and meets my expectations 
    ##                                                                                                                                                                                                                                                   -4.0572097129 
    ##                                                                                                                                                                                                             A - 5. The topics are clear and logically developed 
    ##                                                                                                                                                                                                                                                   -3.2093249249 
    ##                                                                                                                                                                                                               A - 6. I am developing my oral and writing skills 
    ##                                                                                                                                                                                                                                                   -0.2463163470 
    ##                                                                                                                                                                                              A - 7. I am developing my reflective and critical reasoning skills 
    ##                                                                                                                                                                                                                                                   -2.0493272781 
    ##                                                                                                                                                                                                         A - 8. The assessment methods are assisting me to learn 
    ##                                                                                                                                                                                                                                                   -3.1040217826 
    ##                                                                                                                                                                                                                              A - 9. I receive relevant feedback 
    ##                                                                                                                                                                                                                                                   -2.8866661797 
    ##                                                                                                                                                                                                               A - 10. I read the recommended readings and notes 
    ##                                                                                                                                                                                                                                                   -2.5000433418 
    ##                                                                                                                                                                                                                     A - 11. I use the eLearning material posted 
    ##                                                                                                                                                                                                                                                   -3.5233147318 
    ##                                                                                                                                                                           B - 1. Concept 1 of 6: Principles of Business Intelligence and the DataOps Philosophy 
    ##                                                                                                                                                                                                                                                   -1.7404512352 
    ##                                                                                                                                                                                               B - 2. Concept 3 of 6: Linear Algorithms for Predictive Analytics 
    ##                                                                                                                                                                                                                                                   -0.1319877587 
    ##                                                                                                                                                                                                                       C - 2. Quizzes at the end of each concept 
    ##                                                                                                                                                                                                                                                   -2.7829195221 
    ##                                                                                                                                                                                             C - 3. Lab manuals that outline the steps to follow during the labs 
    ##                                                                                                                                                                                                                                                   -2.7949477553 
    ##                                                                                                                                             C - 4. Required lab work submissions at the end of each lab manual that outline the activity to be done on your own 
    ##                                                                                                                                                                                                                                                   -2.5608339337 
    ##                                                                                                                                                                                                                            C - 5. Supplementary videos to watch 
    ##                                                                                                                                                                                                                                                   -1.5652829735 
    ##                                                                                                                                                                                                                      C - 6. Supplementary podcasts to listen to 
    ##                                                                                                                                                                                                                                                   -0.3412897251 
    ##                                                                                                                                                                                                                            C - 7. Supplementary content to read 
    ##                                                                                                                                                                                                                                                   -1.4942785885 
    ##                                                                                                                                                                                                                                          C - 8. Lectures slides 
    ##                                                                                                                                                                                                                                                   -2.6289260720 
    ##                                                                                                                                                                                                              C - 9. Lecture notes on some of the lecture slides 
    ##                                                                                                                                                                                                                                                   -2.7571250132 
    ## C - 10. The quality of the lectures given (quality measured by the breadth (the full span of knowledge of a subject) and depth (the extent to which specific topics are focused upon, amplified, and explored) of learning - NOT quality measured by how fun/co 
    ##                                                                                                                                                                                                                                                   -2.4782273547 
    ##                                                                                C - 11. The division of theory and practice such that most of the theory is done during the recorded online classes and most of the practice is done during the physical classes 
    ##                                                                                                                                                                                                                                                   -2.2240115680 
    ##                                                                                                                                                                                                                        C - 12. The recordings of online classes 
    ##                                                                                                                                                                                                                                                   -1.6010034953 
    ##                                                                                                                                                                                                                                Average Course Evaluation Rating 
    ##                                                                                                                                                                                                                                                   -4.4313900437 
    ##                                                                                                                                                                                                                       Average Level of Learning Attained Rating 
    ##                                                                                                                                                                                                                                                   -0.1237893520 
    ##                                                                                                                                                                                                                                                  Average_Rating 
    ##                                                                                                                                                                                                                                                   -3.0478752154 
    ##                                                                                                                                                                                                                                Project: Section 1-4: (20%) x/10 
    ##                                                                                                                                                                                                                                                   -0.6391899311 
    ##                                                                                                                                                                                                                               Project: Section 5-11: (50%) x/10 
    ##                                                                                                                                                                                                                                                   -0.6895640655 
    ##                                                                                                                                                                                                                                  Project: Section 12: (30%) x/5 
    ##                                                                                                                                                                                                                                                    1.0309998390 
    ##                                                                                                                                                                                                                                Project: (10%): x/30 x 100 TOTAL 
    ##                                                                                                                                                                                                                                                   -0.5100193062 
    ##                                                                                                                                                                                                                         Quiz 1 on Concept 1 (Introduction) x/32 
    ##                                                                                                                                                                                                                                                   -0.0063231369 
    ##                                                                                                                                                                                                                               Quiz 3 on Concept 3 (Linear) x/15 
    ##                                                                                                                                                                                                                                                   -0.0679319205 
    ##                                                                                                                                                                                                                           Quiz 4 on Concept 4 (Non-Linear) x/22 
    ##                                                                                                                                                                                                                                                   -0.2798975387 
    ##                                                                                                                                                                                                                         Quiz 5 on Concept 5 (Dashboarding) x/10 
    ##                                                                                                                                                                                                                                                   -0.2937427206 
    ##                                                                                                                                                                                                                                                         Quizzes 
    ##                                                                                                                                                                                                                                                   -0.0207505936 
    ##                                                                                                                                                                                                                   Lab 1 - 2.c. - (Simple Linear Regression) x/5 
    ##                                                                                                                                                                                                                                                   -4.4212585206 
    ##                                                                                                                                                                                                 Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5 
    ##                                                                                                                                                                                                                                                   -2.2145439103 
    ##                                                                                                                                                                                                               Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5 
    ##                                                                                                                                                                                                                                                   -0.8396398601 
    ##                                                                                                                                                                                                                            Lab 5 - Chart JS Dashboard Setup x/5 
    ##                                                                                                                                                                                                                                                   -0.7896625968 
    ##                                                                                                                                                                                                                                                         LabWork 
    ##                                                                                                                                                                                                                                                   -0.3190843540 
    ##                                                                                                                                                                                                                                                            CAT1 
    ##                                                                                                                                                                                                                                                   -0.5487216466 
    ##                                                                                                                                                                                                                                                            CAT2 
    ##                                                                                                                                                                                                                                                   -0.4783567591 
    ##                                                                                                                                                                                                                                          Absenteeism Percentage 
    ##                                                                                                                                                                                                                                                   -0.0579445534 
    ##                                                                                                                                                                                                                                                      Coursework 
    ##                                                                                                                                                                                                                                                   -0.1081445003 
    ##                                                                                                                                                                                                                                                            EXAM 
    ##                                                                                                                                                                                                                                                   -0.2908781593 
    ##                                                                                                                                                                                                                                                           TOTAL 
    ##                                                                                                                                                                                                                                                   -0.0669732568

``` r
hist(StudentPerformanceDataset_yeo_johnson_transform$YOB, main = "Bar Plot of gender",
     xlab = "YOB", ylab = "Frequency", col = "purple")
```

![](Lab-Submission-Markdown_files/figure-gfm/Applying%20a%20Yeo-Johnson%20Power%20Transform-13.png)<!-- -->

``` r
hist(StudentPerformanceDataset_yeo_johnson_transform$anticipate_test_questions, main = "Bar Plot of Anticipate test questions",
     xlab = "Anticipate test Questions", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/Applying%20a%20Yeo-Johnson%20Power%20Transform-14.png)<!-- -->

``` r
hist(StudentPerformanceDataset_yeo_johnson_transform$gender, main = "Bar Plot of YOB",
     xlab = "Gender", ylab = "Frequency", col = "yellow")
```

![](Lab-Submission-Markdown_files/figure-gfm/Applying%20a%20Yeo-Johnson%20Power%20Transform-15.png)<!-- -->

``` r
hist(StudentPerformanceDataset_yeo_johnson_transform$A1, main = "Bar Plot of enjoyin the Unit",
     xlab = "Bar Plot of enjoying the Unit", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/Applying%20a%20Yeo-Johnson%20Power%20Transform-16.png)<!-- -->

``` r
hist(StudentPerformanceDataset_yeo_johnson_transform$Average_Rating, main = "Average_Rating",
     xlab = "Average_Rating", ylab = "Frequency", col = "pink")
```

![](Lab-Submission-Markdown_files/figure-gfm/Applying%20a%20Yeo-Johnson%20Power%20Transform-17.png)<!-- -->

``` r
hist(StudentPerformanceDataset_yeo_johnson_transform$Quizzes, main = "Bar Plot of Quizzes",
     xlab = "Quizzes", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/Applying%20a%20Yeo-Johnson%20Power%20Transform-18.png)<!-- -->

``` r
hist(StudentPerformanceDataset_yeo_johnson_transform$LabWork, main = "Bar Plot of LabWork",
     xlab = "LabWork ", ylab = "Frequency", col = "pink")
```

![](Lab-Submission-Markdown_files/figure-gfm/Applying%20a%20Yeo-Johnson%20Power%20Transform-19.png)<!-- -->

``` r
hist(StudentPerformanceDataset_yeo_johnson_transform$CAT1, main = "Bar Plot of CAT1",
     xlab = "CAT1", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/Applying%20a%20Yeo-Johnson%20Power%20Transform-20.png)<!-- -->

``` r
hist(StudentPerformanceDataset_yeo_johnson_transform$CAT2, main = "Bar Plot of CAT 2",
     xlab = "CAT2", ylab = "Frequency", col = "purple")
```

![](Lab-Submission-Markdown_files/figure-gfm/Applying%20a%20Yeo-Johnson%20Power%20Transform-21.png)<!-- -->

``` r
hist(StudentPerformanceDataset_yeo_johnson_transform$Coursework, main = "Bar Plot of Coursework",
     xlab = "Coursework", ylab = "Frequency", col = "pink")
```

![](Lab-Submission-Markdown_files/figure-gfm/Applying%20a%20Yeo-Johnson%20Power%20Transform-22.png)<!-- -->

``` r
hist(StudentPerformanceDataset_yeo_johnson_transform$EXAM, main = "Bar Plot of EXAM",
     xlab = "EXAM", ylab = "Frequency", col = "blue")
```

![](Lab-Submission-Markdown_files/figure-gfm/Applying%20a%20Yeo-Johnson%20Power%20Transform-23.png)<!-- -->

``` r
hist(StudentPerformanceDataset_yeo_johnson_transform$TOTAL, main = "Bar Plot of TOTAL Semester marks",
     xlab = "TOTAL Semester marks", ylab = "Frequency", col = "red")
```

![](Lab-Submission-Markdown_files/figure-gfm/Applying%20a%20Yeo-Johnson%20Power%20Transform-24.png)<!-- -->

``` r
summary(StudentPerformanceDataset)
```

    ##      gender            YOB         motivator      read_content_before_lecture
    ##  Min.   :0.0000   Min.   :1998   Min.   :0.0000   Min.   :1.000              
    ##  1st Qu.:0.0000   1st Qu.:2000   1st Qu.:1.0000   1st Qu.:2.000              
    ##  Median :1.0000   Median :2001   Median :1.0000   Median :3.000              
    ##  Mean   :0.5743   Mean   :2001   Mean   :0.7525   Mean   :2.752              
    ##  3rd Qu.:1.0000   3rd Qu.:2002   3rd Qu.:1.0000   3rd Qu.:3.000              
    ##  Max.   :1.0000   Max.   :2003   Max.   :1.0000   Max.   :5.000              
    ##  anticipate_test_questions answer_rhetorical_questions find_terms_I_do_not_know
    ##  Min.   :1.000             Min.   :1.000               Min.   :1.000           
    ##  1st Qu.:3.000             1st Qu.:3.000               1st Qu.:3.000           
    ##  Median :4.000             Median :4.000               Median :4.000           
    ##  Mean   :3.584             Mean   :3.426               Mean   :3.743           
    ##  3rd Qu.:4.000             3rd Qu.:4.000               3rd Qu.:5.000           
    ##  Max.   :5.000             Max.   :5.000               Max.   :5.000           
    ##  copy_new_terms_in_reading_notebook take_quizzes_and_use_results
    ##  Min.   :1.000                      Min.   :1.000               
    ##  1st Qu.:3.000                      1st Qu.:3.000               
    ##  Median :4.000                      Median :4.000               
    ##  Mean   :3.663                      Mean   :3.941               
    ##  3rd Qu.:4.000                      3rd Qu.:5.000               
    ##  Max.   :5.000                      Max.   :5.000               
    ##  reorganise_course_outline write_down_important_points space_out_revision
    ##  Min.   :1.000             Min.   :1.000               Min.   :1.000     
    ##  1st Qu.:3.000             1st Qu.:3.000               1st Qu.:3.000     
    ##  Median :3.000             Median :4.000               Median :3.000     
    ##  Mean   :3.376             Mean   :3.832               Mean   :3.228     
    ##  3rd Qu.:4.000             3rd Qu.:5.000               3rd Qu.:4.000     
    ##  Max.   :5.000             Max.   :5.000               Max.   :5.000     
    ##  studying_in_study_group schedule_appointments goal_oriented  
    ##  Min.   :1.000           Min.   :1.000         Min.   :0.000  
    ##  1st Qu.:1.000           1st Qu.:1.000         1st Qu.:0.000  
    ##  Median :2.000           Median :2.000         Median :0.000  
    ##  Mean   :2.455           Mean   :1.931         Mean   :0.198  
    ##  3rd Qu.:3.000           3rd Qu.:2.000         3rd Qu.:0.000  
    ##  Max.   :5.000           Max.   :5.000         Max.   :1.000  
    ##  spaced_repetition testing_and_active_recall  interleaving    categorizing  
    ##  Min.   :1.000     Min.   :1.000             Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:2.000     1st Qu.:3.000             1st Qu.:2.000   1st Qu.:2.000  
    ##  Median :3.000     Median :3.000             Median :2.000   Median :3.000  
    ##  Mean   :2.554     Mean   :3.059             Mean   :2.257   Mean   :2.713  
    ##  3rd Qu.:3.000     3rd Qu.:4.000             3rd Qu.:3.000   3rd Qu.:3.000  
    ##  Max.   :4.000     Max.   :4.000             Max.   :4.000   Max.   :4.000  
    ##  retrospective_timetable cornell_notes        sq3r          commute     
    ##  Min.   :1.000           Min.   :1.000   Min.   :1.000   Min.   :0.000  
    ##  1st Qu.:2.000           1st Qu.:2.000   1st Qu.:2.000   1st Qu.:2.000  
    ##  Median :2.000           Median :3.000   Median :3.000   Median :3.000  
    ##  Mean   :2.406           Mean   :2.545   Mean   :2.614   Mean   :2.703  
    ##  3rd Qu.:3.000           3rd Qu.:3.000   3rd Qu.:3.000   3rd Qu.:4.000  
    ##  Max.   :4.000           Max.   :4.000   Max.   :4.000   Max.   :4.000  
    ##    study_time    repeats_since_Y1  paid_tuition     free_tuition   
    ##  Min.   :0.000   Min.   : 0.00    Min.   :0.0000   Min.   :0.0000  
    ##  1st Qu.:1.000   1st Qu.: 0.00    1st Qu.:0.0000   1st Qu.:0.0000  
    ##  Median :2.000   Median : 2.00    Median :0.0000   Median :0.0000  
    ##  Mean   :1.733   Mean   : 2.03    Mean   :0.1089   Mean   :0.2673  
    ##  3rd Qu.:2.000   3rd Qu.: 3.00    3rd Qu.:0.0000   3rd Qu.:1.0000  
    ##  Max.   :4.000   Max.   :10.00    Max.   :1.0000   Max.   :1.0000  
    ##  extra_curricular sports_extra_curricular exercise_per_week    meditate     
    ##  Min.   :0.0000   Min.   :0.0000          Min.   :0.000     Min.   :0.0000  
    ##  1st Qu.:0.0000   1st Qu.:0.0000          1st Qu.:1.000     1st Qu.:0.0000  
    ##  Median :1.0000   Median :0.0000          Median :1.000     Median :1.0000  
    ##  Mean   :0.5248   Mean   :0.3564          Mean   :1.089     Mean   :0.7525  
    ##  3rd Qu.:1.0000   3rd Qu.:1.0000          3rd Qu.:2.000     3rd Qu.:1.0000  
    ##  Max.   :1.0000   Max.   :1.0000          Max.   :3.000     Max.   :3.0000  
    ##       pray          internet      family_relationships  friendships  
    ##  Min.   :0.000   Min.   :0.0000   Min.   :0.000        Min.   :0.00  
    ##  1st Qu.:1.000   1st Qu.:1.0000   1st Qu.:4.000        1st Qu.:4.00  
    ##  Median :2.000   Median :1.0000   Median :4.000        Median :4.00  
    ##  Mean   :2.069   Mean   :0.8614   Mean   :4.149        Mean   :3.97  
    ##  3rd Qu.:3.000   3rd Qu.:1.0000   3rd Qu.:5.000        3rd Qu.:4.00  
    ##  Max.   :3.000   Max.   :1.0000   Max.   :5.000        Max.   :5.00  
    ##  romantic_relationships spiritual_wellnes financial_wellness     health 
    ##  Min.   :0.000          Min.   :0.000     Min.   :0          Min.   :0  
    ##  1st Qu.:0.000          1st Qu.:3.000     1st Qu.:2          1st Qu.:3  
    ##  Median :0.000          Median :4.000     Median :3          Median :4  
    ##  Mean   :1.356          Mean   :3.614     Mean   :3          Mean   :4  
    ##  3rd Qu.:3.000          3rd Qu.:4.000     3rd Qu.:4          3rd Qu.:5  
    ##  Max.   :4.000          Max.   :5.000     Max.   :5          Max.   :5  
    ##     day_out         night_out     alcohol_or_narcotics     mentor      
    ##  Min.   :0.0000   Min.   :0.000   Min.   :0.0000       Min.   :0.0000  
    ##  1st Qu.:0.0000   1st Qu.:0.000   1st Qu.:0.0000       1st Qu.:0.0000  
    ##  Median :1.0000   Median :0.000   Median :0.0000       Median :0.0000  
    ##  Mean   :0.7921   Mean   :0.505   Mean   :0.3465       Mean   :0.4059  
    ##  3rd Qu.:1.0000   3rd Qu.:1.000   3rd Qu.:1.0000       3rd Qu.:1.0000  
    ##  Max.   :3.0000   Max.   :3.000   Max.   :3.0000       Max.   :1.0000  
    ##  mentor_meetings        A1        A - 2. Classes start and end on time
    ##  Min.   :0.0000   Min.   :0.000   Min.   :0.000                       
    ##  1st Qu.:0.0000   1st Qu.:4.000   1st Qu.:4.000                       
    ##  Median :0.0000   Median :5.000   Median :5.000                       
    ##  Mean   :0.6733   Mean   :4.446   Mean   :4.634                       
    ##  3rd Qu.:1.0000   3rd Qu.:5.000   3rd Qu.:5.000                       
    ##  Max.   :3.0000   Max.   :5.000   Max.   :5.000                       
    ##  A - 3. The learning environment is participative, involves learning by doing and is group-based
    ##  Min.   :0.000                                                                                  
    ##  1st Qu.:4.000                                                                                  
    ##  Median :4.000                                                                                  
    ##  Mean   :4.307                                                                                  
    ##  3rd Qu.:5.000                                                                                  
    ##  Max.   :5.000                                                                                  
    ##  A - 4. The subject content is delivered according to the course outline and meets my expectations
    ##  Min.   :0.000                                                                                    
    ##  1st Qu.:4.000                                                                                    
    ##  Median :5.000                                                                                    
    ##  Mean   :4.693                                                                                    
    ##  3rd Qu.:5.000                                                                                    
    ##  Max.   :5.000                                                                                    
    ##  A - 5. The topics are clear and logically developed
    ##  Min.   :0.000                                      
    ##  1st Qu.:4.000                                      
    ##  Median :5.000                                      
    ##  Mean   :4.604                                      
    ##  3rd Qu.:5.000                                      
    ##  Max.   :5.000                                      
    ##  A - 6. I am developing my oral and writing skills
    ##  Min.   :0.000                                    
    ##  1st Qu.:4.000                                    
    ##  Median :4.000                                    
    ##  Mean   :4.069                                    
    ##  3rd Qu.:5.000                                    
    ##  Max.   :5.000                                    
    ##  A - 7. I am developing my reflective and critical reasoning skills
    ##  Min.   :0.000                                                     
    ##  1st Qu.:4.000                                                     
    ##  Median :4.000                                                     
    ##  Mean   :4.337                                                     
    ##  3rd Qu.:5.000                                                     
    ##  Max.   :5.000                                                     
    ##  A - 8. The assessment methods are assisting me to learn
    ##  Min.   :0.000                                          
    ##  1st Qu.:4.000                                          
    ##  Median :5.000                                          
    ##  Mean   :4.564                                          
    ##  3rd Qu.:5.000                                          
    ##  Max.   :5.000                                          
    ##  A - 9. I receive relevant feedback
    ##  Min.   :0.000                     
    ##  1st Qu.:4.000                     
    ##  Median :5.000                     
    ##  Mean   :4.535                     
    ##  3rd Qu.:5.000                     
    ##  Max.   :5.000                     
    ##  A - 10. I read the recommended readings and notes
    ##  Min.   :0.000                                    
    ##  1st Qu.:4.000                                    
    ##  Median :5.000                                    
    ##  Mean   :4.505                                    
    ##  3rd Qu.:5.000                                    
    ##  Max.   :5.000                                    
    ##  A - 11. I use the eLearning material posted
    ##  Min.   :0.000                              
    ##  1st Qu.:4.000                              
    ##  Median :5.000                              
    ##  Mean   :4.653                              
    ##  3rd Qu.:5.000                              
    ##  Max.   :5.000                              
    ##  B - 1. Concept 1 of 6: Principles of Business Intelligence and the DataOps Philosophy
    ##  Min.   :0.000                                                                        
    ##  1st Qu.:4.000                                                                        
    ##  Median :4.000                                                                        
    ##  Mean   :4.208                                                                        
    ##  3rd Qu.:5.000                                                                        
    ##  Max.   :5.000                                                                        
    ##  B - 2. Concept 3 of 6: Linear Algorithms for Predictive Analytics
    ##  Min.   :0.000                                                    
    ##  1st Qu.:3.000                                                    
    ##  Median :4.000                                                    
    ##  Mean   :3.901                                                    
    ##  3rd Qu.:5.000                                                    
    ##  Max.   :5.000                                                    
    ##  C - 2. Quizzes at the end of each concept
    ##  Min.   :0.000                            
    ##  1st Qu.:4.000                            
    ##  Median :5.000                            
    ##  Mean   :4.545                            
    ##  3rd Qu.:5.000                            
    ##  Max.   :5.000                            
    ##  C - 3. Lab manuals that outline the steps to follow during the labs
    ##  Min.   :0.000                                                      
    ##  1st Qu.:4.000                                                      
    ##  Median :5.000                                                      
    ##  Mean   :4.564                                                      
    ##  3rd Qu.:5.000                                                      
    ##  Max.   :5.000                                                      
    ##  C - 4. Required lab work submissions at the end of each lab manual that outline the activity to be done on your own
    ##  Min.   :0.000                                                                                                      
    ##  1st Qu.:4.000                                                                                                      
    ##  Median :5.000                                                                                                      
    ##  Mean   :4.505                                                                                                      
    ##  3rd Qu.:5.000                                                                                                      
    ##  Max.   :5.000                                                                                                      
    ##  C - 5. Supplementary videos to watch
    ##  Min.   :0.000                       
    ##  1st Qu.:4.000                       
    ##  Median :4.000                       
    ##  Mean   :4.149                       
    ##  3rd Qu.:5.000                       
    ##  Max.   :5.000                       
    ##  C - 6. Supplementary podcasts to listen to
    ##  Min.   :0.00                              
    ##  1st Qu.:4.00                              
    ##  Median :4.00                              
    ##  Mean   :4.04                              
    ##  3rd Qu.:5.00                              
    ##  Max.   :5.00                              
    ##  C - 7. Supplementary content to read C - 8. Lectures slides
    ##  Min.   :0.000                        Min.   :0.000         
    ##  1st Qu.:4.000                        1st Qu.:4.000         
    ##  Median :4.000                        Median :5.000         
    ##  Mean   :4.129                        Mean   :4.554         
    ##  3rd Qu.:5.000                        3rd Qu.:5.000         
    ##  Max.   :5.000                        Max.   :5.000         
    ##  C - 9. Lecture notes on some of the lecture slides
    ##  Min.   :0.000                                     
    ##  1st Qu.:4.000                                     
    ##  Median :5.000                                     
    ##  Mean   :4.554                                     
    ##  3rd Qu.:5.000                                     
    ##  Max.   :5.000                                     
    ##  C - 10. The quality of the lectures given (quality measured by the breadth (the full span of knowledge of a subject) and depth (the extent to which specific topics are focused upon, amplified, and explored) of learning - NOT quality measured by how fun/co
    ##  Min.   :0.000                                                                                                                                                                                                                                                  
    ##  1st Qu.:4.000                                                                                                                                                                                                                                                  
    ##  Median :5.000                                                                                                                                                                                                                                                  
    ##  Mean   :4.495                                                                                                                                                                                                                                                  
    ##  3rd Qu.:5.000                                                                                                                                                                                                                                                  
    ##  Max.   :5.000                                                                                                                                                                                                                                                  
    ##  C - 11. The division of theory and practice such that most of the theory is done during the recorded online classes and most of the practice is done during the physical classes
    ##  Min.   :0.000                                                                                                                                                                   
    ##  1st Qu.:4.000                                                                                                                                                                   
    ##  Median :5.000                                                                                                                                                                   
    ##  Mean   :4.446                                                                                                                                                                   
    ##  3rd Qu.:5.000                                                                                                                                                                   
    ##  Max.   :5.000                                                                                                                                                                   
    ##  C - 12. The recordings of online classes Average Course Evaluation Rating
    ##  Min.   :0.000                            Min.   :0.000                   
    ##  1st Qu.:4.000                            1st Qu.:4.273                   
    ##  Median :5.000                            Median :4.545                   
    ##  Mean   :4.287                            Mean   :4.486                   
    ##  3rd Qu.:5.000                            3rd Qu.:4.909                   
    ##  Max.   :5.000                            Max.   :5.000                   
    ##  Average Level of Learning Attained Rating Average_Rating 
    ##  Min.   :0.000                             Min.   :0.000  
    ##  1st Qu.:3.500                             1st Qu.:4.000  
    ##  Median :4.000                             Median :4.545  
    ##  Mean   :4.054                             Mean   :4.388  
    ##  3rd Qu.:4.500                             3rd Qu.:4.909  
    ##  Max.   :5.000                             Max.   :5.000  
    ##  Project: Section 1-4: (20%) x/10 Project: Section 5-11: (50%) x/10
    ##  Min.   : 0.000                   Min.   : 0.000                   
    ##  1st Qu.: 7.400                   1st Qu.: 6.000                   
    ##  Median : 8.500                   Median : 7.800                   
    ##  Mean   : 8.011                   Mean   : 6.582                   
    ##  3rd Qu.: 9.000                   3rd Qu.: 8.300                   
    ##  Max.   :10.000                   Max.   :10.000                   
    ##  Project: Section 12: (30%) x/5 Project: (10%): x/30 x 100 TOTAL
    ##  Min.   :0.000                  Min.   :  0.00                  
    ##  1st Qu.:0.000                  1st Qu.: 56.00                  
    ##  Median :0.000                  Median : 66.40                  
    ##  Mean   :1.005                  Mean   : 62.39                  
    ##  3rd Qu.:1.000                  3rd Qu.: 71.60                  
    ##  Max.   :5.000                  Max.   :100.00                  
    ##  Quiz 1 on Concept 1 (Introduction) x/32 Quiz 3 on Concept 3 (Linear) x/15
    ##  Min.   : 4.75                           Min.   : 0.000                   
    ##  1st Qu.:11.53                           1st Qu.: 7.000                   
    ##  Median :15.33                           Median : 9.000                   
    ##  Mean   :16.36                           Mean   : 9.342                   
    ##  3rd Qu.:19.63                           3rd Qu.:12.000                   
    ##  Max.   :31.25                           Max.   :15.000                   
    ##  Quiz 4 on Concept 4 (Non-Linear) x/22 Quiz 5 on Concept 5 (Dashboarding) x/10
    ##  Min.   : 0.00                         Min.   : 0.000                         
    ##  1st Qu.:10.17                         1st Qu.: 4.330                         
    ##  Median :13.08                         Median : 6.000                         
    ##  Mean   :13.11                         Mean   : 5.611                         
    ##  3rd Qu.:17.50                         3rd Qu.: 7.670                         
    ##  Max.   :22.00                         Max.   :12.670                         
    ##     Quizzes      Lab 1 - 2.c. - (Simple Linear Regression) x/5
    ##  Min.   :26.26   Min.   :0.000                                
    ##  1st Qu.:43.82   1st Qu.:5.000                                
    ##  Median :55.31   Median :5.000                                
    ##  Mean   :56.22   Mean   :4.752                                
    ##  3rd Qu.:65.16   3rd Qu.:5.000                                
    ##  Max.   :95.25   Max.   :5.000                                
    ##  Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5
    ##  Min.   :0.000                                                  
    ##  1st Qu.:4.850                                                  
    ##  Median :4.850                                                  
    ##  Mean   :4.218                                                  
    ##  3rd Qu.:4.850                                                  
    ##  Max.   :5.000                                                  
    ##  Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5
    ##  Min.   :0.000                                    
    ##  1st Qu.:2.850                                    
    ##  Median :4.850                                    
    ##  Mean   :3.636                                    
    ##  3rd Qu.:5.000                                    
    ##  Max.   :5.000                                    
    ##  Lab 5 - Chart JS Dashboard Setup x/5    LabWork            CAT1      
    ##  Min.   :0.000                        Min.   : 17.80   Min.   : 0.00  
    ##  1st Qu.:0.000                        1st Qu.: 70.80   1st Qu.:57.89  
    ##  Median :5.000                        Median : 80.00   Median :68.42  
    ##  Mean   :3.404                        Mean   : 79.72   Mean   :66.65  
    ##  3rd Qu.:5.000                        3rd Qu.: 97.20   3rd Qu.:82.89  
    ##  Max.   :5.000                        Max.   :100.00   Max.   :97.36  
    ##       CAT2        Absenteeism Percentage   Coursework         EXAM      
    ##  Min.   :  0.00   Min.   : 0.00          Min.   : 7.47   Min.   : 0.00  
    ##  1st Qu.:  0.00   1st Qu.: 7.41          1st Qu.:20.44   1st Qu.:25.00  
    ##  Median : 52.00   Median :14.81          Median :24.58   Median :33.00  
    ##  Mean   : 43.06   Mean   :15.42          Mean   :24.53   Mean   :32.59  
    ##  3rd Qu.: 68.00   3rd Qu.:22.22          3rd Qu.:29.31   3rd Qu.:42.00  
    ##  Max.   :100.00   Max.   :51.85          Max.   :35.08   Max.   :56.00  
    ##      TOTAL      
    ##  Min.   : 7.47  
    ##  1st Qu.:45.54  
    ##  Median :58.69  
    ##  Mean   :57.12  
    ##  3rd Qu.:68.83  
    ##  Max.   :87.72

``` r
model_of_the_transform <- preProcess(StudentPerformanceDataset, method =
                                       c("scale", "center", "pca"))

print(model_of_the_transform)
```

    ## Created from 101 samples and 91 variables
    ## 
    ## Pre-processing:
    ##   - centered (91)
    ##   - ignored (0)
    ##   - principal component signal extraction (91)
    ##   - scaled (91)
    ## 
    ## PCA needed 47 components to capture 95 percent of the variance

``` r
StudentPerformanceDataset_pca_dr <- predict(model_of_the_transform, StudentPerformanceDataset)
summary(StudentPerformanceDataset_pca_dr)
```

    ##       PC1                PC2                PC3                PC4         
    ##  Min.   :-28.2413   Min.   :-7.07705   Min.   :-6.50316   Min.   :-5.1541  
    ##  1st Qu.: -1.6792   1st Qu.:-2.11407   1st Qu.:-1.27264   1st Qu.:-1.3807  
    ##  Median :  0.6394   Median :-0.04437   Median : 0.01686   Median :-0.2064  
    ##  Mean   :  0.0000   Mean   : 0.00000   Mean   : 0.00000   Mean   : 0.0000  
    ##  3rd Qu.:  2.4720   3rd Qu.: 2.13680   3rd Qu.: 1.80841   3rd Qu.: 1.5461  
    ##  Max.   :  5.9764   Max.   : 7.79469   Max.   : 5.12474   Max.   : 7.3599  
    ##       PC5                 PC6                PC7                PC8         
    ##  Min.   :-5.149529   Min.   :-5.07200   Min.   :-4.75487   Min.   :-5.1068  
    ##  1st Qu.:-1.250978   1st Qu.:-0.88633   1st Qu.:-1.08546   1st Qu.:-0.9946  
    ##  Median : 0.006567   Median : 0.05211   Median : 0.09186   Median : 0.1575  
    ##  Mean   : 0.000000   Mean   : 0.00000   Mean   : 0.00000   Mean   : 0.0000  
    ##  3rd Qu.: 1.209744   3rd Qu.: 0.72448   3rd Qu.: 1.15013   3rd Qu.: 1.1121  
    ##  Max.   : 4.353861   Max.   : 5.67610   Max.   : 2.91380   Max.   : 3.8666  
    ##       PC9               PC10               PC11              PC12        
    ##  Min.   :-4.0102   Min.   :-2.91743   Min.   :-3.0740   Min.   :-3.2209  
    ##  1st Qu.:-1.0196   1st Qu.:-1.05288   1st Qu.:-0.9769   1st Qu.:-0.9093  
    ##  Median :-0.2271   Median : 0.05933   Median : 0.1622   Median :-0.1223  
    ##  Mean   : 0.0000   Mean   : 0.00000   Mean   : 0.0000   Mean   : 0.0000  
    ##  3rd Qu.: 0.9528   3rd Qu.: 0.95431   3rd Qu.: 0.8796   3rd Qu.: 0.7353  
    ##  Max.   : 3.9090   Max.   : 5.43402   Max.   : 3.5211   Max.   : 4.3286  
    ##       PC13              PC14              PC15               PC16         
    ##  Min.   :-3.7507   Min.   :-3.3604   Min.   :-3.21426   Min.   :-3.41473  
    ##  1st Qu.:-0.7550   1st Qu.:-0.8644   1st Qu.:-0.91685   1st Qu.:-0.57213  
    ##  Median : 0.1523   Median :-0.1318   Median : 0.02652   Median : 0.01114  
    ##  Mean   : 0.0000   Mean   : 0.0000   Mean   : 0.00000   Mean   : 0.00000  
    ##  3rd Qu.: 0.5437   3rd Qu.: 0.8203   3rd Qu.: 0.84142   3rd Qu.: 0.61605  
    ##  Max.   : 4.3900   Max.   : 4.9991   Max.   : 3.26017   Max.   : 3.53457  
    ##       PC17               PC18               PC19              PC20        
    ##  Min.   :-3.17788   Min.   :-3.38518   Min.   :-2.7381   Min.   :-2.8611  
    ##  1st Qu.:-0.69312   1st Qu.:-0.70287   1st Qu.:-0.6704   1st Qu.:-0.8961  
    ##  Median :-0.01654   Median :-0.07304   Median :-0.1925   Median : 0.1984  
    ##  Mean   : 0.00000   Mean   : 0.00000   Mean   : 0.0000   Mean   : 0.0000  
    ##  3rd Qu.: 0.86369   3rd Qu.: 0.98352   3rd Qu.: 0.8174   3rd Qu.: 0.8060  
    ##  Max.   : 2.72857   Max.   : 3.03003   Max.   : 2.9430   Max.   : 2.4659  
    ##       PC21               PC22               PC23               PC24          
    ##  Min.   :-2.36330   Min.   :-3.28604   Min.   :-3.08939   Min.   :-3.296734  
    ##  1st Qu.:-0.79899   1st Qu.:-0.62415   1st Qu.:-0.60248   1st Qu.:-0.648073  
    ##  Median :-0.09824   Median : 0.07561   Median :-0.08536   Median : 0.002753  
    ##  Mean   : 0.00000   Mean   : 0.00000   Mean   : 0.00000   Mean   : 0.000000  
    ##  3rd Qu.: 0.91952   3rd Qu.: 0.57419   3rd Qu.: 0.61731   3rd Qu.: 0.751173  
    ##  Max.   : 2.97162   Max.   : 3.38717   Max.   : 3.38774   Max.   : 2.203886  
    ##       PC25               PC26               PC27               PC28         
    ##  Min.   :-2.42556   Min.   :-3.23872   Min.   :-2.57250   Min.   :-2.00293  
    ##  1st Qu.:-0.75827   1st Qu.:-0.73305   1st Qu.:-0.64155   1st Qu.:-0.52630  
    ##  Median :-0.04049   Median : 0.02704   Median : 0.01983   Median : 0.06908  
    ##  Mean   : 0.00000   Mean   : 0.00000   Mean   : 0.00000   Mean   : 0.00000  
    ##  3rd Qu.: 0.66045   3rd Qu.: 0.72343   3rd Qu.: 0.72879   3rd Qu.: 0.66598  
    ##  Max.   : 2.97566   Max.   : 2.30948   Max.   : 2.36991   Max.   : 2.11795  
    ##       PC29               PC30               PC31               PC32        
    ##  Min.   :-1.80292   Min.   :-2.42694   Min.   :-2.18413   Min.   :-1.9957  
    ##  1st Qu.:-0.69908   1st Qu.:-0.56129   1st Qu.:-0.58422   1st Qu.:-0.6203  
    ##  Median : 0.08326   Median :-0.03736   Median :-0.08737   Median :-0.0849  
    ##  Mean   : 0.00000   Mean   : 0.00000   Mean   : 0.00000   Mean   : 0.0000  
    ##  3rd Qu.: 0.57931   3rd Qu.: 0.54844   3rd Qu.: 0.57734   3rd Qu.: 0.5528  
    ##  Max.   : 2.48151   Max.   : 2.44204   Max.   : 2.55573   Max.   : 2.5901  
    ##       PC33               PC34                PC35               PC36         
    ##  Min.   :-2.06550   Min.   :-2.207451   Min.   :-1.99415   Min.   :-1.65089  
    ##  1st Qu.:-0.54913   1st Qu.:-0.484768   1st Qu.:-0.49332   1st Qu.:-0.57852  
    ##  Median :-0.02007   Median :-0.001169   Median : 0.02215   Median :-0.01497  
    ##  Mean   : 0.00000   Mean   : 0.000000   Mean   : 0.00000   Mean   : 0.00000  
    ##  3rd Qu.: 0.46942   3rd Qu.: 0.686645   3rd Qu.: 0.48192   3rd Qu.: 0.50959  
    ##  Max.   : 2.36285   Max.   : 2.165504   Max.   : 2.39829   Max.   : 2.17007  
    ##       PC37                PC38               PC39               PC40           
    ##  Min.   :-2.779624   Min.   :-1.89966   Min.   :-1.92257   Min.   :-1.8180373  
    ##  1st Qu.:-0.506177   1st Qu.:-0.48776   1st Qu.:-0.51821   1st Qu.:-0.5121838  
    ##  Median :-0.009679   Median : 0.05792   Median :-0.04643   Median : 0.0000267  
    ##  Mean   : 0.000000   Mean   : 0.00000   Mean   : 0.00000   Mean   : 0.0000000  
    ##  3rd Qu.: 0.441055   3rd Qu.: 0.48852   3rd Qu.: 0.50855   3rd Qu.: 0.4386499  
    ##  Max.   : 2.751446   Max.   : 1.88214   Max.   : 1.97317   Max.   : 1.8773446  
    ##       PC41               PC42               PC43                PC44         
    ##  Min.   :-1.74912   Min.   :-2.28279   Min.   :-1.848101   Min.   :-2.14043  
    ##  1st Qu.:-0.37843   1st Qu.:-0.42035   1st Qu.:-0.399595   1st Qu.:-0.41976  
    ##  Median : 0.02385   Median :-0.05652   Median :-0.006496   Median :-0.07662  
    ##  Mean   : 0.00000   Mean   : 0.00000   Mean   : 0.000000   Mean   : 0.00000  
    ##  3rd Qu.: 0.44890   3rd Qu.: 0.46532   3rd Qu.: 0.462265   3rd Qu.: 0.42182  
    ##  Max.   : 1.82334   Max.   : 1.57040   Max.   : 1.541775   Max.   : 1.92575  
    ##       PC45              PC46               PC47         
    ##  Min.   :-1.9460   Min.   :-1.53806   Min.   :-1.63471  
    ##  1st Qu.:-0.4324   1st Qu.:-0.35380   1st Qu.:-0.42154  
    ##  Median : 0.0113   Median : 0.01332   Median :-0.04628  
    ##  Mean   : 0.0000   Mean   : 0.00000   Mean   : 0.00000  
    ##  3rd Qu.: 0.4665   3rd Qu.: 0.40829   3rd Qu.: 0.39130  
    ##  Max.   : 1.5744   Max.   : 1.16783   Max.   : 1.45177

``` r
StudentPerformanceDataset_pca_fe <- princomp(cor(StudentPerformanceDataset[, -1]))
summary(StudentPerformanceDataset_pca_fe)
```

    ## Importance of components:
    ##                           Comp.1    Comp.2    Comp.3    Comp.4     Comp.5
    ## Standard deviation     1.3005180 0.7720649 0.4827873 0.3947721 0.32116139
    ## Proportion of Variance 0.4705883 0.1658502 0.0648515 0.0433612 0.02869822
    ## Cumulative Proportion  0.4705883 0.6364385 0.7012900 0.7446512 0.77334939
    ##                            Comp.6     Comp.7     Comp.8     Comp.9    Comp.10
    ## Standard deviation     0.29562266 0.29122645 0.25880647 0.24201971 0.22430820
    ## Proportion of Variance 0.02431553 0.02359772 0.01863626 0.01629708 0.01399905
    ## Cumulative Proportion  0.79766493 0.82126264 0.83989890 0.85619598 0.87019504
    ##                           Comp.11    Comp.12    Comp.13     Comp.14     Comp.15
    ## Standard deviation     0.20869484 0.20414597 0.19238373 0.176690016 0.170304773
    ## Proportion of Variance 0.01211802 0.01159551 0.01029781 0.008686252 0.008069786
    ## Cumulative Proportion  0.88231306 0.89390857 0.90420639 0.912892639 0.920962425
    ##                            Comp.16     Comp.17     Comp.18     Comp.19
    ## Standard deviation     0.164979607 0.157670624 0.144689068 0.132746662
    ## Proportion of Variance 0.007573017 0.006916875 0.005824784 0.004902929
    ## Cumulative Proportion  0.928535442 0.935452317 0.941277101 0.946180030
    ##                            Comp.20     Comp.21     Comp.22     Comp.23
    ## Standard deviation     0.131029649 0.126075694 0.120130371 0.110737197
    ## Proportion of Variance 0.004776915 0.004422533 0.004015263 0.003411893
    ## Cumulative Proportion  0.950956945 0.955379479 0.959394742 0.962806635
    ##                            Comp.24     Comp.25     Comp.26     Comp.27
    ## Standard deviation     0.110031154 0.106737509 0.101862191 0.099075348
    ## Proportion of Variance 0.003368525 0.003169878 0.002886918 0.002731113
    ## Cumulative Proportion  0.966175160 0.969345037 0.972231955 0.974963068
    ##                            Comp.28     Comp.29     Comp.30     Comp.31
    ## Standard deviation     0.090027615 0.086739917 0.084110152 0.080971508
    ## Proportion of Variance 0.002255069 0.002093372 0.001968363 0.001824202
    ## Cumulative Proportion  0.977218137 0.979311509 0.981279872 0.983104073
    ##                            Comp.32     Comp.33     Comp.34     Comp.35
    ## Standard deviation     0.077770195 0.074603641 0.071429722 0.068475237
    ## Proportion of Variance 0.001682809 0.001548561 0.001419601 0.001304594
    ## Cumulative Proportion  0.984786882 0.986335443 0.987755044 0.989059639
    ##                            Comp.36      Comp.37     Comp.38      Comp.39
    ## Standard deviation     0.062233737 0.0596095235 0.058588455 0.0542310249
    ## Proportion of Variance 0.001077606 0.0009886434 0.000955064 0.0008182839
    ## Cumulative Proportion  0.990137245 0.9911258883 0.992080952 0.9928992362
    ##                             Comp.40      Comp.41      Comp.42      Comp.43
    ## Standard deviation     0.0534517236 0.0504857395 0.0473145339 0.0460901083
    ## Proportion of Variance 0.0007949353 0.0007091626 0.0006228701 0.0005910495
    ## Cumulative Proportion  0.9936941716 0.9944033341 0.9950262043 0.9956172538
    ##                             Comp.44      Comp.45     Comp.46      Comp.47
    ## Standard deviation     0.0446546490 0.0396135136 0.037638622 0.0360796382
    ## Proportion of Variance 0.0005548068 0.0004366114 0.000394163 0.0003621869
    ## Cumulative Proportion  0.9961720605 0.9966086720 0.997002835 0.9973650218
    ##                             Comp.48      Comp.49      Comp.50      Comp.51
    ## Standard deviation     0.0346685608 0.0341337916 0.0301575427 0.0289288226
    ## Proportion of Variance 0.0003344106 0.0003241734 0.0002530465 0.0002328466
    ## Cumulative Proportion  0.9976994324 0.9980236058 0.9982766523 0.9985094989
    ##                             Comp.52      Comp.53      Comp.54     Comp.55
    ## Standard deviation     0.0262477723 0.0246575970 0.0240191766 0.023174420
    ## Proportion of Variance 0.0001916873 0.0001691648 0.0001605183 0.000149426
    ## Cumulative Proportion  0.9987011862 0.9988703509 0.9990308692 0.999180295
    ##                            Comp.56      Comp.57      Comp.58      Comp.59
    ## Standard deviation     0.020478216 0.0196668350 1.810924e-02 1.716215e-02
    ## Proportion of Variance 0.000116679 0.0001076161 9.124495e-05 8.195054e-05
    ## Cumulative Proportion  0.999296974 0.9994045903 9.994958e-01 9.995778e-01
    ##                             Comp.60      Comp.61      Comp.62      Comp.63
    ## Standard deviation     1.621798e-02 1.580065e-02 1.295872e-02 1.213124e-02
    ## Proportion of Variance 7.318159e-05 6.946378e-05 4.672317e-05 4.094671e-05
    ## Cumulative Proportion  9.996510e-01 9.997204e-01 9.997672e-01 9.998081e-01
    ##                             Comp.64      Comp.65      Comp.66      Comp.67
    ## Standard deviation     1.167933e-02 1.072612e-02 9.387416e-03 8.933215e-03
    ## Proportion of Variance 3.795282e-05 3.201056e-05 2.451887e-05 2.220363e-05
    ## Cumulative Proportion  9.998461e-01 9.998781e-01 9.999026e-01 9.999248e-01
    ##                             Comp.68      Comp.69      Comp.70      Comp.71
    ## Standard deviation     7.769363e-03 6.954956e-03 0.0063066244 5.464140e-03
    ## Proportion of Variance 1.679497e-05 1.345851e-05 0.0000110663 8.307151e-06
    ## Cumulative Proportion  9.999416e-01 9.999550e-01 0.9999661067 9.999744e-01
    ##                             Comp.72      Comp.73      Comp.74      Comp.75
    ## Standard deviation     4.792189e-03 4.132357e-03 3.822383e-03 3.564077e-03
    ## Proportion of Variance 6.389637e-06 4.751207e-06 4.065153e-06 3.534293e-06
    ## Cumulative Proportion  9.999808e-01 9.999856e-01 9.999896e-01 9.999932e-01
    ##                             Comp.76      Comp.77      Comp.78      Comp.79
    ## Standard deviation     2.801682e-03 2.600399e-03 2.226694e-03 1.385375e-03
    ## Proportion of Variance 2.183967e-06 1.881432e-06 1.379524e-06 5.340021e-07
    ## Cumulative Proportion  9.999953e-01 9.999972e-01 9.999986e-01 9.999991e-01
    ##                             Comp.80      Comp.81      Comp.82      Comp.83
    ## Standard deviation     1.322197e-03 1.039737e-03 4.534355e-04 2.845459e-04
    ## Proportion of Variance 4.864079e-07 3.007845e-07 5.720571e-08 2.252751e-08
    ## Cumulative Proportion  9.999996e-01 9.999999e-01 1.000000e+00 1.000000e+00
    ##                             Comp.84      Comp.85      Comp.86      Comp.87
    ## Standard deviation     3.863625e-09 3.717784e-09 3.002535e-09 1.639143e-09
    ## Proportion of Variance 4.153348e-18 3.845711e-18 2.508330e-18 7.475532e-19
    ## Cumulative Proportion  1.000000e+00 1.000000e+00 1.000000e+00 1.000000e+00
    ##                        Comp.88 Comp.89 Comp.90
    ## Standard deviation           0       0       0
    ## Proportion of Variance       0       0       0
    ## Cumulative Proportion        1       1       1

``` r
## Scree Plot ----

factoextra::fviz_eig(StudentPerformanceDataset_pca_fe, addlabels = TRUE)
```

![](Lab-Submission-Markdown_files/figure-gfm/Performing%20PCA%20Linear%20Algebra%20Transform%20for%20Feature%20Extraction%20and%20visualizing-1.png)<!-- -->

``` r
## Loading Values
StudentPerformanceDataset_pca_fe$loadings[, 1:2]
```

    ##                                                                                                                                                                                                                                                                        Comp.1
    ## YOB                                                                                                                                                                                                                                                              0.0368016182
    ## motivator                                                                                                                                                                                                                                                       -0.0141280159
    ## read_content_before_lecture                                                                                                                                                                                                                                      0.0134746850
    ## anticipate_test_questions                                                                                                                                                                                                                                        0.0451551701
    ## answer_rhetorical_questions                                                                                                                                                                                                                                      0.0433580235
    ## find_terms_I_do_not_know                                                                                                                                                                                                                                         0.0104392736
    ## copy_new_terms_in_reading_notebook                                                                                                                                                                                                                               0.0333793525
    ## take_quizzes_and_use_results                                                                                                                                                                                                                                     0.0204092554
    ## reorganise_course_outline                                                                                                                                                                                                                                       -0.0118277570
    ## write_down_important_points                                                                                                                                                                                                                                      0.0215973828
    ## space_out_revision                                                                                                                                                                                                                                               0.0322464405
    ## studying_in_study_group                                                                                                                                                                                                                                         -0.0335926783
    ## schedule_appointments                                                                                                                                                                                                                                           -0.0208833013
    ## goal_oriented                                                                                                                                                                                                                                                    0.0020109292
    ## spaced_repetition                                                                                                                                                                                                                                                0.0285490938
    ## testing_and_active_recall                                                                                                                                                                                                                                        0.0220554252
    ## interleaving                                                                                                                                                                                                                                                     0.0177145688
    ## categorizing                                                                                                                                                                                                                                                     0.0067159895
    ## retrospective_timetable                                                                                                                                                                                                                                          0.0365913923
    ## cornell_notes                                                                                                                                                                                                                                                    0.0451091287
    ## sq3r                                                                                                                                                                                                                                                             0.0287951241
    ## commute                                                                                                                                                                                                                                                         -0.0456277344
    ## study_time                                                                                                                                                                                                                                                       0.0095826889
    ## repeats_since_Y1                                                                                                                                                                                                                                                -0.0116355230
    ## paid_tuition                                                                                                                                                                                                                                                     0.0305670349
    ## free_tuition                                                                                                                                                                                                                                                     0.0424030486
    ## extra_curricular                                                                                                                                                                                                                                                -0.0253186389
    ## sports_extra_curricular                                                                                                                                                                                                                                         -0.0935028054
    ## exercise_per_week                                                                                                                                                                                                                                               -0.0481544246
    ## meditate                                                                                                                                                                                                                                                        -0.0031805227
    ## pray                                                                                                                                                                                                                                                            -0.0508141628
    ## internet                                                                                                                                                                                                                                                        -0.0280118427
    ## family_relationships                                                                                                                                                                                                                                            -0.0039143773
    ## friendships                                                                                                                                                                                                                                                     -0.0084454613
    ## romantic_relationships                                                                                                                                                                                                                                          -0.0751161688
    ## spiritual_wellnes                                                                                                                                                                                                                                               -0.0087942626
    ## financial_wellness                                                                                                                                                                                                                                              -0.0045077699
    ## health                                                                                                                                                                                                                                                          -0.0005902349
    ## day_out                                                                                                                                                                                                                                                         -0.0412106308
    ## night_out                                                                                                                                                                                                                                                       -0.0732121690
    ## alcohol_or_narcotics                                                                                                                                                                                                                                            -0.0566613477
    ## mentor                                                                                                                                                                                                                                                          -0.0231098698
    ## mentor_meetings                                                                                                                                                                                                                                                 -0.0271873962
    ## A1                                                                                                                                                                                                                                                               0.1891808648
    ## A - 2. Classes start and end on time                                                                                                                                                                                                                             0.1876245719
    ## A - 3. The learning environment is participative, involves learning by doing and is group-based                                                                                                                                                                  0.1619114556
    ## A - 4. The subject content is delivered according to the course outline and meets my expectations                                                                                                                                                                0.2053912842
    ## A - 5. The topics are clear and logically developed                                                                                                                                                                                                              0.1987121578
    ## A - 6. I am developing my oral and writing skills                                                                                                                                                                                                                0.1371535519
    ## A - 7. I am developing my reflective and critical reasoning skills                                                                                                                                                                                               0.1820253369
    ## A - 8. The assessment methods are assisting me to learn                                                                                                                                                                                                          0.1920717091
    ## A - 9. I receive relevant feedback                                                                                                                                                                                                                               0.1966787297
    ## A - 10. I read the recommended readings and notes                                                                                                                                                                                                                0.1900901007
    ## A - 11. I use the eLearning material posted                                                                                                                                                                                                                      0.1914117070
    ## B - 1. Concept 1 of 6: Principles of Business Intelligence and the DataOps Philosophy                                                                                                                                                                            0.1739518863
    ## B - 2. Concept 3 of 6: Linear Algorithms for Predictive Analytics                                                                                                                                                                                                0.1455025135
    ## C - 2. Quizzes at the end of each concept                                                                                                                                                                                                                        0.2087092459
    ## C - 3. Lab manuals that outline the steps to follow during the labs                                                                                                                                                                                              0.1981856895
    ## C - 4. Required lab work submissions at the end of each lab manual that outline the activity to be done on your own                                                                                                                                              0.2031505046
    ## C - 5. Supplementary videos to watch                                                                                                                                                                                                                             0.1544100663
    ## C - 6. Supplementary podcasts to listen to                                                                                                                                                                                                                       0.1288831799
    ## C - 7. Supplementary content to read                                                                                                                                                                                                                             0.1528671672
    ## C - 8. Lectures slides                                                                                                                                                                                                                                           0.1989882229
    ## C - 9. Lecture notes on some of the lecture slides                                                                                                                                                                                                               0.1907689470
    ## C - 10. The quality of the lectures given (quality measured by the breadth (the full span of knowledge of a subject) and depth (the extent to which specific topics are focused upon, amplified, and explored) of learning - NOT quality measured by how fun/co  0.1870295615
    ## C - 11. The division of theory and practice such that most of the theory is done during the recorded online classes and most of the practice is done during the physical classes                                                                                 0.1858064574
    ## C - 12. The recordings of online classes                                                                                                                                                                                                                         0.1534043936
    ## Average Course Evaluation Rating                                                                                                                                                                                                                                 0.2310283001
    ## Average Level of Learning Attained Rating                                                                                                                                                                                                                        0.1794900107
    ## Average_Rating                                                                                                                                                                                                                                                   0.2279500025
    ## Project: Section 1-4: (20%) x/10                                                                                                                                                                                                                                -0.0104894763
    ## Project: Section 5-11: (50%) x/10                                                                                                                                                                                                                               -0.0140944679
    ## Project: Section 12: (30%) x/5                                                                                                                                                                                                                                  -0.0290403831
    ## Project: (10%): x/30 x 100 TOTAL                                                                                                                                                                                                                                -0.0224399096
    ## Quiz 1 on Concept 1 (Introduction) x/32                                                                                                                                                                                                                          0.0311487060
    ## Quiz 3 on Concept 3 (Linear) x/15                                                                                                                                                                                                                                0.0738758544
    ## Quiz 4 on Concept 4 (Non-Linear) x/22                                                                                                                                                                                                                            0.0421661405
    ## Quiz 5 on Concept 5 (Dashboarding) x/10                                                                                                                                                                                                                         -0.0343727556
    ## Quizzes                                                                                                                                                                                                                                                          0.0445578647
    ## Lab 1 - 2.c. - (Simple Linear Regression) x/5                                                                                                                                                                                                                    0.0438657093
    ## Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5                                                                                                                                                                                                  0.0551964961
    ## Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5                                                                                                                                                                                                               -0.0209520023
    ## Lab 5 - Chart JS Dashboard Setup x/5                                                                                                                                                                                                                             0.0007547579
    ## LabWork                                                                                                                                                                                                                                                          0.0175934391
    ## CAT1                                                                                                                                                                                                                                                             0.0304529637
    ## CAT2                                                                                                                                                                                                                                                            -0.0092591894
    ## Absenteeism Percentage                                                                                                                                                                                                                                           0.0259752532
    ## Coursework                                                                                                                                                                                                                                                       0.0084849176
    ## EXAM                                                                                                                                                                                                                                                             0.0159031941
    ## TOTAL                                                                                                                                                                                                                                                            0.0163851152
    ##                                                                                                                                                                                                                                                                        Comp.2
    ## YOB                                                                                                                                                                                                                                                              0.0761766926
    ## motivator                                                                                                                                                                                                                                                        0.0500929593
    ## read_content_before_lecture                                                                                                                                                                                                                                     -0.0078703470
    ## anticipate_test_questions                                                                                                                                                                                                                                        0.0735682621
    ## answer_rhetorical_questions                                                                                                                                                                                                                                      0.0042563790
    ## find_terms_I_do_not_know                                                                                                                                                                                                                                         0.0367996642
    ## copy_new_terms_in_reading_notebook                                                                                                                                                                                                                               0.0585412903
    ## take_quizzes_and_use_results                                                                                                                                                                                                                                     0.1194833684
    ## reorganise_course_outline                                                                                                                                                                                                                                       -0.0241418750
    ## write_down_important_points                                                                                                                                                                                                                                      0.0572743079
    ## space_out_revision                                                                                                                                                                                                                                               0.0151104596
    ## studying_in_study_group                                                                                                                                                                                                                                         -0.0624395903
    ## schedule_appointments                                                                                                                                                                                                                                           -0.0175905117
    ## goal_oriented                                                                                                                                                                                                                                                   -0.0876436183
    ## spaced_repetition                                                                                                                                                                                                                                                0.0029329235
    ## testing_and_active_recall                                                                                                                                                                                                                                        0.0264367538
    ## interleaving                                                                                                                                                                                                                                                     0.0120247525
    ## categorizing                                                                                                                                                                                                                                                    -0.0324186943
    ## retrospective_timetable                                                                                                                                                                                                                                          0.0190147428
    ## cornell_notes                                                                                                                                                                                                                                                   -0.0390514533
    ## sq3r                                                                                                                                                                                                                                                            -0.0748501577
    ## commute                                                                                                                                                                                                                                                         -0.1174138225
    ## study_time                                                                                                                                                                                                                                                       0.0032616285
    ## repeats_since_Y1                                                                                                                                                                                                                                                -0.2398206218
    ## paid_tuition                                                                                                                                                                                                                                                    -0.0699779616
    ## free_tuition                                                                                                                                                                                                                                                    -0.0317800999
    ## extra_curricular                                                                                                                                                                                                                                                -0.1028754352
    ## sports_extra_curricular                                                                                                                                                                                                                                         -0.1412524521
    ## exercise_per_week                                                                                                                                                                                                                                               -0.0979869025
    ## meditate                                                                                                                                                                                                                                                        -0.0703620518
    ## pray                                                                                                                                                                                                                                                             0.0729742384
    ## internet                                                                                                                                                                                                                                                        -0.0319502828
    ## family_relationships                                                                                                                                                                                                                                            -0.0559166365
    ## friendships                                                                                                                                                                                                                                                     -0.1071177392
    ## romantic_relationships                                                                                                                                                                                                                                          -0.0608773917
    ## spiritual_wellnes                                                                                                                                                                                                                                               -0.0413967009
    ## financial_wellness                                                                                                                                                                                                                                               0.0162341854
    ## health                                                                                                                                                                                                                                                          -0.0556631051
    ## day_out                                                                                                                                                                                                                                                         -0.0582582735
    ## night_out                                                                                                                                                                                                                                                       -0.0899682245
    ## alcohol_or_narcotics                                                                                                                                                                                                                                            -0.0769773363
    ## mentor                                                                                                                                                                                                                                                          -0.0413850545
    ## mentor_meetings                                                                                                                                                                                                                                                 -0.0528822246
    ## A1                                                                                                                                                                                                                                                              -0.0210284636
    ## A - 2. Classes start and end on time                                                                                                                                                                                                                            -0.0342061202
    ## A - 3. The learning environment is participative, involves learning by doing and is group-based                                                                                                                                                                 -0.0611455289
    ## A - 4. The subject content is delivered according to the course outline and meets my expectations                                                                                                                                                               -0.0271367516
    ## A - 5. The topics are clear and logically developed                                                                                                                                                                                                              0.0300111698
    ## A - 6. I am developing my oral and writing skills                                                                                                                                                                                                               -0.1077982212
    ## A - 7. I am developing my reflective and critical reasoning skills                                                                                                                                                                                              -0.0737756498
    ## A - 8. The assessment methods are assisting me to learn                                                                                                                                                                                                         -0.0182287747
    ## A - 9. I receive relevant feedback                                                                                                                                                                                                                              -0.0233286127
    ## A - 10. I read the recommended readings and notes                                                                                                                                                                                                                0.0333459439
    ## A - 11. I use the eLearning material posted                                                                                                                                                                                                                     -0.0229667055
    ## B - 1. Concept 1 of 6: Principles of Business Intelligence and the DataOps Philosophy                                                                                                                                                                            0.0564341525
    ## B - 2. Concept 3 of 6: Linear Algorithms for Predictive Analytics                                                                                                                                                                                               -0.0251834713
    ## C - 2. Quizzes at the end of each concept                                                                                                                                                                                                                       -0.0023337884
    ## C - 3. Lab manuals that outline the steps to follow during the labs                                                                                                                                                                                              0.0006159254
    ## C - 4. Required lab work submissions at the end of each lab manual that outline the activity to be done on your own                                                                                                                                             -0.0038501673
    ## C - 5. Supplementary videos to watch                                                                                                                                                                                                                            -0.0988535315
    ## C - 6. Supplementary podcasts to listen to                                                                                                                                                                                                                      -0.0948060201
    ## C - 7. Supplementary content to read                                                                                                                                                                                                                            -0.0918221106
    ## C - 8. Lectures slides                                                                                                                                                                                                                                           0.0401405464
    ## C - 9. Lecture notes on some of the lecture slides                                                                                                                                                                                                               0.0091855540
    ## C - 10. The quality of the lectures given (quality measured by the breadth (the full span of knowledge of a subject) and depth (the extent to which specific topics are focused upon, amplified, and explored) of learning - NOT quality measured by how fun/co -0.0050678290
    ## C - 11. The division of theory and practice such that most of the theory is done during the recorded online classes and most of the practice is done during the physical classes                                                                                 0.0028554083
    ## C - 12. The recordings of online classes                                                                                                                                                                                                                        -0.0267059384
    ## Average Course Evaluation Rating                                                                                                                                                                                                                                -0.0404670479
    ## Average Level of Learning Attained Rating                                                                                                                                                                                                                        0.0161827394
    ## Average_Rating                                                                                                                                                                                                                                                  -0.0385099039
    ## Project: Section 1-4: (20%) x/10                                                                                                                                                                                                                                 0.1504447410
    ## Project: Section 5-11: (50%) x/10                                                                                                                                                                                                                                0.1704852286
    ## Project: Section 12: (30%) x/5                                                                                                                                                                                                                                   0.1574582668
    ## Project: (10%): x/30 x 100 TOTAL                                                                                                                                                                                                                                 0.2127818725
    ## Quiz 1 on Concept 1 (Introduction) x/32                                                                                                                                                                                                                          0.1346581453
    ## Quiz 3 on Concept 3 (Linear) x/15                                                                                                                                                                                                                                0.1732361749
    ## Quiz 4 on Concept 4 (Non-Linear) x/22                                                                                                                                                                                                                            0.2348457476
    ## Quiz 5 on Concept 5 (Dashboarding) x/10                                                                                                                                                                                                                          0.1439990116
    ## Quizzes                                                                                                                                                                                                                                                          0.2411242459
    ## Lab 1 - 2.c. - (Simple Linear Regression) x/5                                                                                                                                                                                                                    0.0946235422
    ## Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5                                                                                                                                                                                                  0.0986567613
    ## Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5                                                                                                                                                                                                                0.1639883417
    ## Lab 5 - Chart JS Dashboard Setup x/5                                                                                                                                                                                                                             0.1519347324
    ## LabWork                                                                                                                                                                                                                                                          0.2303023018
    ## CAT1                                                                                                                                                                                                                                                             0.2118565153
    ## CAT2                                                                                                                                                                                                                                                             0.1960697654
    ## Absenteeism Percentage                                                                                                                                                                                                                                           0.0121349768
    ## Coursework                                                                                                                                                                                                                                                       0.3074620574
    ## EXAM                                                                                                                                                                                                                                                             0.1748251187
    ## TOTAL                                                                                                                                                                                                                                                            0.2648969377

``` r
factoextra::fviz_cos2(StudentPerformanceDataset_pca_fe, choice = "var", axes = 1:2)
```

![](Lab-Submission-Markdown_files/figure-gfm/Performing%20PCA%20Linear%20Algebra%20Transform%20for%20Feature%20Extraction%20and%20visualizing-2.png)<!-- -->

``` r
factoextra::fviz_pca_var(StudentPerformanceDataset_pca_fe, col.var = "cos2",
                         gradient.cols = c("purple", "red", "yellow"),
                         repel = TRUE)
```

![](Lab-Submission-Markdown_files/figure-gfm/Performing%20PCA%20Linear%20Algebra%20Transform%20for%20Feature%20Extraction%20and%20visualizing-3.png)<!-- -->

``` r
if (!is.element("fastICA", installed.packages()[, 1])) {
  install.packages("fastICA", dependencies = TRUE)
}
require("fastICA")
```

    ## Loading required package: fastICA

``` r
summary(StudentPerformanceDataset)
```

    ##      gender            YOB         motivator      read_content_before_lecture
    ##  Min.   :0.0000   Min.   :1998   Min.   :0.0000   Min.   :1.000              
    ##  1st Qu.:0.0000   1st Qu.:2000   1st Qu.:1.0000   1st Qu.:2.000              
    ##  Median :1.0000   Median :2001   Median :1.0000   Median :3.000              
    ##  Mean   :0.5743   Mean   :2001   Mean   :0.7525   Mean   :2.752              
    ##  3rd Qu.:1.0000   3rd Qu.:2002   3rd Qu.:1.0000   3rd Qu.:3.000              
    ##  Max.   :1.0000   Max.   :2003   Max.   :1.0000   Max.   :5.000              
    ##  anticipate_test_questions answer_rhetorical_questions find_terms_I_do_not_know
    ##  Min.   :1.000             Min.   :1.000               Min.   :1.000           
    ##  1st Qu.:3.000             1st Qu.:3.000               1st Qu.:3.000           
    ##  Median :4.000             Median :4.000               Median :4.000           
    ##  Mean   :3.584             Mean   :3.426               Mean   :3.743           
    ##  3rd Qu.:4.000             3rd Qu.:4.000               3rd Qu.:5.000           
    ##  Max.   :5.000             Max.   :5.000               Max.   :5.000           
    ##  copy_new_terms_in_reading_notebook take_quizzes_and_use_results
    ##  Min.   :1.000                      Min.   :1.000               
    ##  1st Qu.:3.000                      1st Qu.:3.000               
    ##  Median :4.000                      Median :4.000               
    ##  Mean   :3.663                      Mean   :3.941               
    ##  3rd Qu.:4.000                      3rd Qu.:5.000               
    ##  Max.   :5.000                      Max.   :5.000               
    ##  reorganise_course_outline write_down_important_points space_out_revision
    ##  Min.   :1.000             Min.   :1.000               Min.   :1.000     
    ##  1st Qu.:3.000             1st Qu.:3.000               1st Qu.:3.000     
    ##  Median :3.000             Median :4.000               Median :3.000     
    ##  Mean   :3.376             Mean   :3.832               Mean   :3.228     
    ##  3rd Qu.:4.000             3rd Qu.:5.000               3rd Qu.:4.000     
    ##  Max.   :5.000             Max.   :5.000               Max.   :5.000     
    ##  studying_in_study_group schedule_appointments goal_oriented  
    ##  Min.   :1.000           Min.   :1.000         Min.   :0.000  
    ##  1st Qu.:1.000           1st Qu.:1.000         1st Qu.:0.000  
    ##  Median :2.000           Median :2.000         Median :0.000  
    ##  Mean   :2.455           Mean   :1.931         Mean   :0.198  
    ##  3rd Qu.:3.000           3rd Qu.:2.000         3rd Qu.:0.000  
    ##  Max.   :5.000           Max.   :5.000         Max.   :1.000  
    ##  spaced_repetition testing_and_active_recall  interleaving    categorizing  
    ##  Min.   :1.000     Min.   :1.000             Min.   :1.000   Min.   :1.000  
    ##  1st Qu.:2.000     1st Qu.:3.000             1st Qu.:2.000   1st Qu.:2.000  
    ##  Median :3.000     Median :3.000             Median :2.000   Median :3.000  
    ##  Mean   :2.554     Mean   :3.059             Mean   :2.257   Mean   :2.713  
    ##  3rd Qu.:3.000     3rd Qu.:4.000             3rd Qu.:3.000   3rd Qu.:3.000  
    ##  Max.   :4.000     Max.   :4.000             Max.   :4.000   Max.   :4.000  
    ##  retrospective_timetable cornell_notes        sq3r          commute     
    ##  Min.   :1.000           Min.   :1.000   Min.   :1.000   Min.   :0.000  
    ##  1st Qu.:2.000           1st Qu.:2.000   1st Qu.:2.000   1st Qu.:2.000  
    ##  Median :2.000           Median :3.000   Median :3.000   Median :3.000  
    ##  Mean   :2.406           Mean   :2.545   Mean   :2.614   Mean   :2.703  
    ##  3rd Qu.:3.000           3rd Qu.:3.000   3rd Qu.:3.000   3rd Qu.:4.000  
    ##  Max.   :4.000           Max.   :4.000   Max.   :4.000   Max.   :4.000  
    ##    study_time    repeats_since_Y1  paid_tuition     free_tuition   
    ##  Min.   :0.000   Min.   : 0.00    Min.   :0.0000   Min.   :0.0000  
    ##  1st Qu.:1.000   1st Qu.: 0.00    1st Qu.:0.0000   1st Qu.:0.0000  
    ##  Median :2.000   Median : 2.00    Median :0.0000   Median :0.0000  
    ##  Mean   :1.733   Mean   : 2.03    Mean   :0.1089   Mean   :0.2673  
    ##  3rd Qu.:2.000   3rd Qu.: 3.00    3rd Qu.:0.0000   3rd Qu.:1.0000  
    ##  Max.   :4.000   Max.   :10.00    Max.   :1.0000   Max.   :1.0000  
    ##  extra_curricular sports_extra_curricular exercise_per_week    meditate     
    ##  Min.   :0.0000   Min.   :0.0000          Min.   :0.000     Min.   :0.0000  
    ##  1st Qu.:0.0000   1st Qu.:0.0000          1st Qu.:1.000     1st Qu.:0.0000  
    ##  Median :1.0000   Median :0.0000          Median :1.000     Median :1.0000  
    ##  Mean   :0.5248   Mean   :0.3564          Mean   :1.089     Mean   :0.7525  
    ##  3rd Qu.:1.0000   3rd Qu.:1.0000          3rd Qu.:2.000     3rd Qu.:1.0000  
    ##  Max.   :1.0000   Max.   :1.0000          Max.   :3.000     Max.   :3.0000  
    ##       pray          internet      family_relationships  friendships  
    ##  Min.   :0.000   Min.   :0.0000   Min.   :0.000        Min.   :0.00  
    ##  1st Qu.:1.000   1st Qu.:1.0000   1st Qu.:4.000        1st Qu.:4.00  
    ##  Median :2.000   Median :1.0000   Median :4.000        Median :4.00  
    ##  Mean   :2.069   Mean   :0.8614   Mean   :4.149        Mean   :3.97  
    ##  3rd Qu.:3.000   3rd Qu.:1.0000   3rd Qu.:5.000        3rd Qu.:4.00  
    ##  Max.   :3.000   Max.   :1.0000   Max.   :5.000        Max.   :5.00  
    ##  romantic_relationships spiritual_wellnes financial_wellness     health 
    ##  Min.   :0.000          Min.   :0.000     Min.   :0          Min.   :0  
    ##  1st Qu.:0.000          1st Qu.:3.000     1st Qu.:2          1st Qu.:3  
    ##  Median :0.000          Median :4.000     Median :3          Median :4  
    ##  Mean   :1.356          Mean   :3.614     Mean   :3          Mean   :4  
    ##  3rd Qu.:3.000          3rd Qu.:4.000     3rd Qu.:4          3rd Qu.:5  
    ##  Max.   :4.000          Max.   :5.000     Max.   :5          Max.   :5  
    ##     day_out         night_out     alcohol_or_narcotics     mentor      
    ##  Min.   :0.0000   Min.   :0.000   Min.   :0.0000       Min.   :0.0000  
    ##  1st Qu.:0.0000   1st Qu.:0.000   1st Qu.:0.0000       1st Qu.:0.0000  
    ##  Median :1.0000   Median :0.000   Median :0.0000       Median :0.0000  
    ##  Mean   :0.7921   Mean   :0.505   Mean   :0.3465       Mean   :0.4059  
    ##  3rd Qu.:1.0000   3rd Qu.:1.000   3rd Qu.:1.0000       3rd Qu.:1.0000  
    ##  Max.   :3.0000   Max.   :3.000   Max.   :3.0000       Max.   :1.0000  
    ##  mentor_meetings        A1        A - 2. Classes start and end on time
    ##  Min.   :0.0000   Min.   :0.000   Min.   :0.000                       
    ##  1st Qu.:0.0000   1st Qu.:4.000   1st Qu.:4.000                       
    ##  Median :0.0000   Median :5.000   Median :5.000                       
    ##  Mean   :0.6733   Mean   :4.446   Mean   :4.634                       
    ##  3rd Qu.:1.0000   3rd Qu.:5.000   3rd Qu.:5.000                       
    ##  Max.   :3.0000   Max.   :5.000   Max.   :5.000                       
    ##  A - 3. The learning environment is participative, involves learning by doing and is group-based
    ##  Min.   :0.000                                                                                  
    ##  1st Qu.:4.000                                                                                  
    ##  Median :4.000                                                                                  
    ##  Mean   :4.307                                                                                  
    ##  3rd Qu.:5.000                                                                                  
    ##  Max.   :5.000                                                                                  
    ##  A - 4. The subject content is delivered according to the course outline and meets my expectations
    ##  Min.   :0.000                                                                                    
    ##  1st Qu.:4.000                                                                                    
    ##  Median :5.000                                                                                    
    ##  Mean   :4.693                                                                                    
    ##  3rd Qu.:5.000                                                                                    
    ##  Max.   :5.000                                                                                    
    ##  A - 5. The topics are clear and logically developed
    ##  Min.   :0.000                                      
    ##  1st Qu.:4.000                                      
    ##  Median :5.000                                      
    ##  Mean   :4.604                                      
    ##  3rd Qu.:5.000                                      
    ##  Max.   :5.000                                      
    ##  A - 6. I am developing my oral and writing skills
    ##  Min.   :0.000                                    
    ##  1st Qu.:4.000                                    
    ##  Median :4.000                                    
    ##  Mean   :4.069                                    
    ##  3rd Qu.:5.000                                    
    ##  Max.   :5.000                                    
    ##  A - 7. I am developing my reflective and critical reasoning skills
    ##  Min.   :0.000                                                     
    ##  1st Qu.:4.000                                                     
    ##  Median :4.000                                                     
    ##  Mean   :4.337                                                     
    ##  3rd Qu.:5.000                                                     
    ##  Max.   :5.000                                                     
    ##  A - 8. The assessment methods are assisting me to learn
    ##  Min.   :0.000                                          
    ##  1st Qu.:4.000                                          
    ##  Median :5.000                                          
    ##  Mean   :4.564                                          
    ##  3rd Qu.:5.000                                          
    ##  Max.   :5.000                                          
    ##  A - 9. I receive relevant feedback
    ##  Min.   :0.000                     
    ##  1st Qu.:4.000                     
    ##  Median :5.000                     
    ##  Mean   :4.535                     
    ##  3rd Qu.:5.000                     
    ##  Max.   :5.000                     
    ##  A - 10. I read the recommended readings and notes
    ##  Min.   :0.000                                    
    ##  1st Qu.:4.000                                    
    ##  Median :5.000                                    
    ##  Mean   :4.505                                    
    ##  3rd Qu.:5.000                                    
    ##  Max.   :5.000                                    
    ##  A - 11. I use the eLearning material posted
    ##  Min.   :0.000                              
    ##  1st Qu.:4.000                              
    ##  Median :5.000                              
    ##  Mean   :4.653                              
    ##  3rd Qu.:5.000                              
    ##  Max.   :5.000                              
    ##  B - 1. Concept 1 of 6: Principles of Business Intelligence and the DataOps Philosophy
    ##  Min.   :0.000                                                                        
    ##  1st Qu.:4.000                                                                        
    ##  Median :4.000                                                                        
    ##  Mean   :4.208                                                                        
    ##  3rd Qu.:5.000                                                                        
    ##  Max.   :5.000                                                                        
    ##  B - 2. Concept 3 of 6: Linear Algorithms for Predictive Analytics
    ##  Min.   :0.000                                                    
    ##  1st Qu.:3.000                                                    
    ##  Median :4.000                                                    
    ##  Mean   :3.901                                                    
    ##  3rd Qu.:5.000                                                    
    ##  Max.   :5.000                                                    
    ##  C - 2. Quizzes at the end of each concept
    ##  Min.   :0.000                            
    ##  1st Qu.:4.000                            
    ##  Median :5.000                            
    ##  Mean   :4.545                            
    ##  3rd Qu.:5.000                            
    ##  Max.   :5.000                            
    ##  C - 3. Lab manuals that outline the steps to follow during the labs
    ##  Min.   :0.000                                                      
    ##  1st Qu.:4.000                                                      
    ##  Median :5.000                                                      
    ##  Mean   :4.564                                                      
    ##  3rd Qu.:5.000                                                      
    ##  Max.   :5.000                                                      
    ##  C - 4. Required lab work submissions at the end of each lab manual that outline the activity to be done on your own
    ##  Min.   :0.000                                                                                                      
    ##  1st Qu.:4.000                                                                                                      
    ##  Median :5.000                                                                                                      
    ##  Mean   :4.505                                                                                                      
    ##  3rd Qu.:5.000                                                                                                      
    ##  Max.   :5.000                                                                                                      
    ##  C - 5. Supplementary videos to watch
    ##  Min.   :0.000                       
    ##  1st Qu.:4.000                       
    ##  Median :4.000                       
    ##  Mean   :4.149                       
    ##  3rd Qu.:5.000                       
    ##  Max.   :5.000                       
    ##  C - 6. Supplementary podcasts to listen to
    ##  Min.   :0.00                              
    ##  1st Qu.:4.00                              
    ##  Median :4.00                              
    ##  Mean   :4.04                              
    ##  3rd Qu.:5.00                              
    ##  Max.   :5.00                              
    ##  C - 7. Supplementary content to read C - 8. Lectures slides
    ##  Min.   :0.000                        Min.   :0.000         
    ##  1st Qu.:4.000                        1st Qu.:4.000         
    ##  Median :4.000                        Median :5.000         
    ##  Mean   :4.129                        Mean   :4.554         
    ##  3rd Qu.:5.000                        3rd Qu.:5.000         
    ##  Max.   :5.000                        Max.   :5.000         
    ##  C - 9. Lecture notes on some of the lecture slides
    ##  Min.   :0.000                                     
    ##  1st Qu.:4.000                                     
    ##  Median :5.000                                     
    ##  Mean   :4.554                                     
    ##  3rd Qu.:5.000                                     
    ##  Max.   :5.000                                     
    ##  C - 10. The quality of the lectures given (quality measured by the breadth (the full span of knowledge of a subject) and depth (the extent to which specific topics are focused upon, amplified, and explored) of learning - NOT quality measured by how fun/co
    ##  Min.   :0.000                                                                                                                                                                                                                                                  
    ##  1st Qu.:4.000                                                                                                                                                                                                                                                  
    ##  Median :5.000                                                                                                                                                                                                                                                  
    ##  Mean   :4.495                                                                                                                                                                                                                                                  
    ##  3rd Qu.:5.000                                                                                                                                                                                                                                                  
    ##  Max.   :5.000                                                                                                                                                                                                                                                  
    ##  C - 11. The division of theory and practice such that most of the theory is done during the recorded online classes and most of the practice is done during the physical classes
    ##  Min.   :0.000                                                                                                                                                                   
    ##  1st Qu.:4.000                                                                                                                                                                   
    ##  Median :5.000                                                                                                                                                                   
    ##  Mean   :4.446                                                                                                                                                                   
    ##  3rd Qu.:5.000                                                                                                                                                                   
    ##  Max.   :5.000                                                                                                                                                                   
    ##  C - 12. The recordings of online classes Average Course Evaluation Rating
    ##  Min.   :0.000                            Min.   :0.000                   
    ##  1st Qu.:4.000                            1st Qu.:4.273                   
    ##  Median :5.000                            Median :4.545                   
    ##  Mean   :4.287                            Mean   :4.486                   
    ##  3rd Qu.:5.000                            3rd Qu.:4.909                   
    ##  Max.   :5.000                            Max.   :5.000                   
    ##  Average Level of Learning Attained Rating Average_Rating 
    ##  Min.   :0.000                             Min.   :0.000  
    ##  1st Qu.:3.500                             1st Qu.:4.000  
    ##  Median :4.000                             Median :4.545  
    ##  Mean   :4.054                             Mean   :4.388  
    ##  3rd Qu.:4.500                             3rd Qu.:4.909  
    ##  Max.   :5.000                             Max.   :5.000  
    ##  Project: Section 1-4: (20%) x/10 Project: Section 5-11: (50%) x/10
    ##  Min.   : 0.000                   Min.   : 0.000                   
    ##  1st Qu.: 7.400                   1st Qu.: 6.000                   
    ##  Median : 8.500                   Median : 7.800                   
    ##  Mean   : 8.011                   Mean   : 6.582                   
    ##  3rd Qu.: 9.000                   3rd Qu.: 8.300                   
    ##  Max.   :10.000                   Max.   :10.000                   
    ##  Project: Section 12: (30%) x/5 Project: (10%): x/30 x 100 TOTAL
    ##  Min.   :0.000                  Min.   :  0.00                  
    ##  1st Qu.:0.000                  1st Qu.: 56.00                  
    ##  Median :0.000                  Median : 66.40                  
    ##  Mean   :1.005                  Mean   : 62.39                  
    ##  3rd Qu.:1.000                  3rd Qu.: 71.60                  
    ##  Max.   :5.000                  Max.   :100.00                  
    ##  Quiz 1 on Concept 1 (Introduction) x/32 Quiz 3 on Concept 3 (Linear) x/15
    ##  Min.   : 4.75                           Min.   : 0.000                   
    ##  1st Qu.:11.53                           1st Qu.: 7.000                   
    ##  Median :15.33                           Median : 9.000                   
    ##  Mean   :16.36                           Mean   : 9.342                   
    ##  3rd Qu.:19.63                           3rd Qu.:12.000                   
    ##  Max.   :31.25                           Max.   :15.000                   
    ##  Quiz 4 on Concept 4 (Non-Linear) x/22 Quiz 5 on Concept 5 (Dashboarding) x/10
    ##  Min.   : 0.00                         Min.   : 0.000                         
    ##  1st Qu.:10.17                         1st Qu.: 4.330                         
    ##  Median :13.08                         Median : 6.000                         
    ##  Mean   :13.11                         Mean   : 5.611                         
    ##  3rd Qu.:17.50                         3rd Qu.: 7.670                         
    ##  Max.   :22.00                         Max.   :12.670                         
    ##     Quizzes      Lab 1 - 2.c. - (Simple Linear Regression) x/5
    ##  Min.   :26.26   Min.   :0.000                                
    ##  1st Qu.:43.82   1st Qu.:5.000                                
    ##  Median :55.31   Median :5.000                                
    ##  Mean   :56.22   Mean   :4.752                                
    ##  3rd Qu.:65.16   3rd Qu.:5.000                                
    ##  Max.   :95.25   Max.   :5.000                                
    ##  Lab 3 - 2.g. - (Logistic Regression using Gradient Descent) x/5
    ##  Min.   :0.000                                                  
    ##  1st Qu.:4.850                                                  
    ##  Median :4.850                                                  
    ##  Mean   :4.218                                                  
    ##  3rd Qu.:4.850                                                  
    ##  Max.   :5.000                                                  
    ##  Lab 4 - 2.h. - (Linear Discriminant Analysis) x/5
    ##  Min.   :0.000                                    
    ##  1st Qu.:2.850                                    
    ##  Median :4.850                                    
    ##  Mean   :3.636                                    
    ##  3rd Qu.:5.000                                    
    ##  Max.   :5.000                                    
    ##  Lab 5 - Chart JS Dashboard Setup x/5    LabWork            CAT1      
    ##  Min.   :0.000                        Min.   : 17.80   Min.   : 0.00  
    ##  1st Qu.:0.000                        1st Qu.: 70.80   1st Qu.:57.89  
    ##  Median :5.000                        Median : 80.00   Median :68.42  
    ##  Mean   :3.404                        Mean   : 79.72   Mean   :66.65  
    ##  3rd Qu.:5.000                        3rd Qu.: 97.20   3rd Qu.:82.89  
    ##  Max.   :5.000                        Max.   :100.00   Max.   :97.36  
    ##       CAT2        Absenteeism Percentage   Coursework         EXAM      
    ##  Min.   :  0.00   Min.   : 0.00          Min.   : 7.47   Min.   : 0.00  
    ##  1st Qu.:  0.00   1st Qu.: 7.41          1st Qu.:20.44   1st Qu.:25.00  
    ##  Median : 52.00   Median :14.81          Median :24.58   Median :33.00  
    ##  Mean   : 43.06   Mean   :15.42          Mean   :24.53   Mean   :32.59  
    ##  3rd Qu.: 68.00   3rd Qu.:22.22          3rd Qu.:29.31   3rd Qu.:42.00  
    ##  Max.   :100.00   Max.   :51.85          Max.   :35.08   Max.   :56.00  
    ##      TOTAL      
    ##  Min.   : 7.47  
    ##  1st Qu.:45.54  
    ##  Median :58.69  
    ##  Mean   :57.12  
    ##  3rd Qu.:68.83  
    ##  Max.   :87.72

``` r
model_of_the_transform <- preProcess(StudentPerformanceDataset,
                                     method = c("scale", "center", "ica"),
                                     n.comp = 8)
print(model_of_the_transform)
```

    ## Created from 101 samples and 91 variables
    ## 
    ## Pre-processing:
    ##   - centered (91)
    ##   - independent component signal extraction (91)
    ##   - ignored (0)
    ##   - scaled (91)
    ## 
    ## ICA used 8 components

``` r
StudentPerformanceDataset_ica_dr <- predict(model_of_the_transform, StudentPerformanceDataset)

summary(StudentPerformanceDataset_ica_dr)
```

    ##       ICA1               ICA2               ICA3               ICA4         
    ##  Min.   :-2.47532   Min.   :-5.45618   Min.   :-2.13659   Min.   :-2.42550  
    ##  1st Qu.:-0.59981   1st Qu.:-0.42174   1st Qu.:-0.64208   1st Qu.:-0.69609  
    ##  Median :-0.03782   Median : 0.05601   Median : 0.01155   Median : 0.04678  
    ##  Mean   : 0.00000   Mean   : 0.00000   Mean   : 0.00000   Mean   : 0.00000  
    ##  3rd Qu.: 0.61363   3rd Qu.: 0.52578   3rd Qu.: 0.64668   3rd Qu.: 0.86318  
    ##  Max.   : 3.17185   Max.   : 2.17535   Max.   : 2.31215   Max.   : 2.17556  
    ##       ICA5              ICA6               ICA7              ICA8         
    ##  Min.   :-2.4521   Min.   :-3.83439   Min.   :-1.1475   Min.   :-3.29954  
    ##  1st Qu.:-0.7566   1st Qu.:-0.50825   1st Qu.:-0.4493   1st Qu.:-0.61429  
    ##  Median : 0.2130   Median : 0.01711   Median :-0.1705   Median :-0.02121  
    ##  Mean   : 0.0000   Mean   : 0.00000   Mean   : 0.0000   Mean   : 0.00000  
    ##  3rd Qu.: 0.7029   3rd Qu.: 0.49478   3rd Qu.: 0.2485   3rd Qu.: 0.62660  
    ##  Max.   : 2.2439   Max.   : 2.85262   Max.   : 8.1193   Max.   : 3.20346
