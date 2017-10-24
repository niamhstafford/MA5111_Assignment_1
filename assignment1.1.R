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
   titlePanel("MA5111 Assignment 1. Part 1"),
   # create layout with numeric input in the side bar and the histogram
   sidebarLayout(
     sidebarPanel(numericInput (inputId="n", "Sample size", value = 10000,
                  min = 1),
      sliderInput("mean","Mean", min = 1, max = 100, value = 50, step = 1),
      sliderInput("sd", "Standard Deviation", min = 1, max = 20, value = 10, step = 1)),
     mainPanel(plotOutput("distPlot"))
     )
)
server<- function(input,output) {
  output$distPlot <- renderPlot({
    hist(rnorm(input$n,input$mean,input$sd),col = 'royalblue1', border = 'white', xlab = "spread", main = "Histogram")
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

