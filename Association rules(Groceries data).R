
groceries<-read.transactions(file.choose(),format="basket")
View(groceries)
head(groceries)

# Data exploration
class(groceries)
summary(groceries)
str(groceries)


library(arules)
library(arulesViz)

# 1st trial of aprioiri algorithm
groceries_rules<-apriori(groceries,parameter = list(support = 0.05,confidence = 0.3,minlen=2))
inspect((groceries_rules))

#  2nd trail
groceries_rules1<-apriori(groceries,parameter = list(support = 0.1,confidence = 0.5,minlen=2))
inspect((groceries_rules1))

#  3rd trail
groceries_rules2<-apriori(groceries,parameter = list(support = 0.2,confidence = 0.7,minlen=2))
inspect((groceries_rules))

# Changing minlen
groceries_rules3 <- apriori(groceries,parameter = list(support = 0.2,confidence = 0.7,minlen=3))
inspect((groceries_rules3))

# itemFrequencyPlot can be applicable only for transaction data 
# count of each item from all the transactions 
itemFrequencyPlot(items(groceries_rules2),topN=5)

plot(groceries_rules2,method = "scatterplot")
plot(groceries_rules2,method = "grouped")
plot(groceries_rules2,method = "graph")

#Sorting rules by confidence 
rules_conf <- sort(groceries_rules2,by="confidence")
inspect(rules_conf)

# Sorting rules by lift ratio
rules_lift <- sort(groceries_rules2,by="lift")

inspect(rules_lift[1:4])
