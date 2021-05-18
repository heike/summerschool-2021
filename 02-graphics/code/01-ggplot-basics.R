## ----setup, include = F---------------------------------------------------------------------------------------------------------------------------------------------------------
library(tidyverse)
library(ggplot2)
library(dplyr)
library(tidyr)
library(gridExtra)


## ----plots-4, fig.align='bottom', fig.height=5, fig.width=15, echo = F----------------------------------------------------------------------------------------------------------
p1 <- ggplot(data = mpg, aes(x = class, y = hwy)) +
  labs(title = "")
p2 <- ggplot(data = mpg, aes(x = class, y = hwy)) +
  geom_boxplot() +
  labs(title = "+ geom_boxplot()")
p3 <- ggplot(data = mpg, aes(x = class, y = hwy)) +
  geom_jitter() +
  geom_boxplot() +
  labs(title = "+ geom_jitter() + geom_boxplot()")
grid.arrange(p1, p2, p3, ncol = 3, nrow = 1)


## ---- eval = FALSE, purl = TRUE-------------------------------------------------------------------------------------------------------------------------------------------------
## ggplot(data = mpg, aes(x = class, y = hwy)) + labs(title = "")
## ggplot(data = mpg, aes(x = class, y = hwy)) + geom_boxplot() + labs(title = "+ geom_boxplot()")
## ggplot(data = mpg, aes(x = class, y = hwy)) + geom_jitter() + geom_boxplot() + labs(title = "+ geom_jitter() + geom_boxplot()")
##


## ---- fig.align='top', fig.height=4, fig.width=10, echo = F---------------------------------------------------------------------------------------------------------------------
p1 <- ggplot(data = mpg, aes(x = cty, y = hwy, colour = class)) +
  geom_text(aes(label = class)) +
  scale_color_locuszoom() +
  labs(x = "city mpg", y = "highway mpg", title = "Geom Text")
p2 <- ggplot(data = mpg, aes(x = cty, y = hwy, colour = class)) +
  geom_point() +
  scale_color_locuszoom() +
  labs(x = "city mpg", y = "highway mpg", title = "Geom Point")
grid.arrange(p2, p1, ncol = 2, nrow = 1)


## ---- eval = FALSE, purl = TRUE-------------------------------------------------------------------------------------------------------------------------------------------------
## ggplot(data = mpg, aes(x = cty, y = hwy, colour = class)) + geom_text(aes(label = class)) + labs(x = "city mpg", y = "highway mpg", title = "Geom Text")
##
## ggplot(data = mpg, aes(x = cty, y = hwy, colour = class)) + geom_point() + labs(x = "city mpg", y = "highway mpg", title = "Geom Point")


## ---- fig.align='bottom', fig.height=5, fig.width=15----------------------------------------------------------------------------------------------------------------------------
p1 <- ggplot(data = mpg, aes(x = class, y = hwy, colour = class)) +
  geom_jitter(width = 0.1) +
  scale_fill_locuszoom() +
  scale_color_locuszoom()
p2 <- ggplot(data = mpg, aes(x = class, y = hwy, colour = class)) +
  geom_violin(aes(fill = class), alpha = 0.4) +
  scale_fill_locuszoom() +
  scale_color_locuszoom()
p3 <- ggplot(data = mpg, aes(x = class, y = hwy, colour = class)) +
  geom_jitter(width = 0.1) +
  geom_violin(aes(fill = class), alpha = 0.4) +
  scale_fill_locuszoom() +
  scale_color_locuszoom()
grid.arrange(p1, p2, p3, ncol = 3, nrow = 1)


## ---- eval = FALSE, purl = TRUE-------------------------------------------------------------------------------------------------------------------------------------------------
## ggplot(data = mpg, aes(x = class, y = hwy, colour = class)) + geom_jitter(width = 0.1)
##
## ggplot(data = mpg, aes(x = class, y = hwy, colour = class)) + geom_violin(aes(fill = class), alpha = 0.4)
##
## ggplot(data = mpg, aes(x = class, y = hwy, colour = class)) + geom_jitter(width = 0.1) + geom_violin(aes(fill = class), alpha = 0.4)
##
##


