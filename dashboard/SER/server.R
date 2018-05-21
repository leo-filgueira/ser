server <- function(input, output) {
  
  dados_st = readRDS("dados/incerteza.rds")
  st = ts(dados_st$value,start = c(2000,01),frequency = 12)
  output$dygraph <- renderDygraph({
    dygraph(st)%>% 
      dyRangeSelector(height = 20, strokeColor = "") 
  })
  
  
  
  
  shape <- readOGR("dados/BRUFE250GC_SIR.shp", stringsAsFactors = F, use_iconv = T, 
                   encoding = "UTF-8")
  shape <- spTransform(shape, CRS("+ellps=WGS84 +proj=longlat +datum=WGS84 +no_defs"))
  shape@data <- shape@data %>%
    mutate(valor = 1:27)
  
  bins = c(1, 5, 10, 15, 20, 27)
  pal <- colorBin("YlOrRd", domain = shape@data$valor, bins)
  
  labels <- sprintf(
    "<strong>%s</strong><br/> valor: %g",
    shape@data$NM_ESTADO, shape@data$valor
  ) %>% lapply(htmltools::HTML)
  
  output$mapa_leaflet <- renderLeaflet({
    leaflet(shape) %>% 
      addTiles() %>% 
      addPolygons(fillColor = ~pal(valor),
                  weight = 2,
                  opacity = 1,
                  color = "white",
                  dashArray = "3",
                  fillOpacity = 0.7,
                  highlight = highlightOptions(
                    weight = 3,
                    color = "#666",
                    dashArray = "",
                    fillOpacity = 0.7,
                    bringToFront = TRUE),
                  label = labels,
                  labelOptions = labelOptions(
                    style = list("font-weight" = "normal", padding = "3px 8px"),
                    textsize = "15px",
                    direction = "auto")) %>% 
      addLegend(pal = pal, values = ~valor, opacity = 0.7, title = "Valor",
                position = "bottomright")
  })
  
}
