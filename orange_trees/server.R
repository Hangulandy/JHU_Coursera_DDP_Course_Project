library(shiny)
library(ggplot2)
## Load and tidy data

shinyServer(function(input, output) {
        
        dat <- reactive({
                Orange[Orange[, 1] %in% input$trees, ]
        })
        
        mod <- reactive({
                lm(data = dat(), circumference ~ age)
        })
        
        coef1 <- reactive({
                ifelse(is.null(input$trees), NA, mod()$coefficients[1])
        })
        
        coef2 <- reactive({
                ifelse(is.null(input$trees), NA, mod()$coefficients[2])
        })
        
        output$coef1 <- renderText(coef1())
        output$coef2 <- renderText(coef2())
        
        output$plot1 <- renderPlot({
                g <- ggplot(dat(), aes(x = age, y = circumference))
                g + geom_point(aes(color = Tree)) + 
                        geom_line(aes(color = Tree)) + 
                        geom_smooth(method = "lm", color = "black") +
                        ggtitle("Tree Data") +
                        theme(plot.title = element_text(hjust = 0.5)) +
                        labs(x = "Age (Days since 1968/12/31)", y = "Circumference (mm)")
        })
        
})
