library(dplyr)
library(leaflet)


library(EpiModel)

# plot(mod)
# summary(mod, at = 100)
# comp_plot(mod, at = 2, digits = 1)

# Main server function
server <- function(input, output) {
  output$dcm_plot <- renderPlot({
    param <-
      param.dcm(
        inf.prob = 0.03,
        act.rate = c(20),
        rec.rate = 0.01,
        a.rate = 0.01,
        ds.rate = 0.00,
        di.rate = 0.01,
        dr.rate = 0.01
      )
    
    init <- init.dcm(s.num = 999,
                     i.num = 100,
                     r.num = 0)
    control <- control.dcm(type = "SIR", nsteps = 365)
    
    mod <- dcm(param, init, control)
    plot(mod)
  })
}