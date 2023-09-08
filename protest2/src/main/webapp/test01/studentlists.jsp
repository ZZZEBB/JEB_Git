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
	<title>학생 목록 확인하기 _ 장은빈</title>
</head>
<body>
	<table align = "center" width = "100%" border = "1">
		<tr align = "center" bgcolor = "lightgray">
			<td width = "7%">ID</td>
			<td width = "7%">USERNAME</td>
			<td width = "7%">UNIV</td>
			<td width = "7%">BIRTH</td>
			<td width = "7%">EMAIL</td>
		</tr>
		<c:choose>
			<c:when test = "${studentsList == null }" >
				<tr align = "center">
					<td colspan = "5" width = "7%"><b>등록된 학생이 없습니다.</b></td>
				</tr>
			</c:when>
			<c:when test="${studentsList != null }">
				<c:forEach var = "student" items = "${studentsList }">
					<tr align = "center">
						<td width = "7%">${student.id }</td>
						<td width = "7%">${student.userName }</td>
						<td width = "7%">${student.univ }</td>
						<td width = "7%">${student.birth }</td>
						<td width = "7%">${student.email }</td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</table>
	<a href = "${contextPath }/boad/addForm.do" >학생 등록하기</a>
</body>
</html>