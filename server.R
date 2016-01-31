library(shiny)
library(ggplot2)

# Define the server logic required
shinyServer(function(input, output) {
    
    output$main_table <- DT::renderDataTable(DT::datatable({
            data <- diamonds
            
            if (input$cut != 'All') {
                data <- data[data$cut == input$cut,]
            }
            if (input$color != 'All') {
                data <- data[data$color == input$color,]
            }
            if (input$clarity != 'All') {
                data <- data[data$clarity == input$clarity,]
            }
            
            data
        },
        options=list(
            searching=FALSE,
            pageLength=15
        )
    ))
})