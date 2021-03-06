library(shiny)
library(wordcloud2)
library(tm)
library(colourpicker)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  # Create a container for tab panels
  tabsetPanel(
    # Create a "Word cloud" tab
    tabPanel(
      title = "Word cloud",
      sidebarLayout(
        sidebarPanel(
          radioButtons(
            inputId = "source",
            label = "Word source",
            choices = c(
              "Martin Luther King Jr's speech" = "book",
              "Use your own words" = "own",
              "Upload a file" = "file")),
          hr(),
          # Add the selector for the language of the text
          selectInput(
            inputId = "language",
            label = "Remove stopwords in",
            choices = c("Danish", "Dutch", "English", "Finnish", "French", "German", "Hungarian", "Italian", "Norwegian", "Portuguese", "Russian", "Spanish", "Swedish"),
            multiple = FALSE,
            selected = "English"),
          conditionalPanel(
            condition = "input.source == 'own'",
            textAreaInput("text", "Enter text", rows = 7)),
          # Wrap the file input in a conditional panel
          conditionalPanel(
            # The condition should be that the user selects
            # "file" from the radio buttons
            condition = "input.source == 'file'",
            fileInput("file", "Select a file")),
            hr(),
                                    checkboxInput("remove_words", "Remove specific words?", FALSE),
                                    conditionalPanel(
                                        condition = "input.remove_words == 1",
                                        textAreaInput("words_to_remove1", "Words to remove (one per line)", rows = 1)
                                    ),
                                    conditionalPanel(
                                        condition = "input.remove_words == 1 && input.words_to_remove1.length > 0",
                                        textAreaInput("words_to_remove2", "", rows = 1)
                                    ),
                                    conditionalPanel(
                                        condition = "input.remove_words == 1 && input.words_to_remove2.length > 0",
                                        textAreaInput("words_to_remove3", "", rows = 1)
                                    ),
                                    conditionalPanel(
                                        condition = "input.remove_words == 1 && input.words_to_remove3.length > 0",
                                        textAreaInput("words_to_remove4", "", rows = 1)
                                    ),
                                    conditionalPanel(
                                        condition = "input.remove_words == 1 && input.words_to_remove4.length > 0",
                                        textAreaInput("words_to_remove5", "", rows = 1)
                                    ),
                                    conditionalPanel(
                                        condition = "input.remove_words == 1 && input.words_to_remove5.length > 0",
                                        textAreaInput("words_to_remove6", "", rows = 1)
                                    ),
                                    conditionalPanel(
                                        condition = "input.remove_words == 1 && input.words_to_remove6.length > 0",
                                        textAreaInput("words_to_remove7", "", rows = 1)
                                    ),
                                    conditionalPanel(
                                        condition = "input.remove_words == 1 && input.words_to_remove7.length > 0",
                                        textAreaInput("words_to_remove8", "", rows = 1)
                                    ),
                                    conditionalPanel(
                                        condition = "input.remove_words == 1 && input.words_to_remove8.length > 0",
                                        textAreaInput("words_to_remove9", "", rows = 1)
                                    ),
                                    conditionalPanel(
                                        condition = "input.remove_words == 1 && input.words_to_remove9.length > 0",
                                        textAreaInput("words_to_remove10", "", rows = 1)
                                    ),
                                    hr(),
                                    numericInput("num", "Maximum number of words",
                                                 value = 100, min = 5
                                    ),
                                    hr(),
                                    colourInput("col", "Background color", value = "white"),
                                    hr(),
                                    HTML('<p>view the <a href="https://github.com/XUYEMAY">code</a></p>')
                                ),
                                mainPanel(
                                    wordcloud2Output("cloud"),
                                    br(),
                                    br()
                                )
                            )
                        ),
                        # Create an "About this app" tab
                        tabPanel(
                            title = "About this app",
                            br(),
                            "Instructions on how to use this Shiny app:",
                            br(),
                            br(),
                            HTML("<ul><li>When uploading a file, make sure to upload a .csv or .txt file</li>
       <li>If it is a .csv file, there should be only one column containing all words or sentences (see below for example files)</li>
       <li>Numbers and punctuations will be automatically removed, as well as stop words in the language of your choice (via the dropdown selector)</li></ul>"),
                            br(),
                            br(),
                            HTML('<p>view the <a href="https://github.com/XUYEMAY">code</a></p>'),
                            br(),
                            br()
                        )
                    )))
