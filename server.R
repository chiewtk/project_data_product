#diabetesRisk <- function(glucose) glucose / 200
shinyServer(
  function(input, output) {
#    output$theoretical_mean_stddev<-1
#    f<<-function() {
    gen<-reactive({
      dat<<-rpois(input$sample_size * 1000,input$lambda)  
      mdat<<-matrix(dat,1000,input$sample_size)
      datbar<<-rowMeans(mdat);
      list(dat,mdat,datbar)
 #   }
    })
    output$popPlot<-renderPlot({
      set.seed(Sys.time())
      gen();
      hist(dat,main="Population Distribution");
    })
    output$sampPlot<-renderPlot({
      gen()
      hist(datbar,main="Sample mean Distribution");
    })
    output$theoretical_mean_stddev <- renderPrint({gen();input$lambda})
    output$sample_mean <- renderPrint({gen();mean(datbar)})
#    output$prediction <- renderPrint({diabetesRisk(input$glucose)})
  }
)