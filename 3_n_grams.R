rm(list = ls())
closeAllConnections()
try(dev.off())
dev.set(2)
plot.new()
shell("cls")
gc()

library("tm")
library("ngram")

dir<-"Progetti_R/casa"
#dir<-"script_vecchi_coursera"

## SET working dir 
work_dir<-paste("~/",dir,"/final",sep="")
setwd(work_dir)
setwd("./data_clean")

##############
#Read Files
##############
file1<-"corpus.RData"
file2<-"corpus_nostop.RData"

rm(dir)

########################
## Tokenizeing N-grams
########################

#load(file1)
#Unigram <- DocumentTermMatrix(corpus)
#Unigram <- removeSparseTerms(Unigram, 0.9995)
#rm(corpus)
#gc()
#sort_Unigram <- sort(colSums(as.matrix(Unigram)),decreasing=TRUE)
#Unigram <- data.frame(word = names(sort_Unigram),freq=sort_Unigram)
#head(Unigram, 20)
#tail(Unigram,20)
#save(Unigram,file="../n_gram/Unigram.RData")
#rm(list = ls(pattern = "Unigram"))
#gc()

load(file1)
str <- concatenate ( lapply ( corpus , "[", 1) )
rm(corpus)

options(mc.cores=1)
Unigram<-ngram(str,n=1)
Unigram<-get.phrasetable (Unigram)
head(Unigram, 20)
tail(Unigram,20)
save(Unigram,file="../n_gram/Unigram.RData")

Bigram <- ngram (str , n =2)
Bigram<-get.phrasetable (Bigram) #generate data.frame
head(Bigram,20)
save(Bigram,file="../n_gram/Bigram.RData")
rm(list=ls(pattern="Bigram"))

Trigram <- ngram (str , n =3)
Trigram<-get.phrasetable (Trigram) #generate data.frame
head(Trigram,20)
save(Trigram,file="../n_gram/Trigram.RData")
rm(list=ls(pattern="Trigram"))

Quadrigram <- ngram (str , n =4)
Quadrigram<-get.phrasetable (Quadrigram) #generate data.frame
head(Quadrigram,20)
save(Quadrigram,file="../n_gram/Quadrigram.RData")
rm(list=ls(pattern="Trigram"))

########################
## Tokenizeing N-grams
# no_stop_word
########################


#load(file2)

#Unigram <- DocumentTermMatrix(corpus_nostop)
#Unigram <- removeSparseTerms(Unigram, 0.98)
#rm(corpus_nostop)
#gc()
#sort_Unigram <- sort(colSums(as.matrix(Unigram)),decreasing=TRUE)
#Unigram_nostop <- data.frame(word = names(sort_Unigram),freq=sort_Unigram)
#head(Unigram_nostop, 20)
#save(Unigram_nostop,file="../n_gram/Unigram_nostop.RData")
#rm(list = ls(pattern = "Unigram"))
#gc()

load(file2)
str <- concatenate ( lapply ( corpus_nostop , "[", 1) )
rm(corpus_nostop)

options(mc.cores=1)
gc()
Unigram_nostop<-ngram(str,n=1)
Unigram_nostop<-get.phrasetable (Unigram_nostop)
head(Unigram_nostop, 20)
tail(Unigram_nostop,20)
save(Unigram_nostop,file="../n_gram/Unigram_nostop.RData")

Bigram <- ngram (str , n =2)
Bigram_nostop<-get.phrasetable (Bigram) #generate data.frame
head(Bigram_nostop,20)
save(Bigram_nostop,file="../n_gram/Bigram_nostop.RData")
rm(list=ls(pattern="Bigram"))

Trigram <- ngram (str , n =3)
Trigram_nostop<-get.phrasetable (Trigram) #generate data.frame
head(Trigram_nostop,20)
save(Trigram_nostop,file="../n_gram/Trigram_nostop.RData")
rm(list=ls(pattern="Trigram"))

Quadrigram <- ngram (str , n =4)
Quadrigram_nostop<-get.phrasetable (Quadrigram) #generate data.frame
head(Quadrigram_nostop,20)
save(Quadrigram_nostop,file="../n_gram/Quadrigram_nostop.RData")
rm(list=ls(pattern="Quadrigram"))

