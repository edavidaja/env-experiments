library(shiny)
library(dotenv)
library(purrr)

ui <- basicPage(
  wellPanel(
    verbatimTextOutput("vars"),
    verbatimTextOutput("branches")
  )
)

server <- function(input, output, session) {
  output$vars <- renderText({
    Sys.getenv("SECOND_VARIABLE")
  })
  
  output$branches <- renderText({
    safe_branch <- safely(gert::git_branch)
    branch <- safe_branch()
    branch$error
  })
}

shinyApp(ui, server)