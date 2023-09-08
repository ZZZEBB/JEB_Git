<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<c:set var = "contextPath" value = "${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>결과창 _ 장은빈 1번</title>
</head>
<body>
	<%
		String userID = request.getParameter("userID");
		if(userID.length() == 0) {
	%>
	<jsp:forward page = "login.jsp" />
	<%
		}
	%>
	<h1>환영합니다! <%=userID %>님 !!</h1>
</body>
</html>