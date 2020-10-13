book<- read.csv(file.choose())

View(book)
attach(book)

summary(book)
str(book)

# Association Rules 

library(arules)
library(arulesViz)

# count of each item from all the transactions 
barplot(sapply(book,sum),col=1:11)

# Applying apriori algorithm to get relevant rules
# Trial 1
rules <- apriori(as.matrix(book),parameter = list(support=0.05,confidence=0.3,minlen=2))
inspect(head(rules))

# Trial 2
rules1 <- apriori(as.matrix(book),parameter = list(support=0.1,confidence=0.5,minlen=2))
inspect(head(rules1))

# Trail 3
rules2 <- apriori(as.matrix(book),parameter = list(support=0.1,confidence=0.7,minlen=2))
inspect(head(rules2))

# Changing the value of minlen
rules3 <- apriori(as.matrix(book),parameter = list(support=0.1,confidence=0.7,minlen=3))
inspect(head(rules3))


# Sorting rules by confidence 
rules_conf <- sort(rules2,by="confidence")
inspect(rules_conf[1:4])

# Sorint rules by lift ratio
rules_lift <- sort(rules2,by="lift")
inspect(rules_lift[1:4])

# Visualizing rules in scatter plot
plot(rules2,method = "graph")
plot(rules2,method = "scatterplot")
plot(rules2,method = "grouped")



