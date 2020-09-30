source('styleguide.R')
library(ggplot2)
library(plyr)
library(dplyr)

data <- read.csv("data.csv")
internetIssues <- c()
for (row in 1:nrow(data)) {
  internetIssues <- append(internetIssues, 
                         unlist(strsplit(as.character(data[row,'InternetIssues']), ", ")))
}
internetIssues
categorized <- revalue(internetIssues, 
                       c("Data caps/limited data plan (hotspot or smart phones with data limits)"=1,
                        "Slow internet speed (applications freeze downloads and uploads take too long...etc.)"=2,
                        "Intermittent or sporadic connection (cuts in and out)"=3
                        ))

category <- c("1","2","3")
categorized <- categorized[categorized %in% category]

# counts
a <- ggplot(data=data.frame(categorized), aes(x=categorized)) +
  scale_fill_manual(values=c("#0015bc")) +
  labs(title="Issues with Internet") +
  geom_bar() + 
  xlab("Issues") +
  ylab("Count") +
  theme(legend.position="bottom") + 
  scale_x_discrete(breaks=c("1","2","3"),
                   labels=c("Data caps/limited data plan",
                            "Slow internet speed ",
                            "Intermittent or sporadic connection"
                   )) + 
  theme(axis.text.x = element_text(size=10,  family="Helvetica"))
  # theme_hodp() 
a

# Add logo
grid::grid.raster(logo, x = 0.01, y = 0.01, just = c('left', 'bottom'), width = unit(2, 'cm'))
ggplotly(a)
