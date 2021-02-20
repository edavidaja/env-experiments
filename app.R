library(shiny)
library(dotenv)

ui <- basicPage(
  wellPanel(
    verbatimTextOutput("vars"),
    verbatimTextOutput("branches")
  )
)

server <- function(input, output, session) {
  output$vars <- renderText({
    Sys.getenv("FIRST_VARIABLE")
  })
  output$branches <- renderText({
    gert::git_branch()
  })
}

shinyApp(ui, server)