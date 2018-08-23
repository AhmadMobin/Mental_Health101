library(shiny)
library(shinydashboard)
library(RCurl)
library(tidyverse)
library(plotly)
library(DT)

  
  #some data manipulation to derive the values of KPI boxes
  data<-read.csv (text=getURL("https://raw.githubusercontent.com/AhmadMobin/Mental_Health101/master/google_analytics_data.csv"),header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8")
  
  
  #Number of Users (Guest plus Enrolled)
  user.count <- data %>% select(User_Count)
  
  #Number of people who completed the course (guests + enrollled users)
  course.completion<- data %>%  select(Course_Completion)     
  
  #Number of Enrolled Users
  enrolled.users<- data %>% select(Enrolled_Users)
  
  #####  
  #Data for Graph
  data1<-read.csv (text=getURL("https://raw.githubusercontent.com/AhmadMobin/Mental_Health101/master/feedback_data.csv"),header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8")
  
  #Reasons for Taking Course
  data2<-read.csv (text=getURL("https://raw.githubusercontent.com/AhmadMobin/Mental_Health101/master/ReasonsForTakingCourse.csv"),header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8")
  
  #What People Enjoyed from Taking The Course
  data3<-read.csv (text=getURL("https://raw.githubusercontent.com/AhmadMobin/Mental_Health101/master/course_positives.csv"),header = TRUE, stringsAsFactors = FALSE, fileEncoding = "UTF-8")
  data3<- data3 %>% select (Comments)
  
  #####  
  
  #This step is necessary to avoid plotly from reordering the x-axis
  xaxis<-c('Strongly Disagree', 
           'Disagree',
           'Neutral',
           'Agree',
           'Strongly Agree')
  xaxis<- factor(xaxis,
                 levels=c('Strongly Disagree', 
                          'Disagree',
                          'Neutral',
                          'Agree',
                          'Strongly Agree'))
  
  #Modifying Axis fonts and size
  f1 <- list(
    family = "Arial, sans-serif",
    size = 14,
    color = "black"
  )
  
  ay <- list(
    title = '<b>Count<b>',
    titlefont=f1,
    zeroline = TRUE,
    showline = TRUE,
    showticklabels = TRUE,
    showgrid = TRUE
  )
  
  f2 <- list(
    family = "Arial, sans-serif",
    size = 18,
    color = "black"
  )
  
  
  ax <- list(
    title = "",
    tickfont = f2,
    zeroline = TRUE,
    showline = TRUE,
    showticklabels = TRUE,
    showgrid = TRUE
  )
  
  #####  