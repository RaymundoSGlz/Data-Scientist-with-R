library(gdata)
# Finalizar la llamada read.xls () que lee los datos de la segunda hoja
# de urbanpop.xls: omita las primeras 50 filas de la hoja.
# Asegúrese de configurar el encabezado de manera apropiada
# y de que los nombres de los países no se importen como factores.
# Imprima las primeras 10 observaciones de urban_pop con head ().

# The gdata package is alreaded loaded

# Column names for urban_pop
columns <- c("country", paste0("year_", 1967:1974))

# Finish the read.xls call
urban_pop <- read.xls("data/urbanpop.xls",
  sheet = 2,
  skip = 50, header = FALSE, stringsAsFactors = FALSE,
  col.names = columns
)

# Print first 10 observation of urban_pop
head(urban_pop, 10)
