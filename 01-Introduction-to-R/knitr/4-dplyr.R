## ---- message=FALSE--------------------------------------------------------------------------------
library(classdata)
library(dplyr)

fbi %>% filter(Type=="Burglary", Year==2016) %>% head()


## --------------------------------------------------------------------------------------------------
fbi %>% mutate(Rate = Count/Population*70000) %>% head()


## ---- message=FALSE--------------------------------------------------------------------------------
fbi %>% arrange(desc(Year), Type, desc(Count)) %>% head()


## --------------------------------------------------------------------------------------------------
fbi %>% arrange(desc(Year), Type, desc(Count)) %>%
  select(Type, Count, State, Year) %>% head()


## --------------------------------------------------------------------------------------------------
fbi %>% 
    summarise(mean_rate = mean(Count/Population*70000, na.rm=TRUE), 
              sd_rate = sd(Count/Population*70000, na.rm = TRUE))


## --------------------------------------------------------------------------------------------------
fbi %>%
    group_by(Type) %>%
    summarise(mean_rate = mean(Count/Population*70000, na.rm=TRUE), 
              sd_rate = sd(Count/Population*70000, na.rm = TRUE))

