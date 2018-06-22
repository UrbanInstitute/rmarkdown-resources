library(fivethirtyeight)
library(stringr)
library(tidyverse)

state <- bad_drivers$state

reports <- tibble(
	filename = str_c("driving-", state, ".html"),
	params = map(state, ~list(state = .))
)

reports %>%
	select(output_file = filename, params) %>%
	pwalk(rmarkdown::render, input = "driving-template.Rmd", output_dir = "output/")
