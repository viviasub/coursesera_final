rm(list = ls())
closeAllConnections()
try(dev.off())
dev.set(2)
plot.new()
shell("cls")
gc()

library("tm")
library("reshape")
#library("ngram")

dir<-"Progetti_R/casa"
#dir<-"script_vecchi_coursera"

## SET working dir 
#setwd("~")
work_dir<-paste("~/",dir,"/final",sep="")
setwd(work_dir)
setwd("./n_gram")

###########################
#Read Files and transform 
###########################

#file1<-"Unigram_nostop.RData"
file2<-"Bigram_nostop.RData"
file3<-"Trigram_nostop.RData"
file4<-"Quadrigram_nostop.Rdata"

load(file2)
columns<-c("one","two")
Bigram_nostop <- transform(Bigram_nostop, 
                              ngrams=colsplit(ngrams, split = " ",
                                              names = columns ))
save(Bigram_nostop,file="split/Bigram_nostop.RData")

load(file3)
columns<-c("one","two","three")
Trigram_nostop <- transform(Trigram_nostop, 
                              ngrams=colsplit(ngrams, split = " ",
                                              names = columns ))
save(Trigram_nostop,file="split/Trigram_nostop.RData")

load(file4)
columns<-c("one","two","three","four")
Quadrigram_nostop <- transform(Quadrigram_nostop, 
                                  ngrams=colsplit(ngrams, split = " ",
                                                  names = columns ))
save(Quadrigram_nostop,file="split/Quadrigram_nostop.RData")


###########################
#Read Files and transform 
###########################

#file1<-"Unigram2.RData"
file2<-"Bigram.RData"
file3<-"Trigram.RData"
file4<-"Quadrigram.Rdata"

load(file2)
columns<-c("one","two")
Bigram <- transform(Bigram, 
                              ngrams=colsplit(ngrams, split = " ",
                                              names = columns ))
save(Bigram,file="split/Bigram.RData")

load(file3)
columns<-c("one","two","three")
Trigram <- transform(Trigram, 
                               ngrams=colsplit(ngrams, split = " ",
                                               names = columns ))
save(Trigram,file="split/Trigram.RData")

rm(list=ls(pattern = "Big"))
rm(list=ls(pattern = "Trig"))
rm(list=ls(pattern = "Quad"))
gc()


load(file4)
columns<-c("one","two","three","four")
Quadrigram <- transform(Quadrigram, 
                                  ngrams=colsplit(ngrams, split = " ",
                                                  names = columns ))
save(Quadrigram,file="split/Quadrigram.RData")
