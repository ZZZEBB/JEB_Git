<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>사업체 이벤트 게시물 목록페이지</title>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
	<div class = "container ms-2">
		<!-- 상단 간략화 메뉴 -->
		<nav class="text-end" style="margin-top:0.5%; text-align:center;" aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="${contextPath}/comBoard/comEventList.do" style="text-decoration:none; color:black;">이벤트 관리</a></li>
				<li class="breadcrumb-item active" aria-current="page">이벤트 목록</li>
			</ol>
		</nav>
		<table class = "table table-hover table-bordered text-center col-md-10 justify-content-center">
			<thead>	
				<tr>
					<th><input type = "checkbox"></th>
					<th>번호</th>
					<th>등록일자</th>
					<th>제목</th>
					<th>본문</th>
					<th>게시글상태</th>
					<th colspan="2"><button type = "button" class = "btn btn-secondary btn-sm">선택삭제</button></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type = "checkbox"></td>
					<td>1</td>
					<td>2023-02-27</td>
					<td>모두와 함께하는 코너투...</td>
					<td>코너투코너 1주년 감사제에 여러분을...</td>
					<td>승인 대기중</td>
					<td><button type = "button" class = "btn btn-secondary btn-sm">수정</button></td>
					<td><button type = "button" class = "btn btn-secondary btn-sm">삭제</button></td>
				</tr>
				<tr>
					<td><input type = "checkbox"></td>
					<td>2</td>
					<td>2023-03-27</td>
					<td>모두와 함께하는 코너투...</td>
					<td>코너투코너 1주년 감사제에 여러분을...</td>
					<td>게시중</td>
					<td><button type = "button" class = "btn btn-secondary btn-sm">수정</button></td>
					<td><button type = "button" class = "btn btn-secondary btn-sm">삭제</button></td>
				</tr>
				<tr>
					<td><input type = "checkbox"></td>
					<td>3</td>
					<td>2023-03-27</td>
					<td>모두와 함께하는 코너투...</td>
					<td>코너투코너 1주년 감사제에 여러분을...</td>
					<td>수정 요청중</td>
					<td><button type = "button" class = "btn btn-secondary btn-sm">수정</button></td>
					<td><button type = "button" class = "btn btn-secondary btn-sm">삭제</button></td>
				</tr>
				<tr>
					<td><input type = "checkbox"></td>
					<td>4</td>
					<td>2023-04-05</td>
					<td>모두와 함께하는 코너투...</td>
					<td>코너투코너 1주년 감사제에 여러분을...</td>
					<td>삭제 요청중</td>
					<td><button type = "button" class = "btn btn-secondary btn-sm">수정</button></td>
					<td><button type = "button" class = "btn btn-secondary btn-sm">삭제</button></td>
				</tr>
			</tbody>
		</table>
		<div class = "col-md-10 justify-content-end">
			<a href ="${contextPath}/comBoard/comEventForm.do"><button type = "button" class = "btn btn-primary btn-md float-right">이벤트 등록</button></a>
		</div>
	</div>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>