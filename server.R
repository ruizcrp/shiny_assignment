

library(shiny)

#the server consists mainly of two outputs: a table and a plot
shinyServer(function(input, output) {
  
 
 #the following command renders the table and might look a bit long
      
  output$range <- renderTable({ 
        #the value given out is in form of a matrix
        matrix(
              #which consists of two elements.
              #first of all the string with the names of the cantons
              #in order to do that, the two values from the slider are taken
            c(as.character(
                  unique(
                        map_data$canton)
                        [input$cantslider[1]:input$cantslider[2]]),
              #then the second part consists of empty character values
              #that are required to fill the matrix (else the first values
              #would be filled again)
              rep("",8-length(input$cantslider[1]:input$cantslider[2])%%8))
            ,ncol=8, byrow=TRUE)},include.colnames=FALSE)
          
#now the plot is rendered
  output$distPlot <- renderPlot({
    
    #the plot is created in a way that only those cantons are displayed
       #that were also previously selected by the slider
    plot(map_data$longitude[map_data$id_canton >= input$cantslider[1] & map_data$id_canton <= input$cantslider[2] ],
         map_data$latitude[map_data$id_canton >= input$cantslider[1] & map_data$id_canton <= input$cantslider[2] ],
         col=map_data$canton[map_data$id_canton >= input$cantslider[1] & map_data$id_canton <= input$cantslider[2] ],
         xlab="",ylab="",pch=19)
    
  })
  
})