## ----echo=TRUE, fig.height=4, fig.width=8, purl=TRUE----------------------------------------------------------------------------------------------------------------------------
ggplot(data = mpg, aes(x = class, y = hwy)) +
  geom_jitter() +
  geom_boxplot()


## ----echo = T, fig.height = 4, fig.width = 8, purl = T--------------------------------------------------------------------------------------------------------------------------
ggplot(data = mpg, aes(x = cty, y = hwy)) +
  geom_point()


## ---- fig.width=10, fig.height=4, echo = TRUE, eval=FALSE-----------------------------------------------------------------------------------------------------------------------
## ggplot(data = mpg,
##        aes(x = cty, y = hwy, colour = class)) +
##   geom_point()
##
## ggplot(data = mpg,
##        aes(x = cty, y = hwy, colour = class)) +
##   geom_point() +
##   facet_grid(.~class)


## ---- fig.width=10, fig.height=4, fig.align = "center", echo=FALSE--------------------------------------------------------------------------------------------------------------
a <- ggplot(data = mpg, aes(x = cty, y = hwy, colour = class)) +
  geom_point() +
  scale_color_locuszoom()

b <- ggplot(data = mpg, aes(x = cty, y = hwy, colour = class)) +
  geom_point() +
  theme(legend.position = "none") +
  facet_grid(. ~ class) +
  scale_color_locuszoom()

grid.arrange(a, b, nrow = 1)


## ----echo = T, fig.height = 4, fig.width = 8, purl = T--------------------------------------------------------------------------------------------------------------------------
ggplot(data = mpg, aes(x = cty, y = hwy)) +
  geom_point()


## ---- fig.width=10, fig.height=4, fig.align = "center"--------------------------------------------------------------------------------------------------------------------------
s <- ggplot(mpg, aes(fl, fill = drv)) +
  ggtitle("") +
  scale_fill_locuszoom()
s1 <- s + geom_bar(position = "dodge") + ggtitle("Dodge")
s2 <- s + geom_bar(position = "fill") + ggtitle("Fill") + scale_fill_locuszoom()
s3 <- s + geom_bar(position = "stack") + ggtitle("Stack")

grid.arrange(s1, s2, s3, nrow = 1)



## ---- fig.width=10, fig.height=4, fig.align = "center"--------------------------------------------------------------------------------------------------------------------------
p2 <- ggplot(mpg, aes(cyl, hwy, color = factor(cyl))) +
  geom_point() +
  ggtitle("geom_point()")
p3 <- ggplot(mpg, aes(cyl, hwy, color = factor(cyl))) +
  geom_point(position = "jitter") +
  ggtitle('geom_point(position = "jitter")')
p4 <- ggplot(mpg, aes(cyl, hwy, color = factor(cyl))) +
  geom_jitter() +
  ggtitle("geom_jitter()")
grid.arrange(p2, p3, p4, nrow = 1)


## ---- fig.width=10, fig.height=5, fig.align = "center"--------------------------------------------------------------------------------------------------------------------------
r <- ggplot(mpg, aes(fl)) +
  geom_bar()
r1 <- r + coord_cartesian(xlim = c(0, 5)) + ggtitle("coord_cartesian")
r2 <- r + coord_fixed(ratio = 1 / 10) + ggtitle("coord_fixed")
r3 <- r + coord_flip() + ggtitle("coord_flip")
r4 <- r + coord_polar(theta = "x", direction = 1) + ggtitle("coord_polar")
r5 <- r + coord_trans(y = "sqrt") + ggtitle("coord_trans")
world <- map_data("world")

library(maps)
worldmap <- ggplot(world, aes(x = long, y = lat, group = group)) +
  geom_path() +
  scale_y_continuous(breaks = (-2:2) * 30) +
  scale_x_continuous(breaks = (-4:4) * 45)

r7 <- worldmap + coord_map("ortho") + ggtitle("coord_map")
r8 <- worldmap + coord_map("ortho", orientation = c(-90, 0, 0)) + ggtitle("coord_map")

grid.arrange(r1, r2, r3, r5, r4, r7, r8, nrow = 2)
