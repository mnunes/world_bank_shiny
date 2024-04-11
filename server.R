function(input, output, session) {
  
  # combine the selected variables into a new data frame
  
  selected_data <- reactive({
    wb |>
      select(x = input$xcol, y = input$ycol, year) |>
      filter(year >= input$slider_year[1]) |>
      filter(year <= input$slider_year[2])
  })
  
  # create a plot with conditional plot
  
  output$plot1 <- renderPlot({
    if(input$facet){
      ggplot(selected_data(), aes(x = x, y = y)) +
        geom_point() +
        labs(x = as.character(input$xcol), y = as.character(input$ycol)) +
        facet_wrap(~ year)
    } else {
      ggplot(selected_data(), aes(x = x, y = y)) +
        geom_point() +
        labs(x = as.character(input$xcol), y = as.character(input$ycol))
      }
  })
  
}


