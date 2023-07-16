# Usando la función seq(), crea una secuencia que vaya desde 1 hasta 500
# en incrementos de 3.
# Asigna el vector resultante a una variable llamada seq1.
# Nuevamente con la función seq(), crea una secuencia desde 1200 hasta 900
# en decrementos de -7. Asigna la secuencia a una variable llamada seq2.
# Calcula la suma total de las secuencias,
# ya sea usando la función sum() dos veces y sumando los dos resultados,
# o concatenando las secuencias y usando la función sum() una vez.
# Imprime el resultado en la consola.


# Create first sequence: seq1
seq1 <- seq(1, 500, 3)

# Create second sequence: seq2
seq2 <- seq(1200, 900, -7)

# Calculate total sum of the sequences
sum(c(seq1, seq2))
