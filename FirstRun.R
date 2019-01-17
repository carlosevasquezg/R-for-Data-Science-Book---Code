
library(tidyverse)
mpg
# puedo ejecutar ?mpg para ver toda la documentacion

ggplot( data = mpg) +
  geom_point(mapping = aes (x = displ, y = hwy))
