library(gdata)
# Agregar código para leer los datos de la tercera hoja en "urbanpop.xls".
# Quieres terminar con tres dataframes:
# urban_sheet1, urban_sheet2 y urban_sheet3.

# Extienda la llamada cbind () para que también incluya urban_sheet3.
# Asegúrese de que la primera columna de urban_sheet2 y urban_sheet3
# se elimine, para que no tenga columnas duplicadas.
# Almacene el resultado en urban.

# Utilice na.omit () en el dataframe urban
# para eliminar todas las filas que contengan valores NA.
# Almacene el dataframe limpio como urban_clean.

# Imprima un resumen de urban_clean y afirme que no hay más valores NA.

# Add code to import data from all three sheets in urbanpop.xls
path <- file.path("data", "urbanpop.xls")
urban_sheet1 <- read.xls(path, sheet = 1, stringsAsFactors = FALSE)
urban_sheet2 <- read.xls(path, sheet = 2, stringsAsFactors = FALSE)
urban_sheet3 <- read.xls(path, sheet = 3, stringsAsFactors = FALSE)

# Extend the cbind() call to include urban_sheet3: urban
urban <- cbind(urban_sheet1, urban_sheet2[-1], urban_sheet3[-1])

# Remove all rows with NAs from urban: urban_clean
urban_clean <- na.omit(urban)

# Print out a summary of urban_clean
summary(urban_clean)
