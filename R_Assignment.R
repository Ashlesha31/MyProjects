View(Data_Test)
Data_test<-read.csv("C://Users//HP//Downloads//Data Testcsv.csv")
install.packages(dplyr)
install.packages(tidyverse)

#Dataframe for Endline Scores
df1<-Data_test[, c(11,12,13,14,15,16,17,18,19,20,21)]
df1

#Dataframe for Baseline Scores
df2<-Data_test[, c(25,26,27,28,29,30,31,32,33,34,35)]
df2

library(dplyr)

#Combining Dataframe1 and dataframe2
combined_data <- bind_rows(df1,df2)
View(combined_data2)

#Merge into single Dataframe
Merged_cols<-data.frame(Q1 = df1$Q1.Score + df2$Q1.Score,
                        Q2 = df1$Q2.Score + df2$Q2.Score,
                        Q3 = df1$Q3.Score + df2$Q3.Score,
                        Q4 = df1$Q4.Score + df2$Q4.Score,
                        Q5 = df1$Q5.Score + df2$Q5.Score,
                        Q6 = df1$Q6.Score + df2$Q6.Score,
                        Q7 = df1$Q7.Score + df2$Q7.Score,
                        Q8a= df1$Q8.a.Score + df2$Q8.a.Score,
                        Q8b= df1$Q8.b.Score + df2$Q8.b.Score,
                        Q9 = df1$Q9.Score + df2$Q9.Score,
                        Q10= df1$Q10.Score + df2$Q10.Score)

#Dataframe for other fields
df3<-Data_Test[,c(1,2,3,4,5,6,7,8)]
df3

#Consolidated data
consolidated_data<-cbind(df3,Merged_cols)
View(consolidated_data)

library(foreign)

#Saving file as .dat
write.dta(consolidated_data,"C://Users//HP//Downloads//Consolidated_data.dta")

#Grouping data according to districts
grouped_df<-consolidated_data %>% group_by(`District Name`)

#Calculating Mean marks
Mean_Marks<-data.frame(AvgMarks = Q1$consolidated_data + Q2$consolidated_data +
                         Q3$consolidated_data + Q4$consolidated_data + Q5$consolidated_data
                       + Q6$consolidated_data + Q7$consolidated_data + Q8a$consolidated_data 
                       + Q8b$consolidated_data + Q9$consolidated_data + Q10$consolidated_data)

#Grouping according to gender
df_M <- consolidated_data %>% group_by(Gender) %>% summarize(count=(n))                 

library(utils)                   

#District wise Statistics
DistrictWiseStats<-grouped_df %>% summarize(No_of_Males = count.fields(Male), No_of_Females = count.fields(Female),
                                            Average_marks = mean(Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8a,Q8b,Q9,Q10))


