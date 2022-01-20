<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
<%
Calendar date = Calendar.getInstance(); 
SimpleDateFormat today = new SimpleDateFormat("yyyy년 mm월 dd일");
SimpleDateFormat now = new SimpleDateFormat("hh시 mm분 ss초");
SimpleDateFormat todaynow = new SimpleDateFormat("yyyy.mm.dd:hh시 mm분 ss초");

%>

	오늘은 <strong> <%= today.format(date.getTime()) %> </strong>입니다.<br>
	지금 시각은 <strong> <%= now.format(date.getTime()) %></strong>입니다.<br>
	
	지금은 <%= todaynow.format(date.getTime()) %>입니다.<br>
	
	<%-- <%= date.getTime() %> --%>
	 <br><%=date.getTimeZone() %>
	<br>
	 <%= date.getWeeksInWeekYear() %><br>
	 <%= now.getCalendar() %><br>
	 <%= date.getCalendarType() %><br>
	 <%= String.valueOf(date.getTime())%><br>
	 

</body>
</html>