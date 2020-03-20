### Ideas script ### 
library(tidyverse)

# Read the data in

df <- read_csv("survey_results_public.csv") %>%
    filter(Employment == "Employed full-time",
        ConvertedComp > 3e4,
        ConvertedComp < 2e6)


# Filter to just UK and Ireland data people

data_jobs <- df %>% 
    mutate(DevType = str_split(DevType, pattern = ";")) %>%
    unnest(DevType) %>%
    mutate(DevType = case_when(
        str_detect(str_to_lower(DevType), "data scientist") ~ "Data scientist",
        str_detect(str_to_lower(DevType), "data or business") ~ "Data analyst",
        TRUE ~ "Other"
    )) %>%
    filter(DevType != "Other")

    


        
