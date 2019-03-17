rm(list = ls())
closeAllConnections()
try(dev.off())
dev.set(2)
plot.new()
shell("cls")
gc()

library("tm")
library("wordcloud")

dir<-"Progetti_R/casa"
#dir<-"script_vecchi_coursera"

## SET working dir 
work_dir<-paste("~/",dir,"/final",sep="")
setwd(work_dir)
setwd("./n_gram")

##############
#Read Files
##############

load("Unigram.RData")
load("Unigram_nostop.RData")

rm(dir)

head(Unigram, 20)

############
# plot
############
setwd("../fig")
png("Unigram.png", width=480, height=480)
#wordcloud(Unigram$ngrams, Unigram$freq,scale = c(3,3) ,colors = brewer.pal(8, "Spectral"))
wordcloud(words = Unigram$ngrams, freq = Unigram$freq, min.freq = 100,
         max.words=80, random.order=FALSE, rot.per=0.25, 
         colors=brewer.pal(8, "Dark2"),scale=c(5,1.5))
dev.off()

png("Unigram_bar.png", width=480, height=480)
barplot(Unigram[1:10,]$freq, las = 2, 
        names.arg = Unigram[1:10,]$ngrams,
        col ="lightblue", main ="Most frequent words",
        ylab = "Word frequencies")
dev.off()

png("Unigram_nostop.png", width=480, height=480)
wordcloud(words = Unigram_nostop$ngrams, freq = Unigram_nostop$freq, min.freq =100,
          max.words=100, random.order=FALSE, rot.per=0.25, 
          colors=brewer.pal(8, "Dark2"),scale=c(3,1))
dev.off()

png("Unigram_nostop_bar.png", width=480, height=480)
barplot(Unigram_nostop[1:10,]$freq, las = 2, 
        names.arg = Unigram_nostop[1:10,]$ngrams,
        col ="lightblue", main ="Most frequent words",
        ylab = "Word frequencies")
dev.off()

setwd("../n_gram")
load("Bigram.RData")
load("Bigram_nostop.RData") #### rigenerare

setwd("../fig")
png("Bigram.png", width=480, height=480)
wordcloud(words = Bigram$ngrams, freq = Bigram$freq, min.freq = 10,
          max.words=50, random.order=FALSE, rot.per=0.25, 
          colors=brewer.pal(8, "Dark2"),scale=c(3,1))
dev.off()

png("Bigram_bar.png", width=480, height=480)
barplot(Bigram[1:10,]$freq, las = 2, 
        names.arg = Bigram[1:10,]$ngrams,
        col ="lightblue", main ="Most frequent words",
        ylab = "Word frequencies")
dev.off()

png("Bigram_nostop.png", width=480, height=480)
wordcloud(words = Bigram_nostop$ngrams, freq = Bigram_nostop$freq, min.freq =10,
          max.words=50, random.order=FALSE, rot.per=0.25, 
          colors=brewer.pal(8, "Dark2"),scale=c(2,0.75))
dev.off()

png("Bigram_nostop_bar.png", width=480, height=480)
barplot(Bigram_nostop[1:10,]$freq, las = 2, 
        names.arg = Bigram_nostop[1:10,]$ngrams,
        col ="lightblue", main ="Most frequent words",
        ylab = "Word frequencies")
dev.off()

setwd("../n_gram")
load("Trigram.RData")
load("Trigram_nostop.RData") 

setwd("../fig")
png("Trigram.png", width=480, height=480)
wordcloud(words = Trigram$ngrams, freq = Trigram$freq, min.freq = 10,
          max.words=50, random.order=FALSE, rot.per=0.25, 
          colors=brewer.pal(8, "Dark2"),scale=c(2,0.5))
dev.off()

png("Trigram_bar.png", width=480, height=480)
barplot(Trigram[1:10,]$freq, las = 2, 
        names.arg = Trigram[1:10,]$ngrams,
        col ="lightblue", main ="Most frequent words",
        ylab = "Word frequencies")
dev.off()

png("Trigram_nostop.png", width=480, height=480)
wordcloud(words = Trigram_nostop$ngrams, freq = Trigram_nostop$freq, min.freq =1000,
          max.words=50, random.order=FALSE, rot.per=0.25, 
          colors=brewer.pal(8, "Dark2"),scale=c(2,0.5))
dev.off()

png("Trigram_nostop_bar.png", width=480, height=480)
barplot(Trigram_nostop[1:10,]$freq, las = 2, 
        names.arg = Trigram_nostop[1:10,]$ngrams,
        col ="lightblue", main ="Most frequent words",
        ylab = "Word frequencies")
dev.off()

