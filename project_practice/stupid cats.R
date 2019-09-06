cats <- data.frame(coat = c("calico", "black", "tabby"),
                   weight = c(2.1, 5.0, 3.2),
                   likes_string = c(1,0,1))
coats <- c('tabby', 'black', 'black')
CATagories <- as.factor(coats)
CATagories
str(CATagories)
