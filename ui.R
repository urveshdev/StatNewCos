library(shiny)
options <- c("Total No. of Companies","Total No. of Companies-public","Total No. of Companies-private"
             ,"Total auth. Capital amount","Auth. Capital amount-public","Auth. Capital amount-private"
             ,"Avg Capital per new Company")

shinyUI(fluidPage(
  navbarPage("Project is part of MOOC : Coursera Developing Data Products"             
  ),
  
  titlePanel("Exploring newly registered companies in India during 2013-14"),
  sidebarLayout(
    sidebarPanel(
      p("Instructions : "),
      p("Select an option you would like to see state-wise statistics for"),
      p("See on the main panel: differently colored states according to calculated value"),
      p("and also the 1st coming state with the value"),
      p("This is very Basic statistics displayed according to data collected from:"),
      a("Click here for Data source and API",href="https://data.gov.in/catalog/registration-new-companies-region-state-wise-distribution"),  
      tags$br(),
      tags$br(),
      selectInput('param', 'Select Parameter', options, selected = "No. of Companies")
    ),
    
    mainPanel(
      h3('state-wise statistics'),
      verbatimTextOutput("text1"),
      verbatimTextOutput("text2"),
      plotOutput("plot"),
      p("Note that information for Indian State Telangana and Sikkim is missing as it was not available"),
      p("Authorized capital in Rs. Crore")
      
      )
      )
    )
  )
  