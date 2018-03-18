library(timevis)


function(input, output, session) {
  output$timelineGroups <- renderTimevis({
    csvFile = subset(csvFile, Month == input$month)
    csvFile = subset(csvFile, Route == input$route)
    colorVector = ifelse(csvFile$type == "charging", "background-color: lightgreen;", NA)
    dataGroups4 = data.frame(
      content = c(""),
      start = c(as.character(csvFile$start)),
      end = c(as.character(csvFile$end)),
      group = c(as.character(csvFile$Bus)),
      style = colorVector
    )
    groups4 = data.frame(
      id = c(unique(as.character(csvFile$Bus))),
      content = c(paste("Bus ", unique(as.character(csvFile$Bus))))
    )
    timevis(data = dataGroups4, groups = groups4)
  })
  output$table = renderTable({
    csvPrices = subset(csvPrices, Month == input$month)
    csvPrices = subset(csvPrices, Route == input$route)
    csvPrices
  })
  observeEvent(input$jumpToDetails, {
    updateNavlistPanel(session, "mainnav", selected = "details")
  })
    
}
