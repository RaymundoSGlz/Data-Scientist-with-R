x <- seq(-10, 10, by = 0.2)
p <- seq(0.001, 0.999, by = 0.001)
# - Examine la estructura de la función `binomial()`.
## *Observe que contiene dos elementos que son funciones,
## * `binomial()$linkinv`*, y* `binomial()$linkfun`.
# - Llame a `binomial()$linkinv()` en `x`, asignando a `linkinv_x`.
# - Compruebe que `linkinv_x` y `plogis()`
## de `x` dan los mismos resultados con `all.equal()`.
# - Llame a `binomial()$linkfun()` en `p`, asignando a `linkfun_p`.
# - Compruebe que `linkfun_p` y `qlogis()` de `p` dan los mismos resultados.

# Look at the structure of binomial() function
str(binomial())

# Call the link inverse on x
linkinv_x <- binomial()$linkinv(x)

# Check linkinv_x and plogis() of x give same results
all.equal(linkinv_x, plogis(x))

# Call the link fun on p
linkfun_p <- binomial()$linkfun(p)

# Check linkfun_p and qlogis() of p give same results
all.equal(linkfun_p, qlogis(p))
