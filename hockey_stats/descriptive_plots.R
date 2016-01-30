# Descriptive plotting commands

qplot(Games.total, GFGA.ratio, data = all.years.final, 
      geom = c("line", "smooth"), xlab = "Games Played", 
      ylab = "GF/GA Ratio", main = "Colorado Avalanche Goal Ratio for Seasons Ending 2013-2016")

qplot(Games.total, W.pct, data = all.years.wins, 
      geom = c("line", "smooth"), xlab = "Games Played", 
      ylab = "Win %", main = "Colorado Avalanche Win Percentage for Seasons Ending 2013-2016")
