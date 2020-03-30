#### Plots ####

## Set custom scale

devtype_scale_colour <- function() {
    scale_colour_manual(breaks = c("Data analyst", "Data scientist"),
                        values = c("#94D0FF", "#AD8CFF"))
}

# Plotting overall salaries 

boxplot_all_salary <- df %>%
    ggplot(aes(DevType, ConvertedComp,  colour = DevType)) +
    geom_boxplot(outlier.colour = NA) +
    theme_minimal(base_size = 12) +
    geom_jitter(alpha = 0.3, width = 0.2) +
    scale_y_log10(labels = scales::dollar_format()) +
    labs(
        x = "",
        y = "Salary (USD)"
    ) +
    theme(
        legend.position = "none"
    ) +
    devtype_scale_colour()
    


# Plotting demographics 

## Gender identity 

boxplot_gender_salary <- df %>%
    filter(!is.na(Gender)) %>%
    mutate(Gender = case_when(
        str_detect(Gender, "Non-binary") ~ 
            "Non-binary, genderqueer, \n or gender non-conforming",
        TRUE ~ Gender
    )) %>%
    ggplot(aes(x = DevType, y = ConvertedComp, colour = DevType)) + 
    geom_boxplot(outlier.colour = NA) + 
    facet_wrap(~factor(Gender, levels = c("Man", "Woman", "Non-binary, genderqueer, \n or gender non-conforming"))) +
    theme_minimal(base_size = 12) +
    geom_jitter(alpha = 0.3, width = 0.2) +
    scale_y_log10(labels = scales::dollar_format()) +
    labs(
        x = "",
        y = "Salary (USD)"
    ) +
    theme(
        legend.position = "none"
    ) +
    devtype_scale_colour()

