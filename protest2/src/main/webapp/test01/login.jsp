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
	<title>로그인창 _ 장은빈 1번</title>
</head>
<body>
	<h1>아이디를 입력하지 않았습니다. 아이디를 입력해 주세요.</h1>
	<form action = "${contextPath }/test01/result.jsp" method = "post">
		아이디 : <input type = "text" name = "userID"><br>
		비밀번호 : <input type = "password" name = "userPw"><br>
		<input type = "submit" value = "로그인">
		<input type = "reset" value = "다시 입력">
	</form>
</body>
</html>