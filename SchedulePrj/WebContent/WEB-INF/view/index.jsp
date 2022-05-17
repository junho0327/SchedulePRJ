<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="poly.util.CmmUtil" %>
<!DOCTYPE html>
<html lang='en'>
  <head>
    <meta charset='utf-8' />
    
<link href='${pageContext.request.contextPath}/resources/fullcalendar-5.10.1/lib/main.css' rel='stylesheet' />
<script src='${pageContext.request.contextPath}/resources/fullcalendar-5.10.1/lib/main.js'></script>
<script type='text/javascript'>

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');
   
  var calendar = new FullCalendar.Calendar(calendarEl, {
    googleCalendarApiKey: '~',
    eventSources: [
      if(userName.equals("123"))
       {
          googleCalendarId: '~',
          className: '123',
          color: '#be5683', //rgb,#ffffff 등의 형식으로 할 수 있어요.
          //textColor: 'black' 
        },
        else if(userName.equals("456"))
      {
          googleCalendarId: '~',
          className: '456',
            color: '#204051',
            //textColor: 'black' 
        },
        else(userName.equals("789"))
      {
          googleCalendarId: '~',
          className: '789',
            color: '#3b6978',
            //textColor: 'black' 
        }
    ]
  });
  calendar.render();
});
</script>
<style>
#calendar{
   width:60%;
   margin:20px auto;
}
</style>
  </head>
  <body>
    <div id='calendar'></div>
  </body>
  
</html>
