library(shiny)
library(digest) # digest() Create hash function digests for R objects

formName <- "januar"
resultsDir <- file.path("./data", formName)
dir.create(resultsDir, recursive = TRUE, showWarnings = FALSE)

# names of the fields on the form we want to save
fieldNames <- c("ime",
                "datum1",
                "datum2",
                "vrsta"
)

shinyServer(function(input, output, session) {
  
  
  # only enable the Submit button when the mandatory fields are validated
  #observe({
  #  if (input$ime == '') {
  #    session$sendCustomMessage(type = "disableBtn", list(id = "submitBtn"))
  #  } else {
   #   session$sendCustomMessage(type = "enableBtn", list(id = "submitBtn"))
  #  }
  #})
  
  observe({
    date <- as.Date(input$datum1)
    updateDateInput(session, "datum2", value = date)
  })
  
  # the name to show in the Thank you confirmation page
  output$thanksName <- renderText({
    paste0("Thank you, ", input$ime, "!")
  })
  
  # we need to have a quasi-variable flag to indicate when the form was submitted
  output$formSubmitted <- reactive({
    FALSE
  })
  outputOptions(output, 'formSubmitted', suspendWhenHidden = FALSE)
  
  
  
  # submit the form  
  observe({
    #if (input$submitConfirmDlg < 1) return(NULL)
    if (input$submitBtn < 1) return(NULL)
    
    # read the info into a dataframe
    isolate(
      infoList <- t(sapply(fieldNames, function(x) x = input[[x]]))
    )
    
    # generate a file name based on timestamp, user name, and form contents
    isolate(
      fileName <- paste0(
        paste(
          getFormattedTimestamp(),
          input$ime,
          sep = "_"
        ),
        ".csv"
      )
    )
    
    # write out the results
    ### This code chunk writes a response and will have to change
    ### based on where we store persistent data
    write.csv(x = infoList, file = file.path(resultsDir, fileName),
              row.names = FALSE)
    ### End of writing data
    
    # indicate the the form was submitted to show a thank you page so that the
    # user knows they're done
    output$formSubmitted <- reactive({ TRUE })
  })
  
})
