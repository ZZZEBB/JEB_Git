<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:set var = "contextPath" value = "${pageContext.request.contextPath }" />
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보 출력창</title>
</head>
<body>
	<table border = "1" align = "center" width = "80%">
		<tr align = "center" bgcolor = "lightgray">
			<td><b>아이디</b></td>
			<td><b>비밀번호</b></td>
			<td><b>이름</b></td>
			<td><b>이메일</b></td>
			<td><b>가입일</b></td>
		</tr>
		<c:choose>
			<c:when test = "${empty membersList }">
				<tr align = "center">
					<td colspan = "5">
						<p>등록된 글이 없습니다.</p>
					</td>
				</tr>
			</c:when>
			<c:when test = "${!empty membersList }">
				<c:forEach var = "member" items = "${membersList }">
					<tr align = "center">
						<td><a href = "${contextPath }/member/modMember.do?id=${member.id}">${member.id }</a></td>
						<td>${member.pwd }</td>
						<td>${member.name }</td>
						<td>${member.email }</td>
						<td>${member.joinDate }</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	<a href = "${contextPath }/member/memberForm.do">
		<h1 style = "text-align : center;">회원가입</h1>
	</a>
</body>
</html>