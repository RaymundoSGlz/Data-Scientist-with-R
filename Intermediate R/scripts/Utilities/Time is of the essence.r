# Utiliza as.Date() para convertir el vector astro en un vector
# que contenga objetos Date.
# Necesitarás los símbolos %d, %b y %Y para especificar el formato.
# Almacena el vector resultante como astro_dates.
# Utiliza as.Date() para convertir el vector meteo en un vector
# con objetos Date.
# Esta vez, necesitarás los símbolos %B, %d y %y para el argumento de formato.
# Almacena el vector resultante como meteo_dates.
# Con una combinación de max(), abs() y -,
# calcula la diferencia absoluta máxima entre el inicio astronómico
# y el inicio meteorológico de una estación, es decir,
# astro_dates y meteo_dates.
astro <- setNames(
    as.Date(c(
        "20-Mar-2015", "25-Jun-2015",
        "23-Sep-2015", "22-Dec-2015"
    ), format = "%d-%b-%Y"),
    c("spring", "summer", "fall", "winter")
)
meteo <- setNames(
    as.Date(c(
        "March 1, 15", "June 1, 15",
        "September 1, 15", "December 1, 15"
    ), format = "%B %d, %y"),
    c("spring", "summer", "fall", "winter")
)


# Convert astro to vector of Date objects: astro_dates
astro_dates <- as.Date(astro, format = "%d-%b-%Y")

# Convert meteo to vector of Date objects: meteo_dates
meteo_dates <- as.Date(meteo, format = "%B %d, %y")

# Calculate the maximum absolute difference between astro_dates and meteo_dates
max(abs(astro_dates - meteo_dates))
