library(leaflet)
library(EpiModel)

# plot(mod)
# summary(mod, at = 100)
# comp_plot(mod, at = 2, digits = 1)

rec_rates <- list(al = 0.01, be= 0.06, de4 = 0.09, de = 0.08, om = 0.12)
inf_rates <- list(al = 1, be = 1.5, de4 = 1.94, de = 1.87, om = 2.37)
a_rates <- list(reg = 0.01, dist = 0.005, quar = 0.002)
interaction_rates <- list(reg = 89, dist = 26, quar = 3)

# Main server function
server <- function(input, output) {
  output$dcm_plot <- renderPlot({
    d_params <-
      param.dcm(
        inf.prob = 0.02 * inf_rates[[input$d_var]],
        act.rate = interaction_rates[[input$d_reg]],
        rec.rate = rec_rates[[input$d_var]],
        a.rate = a_rates[[input$d_reg]],
        ds.rate = 0.01,
        di.rate = 0.018,
        dr.rate = 0.01
      )
    
    d_init <- init.dcm(s.num = input$d_pop,
                     i.num = input$d_inf,
                     r.num = 0)
    d_control <- control.dcm(type = "SIR", nsteps = 365)
    
    d_mod <- dcm(d_params, d_init, d_control)
    plot(d_mod)
  })
  
  output$icm_plot <- renderPlot({
    i_params <-
      param.icm(
        inf.prob = 0.02 * inf_rates[[input$s_var]],
        act.rate = interaction_rates[[input$s_reg]],
        rec.rate = rec_rates[[input$s_var]],
        a.rate = a_rates[[input$s_reg]],
        ds.rate = 0.01,
        di.rate = 0.018,
        dr.rate = 0.01
      )


    i_init <- init.icm(s.num = as.double(input$s_pop),
                     i.num = as.double(input$s_inf),
                     r.num = 0)
    i_control <- control.icm(type = "SIR", nsteps = 30, nsims=10)

    i_mod <- icm(i_params, i_init, i_control)
    plot(i_mod)

  })
}