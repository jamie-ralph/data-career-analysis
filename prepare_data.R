### Data preparation script ### 
library(tidyverse)
library(janitor)
library(patchwork)

# Read in the data

data_ft <- read_csv("survey_results_public.csv") %>%
    filter(Employment == "Employed full-time",
           ConvertedComp >= 3e4,
           ConvertedComp <= 3e5,
           Age >= 18,
           Country == "United States"
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


# Some additional data wrangling to make working with categorical data easier

df <- df %>%
    mutate(
        Gender = case_when(
        str_detect(Gender, "Non-binary") ~ 
            "Non-binary, genderqueer, or gender non-conforming",
        is.na(Gender) ~ "Not available",
        TRUE ~ Gender),
        MainBranch = case_when(
            str_detect("I am a developer by profession", 
                       MainBranch) ~ "Professional developer",
            TRUE ~ "Not professional developer"
        ),
        OrgSize = fct_collapse(OrgSize,
                               `Between 2 and 99` = c("2-9 employees", "10 to 19 employees", "20 to 99 employees"),
                               `Between 100 and 999` = c("100 to 499 employees", "500 to 999 employees"),
                               `Between 1,000 and 4,999` = "1,000 to 4,999 employees",
                               `5,000 or more` = c("5,000 to 9,999 employees", "10,000 or more employees")
        ),
        OpenSourcer = fct_collapse(OpenSourcer,
                                   Never = "Never",
                                   Sometimes = "Less than once per year",
                                   Often = c(
                                       "Less than once a month but more than once per year",
                                       "Once a month or more often"
                                   )
            )
    )

df <- df %>%
    mutate(
    EdLevel = case_when(
        EdLevel %in% c(
            "I never completed any formal education",
            "Primary/elementary school",
            "Secondary school (e.g. American high school, German Realschule or Gymnasium, etc.)",
            "Some college/university study without earning a degree",
            "Associate degree"
        ) ~ "Less than bachelors",
        EdLevel == "Bachelor’s degree (BA, BS, B.Eng., etc.)" ~ "Bachelors degree",
        EdLevel %in% c(
            "Other doctoral degree (Ph.D, Ed.D., etc.)",
            "Master’s degree (MA, MS, M.Eng., MBA, etc.)",
            "Professional degree (JD, MD, etc.)"
        ) ~ "Graduate degree",
        TRUE ~ EdLevel
    )
    )
        
levels(df$EdLevel) <- c("Less than bachelors", "Bachelors degree", "Graduate degree")
