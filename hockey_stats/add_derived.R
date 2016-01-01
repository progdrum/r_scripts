# Add derived fields to already-cleaned-up hockey data

# Function takes a data frame of cleaned-up data and adds a number of 
# fields derived from existing fields.

add.derived <- function(clean.data) {
  mutate(clean.data,
         W.dev = sd(W),
         L.dev = sd(L),
         GF.avg = mean(Tm),
         GA.avg = mean(Opp),
         GFGA.ratio = sum(Tm) / sum(Opp),
         W.pct = sum(W) / sum(L))
}
