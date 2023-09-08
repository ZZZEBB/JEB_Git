<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var = "contextPath" value = "${pageContext.request.contextPath }" />   
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 정보 수정창</title>
	<style>
		.text_center{
			text-align : center;
		}
	</style>
</head>
<body>
	<form method="post" action = "${contextPath}/mem4.do?action=updateMember">
		<h1 class = "text_center">회원 정보 수정창</h1>
		<table align = "center">
			<tr>
				<td width = "200"><p align = "right">아이디</p></td>
				<td width = "400"><input type = "text" name = "id" value = "${member.id }" readonly></td>
			</tr>
			<tr>
				<td width = "200"><p align = "right">비밀번호</p></td>
				<td width = "400"><input type = "password" name = "pwd" value = "${member.pwd }"></td>
			</tr>
			<tr>
				<td width = "200"><p align = "right">이름</p></td>
				<td width = "400"><input type = "text" name = "name" value = "${member.name }"></td>
			</tr>
			<tr>
				<td width = "200"><p align = "right">이메일</p></td>
				<td width = "400"><input type = "text" name = "email" value = "${member.email }"></td>
			</tr>
			<tr>
				<td width = "200"><p>&nbsp;</p></td>
				<td width = "400">
					<input type = "submit" value = "수정하기">
					<a href = "${contextPath }/mem4.do?action=deleteMember&id=${member.id}"><input type = "button" value = "삭제하기"></a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>