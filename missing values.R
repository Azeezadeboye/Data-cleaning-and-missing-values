#By Azeez Adeboye

install.packages("tidyverse")

library(tidyverse)

# taking a quick look
glimpse(grade)

# looking at some variables
grade %>% select(Assignment, Tutorial, Takehome)

grade$Assignment
is.na(grade$Assignment)

# looking at the distinct values
grade %>% distinct(Assignment)

# counting unique values
grade %>% summarise(p = n_distinct(Assignment))

# counting missing values
grade %>% summarise(count = sum(is.na(Assignment)))

# counting unique, missing, and median values
grade %>% summarise(p = n_distinct(Assignment), na = sum(is.na(Assignment)), med = median(Assignment, na.rm = TRUE))

# mutate missing values
grade %>% mutate(Assignment = replace(Assignment, is.na(Assignment), median(Assignment, na.rm = TRUE)))
grade

# mutate missing values, and modify the dataframe
grade <- grade %>% mutate(Assignment = replace(Assignment, is.na(Assignment), median(Assignment, na.rm = TRUE)))
grade

## Non-Standard Missing Values

# looking at missing values
grade$Tutorial
is.na(grade$Tutorial)

# counting missing values
grade %>% summarise(count = sum(is.na(Tutorial)))

# replacing with standard missing value type, NA
grade <- grade %>% mutate(Tutorial = replace(Tutorial, Tutorial == "na", NA)) %>% mutate(Tutorial = replace(Tutorial, Tutorial == "N/A", NA))

# taking another look
grade$Tutorial
is.na(grade$Tutorial)
grade %>% summarise(count = sum(is.na(Tutorial)))

glimpse(grade$Tutorial)

# changing to numeric type
grade$Tutorial = as.numeric(grade$Tutorial)
glimpse(grade$Tutorial)

# replace missing values with median
grade <- grade %>% mutate(Tutorial = replace(Tutorial, is.na(Tutorial), median(Tutorial, na.rm = T)))
grade$Tutorial

# looking at PaymentMethod
grade$Takehome
is.na(grade$Takehome)

# replacing "_" with NA
grade <- grade %>% mutate(Takehome = replace(Takehome, Takehome ==  "_", NA))
is.na(grade$Takehome)
grade$Takehome
grade %>% summarise(count = sum(is.na(Takehome)))

# replace NA with "unavailable"
grade <- grade %>% mutate(Takehome = replace(Takehome, is.na(Takehome), "unavailable"))
grade$Takehome
