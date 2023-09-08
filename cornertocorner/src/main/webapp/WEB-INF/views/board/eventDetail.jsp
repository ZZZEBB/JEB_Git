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
   <title>이벤트 상세페이지</title>
   <!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script>
		document.title = "${eventMap.event_title}";
	</script>
   <style>
	   .card-img-top {
	   		height : 10rem;
			object-fit : cover;
	   }
   </style>
   <script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <!-- css 스타일시트 추가 -->
    <!-- <link href="css/headers.css" rel="stylesheet"> -->
</head>
<body>
	<div class="container">
        <div class="row justify-content-center">
			<!-- <div class = "d-flex w-70 justify-content-end">
				<a href="#" class = "btn btn-outline-dark btn-sm my-2 mx-1">이전글</a>
				<a href="#" class = "btn btn-outline-dark btn-sm my-2 mx-1">다음글</a>
				<a href="${contextPath}/board/eventList.do" class = "btn btn-outline-dark btn-sm my-2 mx-1">목록</a>
			</div> -->
			<div class = "row justify-content-center">
				<span class = "fs-2 fw-bold">${eventMap.event_title}</span>
				<span class = "justify-content-end">${eventMap.event_write_date}</span>
				<hr>
				<img src="${contextPath}/resources/image/event/eventImage01.png" class = "w-80">
				<img src="${contextPath}/resources/image/event/eventImage01.png" class = "w-80">
				<p></p>
			</div>
		</div>
			
		<!-- 이벤트 관련 호텔 목록 -->
	    <div class="container mx-2">
	    	<div class = "container text">
	    		<h3>호텔을 특가로!</h3>
	    	</div> <!-- 원래 이 다음에 메모장 코드 있었음 -->
	    	<div class="row justify-content-center my-4">
	    		<img src="${contextPath}/resources/image/event/eventImage01.png" class = "w-80">
	    	</div>
	    	<div class = "row row-cols-1 row-cols-md-4 g-4">
	    		<div class = "col">
	    			<div class = "card h-100">
	    				<img src="${contextPath}/resources/image/package/pckItem01.jpg" class="card-img-top" alt="이벤트상품이미지">
	    				<div class = "card-body">
							<p class = "card-text">[특가상품] 제주 우도관광</p>
							<h5 class = "card-title">400,900 원~</h5>
							<a href="#" class = "btn btn-secondary btn-sm">자세히보기</a>
						</div>
	    			</div>
	    		</div>
	    		<div class = "col">
	    			<div class = "card h-100">
	    				<img src="${contextPath}/resources/image/package/pckItem02.jpg" class="card-img-top" alt="이벤트상품이미지">
	    				<div class = "card-body">
							<p class = "card-text">[특가상품] 제주 우도관광</p>
							<h5 class = "card-title">400,900 원~</h5>
							<a href="#" class = "btn btn-secondary btn-sm">자세히보기</a>
						</div>
	    			</div>
	    		</div>
	    		<div class = "col">
	    			<div class = "card h-100">
	    				<img src="${contextPath}/resources/image/package/pckItem03.jpg" class="card-img-top" alt="이벤트상품이미지">
	    				<div class = "card-body">
							<p class = "card-text">[특가상품] 제주 우도관광</p>
							<h5 class = "card-title">400,900 원~</h5>
							<a href="#" class = "btn btn-secondary btn-sm">자세히보기</a>
						</div>
	    			</div>
	    		</div>
	    		<div class = "col">
	    			<div class = "card h-100">
	    				<img src="${contextPath}/resources/image/package/pckItem04.jpg" class="card-img-top" alt="이벤트상품이미지">
	    				<div class = "card-body">
							<p class = "card-text">[특가상품] 제주 우도관광</p>
							<h5 class = "card-title">400,900 원~</h5>
							<a href="#" class = "btn btn-secondary btn-sm">자세히보기</a>
						</div>
	    			</div>
	    		</div>
	    		<div class = "col">
	    			<div class = "card h-100">
	    				<img src="${contextPath}/resources/image/package/pckItem05.jpg" class="card-img-top" alt="이벤트상품이미지">
	    				<div class = "card-body">
							<p class = "card-text">[특가상품] 제주 우도관광</p>
							<h5 class = "card-title">400,900 원~</h5>
							<a href="#" class = "btn btn-secondary btn-sm">자세히보기</a>
						</div>
	    			</div>
	    		</div>
	    		<div class = "col">
	    			<div class = "card h-100">
	    				<img src="${contextPath}/resources/image/package/pckItem06.jpg" class="card-img-top" alt="이벤트상품이미지">
	    				<div class = "card-body">
							<p class = "card-text">[특가상품] 제주 우도관광</p>
							<h5 class = "card-title">400,900 원~</h5>
							<a href="#" class = "btn btn-secondary btn-sm">자세히보기</a>
						</div>
	    			</div>
	    		</div>
	    		<div class = "col">
	    			<div class = "card h-100">
	    				<img src="${contextPath}/resources/image/package/pckItem07.jpg" class="card-img-top" alt="이벤트상품이미지">
	    				<div class = "card-body">
							<p class = "card-text">[특가상품] 제주 우도관광</p>
							<h5 class = "card-title">400,900 원~</h5>
							<a href="#" class = "btn btn-secondary btn-sm">자세히보기</a>
						</div>
	    			</div>
	    		</div>
	    		<div class = "col">
	    			<div class = "card h-100">
	    				<img src="${contextPath}/resources/image/package/pckItem08.jpg" class="card-img-top" alt="이벤트상품이미지">
	    				<div class = "card-body">
							<p class = "card-text">[특가상품] 제주 우도관광</p>
							<h5 class = "card-title">400,900 원~</h5>
							<a href="#" class = "btn btn-secondary btn-sm">자세히보기</a>
						</div>
	    			</div>
	    		</div>
	    	</div>
	    </div>
  </div>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
