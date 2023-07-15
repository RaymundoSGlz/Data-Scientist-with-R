# Agrega un argumento opcional llamado print_info, que es TRUE por defecto.
# Envuelve una estructura if alrededor de la función print():
# esta función solo debe ejecutarse si print_info es TRUE.
# Siéntete libre de experimentar con la función pow_two().

# Finish the pow_two() function
pow_two <- function(x, print_info = TRUE) {
    y <- x ^ 2
    if (print_info) {
        print(paste(x, "to the power two equals", y))
    }
    return(y)
}
