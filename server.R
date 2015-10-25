library(sp)

## downloading polygon file for india level 1 in rds format
indiaLevel1 <- readRDS("data/IND_adm1.rds") 
NRCdata <- read.csv("data/NRC.csv")

totalRows <- grep("total", NRCdata$State, ignore.case = TRUE)
NRCdata <- NRCdata[-totalRows,]
NRCdata <- NRCdata[order(NRCdata$State), ]

## skipping Indian state for which no info is available
indiaLevel1 <- indiaLevel1[-c(grep("Sikkim",indiaLevel1$NAME_1),
                              grep("Telangana",indiaLevel1$NAME_1)),]

## renaming some states
levels(NRCdata$State)[levels(NRCdata$State)== "Dadar & N. Haveli"] <- "Dadra and Nagar Haveli"
levels(NRCdata$State)[levels(NRCdata$State)== "A & N Islands"] <- "Andaman and Nicobar"
levels(NRCdata$State)[levels(NRCdata$State)== "Daman & Diu"] <- "Daman and Diu"
NRCdata$State <- factor(NRCdata$State)

indiaLevel1$publicCo <- NRCdata$No..of.Companies...Public
indiaLevel1$authCapPub <- NRCdata$Authorized.Capital...Public
indiaLevel1$privateCo <- NRCdata$No..of.Companies...Private
indiaLevel1$authCapPr <- NRCdata$Authorized.Capital...Private
indiaLevel1$totalCo <- NRCdata$No..of.Companies...Total
indiaLevel1$authCapTot <- NRCdata$Authorized.Capital...Total
indiaLevel1$NAME_1 = as.factor(indiaLevel1$NAME_1)

shinyServer(
  function(input, output) {
    output$plot <- renderPlot({
      
      if(input$param == "Total No. of Companies")
        test <- indiaLevel1$totalCo
      
      else if(input$param == "Total auth. Capital amount")
        test <- indiaLevel1$authCapTot
      
      ## finding average capital per new company
      else if(input$param == "Avg Capital per new Company")
        test <- indiaLevel1$authCapTot / indiaLevel1$totalCo
      
      else if(input$param == "Total No. of Companies-public")
        test <- indiaLevel1$publicCo
      
      else if(input$param == "Auth. Capital amount-public")
        test <- indiaLevel1$authCapPub
      
      else if(input$param == "Total No. of Companies-private")
        test <- indiaLevel1$privateCo
      
      else
        test <- indiaLevel1$authCapPr
      
      indiaLevel1$test <- test
      output$text1 <- renderText({paste("Your selected option : ", input$param)})
      
      ## Displaying highest state for the selected category
      output$text2 <- renderText({paste("The 1st coming state for this option is",
                                        NRCdata[which.max(test),2], " with value ", test[which.max(test)])})
      
      ## plotting on Indian map according to calulated statistics
      spplot(indiaLevel1,"test",col.region=test, colorkey=T, main="Indian States")
    })
  }
)