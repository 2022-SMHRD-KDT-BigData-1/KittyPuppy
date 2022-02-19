<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:remove var="member" scope="session"/>
	<c:remove var="feedNo" scope="session"/>
	<c:remove var="fcNo" scope="session"/>
	<c:remove var="scrapNo" scope="session"/>
	<c:remove var="scfcNo" scope="session"/>
	
	<c:redirect url="login.jsp"/>
	
</body>
</html>