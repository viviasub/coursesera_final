rm(list = ls())
try(dev.off())
dev.set(2)
plot.new()
shell("cls")
gc()

library("tm")
library("qdap")

dir<-"Progetti_R/casa"
#dir<-"script_vecchi_coursera"

## SET working dir 
work_dir<-paste("~/",dir,"/final",sep="")
setwd(work_dir)
setwd("./data_clean")

##############
#Read Files
##############

load("twitter.rda")
load("blogs.rda")
load("news.rda")

#setwd("../data_R")

rm(dir)

#################
# Sampling data
#################

data_sample<-c(blogs,news,twitter)
save(data_sample,file="data_sample.rda")

rm(list=ls(pattern="blogs"))
rm(list=ls(pattern="news"))
rm(list=ls(pattern="twitter"))
gc()
 
#corpus<-SimpleCorpus(VectorSource(list(data_sample))) #OK
corpus<-Corpus(VectorSource(data_sample))#very big file
rm("data_sample")

#Remove profanity and other words we do not want to predict. 
# file available in this locations:
#(https://github.com/shutterstock/List-of-Dirty-Naughty-Obscene-and-Otherwise-Bad-Words/blob/master/en)
profanity <- readLines("../en_US/profanity.txt")
contractions<-rbind(qdapDictionaries::contractions,c(contraction="hadn't",expanded="had not"))
#contractions<-rbind(qdapDictionaries::contractions,c(contraction="it's",expanded="it is"))

#################
# Data cleaning
#################

corpus <- tm-map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus,content_transformer(replace_contraction),contraction =contractions)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeWords, profanity)
save(corpus,file="corpus.RData")

corpus_nostop <- tm_map(corpus, removeWords, stopwords('english'))

save(corpus_nostop,file="corpus_nostop.RData")




