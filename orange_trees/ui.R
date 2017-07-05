library(shiny)

shinyUI(fluidPage(
        titlePanel("Orange Tree Data Selection"),
        sidebarLayout(
                sidebarPanel(
                        h3("Select Trees"),
                        checkboxGroupInput("trees", "", c("1" = "1",
                                                          "2" = "2",
                                                          "3" = "3",
                                                          "4" = "4",
                                                          "5" = "5")
                        )
                ),
                mainPanel(
                        tabsetPanel(type = "tabs",
                                    tabPanel("Scatter Plot", br(), 
                                             plotOutput("plot1"), 
                                             h3("Model Slope: "),
                                             textOutput("coef2"),
                                             h3("Model Intercept: "),
                                             textOutput("coef1")),
                                    tabPanel("Help", br(),
                                             h2("Application Description"),
                                             p("This application allows the user to choose which subject data to use to develop a linear model."),
                                             h2("Data"),
                                             p("The data are the Orange data from the datasets package that comes with R."),
                                             h2("Instructions"),
                                             p("From the 'Scatter Plot' tab, select from the check boxes on the left the trees you wish to consider in your final model."),
                                             p("The points will be displayed on the graph as a line graph.  Additionally, all selected points will be used in a linear regression model whose coefficients may be seen at the bottom of the main panel."),
                                             p("Toggle the check boxes to see the effects of their inclusion on the model.")
                                             )
                        )
                )
        )
))
