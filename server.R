library(shiny)
library(ggplot2)

# Define the server logic required
shinyServer(function(input, output) {
    
    # Render a datatable with those rows matching the selectInput variables
    output$main_table <- DT::renderDataTable(DT::datatable({
            data <- diamonds
            
            # Cut facet filter
            if (input$cut != 'All') {
                data <- data[data$cut == input$cut,]
            }
            
            # Color facet filter
            if (input$color != 'All') {
                data <- data[data$color == input$color,]
            }
            
            # Clarity facet filter
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
    
    # Reactive function to change the variable plotted on x-axis
    mydata <- reactive({
        switch(input$xvar, 
            carat=diamonds$carat, 
            cut=diamonds$cut,
            color=diamonds$color,
            clarity=diamonds$clarity,
            x=diamonds$x,
            y=diamonds$y,
            z=diamonds$z,
            depth=diamonds$depth,
            table=diamonds$table
        )
    })
    
    # Plot the price chart (x-axis is selected reactively)
    output$chart <- renderPlot(
        plot(
            mydata(), 
            diamonds$price,
            main="Diamonds price",
            xlab=input$xvar,  # render the selected column name as the axes label
            ylab="Price",
            col=rgb(0.52, 0.2, 0.9, 0.5)  # an alpha-abled purple-ish colour
        )
    )
})