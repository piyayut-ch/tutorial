library(shiny)
library(bs4Dash)

# create tribble for box global config
box_config <- tibble::tribble(
  ~background, ~labelStatus,
  "danger", "warning",
  "purple", "success",
  "success", "primary",
  "warning", "danger",
  "fuchsia", "info"
)

# box factory function
box_factory <- function(background, labelStatus) {
  box(
    title = "Cyberpunk Box",
    collapsible = TRUE,
    background = background,
    height = "200px",
    label = boxLabel(1, labelStatus)
  )
}

# pmap magic
boxes <- purrr::pmap(box_config, box_factory)

shinyApp(
  ui = dashboardPage(
    freshTheme = theme,
    header = dashboardHeader(
      leftUi = dropdownMenu(
        type = "messages",
        badgeStatus = "success",
        messageItem(
          from = "Support Team",
          message = "This is the content of a message.",
          time = "5 mins"
        ),
        messageItem(
          from = "Support Team",
          message = "This is the content of another message.",
          time = "2 hours"
        )
      )
    ),
    sidebar = dashboardSidebar(),
    body = dashboardBody(
      fluidRow(boxes)
    ),
    controlbar = dashboardControlbar(),
    title = "Fresh theming"
  ),
  server = function(input, output) { }
)