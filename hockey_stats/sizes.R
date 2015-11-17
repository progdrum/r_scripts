library("XML")
library("ggplot2")

tables <- readHTMLTable("http://www.hockey-reference.com/teams/COL/2016.html")
roster <- tables$roster
roster$Ht <- as.character(roster$Ht)

# Convert the heights to inches for easier processing
ht.inches <- function(height) {
  splits <- strsplit(height, split = "-")
  splits.num <- lapply(splits, as.numeric)
  height.inches <- splits.num[[1]][1] * 12 + splits.num[[1]][2]
}

roster$Ht <- as.integer(lapply(roster$Ht, ht.inches))
roster$Wt <- as.numeric(levels(roster$Wt))[roster$Wt]

# Create the plot
size.plot <- ggplot(data = roster) + 
  geom_point(aes(x = roster$Wt, y = roster$Ht)) +  
  scale_y_continuous("Height (inches)", limits = c(65, 85)) + 
  scale_x_continuous("Weight (pounds)")

print(size.plot)
