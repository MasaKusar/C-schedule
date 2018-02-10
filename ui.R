source("helpers.R")

library(shiny)

shinyUI(fluidPage(
  
  # add external JS and CSS
  singleton(
    tags$head(includeScript(file.path('www', 'message-handler.js')),
              includeCSS(file.path('www', 'style.css'))
    )
  ),
  
  title = "Vnos odsotnosti",
  h2("Vnos odsotnosti"),
  
  conditionalPanel(
    # only show this form before the form is submitted
    condition = "!output.formSubmitted",
    
    # form instructions
    p("Prosim, vpisite svoje predvidene odsotnosti za prihodnji mesec"),
    strong(":)"),
    shiny::hr(),
    
    # form fields
    selectInput(inputId = "ime", label = "Ime", choices=c("",  "Trotovsek", "Stanisavljevic", "Dokic", "Petric", "Kusar")),
    radioButtons("1", "1", c("dopoldan", "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE),
    shiny::hr(),
    radioButtons("2", "2", c("dopoldan", "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"),  inline=TRUE), 
    shiny::hr(),
    radioButtons("3", "3", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE), 
    shiny::hr(),
    radioButtons("4", "4", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE), 
    shiny::hr(),
    radioButtons("5", "5", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE), 
    shiny::hr(),
    radioButtons("6", "6", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE), 
    shiny::hr(),
    radioButtons("7", "7", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE), 
    shiny::hr(),
    radioButtons("8", "8", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE), 
    shiny::hr(),
    radioButtons("9", "9", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE), 
    shiny::hr(),
    radioButtons("10", "10", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE), 
    shiny::hr(),
    radioButtons("11", "11", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE), 
    shiny::hr(),
    radioButtons("12", "12", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE),
    shiny::hr(),
    radioButtons("13", "13", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE),
    shiny::hr(),
    radioButtons("14", "14", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE), 
    shiny::hr(),
    radioButtons("15", "15", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE), 
    shiny::hr(),
    radioButtons("16", "16", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE), 
    shiny::hr(),
    radioButtons("17", "17", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE), 
    shiny::hr(),
    radioButtons("18", "18", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE), 
    shiny::hr(),
    radioButtons("19", "19", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE),
    shiny::hr(),
    radioButtons("20", "20", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE), 
    shiny::hr(),
    radioButtons("21", "21", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE), 
    shiny::hr(),
    radioButtons("22", "22", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE), 
    shiny::hr(),
    radioButtons("23", "23", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE), 
    shiny::hr(),
    radioButtons("24", "24", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE), 
    shiny::hr(),
    radioButtons("25", "25", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE), 
    shiny::hr(),
    radioButtons("26", "26", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE), 
    shiny::hr(),
    radioButtons("27", "27", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE), 
    shiny::hr(),
    radioButtons("28", "28", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE), 
    shiny::hr(),
    #radioButtons("29", "29", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE), 
    #shiny::hr(),
    #radioButtons("30", "30", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE), 
    #shiny::hr(),
    #radioButtons("31", "31", c("dopoldan",  "dezurna", "CUB", "dopust", "kontrole", "popoldan", "drugo"), inline=TRUE),
    actionButton(inputId = "submitBtn", label = "Oddaj")
    ),
  
  conditionalPanel(
    # thank you screen after form is submitted
    condition = "output.formSubmitted",
    
    h3(textOutput("thanksName"))
  )
))
