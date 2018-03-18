library(timevis)
library(shinythemes)


fluidPage(
  title = "Electric punctuality", theme = "flatly",
  tags$head(
    tags$link(href = "style.css", rel = "stylesheet")
  ),
  div(id = "header",
    div(id = "title",
      "Electric punctuality"
    ),
    div(id = "subtitle","Timeline visualizations of optimal bus schedules")
  ),
  tabsetPanel(
    id = "mainnav",
    tabPanel(
      div(icon("users"), "Groups"),
      timevisOutput("timelineGroups"),
        selectInput("month", label = p("Month"), selected = csvFile$Month[1], choices = c(levels(unique(csvFile$Month)))),
        selectInput("route", label = p("Route"), choices = c(unique(csvFile$Route)))
    ), 
    tabPanel(title = "Details",
             tableOutput("table")
    )
  )
)
