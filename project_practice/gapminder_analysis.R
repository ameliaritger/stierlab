setwd("~/github/project_practice/data")
gapminder<-read.csv("gapminder_data.csv")

str(gapminder)
typeof(gapminder$year)
str(gapminder$year)
nrow(gapminder)

tail(gapminder) #sample the last few rows of gapminder dataset
gapminder[sample(nrow(gapminder),5),] #sample 5 random rows within gapminder dataset



# ggplot ------------------------------------------------------------------


#######ggplot
data<-read.csv("gapminder_data.csv")
head(data)
library(ggplot2)

#simple plot
ggplot(data=data, aes(x=gdpPercap,y=lifeExp))+
  geom_point()

ggplot(data=data, aes(x=year,y=lifeExp,by=country,color=continent))+
  geom_line() #each line is a country, color coding is grouped by continent

#ggplot() aesthetics affect entire plot
#geom_line() aesthetics affect the geom_line function layer

ggplot(data=data, aes(x=year,y=lifeExp,by=country))+
  geom_line(aes(color=continent))+
  geom_point(color="red") #red points plotted on top of lines color coded by continent

ggplot(data=data, aes(x=log10(gdpPercap),y=lifeExp,by=country))+
  geom_point(aes(color=continent), alpha=0.7) #plot points that fill 70% of the circle and color coded by continent

#fancy subsetting
starts.with<-substr(data$country,start=1,stop=1) #create string of first letter of each country for data frame
az.countries<-data[starts.with%in%c("A","Z"),] #creates data frame of all the countries with names that start with A or Z
# %in% means comparison between before and after
ggplot(data=az.countries, aes(x=year, y=lifeExp, color=continent))+
  geom_line()+
  facet_wrap(~country)


# dplyr -------------------------------------------------------------------


######dplyr
library(dplyr)
str(data)
data_sub<-data%>%
  select(year,country,gdpPercap) #subset year, country, and gdp from data frame
str(data_sub)
data_euro<-data%>%
  filter(continent=="Europe") #select Europe data points from data frame
str(data_euro)
data_sub_euro<-data%>%
  filter(continent=="Europe")%>%
  select(year,country,gdpPercap) #from Europe data, subset year, country, and gdp from data frame
str(data_sub_euro)

gdp_bycont<-data%>%
  group_by(continent)%>%
  summarize(meanGDP=mean(gdpPercap)) #mean GDP of countries, grouped by continent
gdp_bycont%>%
  filter(meanGDP==min(meanGDP)) #select the continent with the minimum GDP of the group

gdp_bycont_log<-data%>%
  mutate(gdp_log=log(gdpPercap))%>%
  group_by(continent,year)%>%
  summarize(meanLogGDP=mean(gdp_log)) #summarize(meanLogGDP=mean(log(gdpPercap)) can replace mutate()

#combine dplyr and ggplot concepts
ggplot(data=gdp_bycont_log,aes(x=year,y=meanLogGDP,color=continent))+
  geom_point()