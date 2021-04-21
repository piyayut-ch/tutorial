library(shiny)
library(dplyr, warn.conflicts = FALSE)
library(mapthai)
# remotes::install_github("piyayut-ch/mapthai")

ref_tha <- ref_tha %>%
  arrange(adm1_th, adm2_th, adm3_th)

ui <- fluidPage(
  selectInput("province", "จังหวัด", choices = unique(ref_tha$adm1_th), selected = "หนองคาย"),
  selectInput("district", "อำเภอ", choices = NULL),
  selectInput("subdistrict", "ตำบล", choices = NULL)
)

server <- function(input, output, session) {
  # update 2nd level choices
  province <- reactive({
    filter(ref_tha, adm1_th == input$province)
  })
  observeEvent(province(), {
    choices <- unique(province()$adm2_th)
    updateSelectInput(inputId = "district", choices = choices) 
  })

  # update 3rd level choices
  district <- reactive({
    req(input$district)
    filter(province(), adm2_th == input$district)
  })
  observeEvent(district(), {
    choices <- unique(district()$adm3_th)
    updateSelectInput(inputId = "subdistrict", choices = choices)
  })
}

shinyApp(ui, server)

#runApp("ms/code/10.04_drilldown.R")