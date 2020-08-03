# Data-cleaning-and-missing-values
Decribing data cleaning and dealing with different types of missing values using Tidyverse in R.
Detecting missing values through tidyr and dplyr packages from the Tidyverse
load the tidyverse library and read your CSV or .txt file into R
install.packages("tidyverse")
library(tidyverse)
# set the working directory
j_me = ("C:/users/Azeez/datademo")
setwd(j_me)
# read in the data file
grade = read_csv("grade_me")
