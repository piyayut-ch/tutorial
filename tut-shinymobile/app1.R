library(shiny)
library(shinyMobile)

shiny::shinyApp(
   ui = f7Page(
      title = "My app",
      f7SingleLayout(
      navbar = f7Navbar(title = "f7Slider Range"),
      f7Card(
      f7Slider(
         inputId = "obs",
         label = "Range values",
         max = 500,
         min = 0,
         value = c(50, 100),
         scale = FALSE
      ),
      verbatimTextOutput("test")
      )
      )
   ),
   server = function(input, output) {
      output$test <- renderPrint({input$obs})
   }
)