library(quarto)
library(dplyr)
library(purrr)

penguins %>%
    pull(species) %>%
    unique() %>%
    map(
        ~ quarto::quarto_render(
            input = "penguins.qmd",
            output_format = "typst",
            output_file = paste0("penguins_", .x, ".pdf"),
            execute_params = list(species = .x)
        )
    )
