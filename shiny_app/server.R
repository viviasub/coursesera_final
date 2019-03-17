library(shiny)

source("./model.R", local = TRUE)

shinyServer(
    function(input, output, session){
        
        
        prediction <- reactive({
            nextWordPredictor(input$inputTxt)
        })
        
        
        output$words <- renderUI( {
            predictWords <- prediction()
            assign('savedWords', predictWords, envir=.GlobalEnv)
            n <- length(predictWords)
            if( n > 0 && nchar(predictWords) > 0) {
                buttons <- list()
                for(i in 1:n) {
                    buttons <- list(buttons, list(
                        actionButton(inputId = paste("word",i, sep = ""), label =predictWords[i])
                    ))
                }
                
                tagList(
                    buttons 
                )
            } else {
                tagList("") 
            }
        })
        
        observeEvent(input$word1, {
            updateTextInput(session, "inputTxt", value = paste(input$inputTxt, get('savedWords', envir=.GlobalEnv)[1]))
        })
        
        observeEvent(input$word2, {
            updateTextInput(session, "inputTxt", value = paste(input$inputTxt, get('savedWords', envir=.GlobalEnv)[2]))
        })
        
        observeEvent(input$word3, {
            updateTextInput(session, "inputTxt", value = paste(input$inputTxt, get('savedWords', envir=.GlobalEnv)[3]))
        })
        
        observeEvent(input$word4, {
            updateTextInput(session, "inputTxt", value = paste(input$inputTxt, get('savedWords', envir=.GlobalEnv)[4]))
        })
        
        
        
        ##################
        # 2ND PREDICTION
        ##################
        
        prediction2 <- reactive({
            nextWordPredictor2(input$inputTxt)
        })
        
        output$words2 <- renderUI( {
            predictWords2 <- prediction2()
            assign('savedWords2', predictWords2, envir=.GlobalEnv)
            n <- length(predictWords2)
            if( n > 0 && nchar(predictWords2) > 0) {
                buttons <- list()
                for(i in 1:n) {
                    buttons <- list(buttons, list(
                        actionButton(inputId = paste("word2_",i, sep = ""), label =predictWords2[i])
                    ))
                }
                
                tagList(
                    buttons 
                )
            } else {
                tagList("") 
            }
        })
        
        observeEvent(input$word2_1, {
            updateTextInput(session, "inputTxt", value = paste(input$inputTxt, get('savedWords2', envir=.GlobalEnv)[1]))
        })
        
        observeEvent(input$word2_2, {
            updateTextInput(session, "inputTxt", value = paste(input$inputTxt, get('savedWords2', envir=.GlobalEnv)[2]))
        })
        
        observeEvent(input$word2_3, {
            updateTextInput(session, "inputTxt", value = paste(input$inputTxt, get('savedWords2', envir=.GlobalEnv)[3]))
        })
        
        observeEvent(input$word2_4, {
            updateTextInput(session, "inputTxt", value = paste(input$inputTxt, get('savedWords2', envir=.GlobalEnv)[4]))
        })
        
    })