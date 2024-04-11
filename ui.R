pageWithSidebar(
  headerPanel('World Bank'),
  sidebarPanel(
    selectInput('xcol', 'X Axis', c("gdp_per_capita", "gdp"),
                selected = "gdp_per_capita"),
    selectInput('ycol', 'Y Axis', c("life_expectancy", "population"),
                selected = "life_expectancy"),
    sliderInput(inputId = "slider_year", label = "Select a year interval",
                min = 2009, max = 2012, step = 1, value = c(2009, 2012)),
    checkboxInput(inputId = "facet",
                  label = "Facets?", 
                  value = TRUE)
  ),
  mainPanel(
    plotOutput('plot1')
  )
)

