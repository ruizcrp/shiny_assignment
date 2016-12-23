
library(shiny)



# I will use navbarPage in order to create two tabs in the top
shinyUI(navbarPage("Communes in Switzerland",
      #the first one is the actual accplication
      tabPanel("Application",
  
  
  # the slider gives in a vector of two values 
  sidebarLayout(
    sidebarPanel(
       sliderInput("cantslider",
                   "Select the Cantons:",
                   min = 1,
                   max = 29,
                   value = c(1,29))
    ),
    
    # the plot is dislayed
    mainPanel(
       plotOutput("distPlot"),
       h3("The following Cantons are displayed above:"),
       #and then also a table is shown with all the names of the cantons.
       tableOutput("range")
    )
    )
  ),
  #and also a tab with documentation is created
  tabPanel("Documentation",
           mainPanel(
                 h2("Documentation"),
                 h4("This application consists mainly of three elements. First of all, you have a plot, in which the communes of Switzerland are displayed as if it were a map based on the longitude and latitude values. The communes are the lowest governmental levels. These communes are plotted in different colors depending on the cantons in which they are located. The cantons are the intermediary governmental level."),
                 h4("Then there is a slider on the sidebar, with which you can select a range of cantons. If you change this value, the displayed cantons are automatically changed. So instead of having all the 1-29 cantons, you get for example only the cantons 5 to 15 if you select these values."),
                 h4("The last element consist of a table below the plot. It also reacts to the slider and shows the names of the cantons that are currently selected."),
                 h2("Have fun!")
           )
           )
  )
)
