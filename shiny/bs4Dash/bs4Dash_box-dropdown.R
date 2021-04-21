library(shiny)
library(bs4Dash)

shinyApp(
  ui = dashboardPage(
    dashboardHeader(),
    dashboardSidebar(),
    dashboardBody(
      box(
        title = "Closable Box with dropdown ",
        closable = FALSE,
        width = 12,
        status = "warning",
        solidHeader = TRUE,
        collapsible = TRUE,
        dropdownMenu = boxDropdown(
          boxDropdownItem("Click me", id = "dropdownItem", icon = icon("heart")),
          boxDropdownItem("item 2", href = "https://www.google.com/"),
          dropdownDivider(),
          boxDropdownItem("item 3", icon = icon("th"))
        ),
        "My box"
      )
    )
  ),
  server = function(input, output) {
    observeEvent(input$dropdownItem, {
      toast(
        title = "Hi!",
        options = list(
          autohide = TRUE,
          class = "bg-pink",
          position = "topRight"
        )
      )
    })
  }
)