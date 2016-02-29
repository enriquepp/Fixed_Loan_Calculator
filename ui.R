
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel(strong("Fixed Loan Calculator")),

  # Sidebar with slider inputs for loan amount, loan term in years, and interest 
  # rate per year
  sidebarLayout(
    sidebarPanel(
        h4(strong("Instructions:")),
        helpText("This calculator is for fixed loans with monthly payments."),
        helpText("1. Introduce loan amount (without commisions paid apart)"),
        helpText("2. Fix loan term in years"),
        helpText("3. Fix nominal interest rate per year (in percentage)"),

        numericInput("amount", "Loan amount:", min = 10000, max = 500000, 
                    value = 100000, step = 10000),
        sliderInput("years", "Loan term in years:", min = 1, max = 40, value = 20),
        sliderInput("rate", "Interest rate per year %:", min = 0, max = 10, 
                   value = 3, step = 0.1),
        
        helpText("Now, you can see your monthly payment and the sensitivity to interest rate variability.")
    ),

    # Show a plot of the generated distribution
    mainPanel(
        h3(strong("Your monthly payment is:")),
        strong(verbatimTextOutput("payment")),

        plotOutput("distPlot")
    )
  )
))
