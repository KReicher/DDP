#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

suppressPackageStartupMessages(library(shiny))


shinyUI(fluidPage(
  
  # Application title
  titlePanel("Iris classification"),
  
  p("This application based on user input determines the type of Iris flower using 
      a prediction model developed by the random forest machine learning algorithm
    and ",
    a("Iris flower data set",href="http://en.wikipedia.org/wiki/Iris_flower_data_set")),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    
    sidebarPanel(
      h3('Input'),
      p('Enter the length and the width of the sepals and petals, in centimetres:'),
      #inputs
      sliderInput("id1", label = strong("Sepal Length"), min = 4.3, max = 7.9, value = 5.843, step = 0.01),
      sliderInput("id2", label = strong("Sepal Width"), min = 2, max = 4.4, value = 3.057, step = 0.01),
      sliderInput("id3", label = strong("Petal Length"), min = 1, max = 6.9, value = 3.758, step = 0.01),
      sliderInput("id4", label = strong("Petal Width"), min = 0.1, max = 2.5, value = 1.199, step = 0.01),
      actionButton("Submit", "Submit")
    ),    
    
    # Show a predicted species
    mainPanel(
      h3('Your Iris flower most likely is species...'),
      #Outputs
      verbatimTextOutput("ospecies"),
      uiOutput(outputId = "opics")
    )
  )
))