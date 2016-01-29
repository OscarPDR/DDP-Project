library(shiny)
library(ggplot2)

# Define the server logic required
shinyServer(function(input, output) {
    
    output$carat <- renderUI({
        sliderInput(
            "carat", 
            "Carat",
            min(diamonds$carat),
            max(diamonds$carat),
            c(min(diamonds$carat), max(diamonds$carat))
        )
    })
    
    output$cut <- renderUI({
        checkboxGroupInput(
            "cut", 
            "Cut",
            choices=setNames(as.list(levels(diamonds$cut)), levels(diamonds$cut))
        )
    })
    
    output$color <- renderUI({
        checkboxGroupInput(
            "color", 
            "Color",
            choices=setNames(as.list(levels(diamonds$color)), levels(diamonds$color))
        )
    })
})