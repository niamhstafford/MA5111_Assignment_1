#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

  # Define UI for application that draws a histogram
  ui <- fluidPage(
    
    # Application title
    titlePanel("MA5111 Assigment1. Part 2"),
    sidebarLayout(
      sidebarPanel(
        fileInput("file1", "Choose CSV File",accept = c( "text/csv","text/comma-separated-values,text/plain",".csv")
        ),
        tags$hr()
        ,
        
        selectInput("var", "Select a variable:",
                    c("Age" = "age","Height" = "height","Weight" = "weight","BMI" = "bmi")),
        radioButtons("cols", "Colours",  c("Red","Blue","Green","Yellow")))
      
      ,
      mainPanel(
        tableOutput("data"),
        plotOutput("variables")
      )))
  
  
  server <- function(input, output){
    output$data <-renderTable({ 
      req(input$file1)
      infile <-input$file1
      read.csv(infile$datapath)
      
    })
    output$variables <-renderPlot({
      (req(input$file1))
      infile <- input$file1
      data <-read.csv(infile$datapath)
      var <-input$var
      col <-input$cols
      boxplot(data[,var], col=col, main=paste("Selected Variable", var))
    })}
  
  
  
  
  
  # Run the application 
  shinyApp(ui = ui, server = server)
  
