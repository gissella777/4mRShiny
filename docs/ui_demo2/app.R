### Solution 2 ###
#Header Panel, 2 column, Footer panel

library(shiny)



# Define UI for application that draws a histogram
ui <- fluidPage(
    titlePanel(column(width=12, div(style="height:50px;",h1("New Application - Title Panel")))
               ),
    fluidRow(column(width=6, div(style = "height:200px; border-style:dashed; border-color:lightblue; text-align:center;",
                    br(),
                    h2("Column 1"),
                    p("6 units wide"))),
             column(width=6, div(style = "height:200px; border-style:dashed; border-color:lightblue; text-align:center;",
                    br(),
                    h2("Column 2"),
                    p("6 units wide")))),
    tags$br(),
    fluidRow(div(style = "height: 150px; border-style:dashed; border-color:lightblue; 
                         margin-left:15px; margin-right:15px; text-align:center;", 
            h2("Goodbye! this is the final panel at the bottom!")))
)


# Define server logic required to draw a histogram
server <- function(input, output) {
    
    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}


# Run the application 
shinyApp(ui = ui, server = server)
