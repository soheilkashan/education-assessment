
## reading raw data from school year 2016 to 2019
## source:  https://www2.ed.gov/about/inits/ed/edfacts/data-files/index.html
## we have downloaded the files but the files can be read directly from the source

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

## filtering just NY STATE
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


### ny_math 2018-19 transformation 
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

### ny rla 2018-19 transformation
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

### ny math 2017-18 transformation
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

### ny rla 2017-18 transformation
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




### ny math 2016-17 transformation
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

### ny rla 2016-17 transformation
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

### ny math 2015-16 transformation
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

### ny rla 2015-16 transformation
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



## parsing PCTPROF to get the percentages
ny_edu <- 
  ny_edu %>%
  separate(PCTPROF, c("num1", "num2"), "-|LE|LT|GT|GE", remove =FALSE)

### we don't remove NAs for further analysis of missing values


ny_edu$num1 <- as.numeric(ny_edu$num1)
ny_edu$num2 <- as.numeric(ny_edu$num2)
ny_edu$avg_num<- (ny_edu$num1 + ny_edu$num2) /2

ny_edu$PASSED <- coalesce(ny_edu$avg_num, ny_edu$num1, ny_edu$num2)

ny_edu <- subset(ny_edu, select = -c(num1, num2, avg_num))

## append mapping for categories
ny_edu <- 
  ny_edu %>%
  mutate(
    CATEGORY_DESC = case_when(
      CATEGORY == "CWD" ~ "Children with disabilities ",
      CATEGORY == "ECD" ~ "Economically disadvantaged",
      CATEGORY == "F" ~ "Female",
      CATEGORY == "FCS" ~ "Foster Care Status",
      CATEGORY == "HOM" ~ "Homeless Enrolled",
      CATEGORY == "LEP" ~ "English Learner",
      CATEGORY == "M" ~ "Male",
      CATEGORY == "MAM" ~ "American Indian/Alaska Native",
      CATEGORY == "MAS" ~ "Asian/Pacific Islander",
      CATEGORY == "MBL" ~ "Black",
      CATEGORY == "MHI" ~ "Hispanic",
      CATEGORY == "MIG" ~ "Migrant",
      CATEGORY == "MIL" ~ "Military Connected Student Status",
      CATEGORY == "MTR" ~ "Two or More Races",
      CATEGORY == "MWH" ~ "White",
      CATEGORY == "ALL" ~ "ALL"
    )
  )

## append mapping for category type

ny_edu <- 
  ny_edu %>%
  mutate(
    CATEGORY_TPYE = case_when(
      CATEGORY == "CWD" | CATEGORY == "FCS" | CATEGORY == "HOM"
      | CATEGORY == "ECD" | CATEGORY == "LEP"  | CATEGORY == "MIG" 
      | CATEGORY == "MIL" ~ "Special Status" ,
      CATEGORY == "F" | CATEGORY == "M" ~ "Sex",
      CATEGORY == "MAM" |
        CATEGORY == "MAS" |
        CATEGORY == "MBL" |
        CATEGORY == "MHI" |
        CATEGORY == "MTR" |
        CATEGORY == "MWH" ~ "Race/Ethnicity",
      CATEGORY == "ALL" ~ "ALL"
    )
  )

## clean up school year formats
ny_edu <- 
  ny_edu %>%
  mutate(
    SCHOOL_YEAR = case_when(
      SCHOOL_YEAR == '2020-2021' ~ "2020-21",
      SCHOOL_YEAR == '1819' ~ "2018-19",
      SCHOOL_YEAR == '1718' ~ "2017-18",
      SCHOOL_YEAR == '1617' ~ "2016-17",
      SCHOOL_YEAR == '1516' ~ "2015-16",
    )
  )

## convert 00 grade to ALL
ny_edu <- 
  ny_edu %>%
  mutate(
    GRADE = case_when(
      GRADE == "00" ~ "ALL",
      TRUE ~ GRADE))

# renaming to District
ny_edu <- 
  ny_edu %>% 
  rename( "District" = "LEANM")

# removing extra fields
ny_edu_final <- subset(ny_edu, select = -c(STNAM, LEAID, ST_LEAID, DATE_CUR))
ny_edu_final$NUMVALID <- as.numeric(ny_edu_final$NUMVALID)
ny_edu_final$CATEGORY <- as.factor(ny_edu_final$CATEGORY)
