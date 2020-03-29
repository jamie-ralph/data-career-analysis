### Plots ###

library(ggridges)
library(cowplot)

### Plotting overall salaries ###

hist_plot <- function(df) {
    ggplot(data = df, aes(x = ConvertedComp, y = DevType, fill = DevType)) +
    geom_density_ridges(alpha = 1, size = 0.25) +
    scale_x_log10(labels = scales::dollar_format()) +
    theme_minimal(base_size = 12) +
    labs(
        x = "Salary (USD)",
        y = "",
        fill = "Developer type",
        colour = "Developer type"
    ) +
    theme(
        legend.position = "none"
    ) +
    scale_fill_manual(breaks = c("Data analyst", "Data scientist"),
                      values = c("#94D0FF", "#AD8CFF"))
    }

box_plot <- function(df) {
    ggplot(data = df, aes(DevType, ConvertedComp,  colour = DevType)) +
    geom_boxplot(outlier.colour = NA) +
    theme_minimal(base_size = 12) +
    geom_jitter(alpha = 0.3, width = 0.2) +
    scale_y_log10(labels = scales::dollar_format(), position = "right") +
    labs(
        x = "",
        y = "Salary (USD)"
    ) +
    theme(
        legend.position = "none"
    ) +
    scale_colour_manual(breaks = c("Data analyst", "Data scientist"),
                        values = c("#94D0FF", "#AD8CFF"))
    }

salary_grid_1 <- plot_grid(hist_plot(df_one_job), box_plot(df_one_job))

### Plotting demographics ###

gender_plot_salary <- df_one_job %>%
    filter(!is.na(Gender)) %>%
    mutate(Gender = case_when(
        str_detect(Gender, "Non-binary") ~ 
            "Non-binary, genderqueer, \n or gender non-conforming",
        TRUE ~ Gender
    )) %>%
    ggplot(aes(x = DevType, y = ConvertedComp, fill = DevType)) + 
    geom_boxplot(outlier.colour = NA) + 
    facet_wrap(~factor(Gender, levels = c("Man", "Woman", "Non-binary, genderqueer, \n or gender non-conforming"))) +
    theme_minimal(base_size = 12) +
    geom_jitter(alpha = 0.3, width = 0.2) +
    scale_y_log10(labels = scales::dollar_format(), position = "right") +
    labs(
        x = "",
        y = "Salary (USD)"
    ) +
    theme(
        legend.position = "none"
    ) +
    scale_fill_manual(breaks = c("Data analyst", "Data scientist"),
                        values = c("#94D0FF", "#AD8CFF"))


