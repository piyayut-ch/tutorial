library(shiny)
library(bs4Dash)

sidebar <- bs4DashSidebar(
  skin = "light",
  status = "primary",
  title = "สินค้าเกษตร",
  brandColor = "primary",
  url = "https://www.nabc.go.th",
  src = "nabc-01.jpg",
  # elevation = 3,
  # opacity = 1,
  # background-color = "white",
  # bs4SidebarUserPanel(
  #   img = "https://image.flaticon.com/icons/svg/1149/1149168.svg",
  #   text = "Welcome Onboard!"
  # ),
  bs4SidebarMenu(
    bs4SidebarHeader("Header 1"),
    bs4SidebarMenuItem(
      "การผลิต",
      tabName = "production",
      icon = "tractor",
      startExpanded = FALSE,
      bs4SidebarMenuSubItem(
        text = "Item 1",
        tabName = "item1",
        icon = "circle-thin"
      ),
      bs4SidebarMenuSubItem(
        text = "Item 2",
        tabName = "item2",
        icon = "circle-thin"
      )
    ),
    bs4SidebarMenuItem(
      "ราคา",
      tabName = "price",
      icon = "tags"
    ),
    bs4SidebarMenuItem(
      "ส่งออก",
      tabName = "export",
      icon = "globe-asia"
    )
  )
)

navbar <- bs4DashNavbar(
  skin = "light",
  status = "white",
  border = TRUE,
  sidebarIcon = "bars",
  controlbarIcon = "th",
  fixed = FALSE,
  leftUi = bs4DropdownMenu(
    show = TRUE,
    align = "left",
    status = "warning",
    menuIcon = "envelope-open",
    src = NULL
  ),
  rightUi = bs4DropdownMenu(
    show = FALSE,
    status = "danger",
    src = "https://www.google.fr",
    bs4DropdownMenuItem(
      message = "message 1",
      from = "Divad Nojnarg",
      src = "https://adminlte.io/themes/v3/dist/img/user3-128x128.jpg",
      time = "today",
      status = "danger",
      type = "message"
    ),
    bs4DropdownMenuItem(
      message = "message 2",
      from = "Nono Gueye",
      src = "https://adminlte.io/themes/v3/dist/img/user3-128x128.jpg",
      time = "yesterday",
      status = "success",
      type = "message"
    )
  )
)

footer <- bs4DashFooter(
 copyrights = a(
   href = "https://twitter.com/divadnojnarg",
   target = "_blank", "@DivadNojnarg"
 ),
 right_text = "2020"
)

controlbar <- bs4DashControlbar()


body <- bs4DashBody(
  fluidRow(
    bs4Card(
      title = "Closable card with dropdown",
      closable = TRUE,
      width = 6,
      status = "warning",
      solidHeader = FALSE,
      collapsible = TRUE,
      # label = bs4CardLabel(
      #   text = 1,
      #   status = "danger",
      #   tooltip = "Hello!"
      # ),
      dropdownMenu = dropdownItemList(
        dropdownItem(url = "https://www.google.com", name = "Link to google"),
        dropdownItem(url = "#", name = "item 2"),
        dropdownDivider(),
        dropdownItem(url = "#", name = "item 3")
      )
      # plotOutput("plot")
    )
  )
)

ui <- bs4DashPage(
  old_school = FALSE,
  sidebar_min = TRUE,
  sidebar_collapsed = TRUE,
  controlbar_collapsed = TRUE,
  controlbar_overlay = TRUE,
  title = "Dashboard สินค้าเกษตร",
  navbar = navbar,
  sidebar = sidebar,
  controlbar = controlbar,
  footer = footer,
  body = body
)

server <- function(input, output) {

}

shinyApp(ui, server)