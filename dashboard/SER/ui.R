require(shinydashboard)
require(leaflet)
require(rgdal)
require(tidyverse)

ui <- dashboardPage(
  dashboardHeader(title = "Exemplo SER"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Mapa", tabName = "mapas", icon = icon("map")),
      menuItem("dygraphs", tabName = "dygraphs", icon = icon("chart-line"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "mapas",
                leafletOutput("mapa_leaflet", height = 600)
      ),
      tabItem(tabName = "dygraphs",
           h1("Dygraph")        
      )
    )  
  )
)
