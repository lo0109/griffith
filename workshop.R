setwd("/Users/swl/Documents/data-analysis")

emp.data <- data.frame (emp_id = c(1:5), emp_name = c("Rick","Dan","Michelle", "Rya", "Gary"), salary = c(623.3, 515.2, 611.0, 729.0, 843.25), start_date = as.Date(c("2012-01-01", "2013-09-23", "2014-11-15", "2014-05-11", "2015-03-27")), stringsAsFactors = FALSE)
emp.data$dept <- c("IT", "Operations", "IT", "HR", "Finance")
emp.newdata <- data.frame( emp_id = c(6:8), emp_name = c("Rasmi", "Pranab", "Tusar"), salary = c(578.0, 722.5, 632.8), start_date = as.Date(c("2013-05-21", "2013-07-30", "2014-06-17")), dept = c("IT", "Operations", "Finanace"), stringsAsFactors = FALSE)
emp.finaldata <- rbind(emp.data,emp.newdata)
emp.finaldata

mydata <- read.csv("Covid19_Europe_Sept21.csv", sep = ",", header = TRUE)
ggplot(data = mydata, mapping = aes (x = Population, y = Active.Cases)) + geom_point()
ggplot(data = mpg, mapping = aes(x=displ, y=hwy))+geom_point(mapping = aes(colour=class))
