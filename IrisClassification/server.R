#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

suppressPackageStartupMessages(library(shiny))
suppressPackageStartupMessages(library(randomForest))

data(iris) # loading data set
train <- iris[,-5]  # training data set contains variables: "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  
species <- iris[,5] # variable "Species" is target variable to predict

# machine learning algorithm
rf.model <- randomForest(train,species,importance=TRUE,ntree=1000)


shinyServer(
  function(input, output) {
    
    iris <- eventReactive(input$Submit,
                         {
                           x1<-as.numeric(input$id1) #user input Sepal.Length
                           x2<-as.numeric(input$id2) #user input Sepal.Width
                           x3<-as.numeric(input$id3) #user input Petal.Length
                           x4<-as.numeric(input$id4) #user input Petal.Width
                           test<-data.frame(x1,x2,x3,x4) # making new dataset from user input to apply random forest model 
                           names(test)<-c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")
                           return(levels(species)[predict(rf.model,newdata=test)])
                         })
    
    output$ospecies<-renderText({
      print(iris())
    })
    
    
    output$opics <- renderUI({
      if(iris()=='setosa')
        img(src='iris_setosa.jpg', height = '250px')
      if(iris()=='versicolor')
        img(src='iris_versicolor.jpg', height = '250px')
      else
        img(src='iris_virginica.jpg', height = '250px')
    })
    
  }
)

