# Example. Replication of results in Simar and Wilson (1998, p.59) 
# Fuente: https://cran.r-project.org/web/packages/deaR/deaR.pdf

library(deaR)

data("Electric_plants")
data_example <- make_deadata(Electric_plants,
                             dmus = 1,
                             ni = 3,
                             no = 1)
result <- model_basic(data_example,
                      orientation = "io",
                      rts = "vrs")
efficiencies(result)


# Ejemplo inspirado en la eficiencia de los municipios 
# en la provisión de servicios municipales. 

municipios <- data.frame(
  Municipio = paste0("Mpio_", 1:10),
  Suelos = c(10032000, 9160000, 11950000, 8620000, 11920000, 7370000, 10890000, 9600000, 8060000, 11340000),
  Gasto_corriente = c(25840000, 20750000, 29200000, 21720000, 28780000, 17120000, 26680000, 24760000, 18800000, 27710000),
  Luminarias = c(1650, 2770, 4240, 2860, 3780, 2370, 3760, 3060, 890, 2950),
  Basura_recolectada = c(1900, 11400, 13500, 11200, 13200, 9500, 12100, 11800, 8400, 11800),
  Intervenciones_policia = c(105, 133, 168, 138, 150, 100, 140, 145, 120, 101)
)


# Preparar los datos
data_dea <- make_deadata(
  datadea = municipios,
  dmus = 1, # Columna 1 de municipios
  inputs = c(2, 3), # Suelos y gasto corriente
  outputs = c(4, 5, 6) # Luminarias, recolección de basura e intervenciones de la policía
)

# DEA con orientación a insumos y rendimientos variables
resultado <- model_basic(
  data_dea,
  orientation = "io",
  rts = "vrs"
)
# "io" significa que el modelo está orientado a insumos, es decir, 
# busca minimizar los insumos manteniendo los niveles de productos.
# "vrs" significa que se asume rendimientos variables a escala 

# Resultado de mppios con mayor eficiencia
efficiencies(resultado)
# Una puntuación de 1 indica que el municipio es eficiente en el uso de sus recursos para generar servicios.
# Una puntuación menor a 1 indica que el municipio es ineficiente y tiene margen para mejorar.

