data <- read.csv("/Users/EthanLee/Desktop/Clubs/HODP/HODP-Digital-Equity/digital equity.csv")

serviceTypes <- c(
  "Adult Education",
  "Arts and Culture",
  "Community, Economic Development, Workforce",
  "Education ",
  "Homelessness",
  "Human Services/Mental Health",
  "Policy & Advocacy",
  "Other"
)

typesInOrder <- rep(serviceTypes, nrow(data))
internetPerType <- rep(NA, 8*nrow(data))
devicePerType <- rep(NA, 8*nrow(data))
data$Are.you.providing.services.that.require.that.your.clients.use.the.internet. <- as.factor(data$Are.you.providing.services.that.require.that.your.clients.use.the.internet.)
data$Are.you.providing.services.that.require.that.your.clients.to.use.a.digital.device..computer..tablet..smart.phone.. <- as.factor(data$Are.you.providing.services.that.require.that.your.clients.to.use.a.digital.device..computer..tablet..smart.phone..)


for(i in 1:nrow(data)){
  temp <- as.character(data$Are.you.providing.services.that.require.that.your.clients.use.the.internet.[i])
  tempDevice <- as.character(data$Are.you.providing.services.that.require.that.your.clients.to.use.a.digital.device..computer..tablet..smart.phone..[i])
  print(temp)
  for(j in 1:length(serviceTypes)){
    if(grepl(serviceTypes[j], data$What.type.of.services.does.your.organization.provide...Please.select.all.that.apply.[i], fixed = TRUE)){
      internetPerType[(i-1)*8+j] <- temp
    }
    if(grepl(serviceTypes[j], data$What.type.of.services.does.your.organization.provide...Please.select.all.that.apply.[i], fixed = TRUE)){
      devicePerType[(i-1)*8+j] <- tempDevice
    }
  }
}

print(internetPerType)

groupedTypes <- cbind(typesInOrder, internetPerType)
cleanGroupedTypes <- na.omit(groupedTypes)
print(table(cleanGroupedTypes[,1], cleanGroupedTypes[,2]))

groupedTypesDevice <- cbind(typesInOrder, devicePerType)
cleanGroupedTypesDevice <- na.omit(groupedTypesDevice)
print(table(cleanGroupedTypesDevice[,1], cleanGroupedTypesDevice[,2]))

barplot(table(cleanGroupedTypes[,2], cleanGroupedTypes[,1]), main="Are You Providing Services that Require Your Clients to Use the Internet?",
        xlab="Service Type", col=c("#78C4D4","#FA9E1C", "#EE3838"),
        legend = rownames(table(cleanGroupedTypes[,2], cleanGroupedTypes[,1])), beside=TRUE)

barplot(table(cleanGroupedTypesDevice[,2], cleanGroupedTypesDevice[,1]), main="Are You Providing Services that Requires Your Clients to Use a Digital Device?",
        xlab="Service Type", col=c("#FA9E1C", "#EE3838"),
        legend = rownames(table(cleanGroupedTypesDevice[,2], cleanGroupedTypesDevice[,1])), beside=TRUE)

