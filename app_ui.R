introduction_page <- tabPanel(
  "Introduction",
  mainPanel(
    h3("COVID-19 Spread Interactive Models"),
    p("This Shiny app attempts to demonstrate how 
    infectious the major variants of COVID are in 
    different population sizes with different rules
    and regulations. The infectivity rates of the 
      different variants were obtained from",
      a("Yale Medicine", 
        href="https://www.yalemedicine.org/news/covid-19-variants-of-concern-omicron"),
      " (accessed March 8 2022), and the quantitative effects of social distancing 
      on the spread of COVID-19 were obtained from ", a("Daghiri and Ozmen 2021.", 
                                                   href="https://pubmed.ncbi.nlm.nih.gov/34071047/"), 
      " Information regarding COVID-19 recovery and death rate was obtained from ",
      a("WebMD.", href="https://www.webmd.com/lung/covid-recovery-overview"))
  )
)

variants <- c("Alpha" = "al", "Beta" = "be", "Delta AY.4.2*" = "de4", "Delta" = "de", "Omicron" = "om")
regulations <- c("None" = "reg", "Masking & Social Distancing" = "dist", "Quarintine"= "quar")
deterministic_model_page <- tabPanel(
  "Deterministic Model",
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "d_pop",
        label = "Initial Number Susceptible",
        min = 100,
        max = 100000,
        value = 1000
      ),
      sliderInput(
        inputId = "d_inf",
        label = "Initial Number Infected",
        min = 0,
        max = 100000,
        value = 10
      ),
      selectInput(
        inputId = "d_reg",
        label = "Regulations",
        choices = regulations
      ),
      selectInput(
        inputId = "d_var",
        label = "Variant",
        choices = variants
      )
    ),
    mainPanel(
      h3("Deterministic Model"),
      p("Here's a deterministic COVID-19 model for the different variants and regulations"),
      plotOutput("dcm_plot")
    )
  )
)
stochastic_model_page <- tabPanel(
  "Stochastic Model",
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "s_pop",
        label = "Initial Number Susceptible",
        min = 10,
        max = 100,
        value = 50
      ),
      sliderInput(
        inputId = "s_inf",
        label = "Initial Number Infected",
        min = 0,
        max = 25,
        value = 5
      ),
      selectInput(
        inputId = "s_reg",
        label = "Regulations",
        choices = regulations
      ),
      selectInput(
        inputId = "s_var",
        label = "Variant",
        choices = variants
      )
    ),
    mainPanel(
      h3("Stochastic Model - Individual Contact Model"),
      p("Here's a stochastic COVID-19 model for the different variants and regulations"),
      plotOutput("icm_plot")
      
    )
  )
)
interpretation_page <- tabPanel(
  "Interpretation",
  mainPanel(
    h3("Observations"),
    p("Both models visualize the fact that masking, social distancing, and 
      quarintine guidelines help limit the spread of COVID-19. They also visualize the fact that
      the Alpha variant is the least infectious variant, while Omicron is the most infectious."),
    p("In the deterministic 
      model, I noticed that the number of infected people would eventually 
      converge to zero in every combination of options, but the differentiating 
      factor between options with regulations versus without regulations was the
      recovery line, which either shot up or remained fairly low."),
    p("In the stochastic model, it was interesting to look at the significant amount of variation
      in the models with small sample size. As expected, the amount of variation decreased with higher
      sample size, but with quarintine regulations, the amount of variation for the number of susceptible
      people seemed to increase. This means that the variation of susceptible people was higher when there
      is lower entry rate and action rate."),
  h4("Limitations"),
    p("There are several limitations to both models. First of all, I assumed the 
      same rates of action and exposure for the different types of regulation,
      which would not be the case for compact urban cities versus suburbs. Next, I
      assumed that there was only one variant present in the region, which in practice
      would never be the case. Furthermore, the deterministic model is only valid
      in the case of large populations, because it assumes the population size is
      infinite."),
))
ui <- navbarPage(
  theme = bs_theme(version = 4, bootswatch = "minty"),
  "COVID-19 Models",
  introduction_page,
  deterministic_model_page,
  stochastic_model_page,
  interpretation_page
)