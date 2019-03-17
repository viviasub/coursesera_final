library(shiny)
shinyUI(   fluidPage(
    headerPanel("Application for Word Prediction"
    ),
    sidebarPanel(
        h1("Explanation"),
        p("This application will predict the next possible word in a phrase."),
        p("Type word(s) in the text field and up to 8 possible words will display."),
        p("The model are based on two data set with and without stopwords."),
        p("Click on word that match to add it to the text field."),
        p("To produce the predictions I used n-grams natural language proccessing models:"),
        a(href="https://en.wikipedia.org/wiki/N-gram","wikipedia"),
        p(" and Katz back-off language model, it is a generative n-gram model that estimates the conditional probability: "),
        a(href="https://en.wikipedia.org/wiki/Katz%27s_back-off_model","wikipedia")
        
        
    ),
    mainPanel(
        h2("Instruction"),
        textInput("inputTxt", "Please input your text one word at time below:", width = "90%"),
        uiOutput("words"),
        uiOutput("words2"),
        br(),
        wellPanel(
            h2("Technical Details"),
            br(),
            p("A short presentation is available at:"),
            a(href="http://rpubs.com/linussub/476963","Rpubs"),
            br(),
            br(),
            br(),
            p("The full R code used for this final project is avaiable on:"),
            a(href="https://github.com/viviasub/coursesera_final.git","GitHub"),
            br(),
            br(),
            br(),
            h4("Author:"),
            p("Antonio Vivi")
        )
        
    )
)) 