rm(list = ls())
try(dev.off())
dev.set(2)
plot.new()
shell("cls")

library("stringr")
library("stringi")
library("tm")

dir<-"Progetti_R/casa"
#dir<-"script_vecchi_coursera"

## SET working dir 
work_dir<-paste("~/",dir,"/final",sep="")
setwd(work_dir)
setwd("./en_US")

##############
#Read Files
##############

con <- file("en_US.twitter.txt","r")
twitter<-readLines(con,encoding="UTF-8",skipNul=TRUE)
## Read the next line of text readLines(con, 5) 
close(con) 
## It's important to close the connection when you are done

con <- file("en_US.blogs.txt", "r")
blogs<-readLines(con,encoding="UTF-8",skipNul=TRUE)
close(con) 

con <- file("en_US.news.txt", "r")
news<-readLines(con,encoding="UTF-8",skipNul=TRUE)
close(con)

setwd("..")

rm(con,dir)


#get file size
twitter_size<-object.size(twitter)
twitter_size<-capture.output(print(twitter_size,units="Mb"))

blogs_size<-object.size(blogs)
blogs_size<-capture.output(print(blogs_size,units="Mb"))

news_size<-object.size(news)
news_size<-capture.output(print(news_size,units="Mb"))

#get line count
twitter_lines<-length(twitter)
blogs_lines<-length(blogs)
news_lines<-length(news)

#get max char line count
twitter_str_lenght<-str_length(twitter)
twitter_max<-max(twitter_str_lenght)
blogs_str_lenght<-str_length(blogs)
blogs_max<-max(blogs_str_lenght)
news_str_lenght<-str_length(news)
news_max<-max(news_str_lenght)

#(index<-which.max(twitter_str_lenght))
#str_length(twitter[index])
#twitter[index]

#get count words
twitter_count<-sum(stri_count_words(twitter))
blogs_count<-sum(stri_count_words(blogs))
news_count<-sum(stri_count_words(news))



textstat<-data.frame ("files"=c("twitter","blogs","news"),
                      "Size"=c(twitter_size,blogs_size,news_size),
                      "Number of Lines"=c(twitter_lines,blogs_lines,news_lines),
                      "Longest Line"=c(twitter_max,blogs_max,news_max),
                      "Numbers of Word"=c(twitter_count,blogs_count,news_count)
)

save(textstat,file="textstat.rda")

#rm(list=ls(pattern="_"))

###############
# sample data
###############

twitter<-sample(twitter,twitter_lines*0.05, replace=F)
blogs <- sample(blogs, blogs_lines*0.05,replace = F)
news <- sample(news, news_lines*0.4,replace = F)


##############
# Clean data
##############

twitter<-tolower(twitter)
blogs<-tolower(blogs)
news<-tolower(news)

#pattern1<-"http"
#tmp1<-grep(pattern1,twitter)
#twitter[tmp1[1:10]]

#remove URL
pattern_html<-"http([^ ]+)"
pattern_html_1<-"http://[[:space:]]"
twitter<-gsub(pattern_html_1, "http://", twitter)
blogs<-gsub(pattern_html_1,"http://",blogs)
news<-gsub(pattern_html_1,"http://",news)
twitter<-gsub(pattern_html, "", twitter)
blogs<-gsub(pattern_html,"",blogs)
news<-gsub(pattern_html,"",news)
#twitter<-gsub(pattern1,"",twitter)

#replace single quote with apostrophe
twitter<-gsub("'", "'", twitter) #retype alt 0146 to get  right single quotation 
blogs<-gsub("'", "'", blogs)
news<-gsub("'", "'", news)

#remove all not english letter and space
twitter<-gsub("[^[:alpha:][:space:]']", "", twitter)
blogs<-gsub("[^[:alpha:][:space:]']", "", blogs)
news<-gsub("[^[:alpha:][:space:]']", "", news)

save(twitter,file="data_clean/twitter.rda")
save(blogs,file="data_clean/blogs.rda")
save(news,file="data_clean/news.rda")

rm(list=ls())
