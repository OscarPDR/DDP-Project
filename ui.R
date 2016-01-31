library(shiny)
library(ggplot2)

# Define UI for the web application
shinyUI(
    navbarPage(
        'Diamond prices',
        tabPanel(
            'Overview',
            fluidRow(
                column(
                    4,
                    br(),
                    br(),
                    br(),
                    p(
                        img(src='diamond.png', height='114', width='200'),
                        align='center'
                    )
                ),
                column(
                    6,
                    p(
                        "This dataset (included in the 'ggplot2' package, contains price information for 
                        nearly 54K diamonds, based on 10 different variables."
                    ),
                    br(),
                    p(
                        "The variables are described as:"
                    ),
                    withMathJax(),
                    tags$ul(
                        tags$li(
                            strong("Price: "),
                            "Price in US dollars"
                        ),
                        tags$li(
                            strong("Carat: "),
                            "Weight of the diamond"
                        ),
                        tags$li(
                            strong("Cut: "),
                            "Quality of the cut"
                        ),
                        tags$li(
                            strong("Color: "),
                            "Diamond color"
                        ),
                        tags$li(
                            strong("Clarity: "),
                            "A measurement of how clear the diamond is"
                        ),
                        tags$li(
                            strong("X: "),
                            "Length in mm"
                        ),
                        tags$li(
                            strong("Y: "),
                            "Width in mm"
                        ),
                        tags$li(
                            strong("Z: "),
                            "Depth in mm"
                        ),
                        tags$li(
                            strong("Depth: "),
                            "Total depth percentage: $$depth_\\%=\\frac{z}{mean(x, y)}$$"
                        ),
                        tags$li(
                            strong("Table: "),
                            "Width of top of diamond relative to widest point"
                        )
                    ),
                    br(),
                    br(),
                    p(
                        "You can find more information about how diamonds are measured in ",
                        a(
                            "this link.",
                            href="http://shop.diamondideals.com/education/find/four_cs.cfm"
                        )
                    )
                )
            )
        ),
        tabPanel(
            'Data table',
            fluidRow(
                column(2),
                column(
                    6,
                    p(
                        "In this panel, you can easily filter the data based on three factor variables,
                        in order to consult those dataset rows which match the selected values"
                    )
                )
            ),
            br(),
            fluidRow(
                column(2),
                column(
                    3,
                    selectInput(
                        'cut',
                        'Cut',
                        c(
                            "All",
                            unique(as.character(diamonds$cut))
                        )
                    )
                ),
                column(
                    3,
                    selectInput(
                        'color',
                        'Color',
                        c(
                            "All",
                            unique(as.character(diamonds$color))
                        )
                    )
                ),
                column(
                    3,
                    selectInput(
                        'clarity',
                        'Clarity',
                        c(
                            "All",
                            unique(as.character(diamonds$clarity))
                        )
                    )
                )
            ),
            fluidRow(
                column(1),
                column(
                    10,
                    DT::dataTableOutput('main_table')
                )
            )
        ),
        tabPanel(
            'Reactive price chart',
            fluidRow(
                column(1),
                column(
                    2,
                    radioButtons(
                        "xvar", 
                        label='X axis variable',
                        choices=list(
                            'carat',
                            'cut',
                            'color',
                            'clarity',
                            'x',
                            'y',
                            'z',
                            'depth',
                            'table'
                        ),
                        selected='carat'
                    )
                ),
                column(
                    8,
                    plotOutput('chart')
                )
            )
        )
    )
)