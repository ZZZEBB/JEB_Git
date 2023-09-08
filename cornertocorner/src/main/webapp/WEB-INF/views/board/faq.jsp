<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<script>
function toggleTagVisibility() {
	  var radioValue = document.querySelector('input[name="btnradio"]:checked').value;
	  var tagToHide1 = document.getElementById('accordionExample1');
	  var tagToHide2 = document.getElementById('accordionExample2');
	  var tagToHide3 = document.getElementById('accordionExample3');
	  var tagToHide4 = document.getElementById('accordionExample4');
	  
	  if (radioValue === 'hotel') {
	    tagToHide1.style.display = '';
	    tagToHide2.style.display = 'none';
	    tagToHide3.style.display = 'none';
	    tagToHide4.style.display = 'none';
	  } 
	  if (radioValue === 'flight') {
	    tagToHide1.style.display = 'none';
	    tagToHide2.style.display = '';
	    tagToHide3.style.display = 'none';
	    tagToHide4.style.display = 'none';
	  } 
	  if (radioValue === 'rent') {
	    tagToHide1.style.display = 'none';
	    tagToHide2.style.display = 'none';
	    tagToHide3.style.display = '';
	    tagToHide4.style.display = 'none';
	  } 
	  if (radioValue === 'packge') {
	    tagToHide1.style.display = 'none';
	    tagToHide2.style.display = 'none';
	    tagToHide3.style.display = 'none';
	    tagToHide4.style.display = '';
	  } 
	}
</script>
<style>
	.accordion-body {
		word-wrap : break-word;
	}
</style>
<head>
<meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>자주묻는질문 게시판</title>
   <!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
	<div class = "col-md-11 justify-content-center">
		<nav class="text-end col-md-11" aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item">고객센터</li>
				<li class="breadcrumb-item active" aria-current="page">자주묻는질문 (FAQ)</li>
			</ol>
		</nav>
		<div class="col-md-11 text-end">
			<h3 class = "fs-4 fw-bolder" style = "line-height: 100%;"><span class = "align-items-center">자주묻는질문</span>
				<img alt="faq" src="${contextPath}/resources/image/faq/faq.png" width="200px" height="200px">
		   	</h3>
		</div>
		<div class="container justify-content-center">
			<!-- 탭 버튼 -->
			<div class="btn-group col-md-11 align-middle" role="group" aria-label="Basic radio toggle button group">
				<input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" value="hotel" onclick="toggleTagVisibility()" checked>
				<label class="btn btn-outline-primary" for="btnradio1">호텔 관련</label>
				
				<input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off" value="flight" onclick="toggleTagVisibility()">
				<label class="btn btn-outline-primary" for="btnradio2">항공 관련</label>
				
				<input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off" value="rent" onclick="toggleTagVisibility()">
				<label class="btn btn-outline-primary" for="btnradio3">렌트 관련</label>
				
				<input type="radio" class="btn-check" name="btnradio" id="btnradio4" autocomplete="off" value="packge" onclick="toggleTagVisibility()">
				<label class="btn btn-outline-primary" for="btnradio4">패키지 관련</label>
			</div>
			<!-- FAQ 목록 -->
			<div class="row mt-3 col-md-11 justify-content-center ms-1">
				<div class="accordion align-middle" id="accordionExample1">
					<!-- FAQ - 호텔 탭 -->
					<c:forEach var="hotel" items="${faqhotel}">
						<div class="accordion-item">
							<h2 class="accordion-header" id="heading${hotel.faq_num}">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${hotel.faq_num}" aria-expanded="false" aria-controls="collapse${hotel.faq_num}">
									Q.&nbsp;${hotel.faq_title}
								</button>
							</h2>
							<div id="collapse${hotel.faq_num}" class="accordion-collapse collapse" aria-labelledby="heading${hotel.faq_num}" data-bs-parent="#accordionExample1">
								<div class="accordion-body text-wrap w-90">
									<p class = "text-break lh-base">A.&nbsp;${fn:replace(hotel.faq_content, replaceChar, "<br/>")}</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="accordion align-middle" id="accordionExample2" style = "display : none;">
					<!-- FAQ - 항공 탭 -->
					<c:forEach var="flight" items="${faqflight}">
						<div class="accordion-item">
							<h2 class="accordion-header" id="heading${flight.faq_num}">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${flight.faq_num}" aria-expanded="false" aria-controls="collapse${flight.faq_num}">
									Q.&nbsp;${flight.faq_title}
								</button>
							</h2>
							<div id="collapse${flight.faq_num}" class="accordion-collapse collapse" aria-labelledby="heading${flight.faq_num}" data-bs-parent="#accordionExample2">
								<div class="accordion-body text-wrap w-90">
									<p class = "text-break lh-base">A.&nbsp;${fn:replace(flight.faq_content, replaceChar, "<br/>")}</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="accordion align-middle" id="accordionExample3" style = "display : none;">
					<!-- FAQ - 렌트 탭 -->
					<c:forEach var="rent" items="${faqrent}">
						<div class="accordion-item">
							<h2 class="accordion-header" id="heading${rent.faq_num}">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${rent.faq_num}" aria-expanded="false" aria-controls="collapse${rent.faq_num}">
									Q.&nbsp;${rent.faq_title}
								</button>
							</h2>
							<div id="collapse${rent.faq_num}" class="accordion-collapse collapse" aria-labelledby="heading${rent.faq_num}" data-bs-parent="#accordionExample3">
								<div class="accordion-body text-wrap w-90">
									<p class = "text-break lh-base">A.&nbsp;${fn:replace(rent.faq_content, replaceChar, "<br/>")}</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="accordion align-middle" id="accordionExample4" style = "display : none;">
					<!-- FAQ - 패키지 탭 -->
					<c:forEach var="pack" items="${faqpackage}">
						<div class="accordion-item">
							<h2 class="accordion-header" id="heading${pack.faq_num}">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${pack.faq_num}" aria-expanded="false" aria-controls="collapse${pack.faq_num}">
									Q.&nbsp;${pack.faq_title}
								</button>
							</h2>
							<div id="collapse${pack.faq_num}" class="accordion-collapse collapse" aria-labelledby="heading${pack.faq_num}" data-bs-parent="#accordionExample4">
								<div class="accordion-body text-wrap w-90">
									<p class = "text-break lh-base">A.&nbsp;${fn:replace(pack.faq_content, replaceChar, "<br/>")}</p>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>