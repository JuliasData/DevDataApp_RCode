library(shiny)

shinyUI(fluidPage(
  titlePanel("Prediction of Diamond Value by Carat, Clarity, Cut and Color"),
  sidebarLayout(
    sidebarPanel(
      numericInput("carat", label = "Carat", value = 0, min = 0.01, max = 3, step = 0.01),
      selectInput("cut", 
                  label = "Diamond Cut",
                  choices = c("Fair", "Good", "Very Good", "Premium", "Ideal")),
     selectInput("clarity", 
                   label = "Diamond Clarity",
                   choices = c("I1", "SI1","SI2", "VS1", "VS2", "VVS1", "VVS2", "IF")),
     selectInput("color", 
                   label = "Diamond Color",
                   choices = c("D", "E", "F", "G", "H", "I", "J")),                    
      submitButton("Submit")
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Calculation", h3("Predicted Value in USD"), verbatimTextOutput("prediction")),
        tabPanel("User Information", 
                 h4("The diamonds dataset from the ggplot2 package is used to create a linear regression model."),
                 h4("Using the variables Carat, Clarity, Cut and Color the price in USD will be predicted."))
      )  
    )
  )
))