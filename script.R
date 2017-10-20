setwd("E:\\Nimesh.Chaturedi\\Desktop\\Nimesh\\R Tutorial edx\\Clustering\\Lancome-City")

# Read in the dataset  data 19th Sep 2017 - 18 Oct 2017
GaData = read.csv("data.csv")

# Look at summary
summary(GaData)
str(GaData)

TaiwanCityClust = hclust(dist(GaData[-1]))

plot(TaiwanCityClust, labels = GaData$City)

rect.hclust(TaiwanCityClust,4)

#################################################################################################
# Compute distances
distances = dist(GaData, method = "euclidean")

# Hierarchical clustering
clusterCities = hclust(distances, method = "ward.D")

# Plot the dendrogram
plot(clusterCities, labels = GaData$City)
rect.hclust(clusterCities,4)

# Assign points to clusters
clusterGroups = cutree(clusterCities, k = 4)

tapply(GaData$Users, clusterGroups, mean)
tapply(GaData$NewUsers, clusterGroups, mean)
tapply(GaData$Sessions, clusterGroups, mean)
tapply(GaData$BounceRate, clusterGroups, mean)
tapply(GaData$PagesPerSession, clusterGroups, mean)
tapply(GaData$Transactions, clusterGroups, mean)
tapply(GaData$Revenue, clusterGroups, mean)
tapply(GaData$E_commerce_Conversion_Rate, clusterGroups, mean)

cluster1 = subset(GaData, clusterGroups==1)
cluster2 = subset(GaData, clusterGroups==2)
cluster3 = subset(GaData, clusterGroups==3)
cluster4 = subset(GaData, clusterGroups==4)

write.csv(cluster1, file = "cluster1.csv")
write.csv(cluster2, file = "cluster2.csv")
write.csv(cluster3, file = "cluster3.csv")
write.csv(cluster4, file = "cluster4.csv")
