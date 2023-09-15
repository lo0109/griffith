library(tidyverse)
mytibble <- read_csv("Afghanistan,1999,745,19987071
                     Afghanistan,2000,2666,20595360
                     Brazil,1999,37737,172006362
                     Brazil,2000,80488,174504898
                     China,1999,212258,1272915272
                     China,2000,213766,1280428583",
                     col_names = c("country","year","cases","population"))
spec(mytibble)
mytibble[c("country","cases")]
mydata <- read_csv("car.data", col_names = c("buying","maint","doors","persons","lug_boot","safety","class"))
mydata
spec(mydata)
mydata[c("doors","class")]
mytibble2 <- mytibble %>%
  mutate(rate=cases/population*10000)
mytibble2
mytibble3 <- mytibble %>%
  transmute(rate=cases/population)
mytibble3
mytibble %>%
  count(year, wt=cases)
mytibble %>%
  count(country, wt =cases)
ggplot(mytibble, aes(year,cases)) + geom_line(aes(group = country), colour = "grey50") + geom_point(aes(colour = country))
#pivoting
mytibble_1 <- read_csv("Afghanistan,745,2666
                       Brazil,37737,80488
                       China,212258,213766",
                       col_names = c("country","1999","2000"))
mytibble_1
mytibble_1 <- mytibble_1 %>%
  pivot_longer(c(`1999`,`2000`), 
               names_to = "year", values_to = "cases")
mytibble_1

mytibble_2 <- read_csv("Afghanistan,19987071,20595360
                      Brazil,172006362,174504898
                      China,1272915272,1280428583",
                      col_names = c("country","1999","2000"))
mytibble_2 <- mytibble_2 %>%
  pivot_longer(c(`1999`,`2000`), 
               names_to = "year", values_to = "population")
mytibble_2

mytibble_3 <- left_join(mytibble_1,mytibble_2) 

mytibble_3

tibble_wider = read_csv("Afghanistan, 1999, cases, 745
                        Afghanistan, 1999, population, 19987071
                        Afghanistan, 2000, cases, 2666
                        Afghanistan, 2000, population, 20595360
                        Brazil, 1999, cases, 37737
                        Brazil, 1999, population, 172006362
                        Brazil, 2000, cases, 80488
                        Brazil, 2000, population, 174504898
                        China, 1999, cases, 212258
                        China, 1999, population, 1272915272
                        China, 2000, cases, 213766
                        China, 2000, population, 1280428583",
                        col_names=c("country", "year", "type", "count"))
tibble_wider
mytibble_4 <- tibble_wider %>%
  pivot_wider(names_from = type,values_from = count)
mytibble_4
