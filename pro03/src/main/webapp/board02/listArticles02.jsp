<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*, sec03.brd02.*" isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록창</title>
<style>
	.cls1 {
		text-decoration : none;
		text-align : center;
	}
	.cls2 {
		text-align : center;
		font-size : 30px;
	}
</style>
</head>
<body>
	<table align="center" border="1" width="80%">
		<tr height="10" align="center" bgcolor="#c52647" style = "color : white;">
			<td>글번호</td>
			<td>작성자</td>
			<td>제목</td>
			<td>작성일</td>
		</tr>
	<c:choose>
		<c:when test="${empty articlesList}">
			<tr height="10">
				<td colspan="4">
					<p align="center">
						<b><span style="font-size:9pt">등록된 글이 없습니다.</span></b>
					</p>
				</td>
			</tr>
		</c:when>
		<c:when test="${!empty articlesList}">
			<c:forEach var="article" items="${articlesList}" varStatus="articleNum">
				<tr align = "center">
					<td width = "5%">${articleNum.count}</td>
					<td width = "10%">${article.id}</td>
					<td align = "left" width = "35%">
					<span style="padding-right : 30px"></span>
					<c:choose>
						<c:when test="${article.level > 1}">
							<c:forEach begin="1" end="${article.level }" step="1">
								<span style="padding-left : 10px"></span>
							</c:forEach>
							<span style="font-size:12px">[답변]</span>
							<a class="clas1" href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">
								${article.title}
							</a>
						</c:when>
						<c:otherwise>
							<a class="cls1" href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">
								${article.title}
							</a>
						</c:otherwise>
					</c:choose>
					</td>
					<td width="10%"><fmt:formatDate value="${article.writeDate}"/></td>
				</tr>
			</c:forEach>
		</c:when>
	</c:choose>
	</table>
	<a class="cls1" href="${contextPath }/board/articleForm.do"><p class="cls2"><b>글쓰기</b></p></a>
</body>
</html>