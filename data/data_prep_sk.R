## reading raw data from school year 2016 to 2019
## source:  https://www2.ed.gov/about/inits/ed/edfacts/data-files/index.html

# Long format
math20_21 <- read.csv("~/Desktop/STATGR-5702/final_project_local/math-achievement-lea-sy2020-21.csv")
rla20_21 <- read.csv("~/Desktop/STATGR-5702/final_project_local//rla-achievement-lea-sy2020-21.csv")

# wide format
math18_19 <- read.csv("~/Desktop/STATGR-5702/final_project_local//math-achievement-lea-sy2018-19-wide.csv")
rla18_19 <- read.csv("~/Desktop/STATGR-5702/final_project_local//rla-achievement-lea-sy2018-19-wide.csv")
math17_18 <- read.csv("~/Desktop/STATGR-5702/final_project_local//math-achievement-lea-sy2017-18.csv")
rla17_18 <- read.csv("~/Desktop/STATGR-5702/final_project_local//rla-achievement-lea-sy2017-18.csv")
math16_17 <- read.csv("~/Desktop/STATGR-5702/final_project_local//math-achievement-lea-sy2016-17.csv")
rla16_17 <- read.csv("~/Desktop/STATGR-5702/final_project_local//rla-achievement-lea-sy2016-17.csv")
math15_16 <- read.csv("~/Desktop/STATGR-5702/final_project_local//math-achievement-lea-sy2015-16.csv")
rla15_16 <- read.csv("~/Desktop/STATGR-5702/final_project_local//rla-achievement-lea-sy2015-16.csv")

library(dplyr)
library(tidyverse)
library(stringr) 
ny_math20_21 <- filter(math20_21, STNAM == "NEW YORK")
ny_rla20_21 <- filter(rla20_21, STNAM == "NEW YORK")
ny_20_21 <- rbind(ny_math20_21, ny_rla20_21)

ny_math18_19 <- filter(math18_19, STNAM == "NEW YORK")
ny_rla18_19 <- filter(rla18_19, STNAM == "NEW YORK")


ny_math17_18 <- filter(math17_18, STNAM == "NEW YORK")
ny_rla17_18 <- filter(rla17_18, STNAM == "NEW YORK")


ny_math16_17 <- filter(math16_17, STNAM == "NEW YORK")
ny_rla16_17 <- filter(rla16_17, STNAM == "NEW YORK")


ny_math15_16 <- filter(math15_16, STNAM == "NEW YORK")
ny_rla15_16 <- filter(rla15_16, STNAM == "NEW YORK")


## test  <- filter(ny_math18_19, ST_LEAID == 'NY-211003040000')
## test$ALL_MTH00numvalid_1819 <- as.character(test$ALL_MTH00numvalid_1819)




### ny_math 2018-19
ny_math18_19$ALL_MTH00numvalid_1819 <- as.character(ny_math18_19$ALL_MTH00numvalid_1819)

ny_math18_19_long <- pivot_longer(ny_math18_19, cols = 7:262 , 
                                  names_to = c("CATEGORY","v2", "SCHOOL_YEAR"), 
                                  names_sep = "_",
                                  values_to = "score")
ny_math18_19_long$SUBJECT <- str_sub(ny_math18_19_long$v2, 1,3) 
ny_math18_19_long$GRADE <- str_sub(ny_math18_19_long$v2, 4,5) 
ny_math18_19_long$score_type <- str_sub(ny_math18_19_long$v2, 6) 
ny_math18_19_long$score_type  = toupper(ny_math18_19_long$score_type)
ny_math18_19_long <- subset(ny_math18_19_long, select = -v2)

ny_math18_19_long <- pivot_wider(ny_math18_19_long, names_from = score_type,
                                 values_from = score )

### ny rla 2018-19
ny_rla18_19$ALL_RLA00numvalid_1819 <- as.character(ny_rla18_19$ALL_RLA00numvalid_1819)
ny_rla18_19_long <- pivot_longer(ny_rla18_19, cols = 7:262 , 
                                 names_to = c("CATEGORY","v2", "SCHOOL_YEAR"), 
                                 names_sep = "_",
                                 values_to = "score")
ny_rla18_19_long$SUBJECT <- str_sub(ny_rla18_19_long$v2, 1,3) 
ny_rla18_19_long$GRADE <- str_sub(ny_rla18_19_long$v2, 4,5) 
ny_rla18_19_long$score_type <- str_sub(ny_rla18_19_long$v2, 6) 
ny_rla18_19_long$score_type  = toupper(ny_rla18_19_long$score_type)
ny_rla18_19_long <- subset(ny_rla18_19_long, select = -v2)

ny_rla18_19_long <- pivot_wider(ny_rla18_19_long, names_from = score_type,
                                values_from = score )

### ny math 2017-18
ny_math17_18$ALL_MTH00NUMVALID_1718 <- as.character(ny_math17_18$ALL_MTH00NUMVALID_1718)

ny_math17_18_long <- pivot_longer(ny_math17_18, cols = 7:262 , 
                                  names_to = c("CATEGORY","v2", "SCHOOL_YEAR"), 
                                  names_sep = "_",
                                  values_to = "score")
ny_math17_18_long$SUBJECT <- str_sub(ny_math17_18_long$v2, 1,3) 
ny_math17_18_long$GRADE <- str_sub(ny_math17_18_long$v2, 4,5) 
ny_math17_18_long$score_type <- str_sub(ny_math17_18_long$v2, 6) 
ny_math17_18_long$score_type  = toupper(ny_math17_18_long$score_type)
ny_math17_18_long <- subset(ny_math17_18_long, select = -v2)

ny_math17_18_long <- pivot_wider(ny_math17_18_long, names_from = score_type,
                                 values_from = score )

