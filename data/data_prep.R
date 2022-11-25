## reading raw data from school year 2016 to 2019
## source:  https://www2.ed.gov/about/inits/ed/edfacts/data-files/index.html

math18_19 <- read.csv("data/raw/math-achievement-lea-sy2018-19-wide.csv")
rla18_19 <- read.csv("data/raw/rla-achievement-lea-sy2018-19-wide.csv")
math17_18 <- read.csv("data/raw/math-achievement-lea-sy2017-18.csv")
rla17_18 <- read.csv("data/raw/rla-achievement-lea-sy2017-18.csv")
math16_17 <- read.csv("data/raw/math-achievement-lea-sy2016-17.csv")
rla16_17 <- read.csv("data/raw/rla-achievement-lea-sy2016-17.csv")

library(dplyr)
ny_math18_19 <- filter(math18_19, STNAM == "NEW YORK")
ny_rla18_19 <- filter(rla18_19, STNAM == "NEW YORK")
ny_math17_18 <- filter(math17_18, STNAM == "NEW YORK")
ny_rla17_18 <- filter(rla17_18, STNAM == "NEW YORK")
ny_math16_17 <- filter(math16_17, STNAM == "NEW YORK")
ny_rla16_17 <- filter(rla16_17, STNAM == "NEW YORK")
