#rm(list = ls())
#closeAllConnections()
#try(dev.off())
#dev.set(2)
#plot.new()
#shell("cls")
#gc()

library("tm")

#dir<-"Progetti_R/casa"
#dir<-"script_vecchi_coursera"

## SET working dir 
#work_dir<-paste("~/",dir,"/final/shiny_app",sep="")
#setwd(work_dir)
setwd("./data")

##################
# Read the Data
##################

#bigram <- readRDS("Bigram.RData")
#trigram <- readRDS(file="Trigram.RData")
#fourgram <- readRDS(file="Quadrigram.RData")
load("Bigram_nostop.RData")
load("Trigram_nostop.RData")
load("Quadrigram_nostop.RData")

load("Bigram.RData")
load("Trigram.RData")
load("Quadrigram.RData")

nextWordPredictor <- function(inputTxt) {

#inputTxt<-"time"
    
    if(nchar(inputTxt) > 0) {
        #clean input
        inputTxt <- tolower(inputTxt)
        inputTxt <- removeNumbers(inputTxt)
        inputTxt <- removePunctuation(inputTxt)
        inputTxt <- stripWhitespace(inputTxt)
        
        #split into words
        inputList <- unlist(strsplit(inputTxt, " "))
        
        print(inputList)
        
        
        numWords <- length(inputList)
        
        print(numWords)
        
        runBigram <- function(words){
            Bigram[Bigram$ngrams$one == words,]$ngrams$two
        }
        
        
        runTrigram <- function(words){
            Trigram[Trigram$ngrams$one == words[1] &
                       Trigram$ngrams$two == words[2],]$ngrams$three
        }
        
        
        runFourgram <- function(words) {
            Quadrigram[Quadrigram$ngrams$one == words[1] &
                          Quadrigram$ngrams$two == words[2] &
                          Quadrigram$ngrams$three == words[3],]$ngrams$four
        }
        
        
        if(numWords == 1) {
            #print("running bigram")
            predList <- runBigram(inputList[1])
         
        }else if (numWords == 2) {
            #print("running trigram")
            word1 <- inputList[1]
            word2 <- inputList[2]
            predList <- runTrigram(c(word1, word2))
            
            if(length(predList) == 0){
                #print("Trigram failed running bigram")
                predList <- runBigram(word2)
            }
        }else {
            #print("running fourgram")
            word1 <- inputList[numWords-2]
            word2 <- inputList[numWords-1]
            word3 <- inputList[numWords]
            predList <- runFourgram(c(word1, word2,word3))
            
            if(length(predList) == 0){
                #print("fourgram failed running trigram")
                predList <- runTrigram(c(word2,word3))
            }
            
            if(length(predList) == 0){
                #print("trigram failed running bigram")
                predList <- runBigram(word3)
            }
        }
        
        #Return top n predictors
        n <- 4
        tp <- length(predList)
        
        if( tp >= n){
            predList <- predList[1:n]
        }
        
        as.character(predList)
        
        
    }else{
        ""
    }
}

nextWordPredictor2 <- function(inputTxt) {
    
    #inputTxt<-"time"
    
    if(nchar(inputTxt) > 0) {
        #clean input
        inputTxt <- tolower(inputTxt)
        inputTxt <- removeNumbers(inputTxt)
        inputTxt <- removePunctuation(inputTxt)
        inputTxt <- stripWhitespace(inputTxt)
        
        #split into words
        inputList <- unlist(strsplit(inputTxt, " "))
        
        print(inputList)
        
        
        numWords <- length(inputList)
        
        print(numWords)
        
        runBigram2 <- function(words){
            Bigram_nostop[Bigram_nostop$ngrams$one == words,]$ngrams$two
        }
        
        runTrigram2 <- function(words){
            Trigram_nostop[Trigram_nostop$ngrams$one == words[1] &
                               Trigram_nostop$ngrams$two == words[2],]$ngrams$three
        }
        
        runFourgram2 <- function(words) {
            Quadrigram_nostop[Quadrigram_nostop$ngrams$one == words[1] &
                                  Quadrigram_nostop$ngrams$two == words[2] &
                                  Quadrigram_nostop$ngrams$three == words[3],]$ngrams$four
        }
        
        if(numWords == 1) {
            #print("running bigram")
            predList2 <- runBigram2(inputList[1])
        }else if (numWords == 2) {
            #print("running trigram")
            word1 <- inputList[1]
            word2 <- inputList[2]
            predList2 <- runTrigram2(c(word1, word2))
            
            if(length(predList2) == 0){
                #print("Trigram failed running bigram")
                predList2 <- runBigram2(inputList[1])
            }
        }else {
            #print("running fourgram")
            word1 <- inputList[numWords-2]
            word2 <- inputList[numWords-1]
            word3 <- inputList[numWords]
            predList2 <- runFourgram2(c(word1, word2,word3))
            
            if(length(predList2) == 0){
                #print("fourgram failed running trigram")
                predList2 <- runTrigram2(c(word2,word3))
            }
            
            if(length(predList2) == 0){
                #print("trigram failed running bigram")
                predList2 <- runBigram2(word3)
            }
        }
        
        #Return top n predictors
        n <- 4
        tp2 <- length(predList2)
        
        if( tp2 >= n){
            predList2 <- predList2[1:n]
        }
        
        as.character(predList2)
        
    }else{
        ""
    }
}

# ptm <- proc.time()
# nextWordPredictor("the world")
# proc.time() - ptm
