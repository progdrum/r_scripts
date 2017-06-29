library(arules)
library(arulesViz)

# Get some itemsets
itemsets <- apriori(questions_only, 
                    parameter = list(target = "frequent", minlen = 2))
itemsets.sorted <- sort(itemsets)
inspect(head(itemsets.sorted, 10))
inspect(tail(itemsets.sorted, 10))

# Get some rules
rules <- apriori(questions_only, parameter = list(conf = 0.9, supp = 0.1))
plot(rules)
rules.sorted <- sort(rules, by = "lift")
inspect(head(rules.sorted))
inspect(tail(rules.sorted))
