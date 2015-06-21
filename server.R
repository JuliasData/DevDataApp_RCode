library(shiny)
library(ggplot2)
data(diamonds)

fitModel <<- lm(price ~ carat + cut + clarity + color, data = diamonds)

shinyServer(
  function(input, output) {
    prediction <-  reactive({  
      prediction_parameters<-data.frame(carat=input$carat, cut = input$cut, 
                                        clarity = input$clarity,color = input$color)
      value <- predict(fitModel,prediction_parameters) 
      if (value < 0) {
        cat('Error: No data or Prediction Value < 0. Please try again.')
      } else if (value > 0) {
        cat(round(value,0), "$ \n")
    } })
   output$prediction <- renderPrint({prediction()})  
  }
)

