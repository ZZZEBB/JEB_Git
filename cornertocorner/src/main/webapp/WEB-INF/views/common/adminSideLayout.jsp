<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width">
	<%-- CSS only --%>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<title><tiles:insertAttribute name="title" /></title>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
   	* {
		font-family: 'Noto Sans KR', sans-serif;
	}
</style>
</head>
<body>
	<div class = "container">
		<header>
			<tiles:insertAttribute name="adminHeader" />
		</header>
		
		<div class="clear"></div>
		
		<div class = "d-flex p-2 bd-highlight">
			<aside class = "p-2 bd-highlight">
				<tiles:insertAttribute name="adminSide" />
			</aside>
			<article class = "p-2 flex-fill bd-highlight">
				<div class = "container-fluid">
					<tiles:insertAttribute name="body" />
				</div>
			</article>
		</div>
		<div class="clear"></div>
		
		<footer>
			<tiles:insertAttribute name="footer" />
		</footer>
	</div>
	
	<%-- JavaScript Bundle with Popper --%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>