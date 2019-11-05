### Solution 3 ###
#Header Panel, 3 tabs

library(shiny)



# Define UI for application that draws a histogram
ui <- fluidPage(
    headerPanel(div(style="height:50px;",h1("New Application 3 - Title Panel"))
                ),
    tabsetPanel(
        tabPanel(h4("Tab 1"), div(style="height:300px; text-align:left; font-size:16px; padding-left:15px; 
                                         border-style:dotted; border-width:2px; border-color:lightgrey;", 
                                br(), "Contents for tab 1")),
        tabPanel(h4("Tab 2"), div(style="height:300px; text-align:left; font-size:16px; padding-left:15px; 
                                        border-style:dotted; border-width:2px; border-color:lightgrey;", 
                                br(), "Contents for tab 2")),
        tabPanel(h4("Tab 3"), div(style="height:300px; text-align:left; font-size:16px; padding-left:15px;
                                        border-style:dotted; border-width:2px; border-color:lightgrey;", 
                                br(), "Contents for tab 3"))
    )
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
