server <- function(input, output) {
#creating the valueBoxOutput content
output$value1 <- renderValueBox({
  valueBox(
    formatC(user.count$User_Count, format="d", big.mark=',')
    ,'USER COUNT'
    ,icon = icon("stats",lib='glyphicon')
    ,color = "purple")  
})
  
output$value2 <- renderValueBox({ 
  valueBox(
    formatC(course.completion$Course_Completion, format="d", big.mark=',')
    ,'COURSE COMPLETION- ALL USERS'
    ,icon = icon("check",lib='glyphicon')
    ,color = "green")  
})

output$value3 <- renderValueBox({
  valueBox(
    formatC(enrolled.users$Enrolled_Users, format="d", big.mark=',')
    ,'ENROLLED USERS'
    ,icon = icon("user",lib='glyphicon')
    ,color = "yellow")   
})

#creating the plotOutput content
output$plot1 <- renderPlotly({
  plot_ly(data1,  y=~get(input$input1), 
          x=~xaxis,
          type='bar', 
          marker=list(color='#006eed')) %>% 
    layout(yaxis = ay, xaxis=ax)
})  

#reasons for taking the course
output$Reasons<-renderDataTable({
  datatable(data2, options=list(paging=TRUE,
                                          pageLength=5,
                                          lengthChange=FALSE),
            rownames=FALSE,
            colnames=NULL,
            escape=FALSE) 
  
})

#What People liked from the course
output$Enjoy<-renderDataTable({
  datatable(data3, options=list(paging=TRUE,
                                pageLength=5,
                                lengthChange=FALSE),
            rownames=FALSE,
            colnames=NULL,
            escape=FALSE) 
  
})


} #server }