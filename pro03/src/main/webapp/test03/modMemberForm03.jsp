<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var = "contextPath" value = "${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 가입창</title>
	<style type = "text/css">
		.cls1 {
			font-size : 40px;
			text-align : center;
		}
		.cls2{
			text-align : center;
		}
	</style>
</head>
<body>
	<h1 class = "cls1">회원 정보 수정창</h1>
	<form action = "${contextPath }/member152/modMember.do?id=${memInfo.id}" method = "post">
		<table align = "center">
			<caption>회원가입창</caption>
			<tr>
				<td width = "110"><p>아이디 : </p></td>
				<td width = "50"><input type = "text" name = "id" value = "${memInfo.id}" disabled = "disabled"></td>
			</tr>
			<tr>
				<td width = "110"><p>비밀번호 : </p></td>
				<td width = "50"><input type = "password" name = "pwd" value = "${memInfo.pwd}"></td>
			</tr>
			<tr>
				<td width = "110"><p>이름 : </p></td>
				<td width = "50"><input type = "text" name = "name" value = "${memInfo.name}"></td>
			</tr>
			<tr>
				<td width = "110"><p>이메일 : </p></td>
				<td width = "50"><input type = "email" name = "email" value = "${memInfo.email}"></td>
			</tr>
			<tr>
				<td width = "110"><p>&nbsp;</p></td>
				<td width = "50">
					<input type = "submit" value = "수정">
					<input type = "reset" value = "취소">
				</td>
			</tr>
		</table>
	</form>		
</body>
</html>