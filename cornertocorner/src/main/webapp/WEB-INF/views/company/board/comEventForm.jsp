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
	<title>사업체 이벤트 게시물 등록페이지</title>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
	<div class = "container justify-content-center col-md-9 ms-2">
		<!-- 상단 간략화 메뉴 -->
		<nav class="text-end" style="margin-top:0.5%; text-align:center;" aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="${contextPath}/comBoard/comEventList.do" style="text-decoration:none; color:black;">이벤트 관리</a></li>
				<li class="breadcrumb-item active" aria-current="page">이벤트 등록</li>
			</ol>
		</nav>
		<form class="row g-3 col-md-9 justify-content-center is-invalid">
			<div class="mb-3 row">
				<label for="inputEventTitle" class="col-sm-2 col-form-label">제목</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" id="inputEventTitle" placeholder="등록하실 이벤트의 제목을 입력해주세요." required>
				</div>
			</div>
			<div class="col-md-5">
				<label for="inputState" class="col-sm-5 col-form-label">카테고리</label>
				<select id="inputState" class="form-select form-control">
					<option selected>선택</option>
					<option value = "호텔">호텔</option>
					<option value = "항공">항공</option>
					<option value = "렌트">렌트</option>
					<option value = "패키지">패키지</option>
				</select>
				<div class="invalid-feedback">카테고리를 선택해주세요.</div>
			</div>
			<div class="col-md-7">
				<label for="inputState" class="col-sm-7 col-form-label">상품선택</label>
				<select id="inputState" class="form-select form-control">
					<option selected>선택</option>
					<option value = "호텔">호텔</option>
					<option value = "항공">항공</option>
					<option value = "렌트">렌트</option>
					<option value = "패키지">패키지</option>
				</select>
				<div class="invalid-feedback">이벤트와 연결할 상품을 선택해주세요.</div>
			</div>
			<div class="col-12">
				<label for="inputAddress" class="form-label">Address</label>
				<input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
			</div>
			<div class="col-12">
				<label for="inputAddress2" class="form-label">Address 2</label>
				<input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
			</div>
			<div class="col-md-6">
				<label for="inputCity" class="form-label">City</label>
				<input type="text" class="form-control" id="inputCity">
			</div>
			<div class="col-md-4">
				<label for="inputState" class="form-label">State</label>
				<select id="inputState" class="form-select">
					<option selected>Choose...</option>
					<option>...</option>
				</select>
			</div>
			<div class="col-md-2">
				<label for="inputZip" class="form-label">Zip</label>
				<input type="text" class="form-control" id="inputZip">
			</div>
			<div class="col-12">
				<div class="form-check">
					<input class="form-check-input" type="checkbox" id="gridCheck">
					<label class="form-check-label" for="gridCheck">Check me out</label>
				</div>
			</div>
			<div class="col-12">
				<button type = "submit" class = "btn btn-primary btn-md justify-content-end">등록요청</button>
			</div>
		</form>
	</div>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>