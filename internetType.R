source('styleguide.R')
library(ggplot2)
library(plyr)
library(dplyr)

data <- read.csv("data.csv")
internetType <- c()
for (row in 1:nrow(data)) {
  internetType <- append(internetType, 
                         unlist(strsplit(as.character(data[row,'InternetType']), ", ")))
}

categorized <- revalue(internetType, c("No internet or cell phone data"=1,
                        "Cell phone data only"=2,
                        "Hotspot"=3,
                        "Comcast Internet Essentials (discounted plan)"=4,
                        "Comcast Internet (traditional fully priced plan like Xfinity)"=5,
                        "Starry"=6,
                        "Verizon"=7,
                        "Public wifi (xfinitywifi) or a neighbor's wifi"=8,
                        "I don't know"=9
                        ))

category <- c("1","2","3","4","5","6","7","8","9")
categorized <- categorized[categorized %in% category]

# counts
a <- ggplot(data=data.frame(categorized), aes(x=categorized)) +
  labs(title="Types of Internet Connection") +
  geom_bar() + 
  xlab("Type") +
  ylab("Count") +
  theme(legend.position="bottom") + 
  scale_x_discrete(breaks=c("1","2","3","4","5","6","7","8","9"),
                   labels=c("No internet or cell phone data",
                            "Cell phone data only",
                            "Hotspot",
                            "Comcast Internet Essentials",
                            "Comcast Internet",
                            "Starry",
                            "Verizon",
                            "Public wifi (xfinitywifi) or a neighbor's wifi",
                            "I don't know"
                   )) + 
  theme(axis.text.x = element_text(size=10,  family="Helvetica",angle = 65, hjust = 1))
  # theme_hodp() 
a

# Add logo
grid::grid.raster(logo, x = 0.01, y = 0.01, just = c('left', 'bottom'), width = unit(2, 'cm'))
ggplotly(a)
