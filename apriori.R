install.packages('arules')
library(arules)

t = read.csv("transaction.csv")
head(t)

# spliting by transaction ID
tlist <- split(t$item, t$TID)
head(tlist)

# arules' transaction format
trans <- as(tlist, "transactions")
trans

# rules
rules <- apriori(trans, parameter = list(supp=.001 , conf = .8))

# inspect rules
rules.sorted <- sort(rules, by="lift")
inspect((rules.sorted)[1:5])

# redundant rules
redundant = is.redundant(rules)
rules[!redundant]
inspect(rules[!redundant])


