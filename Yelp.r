# Yelp Data Scientist Assignment
#read data
b<-read.csv('/business.csv', header=TRUE,sep=",")
u<-read.csv('/users.csv', header=TRUE,sep=",")
r<-read.csv('/reviews.csv', header=TRUE,sep=",")

#count by days
r$day = factor(r$day);
count_by_days = summary(r$day);
sort(count_by_days);
bp = barplot(count_by_days, horiz=FALSE, names.arg=c("F", "M", "Sa", "Su", "Th", "Tu", "W"), cex.names=0.8, xlab = "Days", ylab = "Counts", axes = FALSE, col = rainbow(7))
text(bp, 0, count_by_days,cex=1,pos=3)

#add user type and make pie-chart
summary(u$review_count, na.rm = T)
u$type = "NULL"
u[u$review_count>=50,]$type = "high"
u[u$review_count<=5,]$type = "low"
u[(u$review_count>5 & u$review_count<50),]$type = "medium"
mean(b$review_count)
summary(factor(u$type))
lab = round(summary(factor(u$type))/sum(summary(factor(u$type))) * 100, 1)
lab = paste(lab, "%", sep="")
pie(summary(factor(u$type)), labels = lab, col = rainbow(3))
legend(1.5, 0.5, c("High", "Low", "Medium"), cex=0.8, fill=rainbow(3))

#day wise analysis
Saturday = r[r$day == "Saturday",]
x = b[b$business_id %in% Saturday$business_id, ]
y = u[u$user_id %in% Saturday$user_id, ]
mean(x$stars, na.rm = TRUE)
mean(x$review_count)
summary(as.factor(y$type))/dim(y)[1]
c = cat(x)
c$ecount/dim(x)[1] 
c$fcount/dim(x)[1] 
restaurants = regexpr("Restaurants", x[, "categories"], ignore.case=TRUE) != -1
summary(restaurants);

Wednesday = r[r$day == "Wednesday",]
x = b[b$business_id %in% Wednesday$business_id, ]
y = u[u$user_id %in% Wednesday$user_id, ]
mean(x$stars, na.rm = TRUE)
mean(x$review_count)
summary(as.factor(y$type))/dim(y)[1]
c = cat(x)
c$ecount/dim(x)[1] 
c$fcount/dim(x)[1] 
restaurants = regexpr("Restaurants", x[, "categories"], ignore.case=TRUE) != -1
summary(restaurants);

Monday = r[r$day == "Monday",]
x = b[b$business_id %in% Monday$business_id, ]
y = u[u$user_id %in% Monday$user_id, ]
mean(x$stars, na.rm = TRUE)
mean(x$review_count)
summary(as.factor(y$type))/dim(y)[1]
c = cat(x)
c$ecount/dim(x)[1] 
c$fcount/dim(x)[1]
restaurants = regexpr("Restaurants", x[, "categories"], ignore.case=TRUE) != -1
summary(restaurants);

Friday = r[r$day == "Friday",]
x = b[b$business_id %in% Friday$business_id, ]
y = u[u$user_id %in% Friday$user_id, ]
mean(x$stars, na.rm = TRUE)
mean(x$review_count)
summary(as.factor(y$type))/dim(y)[1]
c = cat(x)
c$ecount/dim(x)[1] 
c$fcount/dim(x)[1] 
restaurants = regexpr("Restaurants", x[, "categories"], ignore.case=TRUE) != -1
summary(restaurants);

rest = matrix(c(4310,3433,4612,3472, 4975,3586, 5010,3561),nr=2)
barplot(rest,beside= TRUE, col = rainbow(2),ylim=c(0,6500),names=c("S", "F", "M","W"))
legend(1,6500, c("Non-Restaurants","Restaurants"), pch=15, col = rainbow(2), bty="n")

#function to count number of reviews in food and entertainment categories.
cat = function(x)
{
fcount = 0 
ecount = 0   
for(i in 1:dim(x)[1])
{
str = strsplit(as.character(x$categories[i]), ' ; ')
if(("Food" %in% str[[1]]) | ("Restaurants" %in% str[[1]]) | ("Bar" %in% str[[1]]) | ("Pubs" %in% str[[1]]))
fcount = fcount +1

if(("Arts & Entertainment" %in% str[[1]]) | ("Nightlife" %in% str[[1]]) | ("Shopping" %in% str[[1]]) | ("Hotels & Travel" %in% str[[1]]))
ecount = ecount +1
}  

return(list("fcount" = fcount, "ecount" = ecount))
}