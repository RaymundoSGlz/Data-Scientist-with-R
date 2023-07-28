library(XLConnect)
# Usar writeWorksheet() para poblar la hoja
# "data_summary" con el dataframe summ.
# Llamar a saveWorkbook() para almacenar el libro de trabajo de Excel
# adaptado como un nuevo archivo, "summary.xlsx".

# XLConnect is already available

# Build connection to urbanpop.xlsx
my_book <- loadWorkbook("data/urbanpop.xlsx")

# Add a worksheet to my_book, named "data_summary"
createSheet(my_book, "data_summary")

# Create data frame: summ
sheets <- getSheets(my_book)[1:3]
dims <- sapply(sheets,
  function(x) dim(readWorksheet(my_book, sheet = x)),
  USE.NAMES = FALSE
)
summ <- data.frame(
  sheets = sheets,
  nrows = dims[1, ],
  ncols = dims[2, ]
)

# Add data in summ to "data_summary" sheet
writeWorksheet(my_book, summ, "data_summary")

# Save workbook as summary.xlsx
saveWorkbook(my_book, "data/summary.xlsx")
