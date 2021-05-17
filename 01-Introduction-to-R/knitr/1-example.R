## knitr::opts_chunk(warning = FALSE)


## ---- eval = FALSE---------------------------------------------------------------------------------
## curl::curl_download(
##   "https://raw.githubusercontent.com/heike/summerschool-2021/master/01-Introduction-to-R/code/1-example.R",
##   "1-example.R"
## )
## file.edit("1-example.R")


## --------------------------------------------------------------------------------------------------
penguins <- read.csv("https://raw.githubusercontent.com/heike/summerschool-2021/main/01-Introduction-to-R/data/penguins.csv", stringsAsFactors = TRUE)


## --------------------------------------------------------------------------------------------------
head(penguins)


## --------------------------------------------------------------------------------------------------
str(penguins)


## --------------------------------------------------------------------------------------------------
summary(penguins)


## ---- eval=FALSE-----------------------------------------------------------------------------------
## install.packages("ggplot2")
## library(ggplot2)
## library(dplyr)


## ---- echo=FALSE, message = FALSE, warning = FALSE-------------------------------------------------
library(ggplot2)
library(dplyr)


## ---- fig.height=3, fig.width=3, warning = FALSE---------------------------------------------------
penguins %>% ggplot(aes(x = bill_length_mm, y = flipper_length_mm)) + geom_point()


## ---- fig.height=3, fig.width=3, echo = FALSE, warning = FALSE-------------------------------------
penguins %>% ggplot(aes(x = bill_length_mm, y = flipper_length_mm)) + geom_point()


## --------------------------------------------------------------------------------------------------
cor(penguins$bill_length_mm, penguins$flipper_length_mm, use = "pairwise")


## ---- fig.height=3.5, fig.width=4, warning = FALSE-------------------------------------------------
penguins %>% 
  ggplot(aes(x = bill_length_mm, y = flipper_length_mm, colour = sex)) + 
  geom_point()


## ---- fig.height=3.5, fig.width=4, warning = FALSE-------------------------------------------------
penguins %>% 
  ggplot(aes(x = bill_length_mm, y = flipper_length_mm, colour = species)) + 
  geom_point()


## ---- fig.height=3.5, fig.width=4, warning = FALSE-------------------------------------------------
penguins %>% 
  ggplot(aes(x = bill_length_mm, y = flipper_length_mm, colour = species)) + 
  geom_point() +
  scale_color_manual(values = c("darkorange","purple","cyan4")) 


## ---- fig.height=4, fig.width=4, warning = FALSE---------------------------------------------------
penguins %>% 
  ggplot(aes(x = body_mass_g)) + geom_histogram(binwidth = 100)


## ---- fig.height=4, fig.width=4, warning = FALSE---------------------------------------------------
penguins %>% 
  ggplot(aes(x = body_mass_g, fill= sex)) + geom_histogram(binwidth = 100)


## ---- fig.height=4, fig.width=10, warning = FALSE--------------------------------------------------
penguins %>% 
  ggplot(aes(x = body_mass_g, fill= sex)) + geom_histogram(binwidth = 100) +
  facet_grid(.~species)


## ---- fig.height=4, fig.width=10, warning = FALSE--------------------------------------------------
penguins %>% filter(!is.na(sex)) %>%
  ggplot(aes(x = body_mass_g, fill= sex)) + geom_density(alpha = 0.5) +
  facet_grid(.~species)


## --------------------------------------------------------------------------------------------------
gentoo <- filter(penguins, species=="Gentoo")

mean(gentoo$body_mass_g[gentoo$sex == "male"], na.rm=TRUE)
mean(gentoo$body_mass_g[gentoo$sex == "female"], na.rm=TRUE)


## --------------------------------------------------------------------------------------------------
t.test(body_mass_g ~ sex, data = gentoo)

