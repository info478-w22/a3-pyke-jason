introduction_page <- tabPanel(
  titlePanel("Introduction"),
  mainPanel(
    h3("COVID-19 Spread Interactive Models"),
    p("A map of various statistics of counties and states in the midwest, 
      including education, poverty and diversity. ",
      strong("Marker sizes are based on the amount of 
      education/diversity/poverty per county/state. 
      For counties, opacity also depends on this."))
  )
)
deterministic_model_page <- tabPanel(
  titlePanel("Deterministic Model"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "map_type",
        label = "Statistics Area of Interest",
        choices = c("Education", "Diversity", "Poverty")
      ),
      selectInput(
        inputId = "scope",
        label = "Scope",
        choices = c("County", "State")
      )
    ),
    mainPanel(
      h3("Deterministic Model"),
      p("A map of various statistics of counties and states in the midwest, 
        including education, poverty and diversity. ",
        strong("Marker sizes are based on the amount of 
        education/diversity/poverty per county/state. 
        For counties, opacity also depends on this.")),
      plotOutput("dcm_plot")
    )
  )
)
stochastic_model_page <- tabPanel(
  titlePanel("Stochastic Model"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "map_type",
        label = "Statistics Area of Interest",
        choices = c("Education", "Diversity", "Poverty")
      ),
      selectInput(
        inputId = "scope",
        label = "Scope",
        choices = c("County", "State")
      )
    ),
    mainPanel(
      h3("Stochastic Model - Individual Contact Model"),
      p("A map of various statistics of counties and states in the midwest, 
        including education, poverty and diversity. ",
        strong("Marker sizes are based on the amount of 
        education/diversity/poverty per county/state. 
        For counties, opacity also depends on this."))
    )
  )
)
interpretation_page <- tabPanel(
  titlePanel("Interpretation"),
  mainPanel(
    h3("Interpretation of Models"),
    p("A map of various statistics of counties and states in the midwest, 
      including education, poverty and diversity. ",
      strong("Marker sizes are based on the amount of 
      education/diversity/poverty per county/state. 
      For counties, opacity also depends on this."))
  )
)
ui <- navbarPage(
  "Education Diversity and Poverty",
  introduction_page,
  deterministic_model_page,
  stochastic_model_page,
  interpretation_page
)