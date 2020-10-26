library(shiny)
library(ggplot2)

# ui <- basicPage(
#   plotOutput("plot", click = "plot_click"),
#   verbatimTextOutput("info")
# )

# server <- function(input, output) {
#   output$plot <- renderPlot({
#     plot(mtcars$wt, mtcars$mpg)
#   }, res = 96)

#   output$info <- renderPrint({
#     req(input$plot_click)
#     x <- round(input$plot_click$x, 2)
#     y <- round(input$plot_click$y, 2)
#     cat("[", x, ", ", y, "]", sep = "")
#   })
# }



ui <- fluidPage(
  plotOutput("plot", brush = "plot_brush"),
  tableOutput("data")
)
server <- function(input, output, session) {
  output$plot <- renderPlot({
    ggplot(mtcars, aes(wt, mpg)) + geom_point()
  }, res = 96)
  
  output$data <- renderTable({
    brushedPoints(mtcars, input$plot_brush)
  })
}

shinyApp(ui, server)