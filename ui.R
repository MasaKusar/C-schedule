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
    p("Drugo polje za datum se izpolni samo. V primeru, da gre za za vecdnevno odsotnost, tja vpisite dan pred povratkom."),
    strong(":)"),
    shiny::hr(),
    
    # form fields
    selectInput(inputId = "ime", label = "Ime", choices=c("",  "Trotovsek", "Stanisavljevic", "Dokic", "Petric", "Kusar")),
    dateInput("datum1", "datum", value = NULL, min = "2018-01-01", format = "yyyy-mm-dd", 
              startview = "year", weekstart = 1),
    dateInput(inputId="datum2", label="datum konca dopusta", value = NULL, min = "2018-01-01", format = "yyyy-mm-dd", 
              startview = "year", weekstart = 1),
    selectInput("vrsta", "Kaj delam", c("",  "po dezurni", "8193", "dopust", "kontrole", "popoldan", "drugo")), 
    actionButton(inputId = "submitBtn", label = "Submit")
    ),
  
  conditionalPanel(
    # thank you screen after form is submitted
    condition = "output.formSubmitted",
    
    h3(textOutput("thanksName")),
    actionLink("ponovi", "Nov vnos", onclick ="location.href='https://binky.si/shiny/schedule/';")
  )
))