### ny rla 2017-18
ny_rla17_18$ALL_RLA00NUMVALID_1718 <- as.character(ny_rla17_18$ALL_RLA00NUMVALID_1718)
ny_rla17_18_long <- pivot_longer(ny_rla17_18, cols = 7:262 , 
                                 names_to = c("CATEGORY","v2", "SCHOOL_YEAR"), 
                                 names_sep = "_",
                                 values_to = "score")
ny_rla17_18_long$SUBJECT <- str_sub(ny_rla17_18_long$v2, 1,3) 
ny_rla17_18_long$GRADE <- str_sub(ny_rla17_18_long$v2, 4,5) 
ny_rla17_18_long$score_type <- str_sub(ny_rla17_18_long$v2, 6) 
ny_rla17_18_long$score_type  = toupper(ny_rla17_18_long$score_type)
ny_rla17_18_long <- subset(ny_rla17_18_long, select = -v2)

ny_rla17_18_long <- pivot_wider(ny_rla17_18_long, names_from = score_type,
                                values_from = score )




### ny math 2016-17
ny_math16_17$ALL_MTH00NUMVALID_1617 <- as.character(ny_math16_17$ALL_MTH00NUMVALID_1617)

ny_math16_17_long <- pivot_longer(ny_math16_17, cols = 7:230 , 
                                  names_to = c("CATEGORY","v2", "SCHOOL_YEAR"), 
                                  names_sep = "_",
                                  values_to = "score")
ny_math16_17_long$SUBJECT <- str_sub(ny_math16_17_long$v2, 1,3) 
ny_math16_17_long$GRADE <- str_sub(ny_math16_17_long$v2, 4,5) 
ny_math16_17_long$score_type <- str_sub(ny_math16_17_long$v2, 6) 
ny_math16_17_long$score_type  = toupper(ny_math16_17_long$score_type)
ny_math16_17_long <- subset(ny_math16_17_long, select = -v2)

ny_math16_17_long <- pivot_wider(ny_math16_17_long, names_from = score_type,
                                 values_from = score )

### ny rla 2016-17
ny_rla16_17$ALL_RLA00NUMVALID_1617 <- as.character(ny_rla16_17$ALL_RLA00NUMVALID_1617)
ny_rla16_17_long <- pivot_longer(ny_rla16_17, cols = 7:230 , 
                                 names_to = c("CATEGORY","v2", "SCHOOL_YEAR"), 
                                 names_sep = "_",
                                 values_to = "score")
ny_rla16_17_long$SUBJECT <- str_sub(ny_rla16_17_long$v2, 1,3) 
ny_rla16_17_long$GRADE <- str_sub(ny_rla16_17_long$v2, 4,5) 
ny_rla16_17_long$score_type <- str_sub(ny_rla16_17_long$v2, 6) 
ny_rla16_17_long$score_type  = toupper(ny_rla16_17_long$score_type)
ny_rla16_17_long <- subset(ny_rla16_17_long, select = -v2)

ny_rla16_17_long <- pivot_wider(ny_rla16_17_long, names_from = score_type,
                                values_from = score )

### ny math 2015-16
ny_math15_16$ALL_MTH00NUMVALID_1516 <- as.character(ny_math15_16$ALL_MTH00NUMVALID_1516)
ny_math15_16_long <- pivot_longer(ny_math15_16, cols = 6:229 , 
                                  names_to = c("CATEGORY","v2", "SCHOOL_YEAR"), 
                                  names_sep = "_",
                                  values_to = "score")
ny_math15_16_long$SUBJECT <- str_sub(ny_math15_16_long$v2, 1,3) 
ny_math15_16_long$GRADE <- str_sub(ny_math15_16_long$v2, 4,5) 
ny_math15_16_long$score_type <- str_sub(ny_math15_16_long$v2, 6) 
ny_math15_16_long$score_type  = toupper(ny_math15_16_long$score_type)
ny_math15_16_long <- subset(ny_math15_16_long, select = -v2)

ny_math15_16_long <- pivot_wider(ny_math15_16_long, names_from = score_type,
                                 values_from = score )
ny_math15_16_long$ST_LEAID <- "NULL"

### ny rla 2015-16
ny_rla15_16$ALL_RLA00NUMVALID_1516 <- as.character(ny_rla15_16$ALL_RLA00NUMVALID_1516)
ny_rla15_16_long <- pivot_longer(ny_rla15_16, cols = 6:229 , 
                                 names_to = c("CATEGORY","v2", "SCHOOL_YEAR"), 
                                 names_sep = "_",
                                 values_to = "score")
ny_rla15_16_long$SUBJECT <- str_sub(ny_rla15_16_long$v2, 1,3) 
ny_rla15_16_long$GRADE <- str_sub(ny_rla15_16_long$v2, 4,5) 
ny_rla15_16_long$score_type <- str_sub(ny_rla15_16_long$v2, 6) 
ny_rla15_16_long$score_type  = toupper(ny_rla15_16_long$score_type)
ny_rla15_16_long <- subset(ny_rla15_16_long, select = -v2)

ny_rla15_16_long <- pivot_wider(ny_rla15_16_long, names_from = score_type,
                                values_from = score )
ny_rla15_16_long$ST_LEAID <- "NULL"

#### combining all data 
ny_edu <- rbind(ny_20_21, 
                ny_math18_19_long, ny_rla18_19_long,
                ny_math17_18_long, ny_rla17_18_long,
                ny_math16_17_long, ny_rla16_17_long,
                ny_math15_16_long, ny_rla15_16_long)

write_csv(ny_edu, "~/Desktop/STATGR-5702/final_project_local/Proc_NY_MATH_RLA.csv")

ny_edu2 <-
  ny_edu %>%
  separate(PCTPROF, c("num1", "num2"), "-")



