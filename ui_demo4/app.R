### Solution 3 ###
#Header Panel, 3 tabs

library(shiny)



# Define UI for application that draws a histogram
ui <- fluidPage(
    headerPanel("Application Layout 4"),
    sidebarPanel(width=3,"SideBar", br(), br(),"sidestuff"),
    mainPanel(tabsetPanel(
        tabPanel("Tab 1", br(),"contents for tab 1", br(),"line 2"),
        tabPanel("Tab 2", br(),"contents for tab 2"),
        tabPanel("Tab 3", br(),"contents for tab 3")
        )
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
