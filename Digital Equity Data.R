# Lucas Pao, ...
# Digital Equity

library(stringr)

data <- read.csv("digital equity.csv")
names <- colnames(digitalEquityData); names


# Section 1 ---------------------------------------------------------------

adultEducation <- subset(data, str_detect(data$What.type.of.services.does.your.organization.provide...Please.select.all.that.apply., "Adult Education")); head(adultEducation)
artsAndCulture <- subset(data, str_detect(data$What.type.of.services.does.your.organization.provide...Please.select.all.that.apply., "Arts and Culture")); head(artsAndCulture)
educationK12 <- subset(data, str_detect(data$What.type.of.services.does.your.organization.provide...Please.select.all.that.apply., "Education")); head(educationK12)
homelessness <- subset(data, str_detect(data$What.type.of.services.does.your.organization.provide...Please.select.all.that.apply., "Homelessness")); head(homelessness)
humanServices <- subset(data, str_detect(data$What.type.of.services.does.your.organization.provide...Please.select.all.that.apply., "Human Services")); head(humanServices)
policy <- subset(data, str_detect(data$What.type.of.services.does.your.organization.provide...Please.select.all.that.apply., "Policy")); head(policy)
other <- subset(data, str_detect(data$What.type.of.services.does.your.organization.provide...Please.select.all.that.apply., "Other")); head(other)

internetYes <- subset(data, str_detect(data$Are.you.providing.services.that.require.that.your.clients.use.the.internet., "Yes")); head(internetYes)
internetNo <- subset(data, str_detect(data$Are.you.providing.services.that.require.that.your.clients.use.the.internet., "No")); head(internetNo)
internetMaybe <- subset(data, str_detect(data$Are.you.providing.services.that.require.that.your.clients.use.the.internet., "I")); head(internetMaybe)

deviceYes <- subset(data, str_detect(data$Are.you.providing.services.that.require.that.your.clients.to.use.a.digital.device..computer..tablet..smart.phone.., "Yes")); head(deviceYes)
deviceNo <- subset(data, str_detect(data$Are.you.providing.services.that.require.that.your.clients.to.use.a.digital.device..computer..tablet..smart.phone.., "No")); head(deviceNo)
deviceMaybe <- subset(data, str_detect(data$Are.you.providing.services.that.require.that.your.clients.to.use.a.digital.device..computer..tablet..smart.phone.., "I")); head(deviceMaybe)

sufficientAll <- subset(data, str_detect(data$Do.your.clients.have.sufficient.internet.connectivity.to.access.services.and.obtain.essentials., "All")); head(sufficientAll)
sufficientMost <- subset(data, str_detect(data$Do.your.clients.have.sufficient.internet.connectivity.to.access.services.and.obtain.essentials., "Most")); head(sufficientMost)
sufficientSome <- subset(data, str_detect(data$Do.your.clients.have.sufficient.internet.connectivity.to.access.services.and.obtain.essentials., "Some")); head(sufficientSome)
sufficientNone <- subset(data, str_detect(data$Do.your.clients.have.sufficient.internet.connectivity.to.access.services.and.obtain.essentials., "None")); head(sufficientNone)
sufficientIdk <- subset(data, str_detect(data$Do.your.clients.have.sufficient.internet.connectivity.to.access.services.and.obtain.essentials., "I")); head(sufficientAll)


# Section 2 ---------------------------------------------------------------


