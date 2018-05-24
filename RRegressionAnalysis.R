install.packages("car")
install.packages("ggplot2")
install.packages("MASS")
library(car)
library(ggplot2) # Library to create some nice looking graphs.
library(MASS) # Library for our box-cox transform down the end.
help(Prestige)
lregression<-lm(prestige~education+log2(income)+women, data=Prestige)
summary(lregression)
ls(lregression)
names(lregression)
dim(lregression)
head(Prestige,5)
newdata=Prestige[,c(1:2)]
summary(newdata)
qplot(education, data = newdata, geom="histogram", binwidth=1) + labs(title = "Historgram of Average Years of Education") +
  labs(x ="Average Years of Education") + labs(y = "Frequency") + scale_y_continuous(breaks = c(1:20), minor_breaks = NULL) +
  scale_x_continuous(breaks = c(6:16), minor_breaks = NULL) + geom_vline(xintercept = mean(newdata$education), show_guide=TRUE, color="red", labels="Average") + geom_vline(xintercept = median(newdata$education), show_guide=TRUE, color="blue", labels="Median")
# Just proper script
# Histogram for variable 'Education': 
qplot(education, data = newdata, geom="histogram", binwidth=1) +
  labs(title = "Historgram of Average Years of Education") +
  labs(x ="Average Years of Education") +
  labs(y = "Frequency") +
  scale_y_continuous(breaks = c(1:20), minor_breaks = NULL) +
  scale_x_continuous(breaks = c(6:16), minor_breaks = NULL) +
  geom_vline(xintercept = mean(newdata$education), show_guide=TRUE, color="red", labels="Average") +
  geom_vline(xintercept = median(newdata$education), show_guide=TRUE, color="blue", labels="Median")

# Histogram of the variable Income.
qplot(income, data = newdata, geom="histogram", binwidth=1000) +
  labs(title = "Historgram of Average Income") +
  labs(x ="Average Income") +
  labs(y = "Frequency") +
  scale_y_continuous(breaks = c(1:20), minor_breaks = NULL) +
  scale_x_continuous(breaks = c(0, 2000, 4000, 6000, 8000, 10000, 12000, 14000, 16000, 18000, 20000, 22000, 24000, 26000), minor_breaks = NULL) +
  geom_vline(xintercept = mean(newdata$income), show_guide=TRUE, color="red", labels="Average") +
  geom_vline(xintercept = median(newdata$income), show_guide=TRUE, color="blue", labels="Median")
