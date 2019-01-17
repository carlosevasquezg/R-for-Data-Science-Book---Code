
library(tidyverse)
mpg
# puedo ejecutar ?mpg para ver toda la documentacion


# 1 variacion con shape, alpha, size
ggplot( data = mpg) +
  geom_point(mapping = aes (x = displ, y = hwy, alpha = class), color = "blue")

# 2 Facets
ggplot( data = mpg) +
  geom_point(mapping = aes (x = displ, y = hwy)) +
  facet_wrap (~class, nrow = 3)

# 3 Facets dos variables
ggplot( data = mpg) +
  geom_point(mapping = aes (x = displ, y = hwy)) +
  facet_grid (drv ~ cyl)

#4 variando con geom_smooth
ggplot( data = mpg) +
  geom_smooth(mapping = aes (x = displ, y = hwy))

#5 variando con tipos de linea
ggplot( data = mpg) +
  geom_smooth(mapping = aes (x = displ, y = hwy, linetype = drv))
