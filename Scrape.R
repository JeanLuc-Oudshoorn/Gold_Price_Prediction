library(rvest)
library(dplyr)
library(stringr)


link <- read_html("https://www.indexmundi.com/commodities/?commodity=aluminum&months=360")

txt <- link %>%
  html_nodes(xpath = '//*[@id="gvPrices"]') %>%
  html_text() 

aluv <- txt %>%
  str_extract_all("[0-9],[0-9]{2,}\\.[0-9]{2}") %>%
  unlist() %>%
  str_remove_all(",") %>%
  as.numeric()
  
