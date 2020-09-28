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
  "Community, Economic Development, Workforce",
  "Education ",
  "Homelessness",
  "Human Services/Mental Health",
  "Policy & Advocacy",
  "Other"
); serviceTypes

serviceTypesValues <- 1:length(serviceTypes); serviceTypesValues
for(i in 1:length(serviceTypes)) {
  serviceTypesValues[i] <- nrow(subset(section1, str_detect(section1$"Types.of.services", serviceTypes[i])))
}
serviceTypes[3] <- "Community, \n Workforce, etc."
serviceTypes[4] <- "Education (K-12)"
serviceTypes[6] <- "Human Services/ \n Mental Health"

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
png(file="~/Desktop/HODP-Digital-Equity/section1_Services_Barplot.png", width=1000, height=500)
barplot(height=serviceTypesValues, names.arg=serviceTypes, las=1, ylim=c(0,20), ylab="Frequency",
        main="What type of services does your organization provide?")
dev.off()

png(file="~/Desktop/HODP-Digital-Equity/section1_Internet_Barplot.png")
barplot(height=internetValues, names.arg=internet, las=1, ylim=c(0, 50), ylab="Frequency",
        main="Are you providing services that require \n that your clients use the internet?")
dev.off()

png(file="~/Desktop/HODP-Digital-Equity/section1_Device_Barplot.png")
barplot(height=deviceValues, names.arg=device, las=1, ylim=c(0, 50), ylab="Frequency",
        main="Are you providing services that require that \n your clients to use a digital device \n (computer, tablet, smart phone)?")
dev.off()

png(file="~/Desktop/HODP-Digital-Equity/section1_Sufficient_Barplot.png")
barplot(height=sufficientValues, names.arg=sufficient, las=1, ylim=c(0, 50), ylab="Frequency",
        main="Do your clients have sufficient internet connectivity \n to access services and obtain essentials?")
dev.off()
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


