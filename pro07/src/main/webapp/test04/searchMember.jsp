<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원검색창 _ 조건 값으로 회원 정보 조회</title>
</head>
<body>
	<form action = "${pageContext.request.contextPath }/mem4.do">
		<input type = "hidden" name = "action" value =  "searchMember" />
		이름 : <input type = "text" name = "name" /><br>
		이메일 : <input type = "text" name = "email" /><br>
		<input type = "submit" value = "검색" />
	</form>
</body>
</html>