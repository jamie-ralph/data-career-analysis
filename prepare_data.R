### Ideas script ### 
library(tidyverse)

# Choose the columns we want

columns <-  c("Respondent",
                  "MainBranch",
                  "Hobbyist",
                  "OpenSourcer",
                  "Employment",
                  "Country",
                  "UndergradMajor",
                  "DevType",
                  "YearsCode",
                  "JobSat",
                  "ConvertedComp",
                  "WorkRemote",
                  "LanguageWorkedWith",
                  "LanguageDesireNextYear",
                  "Age",
                  "Gender",
                  "Trans",
                  "Sexuality")

# Read the data in

df <- read_csv("survey_results_public.csv") %>%
    select(columns) %>%
    filter(Employment == "Employed full-time",
        ConvertedComp > 3e4,
        ConvertedComp < 2e6)


# Filter to just UK and Ireland data people

data_jobs_UKIR <- df %>% 
    mutate(DevType = str_split(DevType, pattern = ";")) %>%
    unnest(DevType) %>%
    mutate(DevType = case_when(
        str_detect(str_to_lower(DevType), "data scientist") ~ "Data scientist",
        str_detect(str_to_lower(DevType), "data or business") ~ "Data analyst",
        TRUE ~ "Other"
    )) %>%
    filter(DevType != "Other")

    


        
