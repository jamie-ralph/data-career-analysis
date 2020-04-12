library(moderndive)

# Fit a simple linear regression

model_data <- df %>%
    select(ConvertedComp, Age, DevType, EdLevel, OrgSize, OpenSourcer, MainBranch) %>%
    mutate(log_salary = log10(ConvertedComp),
           log_age = log10(Age)) %>%
    select(-ConvertedComp, -Age)


simple_lm <- lm(log_salary ~ log_age + DevType * OpenSourcer + DevType * EdLevel + DevType * MainBranch,
                data = model_data)


