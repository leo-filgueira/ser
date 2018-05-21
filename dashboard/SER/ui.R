

ui <- dashboardPage(
  dashboardHeader(title = "Exemplo SER"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Mapa", tabName = "mapas", icon = icon("map")),
      menuItem("dygraphs", tabName = "dygraphs", icon = icon("line-chart"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "mapas",
                leafletOutput("mapa_leaflet", height = 600)
      ),
      tabItem(tabName = "Dygraphs",
           h1("Indicador de incerteza da economia do Brasil - FGV"),
           dygraphOutput("dygraph")
          
      )
    )  
  )
)
