### Plots ###

library(ggridges)
library(cowplot)

hist <- data_jobs %>%
    ggplot(aes(x = ConvertedComp, y = DevType, fill = DevType)) +
    geom_density_ridges(alpha = 1, size = 0.9) +
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
                      values = c("#0ABDA0", "#FDA134"))

box <- data_jobs %>%
    ggplot(aes(DevType, ConvertedComp,  colour = DevType)) +
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
                        values = c("#0ABDA0", "#FDA134"))

salary_grid <- plot_grid(hist, box)
