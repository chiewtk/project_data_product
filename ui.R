shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Illustration of Central Limit Theorem with poisson distribution."),

    sidebarPanel(
      h4('This tutorial demonstrated how the sample means tends to the population mean and how poisson distribution samples has distribution approaching normal distribution.'),
      #      numericInput('glucose', 'Glucose mg/dl', 90, min = 50, max = 200, step = 5),
#      selectInput('distribution','Prob Distribution',
#                  choices = list("Uniform" = "uniform", "Binomial" = "binomial", "Poisson" = "poisson", "Exponential" = "exponential")),
      sliderInput('lambda', 'lambda', value = 0.1, min = 0.1, max = 10, step = 0.1,),
      sliderInput('sample_size', 'Samples Size (1000 samples)',value = 25, min = 10, max = 100, step = 1,)
#      submitButton('Submit')
    ),
    mainPanel(
      h3('Theoretical parameters:'),
      h4('mean = stddev = '),
      verbatimTextOutput("theoretical_mean_stddev"),
      h3('Sample statistics:'),
      verbatimTextOutput("sample_mean"),
      plotOutput("popPlot"),
      plotOutput("sampPlot")
    )
  )
)