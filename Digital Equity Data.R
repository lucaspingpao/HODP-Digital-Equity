# Lucas Pao, ...
# Digital Equity

library(stringr)

# Make sure to reset your working directory to HODP-Digital-Equity
# setwd("~/Desktop/HODP-Digital-Equity")
data <- read.csv("digital equity.csv")
names <- colnames(digitalEquityData); names
colnames(data)[2] <- "Email"
colnames(data)[3] <- "Name"
colnames(data)[4] <- "Organization"
colnames(data)[5] <- "Types.of.services"
colnames(data)[6] <- "Clients.require.internet"
colnames(data)[7] <- "Clients.require.device"
colnames(data)[8] <- "Sufficient.internet"
colnames(data)[21] <- "Number.of.clients"

# Section 1 ---------------------------------------------------------------

section1 <- data[c(1:8, 21)]
as.numeric(section1$"Number.of.clients")

serviceTypes <- c(
  "Adult Education",
  "Arts and Culture",
  "Community, Economic Development, Workfoce",
  "Education (K-12)",
  "Homelessness",
  "Human Services/Mental Health",
  "Policy & Advocacy",
  "Other"
); serviceTypes

serviceTypesValues <- 1:length(serviceTypes); serviceTypesValues
for(i in 1:length(serviceTypes)) {
  serviceTypesValues[i] <- nrow(subset(section1, str_detect(section1$"Types.of.services", serviceTypes[i])))
}

internet <- c("Yes", "No", "I'm not sure")
internetValues <- 1:length(internet); internetValues
for(i in 1:length(internet)) {
  internetValues[i] <- nrow(subset(section1, str_detect(section1$"Clients.require.internet", internet[i])))
}

device <- c("Yes", "No", "I'm not sure")
deviceValues <- 1:length(device); internetValues
for(i in 1:length(device)) {
  deviceValues[i] <- nrow(subset(section1, str_detect(section1$"Clients.require.device", device[i])))
}

sufficient <- c("All", "Most", "Some", "None")
sufficientValues <- 1:length(sufficient); sufficientValues
for(i in 1:length(sufficient)) {
  sufficientValues[i] <- nrow(subset(section1, str_detect(section1$"Sufficient.internet", sufficient[i])))
}

##################################################
# Plots
barplot(height=serviceTypesValues, names.arg=serviceTypes, las=2, main="What type of services does your organization provide?", ylab="Frequency")
barplot(height=internetValues, names.arg=internet, las=2, main="Are you providing services that require that your clients use the internet?", ylab="Frequency")
barplot(height=deviceValues, names.arg=device, las=2, main="Are you providing services that require that your clients to use a digital device (computer, tablet, smart phone)?", ylab="Frequency")
barplot(height=sufficientValues, names.arg=sufficient, las=2, main="Do your clients have sufficient internet connectivity to access services and obtain essentials?", ylab="Frequency")
##################################################



# Random data cleaning?
adultEducation <- subset(section1, str_detect(section1$"Types.of.services", "Adult Education")); head(adultEducation)
artsAndCulture <- subset(section1, str_detect(section1$"Types.of.services", "Arts and Culture")); head(artsAndCulture)
educationK12 <- subset(section1, str_detect(section1$"Types.of.services", "Education (K-12)")); head(educationK12)
homelessness <- subset(section1, str_detect(section1$"Types.of.services", "Homelessness")); head(homelessness)
humanServices <- subset(section1, str_detect(section1$"Types.of.services", "Human Services")); head(humanServices)
policy <- subset(section1, str_detect(section1$"Types.of.services", "Policy")); head(policy)
other <- subset(section1, str_detect(section1$"Types.of.services", "Other")); head(other)

internetYes <- subset(section1, str_detect(section1$"Clients.require.internet", "Yes")); head(internetYes)
internetNo <- subset(section1, str_detect(section1$"Clients.require.internet", "No")); head(internetNo)
internetMaybe <- subset(section1, str_detect(section1$"Clients.require.internet", "I")); head(internetMaybe)

deviceYes <- subset(section1, str_detect(section1$"Clients.require.device", "Yes")); head(deviceYes)
deviceNo <- subset(section1, str_detect(section1$"Clients.require.device", "No")); head(deviceNo)
deviceMaybe <- subset(section1, str_detect(section1$"Clients.require.device", "I")); head(deviceMaybe)

sufficientAll <- subset(section1, str_detect(section1$"Sufficient.internet", "All")); head(sufficientAll)
sufficientMost <- subset(section1, str_detect(section1$"Sufficient.internet", "Most")); head(sufficientMost)
sufficientSome <- subset(section1, str_detect(section1$"Sufficient.internet", "Some")); head(sufficientSome)
sufficientNone <- subset(section1, str_detect(section1$"Sufficient.internet", "None")); head(sufficientNone)
sufficientIdk <- subset(section1, str_detect(section1$"Sufficient.internet", "I")); head(sufficientAll)


# Section 2 ---------------------------------------------------------------


