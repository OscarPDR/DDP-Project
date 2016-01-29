library(shiny)

# Define UI for the web application
shinyUI(fluidPage(
  
    # Application title
    titlePanel("Diamond prices"),
  
    sidebarLayout(
        # sidebar
        sidebarPanel(
            p(
                "This dataset (included in the 'ggplot2' package, contains price information for 
                nearly 54K diamonds, based on 10 different variables.",
                br(),
                br(),
                align="center",
                img(src="diamond.png", height="114", width="200"),
                br()
            ),
            p("The variables are as follows:"),
            uiOutput("carat"),
            
            fluidRow(
                column(
                    6,
                    uiOutput("cut")
                ),
                column(
                    6,
                    uiOutput("color")
                )
            )
        ),
    
        # main
        mainPanel(
            plotOutput("distPlot")
        )
    )
))