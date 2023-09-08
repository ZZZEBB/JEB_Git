<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, sec01.ex01.*" isELIgnored="false" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var = "contextPath" value = "${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>학생 추가 하기 _ 장은빈</title>
</head>
<body>
	<h1>학생 추가</h1>
	<hr>
	<form action = "${contextPath }/boad/addstudent.do" method = "post">
		<table align = "center">
			<tr>
				<td width = "110"><p>이름 : </p></td>
				<td width = "50"><input type = "text" name = "userName"></td>
			</tr>
			<tr>
				<td width = "110"><p>대학 : </p></td>
				<td width = "50"><input type = "text" name = "univ"></td>
			</tr>
			<tr>
				<td width = "110"><p>생일 : </p></td>
				<td width = "50"><input type = "text" name = "birth"></td>
			</tr>
			<tr>
				<td width = "110"><p>이메일 : </p></td>
				<td width = "50"><input type = "text" name = "email"></td>
			</tr>
			<tr>
				<td width = "110"><p>&nbsp;</p></td>
				<td width = "50"><input type = "submit" value = "등록"></td>
			</tr>
		</table>
	</form>
</body>
</html>