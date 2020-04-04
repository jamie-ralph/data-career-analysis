#### Plots ####
library(cowplot)
## Set custom scale

devtype_scale_colour <- function() {
    scale_colour_manual(breaks = c("Data analyst", "Data scientist"),
                        values = c("#94D0FF", "#AD8CFF"))
}

devtype_scale_fill <- function() {
    scale_fill_manual(breaks = c("Data analyst", "Data scientist"),
                        values = c("#94D0FF", "#AD8CFF"))
}
# Plotting overall salaries 

boxplot_all_salary <- df %>%
    ggplot(aes(DevType, ConvertedComp,  colour = DevType)) +
    geom_boxplot(outlier.colour = NA) +
    theme_minimal(base_size = 12) +
    geom_jitter(alpha = 0.3, width = 0.2) +
    scale_y_continuous(labels = scales::dollar_format()) +
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
    facet_wrap(~factor(Gender, levels = c("Man", 
                                          "Woman", 
                                          "Non-binary, genderqueer, \n or gender non-conforming"))) +
    theme_minimal(base_size = 12) +
    geom_jitter(alpha = 0.3, width = 0.2) +
    scale_y_continuous(labels = scales::dollar_format()) +
    labs(
        x = "",
        y = "Salary (USD)"
    ) +
    theme(
        legend.position = "none"
    ) +
    devtype_scale_colour()

## Age

hist_age <- df %>%
    ggplot(aes(x = Age, fill = DevType, colour = DevType)) +
    geom_histogram(bins = 100) +
    theme_minimal(base_size = 12) +
    devtype_scale_fill() +
    devtype_scale_colour() +
    labs(
        y = "Number of respondents"
    ) +
    theme(
        legend.position = "none"
    )
    

scatter_age <- df %>%
    ggplot(aes(x = Age, y = ConvertedComp, colour = DevType)) +
    theme_minimal(base_size = 12) +
    guides(colour = guide_legend(override.aes = list(size = 5))) +
    geom_point() +
    labs(
        y = "Salary (USD)"
    ) +
    scale_y_continuous(labels = scales::dollar_format()) +
    devtype_scale_colour() +
    facet_wrap(~DevType)

age_plots <- plot_grid(hist_age, scatter_age)

## Sexuality

s_levels = c("Straight / Heterosexual", "Bisexual", "Gay or Lesbian")

sexuality_bar_plot <- df %>%
    filter(!is.na(Sexuality)) %>%
    mutate(
        Sexuality = str_split(Sexuality, pattern = ";")
    ) %>%
    unnest(Sexuality) %>%
    group_by(DevType, Sexuality) %>%
    tally() %>%
    ggplot(aes(x = factor(Sexuality, levels = rev(s_levels)), y = n, fill = DevType)) +
    geom_col(position = "dodge") +
    theme_minimal(base_size = 12) +
    labs(
        x = "Sexuality"
    ) +
    coord_flip() +
    devtype_scale_fill()

    