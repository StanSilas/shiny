#My First Major shiny app
#ui.r
#ui.r
library(stringi)
library(stringr)
library(regexr)
library(shiny)
library(shinyIncubator)

#creating the fluidic page
shinyUI(fluidPage(
  
  
  #naming the the page 
  headerPanel("Sentiment Analysis "),
  
  # Inputting the search Terms
  
  sidebarPanel(
    
    wellPanel(
      textInput("entity1", "Handle 1: ","#clinton"),
      textInput ("entity2","Handle 2: ","#biden"),
      HTML
      ("<div style='font-size: 10px;font-weight: bold'> Feel free to replace above text with your own twitter handle name 
      starting with '@' or hashtag starting with '#'</div>")
      )  ,
    wellPanel(
      sliderInput("maxTweets","Number of recent tweets to use for analysis:",min=10,max=15000,value=10,step=5), # The values can be changed as required
      actionButton(inputId='actb',icon =icon("twitter"), label="Analyze!")
    )
    
    ),
  
  mainPanel(
    
    tabsetPanel(
      
      #Output from tab 4 ----So a box plot to see the distribution of scores of sentiments 
      tabPanel("Sentiment Analysis", plotOutput("sentiboxplot"), HTML
               ("<div> This plot shows the distribution of positive/negative sentiments about each entity. Note that tweets were cleaned before this analysis was performed. For each tweet, a net score of positive and negative sentiments are computed and this plot shows the distribution of scores.A higher sentiment score suggests more positive (or a less negative) discussion of that entity than the other.</div>"),
               tableOutput("sentiheadtable"),tableOutput("sentitailtable"),id="test"),
      
      #Output from tab 5 - Word clouds - with some html tags
      
      tabPanel("Word Clouds",h2(textOutput("entity1wc")),plotOutput("entity1wcplot"),h2(textOutput("entity2wc")),plotOutput("entity2wcplot")),
      
      #Output from tabs 6 and 7, the raw tweets
      tabPanel("Entity 1 Raw tweets",tableOutput("tableentity1")),
      tabPanel("Entity 2 Raw tweets",tableOutput("tableentity2"))
    )
  )
  
))
