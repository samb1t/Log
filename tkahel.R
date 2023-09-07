rm(list=ls())
setwd("C:/Users/sambi/Downloads")
df = read.csv("train.csv")
df = df[-1]
View(df)
colnames(df)[c(3,6,8,9)] = c("Gender", "Actual_Price","NumNoRating","NumNoReviews")
str(df)

n = length(df$fulfilled1)
sum(df$fulfilled1 == 1)/n
for(i in 1:n){
  if(df$Gender[i] == "")
    {
      if(grepl(c("Women","Girl","Woman","Lady"), df$title[i], fixed = TRUE))
      {
        df$Gender[i] = "Women"
      }
      else
      {
        df$Gender[i] = "Men"
      }
  }
}

m = glm(df$fulfilled1~.,data = df, family = binomial(link = "logit"))

?glm
