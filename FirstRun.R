
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
  geom_smooth(mapping = aes (x = displ, y = hwy, linetype = drv)) +
  geom_point(mapping = aes (x = displ, y = hwy, color = drv))

#6 una forma mas eficiente y elegante sin repetir los ejes 
ggplot( data = mpg, mapping = aes(x = displ, y = hwy))  +
  geom_smooth() +
  geom_point()

#7 diferenciando capas 
ggplot( data = mpg, mapping = aes(x = displ, y = hwy))  +
  geom_smooth(mapping =  aes(color = class)) +
  geom_point()

#8 diferenciando capas, esta ves invertido al de arriba 
ggplot( data = mpg, mapping = aes(x = displ, y = hwy))  +
  geom_point(mapping =  aes(color = class, size = 10)) +
  geom_smooth()

# 9 se puede usar filtro en cada geom
ggplot( data = mpg, mapping = aes(x = displ, y = hwy))  +
  geom_point(mapping =  aes(color = class, size = 5)) +
  geom_smooth(
    data = filter(mpg, class == "subcompact"),size =2,
    se = FALSE
  )

# 10 size normal de lineas x defecto
ggplot( data = mpg, mapping = aes(x = displ, y = hwy))  +
  geom_point(mapping =  aes(color = class)) +
  geom_smooth(
    data = filter(mpg, class == "subcompact"),
    se = FALSE
  )


# ========== Graficas de Barras  barras ================
# diamonds, dataset con mas de 53000 diamantes
# ======================================================

diamonds

# 1
ggplot(data = diamonds) +
  geom_bar(mapping = aes (x = cut))

#2 con mediana
ggplot(data = diamonds) +
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.ymin = min,
    fun.ymax = max,
    fun.y = median
  )

#3 con colores en los bordes
ggplot( data = diamonds) +
  geom_bar(mapping = aes (x = cut, color = cut))

#4 con colores en el llenado
ggplot( data = diamonds) +
  geom_bar(mapping = aes (x = cut, fill = cut))

#5 con colores en el llenado y stacked
ggplot( data = diamonds) +
  geom_bar(mapping = aes (x = cut, fill = clarity))

#6 uso de jitter
ggplot (data = mpg) +
  geom_point( aes (x = displ, y = hwy, size = 1),
  position = "jitter"
  )

# 7 uso de coord_flip() para intercambiar ejes
ggplot (data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot()

# 7.1 uso de coord_flip() para intercambiar ejes
ggplot (data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot() +
  coord_flip()

# 8 con maps
# install.packages("maps")
library(maps)
pais <- map_data("nz")
pais

# default
ggplot(pais, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", color = "black")

# con ajuste
ggplot(pais, aes(long, lat, group = group)) +
  geom_polygon(fill = "white", color = "black") +
  coord_quickmap()




  





