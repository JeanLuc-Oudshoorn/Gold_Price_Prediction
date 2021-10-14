library(rvest)
library(dplyr)
library(stringr)
library(lubridate)
library(xts)


link <- read_html("https://www.indexmundi.com/commodities/?commodity=aluminum&months=360")

txt <- link %>%
  html_nodes(xpath = '//*[@id="gvPrices"]') %>%
  html_text() 

aluv <- txt %>%
  str_extract_all("[0-9],[0-9]{2,}\\.[0-9]{2}") %>%
  unlist() %>%
  str_remove_all(",") %>%
  as.numeric()
  
indx <- txt %>%
  str_extract_all("[A-Z][a-z]{2} [0-9]{4}") %>%
  unlist() %>%
  str_to_lower() %>%
  parse_date_time(order = "b Y")

dat <- xts(aluv, order.by = indx)

colnames(dat) <- "price"

dat$logreturn <- diff(log(dat$price))

dat$perctreturn <- (exp(dat$logreturn)-1)*100
