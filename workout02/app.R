#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

#Future value functions
future_value <- function(amount, rate, years) {
  return(amount*((1+rate)^years))
}
annuity <- function(contrib, rate, years) {
  return(contrib*((((1+rate)^years) - 1)/rate))
}
growing_annuity <- function(contrib, rate, growth, years) {
  first <- (1+rate)^years
  second <- (1+growth)^years
  third <- (rate-growth)
  return(contrib*((first-second)/third))
}

ui <- fluidPage(
   
   # Application title
   titlePanel("Investment Mode Visualization"),
   
   fluidRow(
     column(4, sliderInput("initial",
                 "Initial Amount",
                 min = 1,
                 max = 100000,
                 value = 1000)),
     column(4, sliderInput("annual",
                 "Annual Contribution",
                 min = 0,
                 max = 50000,
                 value = 2000)),
     column(4, sliderInput("return",
                 "Return Rate (in %)",
                 min = 0,
                 max = 20,
                 value = 5)),
     column(4, sliderInput("growth",
                 "Growth Rate (in %)",
                 min = 0,
                 max = 20,
                 value = 2)),
     column(4, sliderInput("years",
                 "Years",
                 min = 0,
                 max = 50,
                 value = 10)),
     column(4, selectInput("facet", label = "Facet?", 
                 choices = list("No" = 0, "Yes" = 1), 
                 selected = 0))
   ),
   
   mainPanel(
     h4("Timelines"),
     plotOutput("plot"),
     
     h4("Balances"),
     verbatimTextOutput("table")
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$plot <- renderPlot({
     initial <- input$initial
     annual <- input$annual
     return <- input$return / 100
     growth <- input$growth / 100
     years <- 0:input$years
     no_contrib <- c()
     fixed_contrib <- c()
     growing_contrib <- c()
     for(year in years) {
       no_contrib <- append(no_contrib, future_value(initial, return, year))
       fixed_contrib <- append(fixed_contrib, future_value(initial, return, year) + annuity(annual, return, year))
       growing_contrib <- append(growing_contrib, future_value(initial, return, year) + growing_annuity(annual, return, growth, year))
     }
     modalities <- data.frame(years, no_contrib, fixed_contrib, growing_contrib)
     modalities
     
     print(input$facet)
     if (input$facet == "0") {
       p <- ggplot(data=modalities, aes(x=years, y=balance)) + geom_line(aes(y=no_contrib, colour="no_contrib")) + geom_line(aes(y=fixed_contrib, colour="fixed_contrib")) + geom_line(aes(y=growing_contrib, colour="growing_contrib")) + ggtitle("Three modes of investing") + labs(colour = "mode")
     } else {
       year <- c()
       year <- append(year, rep(0:input$years, 3))
       balance <- c()
       balance <- append(balance, no_contrib)
       balance <- append(balance, fixed_contrib)
       balance <- append(balance, growing_contrib)
       mode <- c()
       mode <- append(mode, rep("no_contrib", input$years+1))
       mode <- append(mode, rep("fixed_contrib", input$years+1))
       mode <- append(mode, rep("growing_contrib", input$years+1))
       faceted <- data.frame(years, balance, mode)
       p <- ggplot(data=faceted, aes(x=year, y=balance, colour=mode)) + geom_line() + geom_area() + ggtitle("Three modes of investing") + labs(colour = "mode") + facet_grid(. ~ mode)
     }
     print(p)
   })
   output$table <- renderPrint({
     modalities
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

