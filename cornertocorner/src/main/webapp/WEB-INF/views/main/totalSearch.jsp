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
   <title>통합검색 결과창</title>
   <!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<style>
		a {
			text-decoration : none !important;
			color : #000 !important;
		}
	</style>
</head>
<body>
	<div class="container mt-3">
		<!-- 상단 탭 -->
		<ul class="nav nav-tabs justify-content-start" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="all-tab" data-bs-toggle="tab" data-bs-target="#all" type="button" role="tab" aria-controls="all" aria-selected="true">전체</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="goods-tab" data-bs-toggle="tab" data-bs-target="#goods" type="button" role="tab" aria-controls="goods" aria-selected="false">여행상품</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="faq-tab" data-bs-toggle="tab" data-bs-target="#faq" type="button" role="tab" aria-controls="faq" aria-selected="false">자주묻는질문</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="notice-tab" data-bs-toggle="tab" data-bs-target="#notice" type="button" role="tab" aria-controls="notice" aria-selected="false">공지사항</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="event-tab" data-bs-toggle="tab" data-bs-target="#event" type="button" role="tab" aria-controls="event" aria-selected="false">이벤트</button>
			</li>
		</ul>
		<h3 class = "mt-3"><span class = "fw-bolder">'여수'</span>에 관한 검색결과 <span class="badge bg-light text-dark">52건</span></h3>
		<!-- 탭 내용 -->
		<div class="tab-content mt-4" id="myTabContent">
			<div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="all-tab">
				<!-- 여행상품 -->
				<div class = "mt-3">
					<h4>여행상품 <span class="badge rounded-pill bg-success">32</span></h4>
					<hr class = "event_hr">
					<div class="row justify-content-start align-middle">
			  			<div class="d-flex list-group list-group-flush">
							<div class="list-group-item border-0 h-30">
								<img src="${contextPath}/resources/image/hotel/hotel1.jpg" width="30%" class = "float-start align-middle" alt="여수 1박2일여행">
								<h6 class = "ms-1 mt-1 fs-5 fw-bolder"><a href="#">에메랄드빛 바다와 함께하는 5성급 워케이션 라마다프라자 바이윈덤 여수</a></h6>
								<p class="smallCaption text-secondary">전라남도 여수시</p>
								<p class="smallCaption text-secondary">#라마다프라자바이윈덤여수 #여수여행 #여수 #향일암 #여수가볼만한곳 #호캉스 #품질인증콘텐츠</p>
							</div>
							<hr class = "event_hr">
						</div>
		        	</div>
		        	<div class="row justify-content-start align-middle">
			  			<div class="d-flex list-group list-group-flush">
							<div class="list-group-item border-0 h-30">
								<img src="${contextPath}/resources/image/hotel/htList01.png" width="30%" class = "float-start align-middle" alt="여수 1박2일여행">
								<h6 class = "ms-1 mt-1 fs-5 fw-bolder"><a href="#">친구야, 추억의 수학여행 떠나자! 여수 오동도</a></h6>
								<p class="smallCaption text-secondary">전라남도 여수시</p>
								<p class="smallCaption text-secondary">#9월추천 #여수가볼만한곳 #오동도 #여수해상케이블카 #돌산공원</p>
							</div>
							<hr class = "event_hr">
						</div>
		        	</div>
		        	<div class="row justify-content-start align-middle">
			  			<div class="d-flex list-group list-group-flush">
							<div class="list-group-item border-0 h-30">
								<img src="${contextPath}/resources/image/package/pckItem01.jpg" width="30%" class = "float-start align-middle" alt="여수 1박2일여행">
								<h6 class = "ms-1 mt-1 fs-5 fw-bolder"><a href="#">2022 필더리듬오브코리아! 한국관광 홍보영상 #여수 Feel the Rhythm of Korea - YEOSU</a></h6>
								<p class="smallCaption text-secondary">전라남도 여수시</p>
								<p class="smallCaption text-secondary">#여수 #여수여행 #여수가볼만한곳 #필더리듬오브코리아 #한국관광홍보영상</p>
							</div>
							<hr class = "event_hr">
						</div>
		        	</div>
		        	<div class="row justify-content-start align-middle">
			  			<div class="d-flex list-group list-group-flush">
							<div class="list-group-item border-0 h-30">
								<img src="${contextPath}/resources/image/package/pckItem02.jpg" width="30%" class = "float-start align-middle" alt="여수 1박2일여행">
								<h6 class = "ms-1 mt-1 fs-5 fw-bolder"><a href="#">같은 곳은 이제 NO! 자연과 예술이 함께하는 색다른 여수 여행</a></h6>
								<p class="smallCaption text-secondary">전라남도 여수시</p>
								<p class="smallCaption text-secondary">#전남가볼만한곳 #여수여행 #여수가볼만한곳 #장도 #웅천친수공원 #예술랜드 #스카이워크</p>
							</div>
							<hr class = "event_hr">
						</div>
		        	</div>
		        	<div class = "d-grid gap-2 col-4 mx-auto">
		        		<button type="button" class="btn btn-outline-dark btn-lg">더보기</button>
		        	</div>
	        	</div>
	        	<!-- 자주묻는질문 -->
	        	<div class = "mt-3">
		        	<h4>자주묻는질문 <span class="badge rounded-pill bg-success">4</span></h4>
					<div class="row justify-content-start align-middle">
			  			<div class="d-flex list-group list-group-flush">
							<div class="list-group-item border-0 h-30">
								<h6 class = "ms-1 mt-1 fs-5 fw-bolder"><a href="#">레이트 체크아웃 추가 되나요?</a></h6>
							</div>
							<hr class = "event_hr">
						</div>
		        	</div>
		        	<div class="row justify-content-start align-middle">
			  			<div class="d-flex list-group list-group-flush">
							<div class="list-group-item border-0 h-30">
								<h6 class = "ms-1 mt-1 fs-5 fw-bolder"><a href="#">결제 수단의 변경이 가능한가요?</a></h6>
							</div>
							<hr class = "event_hr">
						</div>
		        	</div>
		        	<div class = "d-grid gap-2 col-4 mx-auto">
		        		<button type="button" class="btn btn-outline-dark btn-lg">더보기</button>
		        	</div>
		        </div>
		        <!-- 공지사항 -->
		        <div class = "mt-3">
		        	<h4>공지사항 <span class="badge rounded-pill bg-success">5</span></h4>
					<div class="row justify-content-start align-middle">
			  			<div class="d-flex list-group list-group-flush">
							<div class="list-group-item border-0 h-30">
								<h6 class = "ms-1 mt-1 fs-5 fw-bolder"><a href="#">설 연휴 국내 항공 업무 안내</a></h6>
								<p class="smallCaption text-secondary">2023-03-28</p>
							</div>
							<hr class = "event_hr">
						</div>
		        	</div>
		        	<div class = "d-grid gap-2 col-4 mx-auto">
		        		<button type="button" class="btn btn-outline-dark btn-lg">더보기</button>
		        	</div>
		        </div>
		        <!-- 이벤트 -->
		        <div class = "mt-3">
		        	<h4>이벤트 <span class="badge rounded-pill bg-success">11</span></h4>
					<div class="row justify-content-start align-middle">
			  			<div class="d-flex list-group list-group-flush">
							<div class="list-group-item border-0 h-30">
								<img src="${contextPath}/resources/image/event/eventImage01.png" width="30%" class = "float-start align-middle" alt="여수 1박2일여행">
								<h6 class = "ms-1 mt-1 fs-5 fw-bolder"><a href="#">CornerToCorner 1주년 감사제!</a></h6>
								<p class="smallCaption text-secondary">CornerToCorner 1주년 감사제</p>
								<p class="smallCaption text-secondary">2023-03-18 ~ 2023-06-20</p>
							</div>
							<hr class = "event_hr">
						</div>
		        	</div>
		        	<div class = "d-grid gap-2 col-4 mx-auto">
		        		<button type="button" class="btn btn-outline-dark btn-lg">더보기</button>
		        	</div>
		        </div>
			</div>
			<div class="tab-pane fade" id="goods" role="tabpanel" aria-labelledby="goods-tab">
				<div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="all-tab">
		        	<div class="row justify-content-start align-middle">
			  			<div class="d-flex list-group list-group-flush">
							<div class="list-group-item border-0 h-30">
								<img src="${contextPath}/resources/image/hotel/hotel1.jpg" width="30%" class = "float-start align-middle" alt="여수 1박2일여행">
								<h6 class = "ms-1 mt-1 fs-5 fw-bolder"><a href="#">에메랄드빛 바다와 함께하는 5성급 워케이션 라마다프라자 바이윈덤 여수</a></h6>
								<p class="smallCaption text-secondary">전라남도 여수시</p>
								<p class="smallCaption text-secondary">#라마다프라자바이윈덤여수 #여수여행 #여수 #향일암 #여수가볼만한곳 #호캉스 #품질인증콘텐츠</p>
							</div>
							<hr class = "event_hr">
						</div>
		        	</div>
		        	<div class="row justify-content-start align-middle">
			  			<div class="d-flex list-group list-group-flush">
							<div class="list-group-item border-0 h-30">
								<img src="${contextPath}/resources/image/hotel/htList01.png" width="30%" class = "float-start align-middle" alt="여수 1박2일여행">
								<h6 class = "ms-1 mt-1 fs-5 fw-bolder"><a href="#">친구야, 추억의 수학여행 떠나자! 여수 오동도</a></h6>
								<p class="smallCaption text-secondary">전라남도 여수시</p>
								<p class="smallCaption text-secondary">#9월추천 #여수가볼만한곳 #오동도 #여수해상케이블카 #돌산공원</p>
							</div>
							<hr class = "event_hr">
						</div>
		        	</div>
		        	<div class="row justify-content-start align-middle">
			  			<div class="d-flex list-group list-group-flush">
							<div class="list-group-item border-0 h-30">
								<img src="${contextPath}/resources/image/package/pckItem01.jpg" width="30%" class = "float-start align-middle" alt="여수 1박2일여행">
								<h6 class = "ms-1 mt-1 fs-5 fw-bolder"><a href="#">2022 필더리듬오브코리아! 한국관광 홍보영상 #여수 Feel the Rhythm of Korea - YEOSU</a></h6>
								<p class="smallCaption text-secondary">전라남도 여수시</p>
								<p class="smallCaption text-secondary">#여수 #여수여행 #여수가볼만한곳 #필더리듬오브코리아 #한국관광홍보영상</p>
							</div>
							<hr class = "event_hr">
						</div>
		        	</div>
		        	<div class="row justify-content-start align-middle">
			  			<div class="d-flex list-group list-group-flush">
							<div class="list-group-item border-0 h-30">
								<img src="${contextPath}/resources/image/package/pckItem02.jpg" width="30%" class = "float-start align-middle" alt="여수 1박2일여행">
								<h6 class = "ms-1 mt-1 fs-5 fw-bolder"><a href="#">같은 곳은 이제 NO! 자연과 예술이 함께하는 색다른 여수 여행</a></h6>
								<p class="smallCaption text-secondary">전라남도 여수시</p>
								<p class="smallCaption text-secondary">#전남가볼만한곳 #여수여행 #여수가볼만한곳 #장도 #웅천친수공원 #예술랜드 #스카이워크</p>
							</div>
							<hr class = "event_hr">
						</div>
		        	</div>
				</div>
			</div>
			<div class="tab-pane fade" id="faq" role="tabpanel" aria-labelledby="faq-tab">
				<div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="all-tab">
					<div class="row justify-content-start align-middle">
			  			<div class="d-flex list-group list-group-flush">
							<div class="list-group-item border-0 h-30">
								<h6 class = "ms-1 mt-1 fs-5 fw-bolder"><a href="#">레이트 체크아웃 추가 되나요?</a></h6>
							</div>
							<hr class = "event_hr">
						</div>
		        	</div>
		        	<div class="row justify-content-start align-middle">
			  			<div class="d-flex list-group list-group-flush">
							<div class="list-group-item border-0 h-30">
								<h6 class = "ms-1 mt-1 fs-5 fw-bolder"><a href="#">결제 수단의 변경이 가능한가요?</a></h6>
							</div>
							<hr class = "event_hr">
						</div>
		        	</div>
				</div>
			</div>
			<div class="tab-pane fade" id="notice" role="tabpanel" aria-labelledby="notice-tab">
				<div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="all-tab">
					<div class="row justify-content-start align-middle">
			  			<div class="d-flex list-group list-group-flush">
							<div class="list-group-item border-0 h-30">
								<h6 class = "ms-1 mt-1 fs-5 fw-bolder"><a href="#">설 연휴 국내 항공 업무 안내</a></h6>
								<p class="smallCaption text-secondary">2023-03-28</p>
							</div>
							<hr class = "event_hr">
						</div>
		        	</div>
				</div>
			</div>
			<div class="tab-pane fade" id="event" role="tabpanel" aria-labelledby="event-tab">
				<div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="all-tab">
					<div class="row justify-content-start align-middle">
			  			<div class="d-flex list-group list-group-flush">
							<div class="list-group-item border-0 h-30">
								<img src="${contextPath}/resources/image/event/eventImage01.png" width="30%" class = "float-start align-middle" alt="여수 1박2일여행">
								<h6 class = "ms-1 mt-1 fs-5 fw-bolder"><a href="#">CornerToCorner 1주년 감사제!</a></h6>
								<p class="smallCaption text-secondary">CornerToCorner 1주년 감사제</p>
								<p class="smallCaption text-secondary">2023-03-18 ~ 2023-06-20</p>
							</div>
							<hr class = "event_hr">
						</div>
		        	</div>
				</div>
			</div>
		</div>
		<!-- 페이지네이션 -->
		<nav aria-label="Page navigation" class = "mt-5">
			<ul class="pagination justify-content-center">
				<li class="page-item">
					<a class="page-link" href="#" aria-label="Previous">
					  <span aria-hidden="true">&laquo;</span>
					</a>
				</li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item">
					<a class="page-link" href="#" aria-label="Next">
					  <span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</ul>
		</nav>
	</div>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>