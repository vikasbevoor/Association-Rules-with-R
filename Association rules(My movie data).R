movie<- read.csv(file.choose())
View(movie)

movies <- movie[-c(1:5)]
View(movies)

# Data exploration
str(movies)

# Association Rules 

library(arules)
library(arulesViz)

# count of each item from all the transactions 
barplot(sapply(movies,sum),col=1:10)

# Applying apriori algorithm to get relevant rules
# Trial 1
rules <- apriori(as.matrix(movies),parameter = list(support=0.1,confidence=0.3,minlen=2))
inspect(head(rules))

# Trial 2
rules1 <- apriori(as.matrix(movies),parameter = list(support=0.3,confidence=0.5,minlen=2))
inspect(head(rules1))

# Trial 3
rules2 <- apriori(as.matrix(movies),parameter = list(support=0.5,confidence=0.7,minlen=2))
inspect(head(rules2))

# Changing minlen to 3
rules3 <- apriori(as.matrix(movies),parameter = list(support=0.2,confidence=0.5,minlen=3))
inspect(head(rules3))

# Sorting rules by confidence 
rules_conf <- sort(rules2,by="confidence")
inspect(rules_conf)

# Sorint rules by lift ratio
rules_lift <- sort(rules2,by="lift")
inspect(rules_lift)


# Visualizing rules in scatter plot
plot(rules2,method = "graph")
plot(rules2,method = "scatterplot", jitter=0)
plot(rules2,method = "grouped")



