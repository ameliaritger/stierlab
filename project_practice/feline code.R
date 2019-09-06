cats <- data.frame(coat = c("calico", "black", "tabby"),
                 weight = c(2.1, 5.0, 3.2),
                 likes_string = c(1,0,1))
write.csv(x = cats, file = "data/feline-data.csv", row.names = FALSE)

cats$weight + 2
log(cats$weight)
cats$weight + cats$likes_string
paste('my cat is', cats$coat)

typeof(cats$weight)
typeof(TRUE)
typeof(1+1i)
typeof('banana')
typeof(1L)



vec <- vector(length=3)
vec2 <- vector(mode='character',length=3)
typeof(vec)
typeof(vec2)

str(vec2)
str(vec)
str(cats)

age <- c(2,3,4)
cats<-cbind(cats,age)


#add new tortoiseshell cat information to cats datasheet
levels(cats$coat) <- c(levels(cats$coat), "tortoiseshell") #tell R that tortoiseshell is a "level" option for the coats column
cats <- rbind(cats, c("tortoiseshell", 3.3, TRUE, 9))


#create a data frame with my personal information
df<-data.frame(name=c("Amelia"),
               surname=c("Ritger"),
               lucky_number=c(28),
               stringsAsFactors = FALSE) #stringsAsFactors forces "amelia" and "ritger" are not factors

#add coffee as an option
coffee<-c(FALSE)
df<-cbind(df,coffee)
#add my neighbor as an option
df<-rbind(df, c("Sam", "Niday", 11, TRUE))
#add color as an option
color<-c("blue","purple")
df<-cbind(df,color)
#add another neighbor as an option
df$color<-as.character(df$color)
df<-rbind(df, c("Mary","Donovan",2,FALSE,"red"))