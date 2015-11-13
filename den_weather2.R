den_airport <- getWeatherForYear("DEN", 2015)

p <- ggplot(data = den_airport) + 
  scale_color_manual(name = "Extremes", values = c("red", "blue")) + 
  geom_point(aes(x = Date, y = Max_TemperatureF, color = "High")) + 
  geom_smooth(aes(x = Date, y = Max_TemperatureF), method = "loess") + 
  geom_point(aes(x = Date, y = Min_TemperatureF, color = "Low")) + 
  geom_smooth(aes(x = Date, y = Min_TemperatureF), method = "loess") + 
  scale_y_continuous("Temperature")

ggplotly(p)
