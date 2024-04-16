
# overview ----------------------------------------------------------------


# load libraries ----------------------------------------------------------

library(tidyverse)
library(janitor)

# import data -------------------------------------------------------------

data_in <- read_csv("data-raw/Water_Point_Data_Exchange__WPdx-Basic_.csv") |>
  select(1:10) |>
  clean_names()

# transform data ----------------------------------------------------------

glimpse(data_in)

whdxdata <- data_in |>
  rename_with(~ str_replace(., "number_", ""))

# export data -------------------------------------------------------------

usethis::use_data(whdxdata, overwrite = TRUE)

# prepare dataset export files --------------------------------------------

# fs::dir_create(here::here("inst", "extdata"))
# write_csv(mwater, here::here("inst", "extdata", "mwater.csv"))
# openxlsx::write.xlsx(mwater, here::here("inst", "extdata", "mwater.xlsx"))


# functions ---------------------------------------------------------------


get_variable_info <- function(data, directory = "", file_name = "") {
  total_variables <- sum(sapply(data, function(df) length(names(df))))

  variable_info <- tibble(
    directory = character(total_variables),
    file_name = character(total_variables),
    variable_name = character(total_variables),
    variable_type = character(total_variables),
    description = character(total_variables)
  )

  index <- 1

  for (i in seq_along(data)) {
    dataframe <- data[[i]]
    variable_names <- names(dataframe)
    variable_types <- sapply(dataframe, typeof)

    num_variables <- length(variable_names)
    variable_info$variable_name[index:(index + num_variables - 1)] <- variable_names
    variable_info$variable_type[index:(index + num_variables - 1)] <- variable_types
    variable_info$file_name[index:(index + num_variables - 1)] <- rep(file_name[i], num_variables)
    variable_info$directory[index:(index + num_variables - 1)] <- rep(directory[i], num_variables)

    index <- index + num_variables
  }

  return(variable_info)
}


# Specify values for directory and file_name
directories <- c("data/")
file_names <- c("whdxdata.rda")

dictionary <- get_variable_info(data = list(whdxdata),
                                directory = directories,
                                file_name = file_names)
dictionary |>
  write_csv("data-raw/dictionary.csv")


