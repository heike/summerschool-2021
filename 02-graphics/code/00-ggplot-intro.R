## ----setup, include = F---------------------------------------------------------------------------------------------------------------------------------------------------------
library(tidyverse)
library(ggplot2)
library(dplyr)
library(tidyr)
library(gridExtra)

## ----ggplot2-ex-dissect, message = F, warning = F, fig.show='hide'--------------------------------------------------------------------------------------------------------------
library(classdata)
library(ggplot2)
ggplot(
  data = fbiwide,
  # Aesthetic mappings
  aes(
    x = Burglary,
    y = Murder
  )
) +

  # layer - plot using points
  geom_point()


## ----ggplot2-ex-dissect, echo= F,message = F, warning = F, fig.width = 6, fig.height = 6----------------------------------------------------------------------------------------
library(classdata)
library(ggplot2)
ggplot(
  data = fbiwide,
  # Aesthetic mappings
  aes(
    x = Burglary,
    y = Murder
  )
) +

  # layer - plot using points
  geom_point()


## ----ggplot2-ex-dissect2, message = F, warning = F, fig.show='hide'-------------------------------------------------------------------------------------------------------------
library(classdata)
library(ggplot2)

ggplot(
  data = fbiwide,
  # Aesthetic mappings
  aes(
    x = Burglary,
    y = Murder,
    color = Year
  )
) +

  # layer - plot using points
  geom_point()


## ----ggplot2-ex-dissect2, echo= F,message = F, warning = F, fig.width = 6, fig.height = 6---------------------------------------------------------------------------------------
library(classdata)
library(ggplot2)

ggplot(
  data = fbiwide,
  # Aesthetic mappings
  aes(
    x = Burglary,
    y = Murder,
    color = Year
  )
) +

  # layer - plot using points
  geom_point()


## ----ggplot2-ex-dissect3, message = F, warning = F, fig.show='hide'-------------------------------------------------------------------------------------------------------------
library(classdata)
library(ggplot2)

ggplot(
  data = fbiwide,
  # Aesthetic mappings
  aes(
    x = Burglary,
    y = Murder,
    color = State
  )
) +

  # layer - plot using points
  geom_point() +
  # Skip the legend for now
  guides(color = F)


## ----ggplot2-ex-dissect3, echo= F,message = F, warning = F, fig.width = 6, fig.height = 6---------------------------------------------------------------------------------------
library(classdata)
library(ggplot2)

ggplot(
  data = fbiwide,
  # Aesthetic mappings
  aes(
    x = Burglary,
    y = Murder,
    color = State
  )
) +

  # layer - plot using points
  geom_point() +
  # Skip the legend for now
  guides(color = F)


## ---- eval = F------------------------------------------------------------------------------------------------------------------------------------------------------------------
## library(classdata)
## library(ggplot2)
##
## ggplot(data = fbiwide,
##        # Aesthetic mappings
##        aes(x = Burglary,
##            y = Murder,
##            color = State)) +
##
##   # layer - plot using points
##   geom_point() +
##   # Skip the legend for now
##   guides(color = F)


## ----plots-4, fig.align='top', fig.height=5, fig.width=15, echo = F-------------------------------------------------------------------------------------------------------------
p1 <- ggplot(diamonds, aes(cut, fill = cut)) +
  geom_bar() +
  labs(title = "Bar Chart", subtitle = "Cartesian coordinates") 
p2 <- ggplot(diamonds, aes(factor(1), fill = cut)) +
  geom_bar(width = 1) +
  labs(x = "", title = "Fill-Bar", subtitle = "Cartesian coordinates")
p3 <- ggplot(diamonds, aes(factor(1), fill = cut)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y") +
  labs(x = "", title = "Fill-Bar", subtitle = "Polar coordinates")
grid.arrange(p1, p2, p3, ncol = 3, nrow = 1)
