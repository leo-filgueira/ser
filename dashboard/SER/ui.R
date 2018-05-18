require(shinydashboard)
require(leaflet)
require(rgdal)
require(tidyverse)

ui <- dashboardPage(
  dashboardHeader(title = "Exemplo SER"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("mapas", tabName = "Mapas", icon = icon("map")),
      menuItem("dygraphs", tabName = "dygraphs", icon = icon("chart-line"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "mapas",
              fluidRow(
                leafletOutput("mapa_leaflet", width = "75%", height = "200px")
              )  
      ),
      tabItem(tabName = "dygraphs",
           h1("Dygraph")        
      )
    )  
  )
)