library(shiny)
ui=(pageWithSidebar(
        headerPanel("Interactive Histogram created with Shiny for the Data Products Project, (Johns Hopkins Data Science Certification)"),
        sidebarPanel(
                selectInput("textinput1", "Choose Plot Color:", choices = c('lightgreen','red', 'blue')),                
                numericInput('id1', 'Number of bins data is placed into', 5, min = 5, max = 100, step=5),
                sliderInput("num", "Choose a value for the number of random data points to be generated)",0, 1000,70, 0.5),
                dateInput("date1", "Pick a Date when the Data was generated:"),
                dateInput("date2", "Pick a Date when the Data was analyzed:"),
                p("R script: App01-template_hist_color_bin_date.R"),
                p("Github: https://github.com/infomindgithub/Interactive-Shiny-App-and-Reproducible-Presentation/tree/gh-pages")
        ),
        
        mainPanel(
                h4('MD Alamgir, Ph.D.'),
                h3('Interactive Histogram of Random Normal Numbers'),
                plotOutput(outputId = "histogram")
        )
)
)

#-------server code---

server<-function(input, output)
        {
        output$oid1 = renderPrint({input$id1})
        output$oid2 = renderPrint({input$id2})
        output$odate = renderPrint({input$date2-input$date1})
        output$histogram = renderPlot({hist(rnorm(input$num), col=input$textinput1, breaks = input$id1)})
        }
shinyApp(ui=ui, server=server)