den_airport <- getWeatherForYear("DEN", 2015)

p <- ggplot(data = den_airport) + 
  scale_shape_manual(name = "Extremes", values = c(2, 7)) + 
  geom_point(aes(x = Date, y = Max_TemperatureF, shape = "High")) + 
  geom_smooth(aes(x = Date, y = Max_TemperatureF), method = "loess") + 
  geom_point(aes(x = Date, y = Min_TemperatureF, shape = "Low")) + 
  geom_smooth(aes(x = Date, y = Min_TemperatureF), method = "loess") + 
  scale_y_continuous("Temperature")

ggplotly(p)
