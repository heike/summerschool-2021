## ----setup, include = F---------------------------------------------------------------------------------------------------------------------------------------------------------
library(tidyverse)
library(ggplot2)
library(dplyr)
library(tidyr)
library(gridExtra)


## ---- fig.width = 8, fig.height = 4, out.width = "100%"-------------------------------------------------------------------------------------------------------------------------

tmp <- tibble(g1 = 1, x = seq(-2, 2, .01), y = -sin(pi * x)) %>%
  bind_rows(tibble(x = seq(-2, 2, .01), y = 0, g1 = 2)) %>%
  mutate(color = factor(floor(x)), size = as.numeric(color) %% 2)

ggplot(tmp, aes(x = x, y = y, group = g1)) +
  geom_line() +
  scale_size_continuous(range = c(.75, 1.25)) +
  guides(size = "none", color = "none") +
  theme_minimal() +
  theme(axis.title = element_blank(), axis.text = element_blank()) +
  coord_fixed()


## ----color-ggplot2, fig.width = 10, fig.height = 5, out.width = "100%"----------------------------------------------------------------------------------------------------------
library(ggsci)
library(viridis)
library(wesanderson)
library(RColorBrewer)

p1 <- ggplot(data = mpg, aes(x = class, fill = class)) +
  geom_bar() +
  theme_bw() +
  theme(legend.position = "none", axis.text.x = element_blank())

p11 <- p1 + labs(title = "ggplot2 default")
p2 <- p1 + scale_fill_npg() + labs(title = "NPG")
p3 <- p1 + scale_fill_startrek() + labs(title = "Star Trek")
p4 <- p1 + scale_fill_ucscgb() + labs(title = "UCSCGB")
p5 <- p1 + scale_fill_viridis(discrete = TRUE) + labs(title = "Viridis")
p6 <- p1 + scale_fill_viridis(option = "magma", discrete = TRUE) + labs(title = "Magma")
p9 <- p1 + scale_fill_brewer(palette = "Set2") + labs(title = "Set2")
p0 <- p1 + scale_fill_brewer(palette = "Dark2") + labs(title = "Dark2")

grid.arrange(p11, p2, p3, p4, p5, p6,
  p9, p0,
  nrow = 2
)



## ---- echo = T, purl = T--------------------------------------------------------------------------------------------------------------------------------------------------------
data(diamonds)


## ---- echo = TRUE, purl = T-----------------------------------------------------------------------------------------------------------------------------------------------------
movies <- read.csv("http://heike.github.io/summerschool-2021/02-graphics/data/MovieSummary.csv")
