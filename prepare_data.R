### Data preparation script ### 
library(tidyverse)
library(janitor)

# Read in the data

data_ft <- read_csv("survey_results_public.csv") %>%
    filter(Employment == "Employed full-time",
        ConvertedComp >= 3e4,
        ConvertedComp <= 3e5
    )

# Identify managers and academics

managers <- data_ft %>%
    filter(str_detect(DevType, "Engineering manager|Product manager|Senior executive/VP"))

academics <- data_ft %>%
    filter(str_detect(DevType, "Academic researcher|Scientist|Educator"))

# Filter to data scientists and data analysts only

data_jobs <- data_ft %>% 
    anti_join(managers) %>%
    anti_join(academics) %>%
    mutate(DevType = str_split(DevType, pattern = ";")) %>%
    unnest(DevType) %>%
    mutate(DevType = case_when(
            str_detect(str_to_lower(DevType), "data scientist") ~ "Data scientist",
            str_detect(str_to_lower(DevType), "data or business") ~ "Data analyst",
            TRUE ~ "Other") ) %>%
    filter(DevType != "Other")
    
        

# Filter df to people who selected both job types, then anti join to get
# respondents who selected one job type

both_jobs <- data_jobs %>%
    group_by(Respondent) %>%
    summarise(Count = n()) %>%
    filter(Count > 1) %>%
    select(-Count)

df <- data_jobs %>%
    anti_join(both_jobs)
    


        
