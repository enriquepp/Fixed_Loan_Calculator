
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

payment <- function(amount, rate, years) {
        if (rate==0) {
                amount / years / 12
        } else {
        amount * rate / 1200 / (1 - 1 / (1 + rate / 1200)^(years * 12))
        }
}

shinyServer(function(input, output) {

    # calculate monthly payment
    output$payment <- renderPrint({round(payment(input$amount, input$rate, input$years), 2)})
        
    output$distPlot <- renderPlot({

    # generate payments for a range of interest rates
    x <- seq(0, input$rate + 5, 0.5)
    y <- sapply(x, function(x) payment(input$amount, x, input$years))

    # draw the plot
    plot(x, y, type="l", col="darkgray", xlab="interest rate per year %", lwd=3,
         ylab="monthly payment", main="Sensitivity to interest rate variability",
         cex.axis=1.5, cex.lab=1.5, cex.main=1.5)
    grid()
    abline(v=input$rate, col="red")
    abline(h=payment(input$amount, input$rate, input$years), col="red")

  })

})
