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
source("functions.R")

# Define UI for application that draws a histogram
ui <- fluidPage(
   # Application title
   titlePanel("Annual Balance Growth of Different Investment Modes"),
   # Create a first row of options
   fluidRow(
     column(4,
            sliderInput("amount",
                        "Initial Amount", min=0, max=100000, value=1000, step=500, pre="$")),
     column(4,
            sliderInput("rate",
                        "Return Rate (in %)", min=0, max=20, value=5, step=0.1)),
     column(4,
            sliderInput("years",
                        "Years", min=0, max=50, value=20, step=1))),
   # Create a second row of options
   fluidRow(
     column(4,
            sliderInput("contrib",
                        "Annual Contribution", min=0, max=50000, value=2000, step=500, pre="$")),
     column(4,
            sliderInput("growth",
                        "Growth Rate (in %)", min=0, max=20, value=2, step=0.1)),
     column(4,
            selectInput("facet",
                        "Facet?", c("No", "Yes")))),
   # plot title
   tags$h4("Timelines"),
   # Timeline plot
   plotOutput('balancePlot'),
   # table title
   tags$h4("Balances"),
   # Balance table
   tableOutput('balancetbl')
   )

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$balancePlot <- renderPlot({
     tbl = balances(input$amount, input$rate, input$years, input$contrib, input$growth)
     vals = c(tbl$no_contrib, tbl$fixed_contrib, tbl$growing_contrib)
     modes = data.frame(years=rep(tbl$year,3),
                        dollar_amount=vals,
                        variable=rep(c(" no_contrib","fixed_contrib","growing_contrib"),each=length(tbl$year)))
     
     ploot = ggplot(modes, aes(years, dollar_amount)) +
       geom_line(aes(color=variable), size=1) +
       geom_point(aes(color=variable), size=2) +
       labs(x="year", y="value", subtitle="Three modes of investing")
     
     if (input$facet=="Yes") {
       ploot + facet_wrap(~variable) + geom_area(aes(fill=variable),alpha=.5)
     }
     else ploot
   })
   
   output$balancetbl <- renderTable({
     balances(input$amount, input$rate, input$years, input$contrib, input$growth)
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

