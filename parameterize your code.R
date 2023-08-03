with(Hanoi, plot(time, temperature, type = "l", col = "red"))
with(HCMC, lines(time, temperature, col = "blue"))

with(Hanoi, plot(time, rainfall, type = "l", col = "red"))
with(HCMC, lines(time, rainfall, col = "blue"))



col_Hanoi <- "red"
col_HCMC <- "green"

with(Hanoi, plot(time, temperature, type = "l", col = col_Hanoi))
with(HCMC, lines(time, temperature, col = col_HCMC))

with(Hanoi, plot(time, rainfall, type = "l", col = col_Hanoi))
with(HCMC, lines(time, rainfall, col = col_HCMC))










