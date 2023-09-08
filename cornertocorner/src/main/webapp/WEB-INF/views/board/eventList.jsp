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
   <title>공지사항 게시판</title>
   <!-- CSS only -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
   <style>
         .event_hr {
	   		box-sizing : border-box;
			background-color : #808080;
			margin : 30px auto;
			border : none;
			height : 2px;
		}
         tbody > tr > td > a {
            text-decoration: none;
         }
   </style>
   <script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
	<div class = "col-md-11">
		<ul class="nav nav-pills justify-content-center" id="myTab" role="tablist">
			<li class="nav-item" role="presentation">
				<button class="nav-link active" id="all-tab" data-bs-toggle="tab" data-bs-target="#all" type="button" role="tab" aria-controls="all" aria-selected="true">전체</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="hotel-tab" data-bs-toggle="tab" data-bs-target="#hotel" type="button" role="tab" aria-controls="hotel" aria-selected="false">호텔</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="flight-tab" data-bs-toggle="tab" data-bs-target="#flight" type="button" role="tab" aria-controls="flight" aria-selected="false">항공권</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="rent-tab" data-bs-toggle="tab" data-bs-target="#rent" type="button" role="tab" aria-controls="rent" aria-selected="false">렌트</button>
			</li>
			<li class="nav-item" role="presentation">
				<button class="nav-link" id="package-tab" data-bs-toggle="tab" data-bs-target="#package" type="button" role="tab" aria-controls="package" aria-selected="false">패키지</button>
			</li>
		</ul>
		<div class="tab-content" id="myTabContent">
			<div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="all-tab">
				<h6 class = "col-md-7 fs-6 fw-bold">전체 프로모션 n개</h6>
				<hr class = "event_hr">
				<div class="row justify-content-center">
					<div class="col-md-9">
						<div class="list-group list-group-flush">
							<c:choose>
								<c:when test="${empty eventLists}">
									<h3>등록된 이벤트가 없습니다.</h3>
								</c:when>
								<c:otherwise>
									<c:forEach var = "event" items = "${eventLists}">
										<div class="d-flex w-70 list-group-item border-0">
											<img src="${contextPath}/resources/image/event/eventImage01.png" width="30%">
											<span class="badge badge-pill badge-light ms-3" style="color: #004680; border: 1px solid #004680; height: 10%;">${event.event_category}</span>
											<h6 class="mb-1 ms-5" style="height: 15px; line-height: 15px;"><span class = "fs-5 fw-bolder">${event.event_title}</span>
												<small class="smallCaption text-secondary"><br>${event.event_content}<br><fmt:formatDate value="${event.event_start_date}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${event.event_end_date}" pattern="yyyy-MM-dd"/></small>
											</h6>
											<span class="badge badge-pill badge-light ms-3" style="color: #004680; border: 1px solid #004680; height: 10%;">${event.event_status}</span>
										</div>
										<div class="d-flex justify-content-end">
											<a class = "btn btn-primary btn-sm" href="${contextPath}/board/eventDetail.do?event_num=${event.event_num}">자세히 보기</a>
										</div>
										<hr class = "event_hr col-md-12">
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
       				</div>
  				</div>
  			</div>
			<div class="tab-pane fade" id="hotel" role="tabpanel" aria-labelledby="hotel-tab">
				<h6 class = "col-md-7 fs-6 fw-bold">호텔 프로모션 n개</h6>
				<hr class = "event_hr">
				<div class="row justify-content-center">
					<div class="col-md-9">
						<div class="list-group list-group-flush">
							<c:choose>
								<c:when test="${empty eventLists}">
									<h3>등록된 이벤트가 없습니다.</h3>
								</c:when>
								<c:otherwise>
									<c:forEach var = "event" items = "${eventLists}">
										<c:if test="${event.event_category == '호텔'}">
											<div class="d-flex w-70 list-group-item border-0">
												<img src="${contextPath}/resources/image/event/eventImage01.png" width="30%">
												<span class="badge badge-pill badge-light ms-3" style="color: #004680; border: 1px solid #004680; height: 10%;">${event.event_category}</span>
												<h6 class="mb-1 ms-5" style="height: 15px; line-height: 15px;"><span class = "fs-5 fw-bolder">${event.event_title}</span>
													<small class="smallCaption text-secondary"><br>${event.event_content}<br><fmt:formatDate value="${event.event_start_date}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${event.event_end_date}" pattern="yyyy-MM-dd"/></small>
												</h6>
												<span class="badge badge-pill badge-light ms-3" style="color: #004680; border: 1px solid #004680; height: 10%;">${event.event_status}</span>
											</div>
											<div class="d-flex justify-content-end">
												<a class = "btn btn-primary btn-sm" href="${contextPath}/board/eventDetail.do?event_num=${event.event_num}">자세히 보기</a>
											</div>
											<hr class = "event_hr col-md-12">
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
       				</div>
  				</div>
  			</div>
		    <div class="tab-pane fade" id="flight" role="tabpanel" aria-labelledby="flight-tab">
				<h6 class = "col-md-7 fs-6 fw-bold">항공 프로모션 n개</h6>
				<hr class = "event_hr">
				<div class="row justify-content-center">
					<div class="col-md-9">
						<div class="list-group list-group-flush">
							<c:choose>
								<c:when test="${empty eventLists}">
									<h3>등록된 이벤트가 없습니다.</h3>
								</c:when>
								<c:otherwise>
									<c:forEach var = "event" items = "${eventLists}">
										<c:if test="${event.event_category == '항공권'}">
											<div class="d-flex w-70 list-group-item border-0">
												<img src="${contextPath}/resources/image/event/eventImage01.png" width="30%">
												<span class="badge badge-pill badge-light ms-3" style="color: #004680; border: 1px solid #004680; height: 10%;">${event.event_category}</span>
												<h6 class="mb-1 ms-5" style="height: 15px; line-height: 15px;"><span class = "fs-5 fw-bolder">${event.event_title}</span>
													<small class="smallCaption text-secondary"><br>${event.event_content}<br><fmt:formatDate value="${event.event_start_date}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${event.event_end_date}" pattern="yyyy-MM-dd"/></small>
												</h6>
												<span class="badge badge-pill badge-light ms-3" style="color: #004680; border: 1px solid #004680; height: 10%;">${event.event_status}</span>
											</div>
											<div class="d-flex justify-content-end">
												<a class = "btn btn-primary btn-sm" href="${contextPath}/board/eventDetail.do?event_num=${event.event_num}">자세히 보기</a>
											</div>
											<hr class = "event_hr col-md-12">
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
       				</div>
  				</div>
  			</div>
    		<div class="tab-pane fade" id="rent" role="tabpanel" aria-labelledby="rent-tab">
				<h6 class = "col-md-7 fs-6 fw-bold">렌트 프로모션 n개</h6>
				<hr class = "event_hr">
				<div class="row justify-content-center">
					<div class="col-md-9">
						<div class="list-group list-group-flush">
							<c:choose>
								<c:when test="${empty eventLists}">
									<h3>등록된 이벤트가 없습니다.</h3>
								</c:when>
								<c:otherwise>
									<c:forEach var = "event" items = "${eventLists}">
										<c:if test="${event.event_category == '렌트'}">
											<div class="d-flex w-70 list-group-item border-0">
												<img src="${contextPath}/resources/image/event/eventImage01.png" width="30%">
												<span class="badge badge-pill badge-light ms-3" style="color: #004680; border: 1px solid #004680; height: 10%;">${event.event_category}</span>
												<h6 class="mb-1 ms-5" style="height: 15px; line-height: 15px;"><span class = "fs-5 fw-bolder">${event.event_title}</span>
													<small class="smallCaption text-secondary"><br>${event.event_content}<br><fmt:formatDate value="${event.event_start_date}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${event.event_end_date}" pattern="yyyy-MM-dd"/></small>
												</h6>
												<span class="badge badge-pill badge-light ms-3" style="color: #004680; border: 1px solid #004680; height: 10%;">${event.event_status}</span>
											</div>
											<div class="d-flex justify-content-end">
												<a class = "btn btn-primary btn-sm" href="${contextPath}/board/eventDetail.do?event_num=${event.event_num}">자세히 보기</a>
											</div>
											<hr class = "event_hr col-md-12">
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
       				</div>
  				</div>
  			</div>
    		<div class="tab-pane fade" id="package" role="tabpanel" aria-labelledby="package-tab">
				<h6 class = "col-md-7 fs-6 fw-bold">패키지 프로모션 n개</h6>
				<hr class = "event_hr">
				<div class="row justify-content-center">
					<div class="col-md-9">
						<div class="list-group list-group-flush">
							<c:choose>
								<c:when test="${empty eventLists}">
									<h3>등록된 이벤트가 없습니다.</h3>
								</c:when>
								<c:otherwise>
									<c:forEach var = "event" items = "${eventLists}">
										<c:if test="${event.event_category == '패키지'}">
											<div class="d-flex w-70 list-group-item border-0">
												<img src="${contextPath}/resources/image/event/eventImage01.png" width="30%">
												<span class="badge badge-pill badge-light ms-3" style="color: #004680; border: 1px solid #004680; height: 10%;">${event.event_category}</span>
												<h6 class="mb-1 ms-5" style="height: 15px; line-height: 15px;"><span class = "fs-5 fw-bolder">${event.event_title}</span>
													<small class="smallCaption text-secondary"><br>${event.event_content}<br><fmt:formatDate value="${event.event_start_date}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${event.event_end_date}" pattern="yyyy-MM-dd"/></small>
												</h6>
												<span class="badge badge-pill badge-light ms-3" style="color: #004680; border: 1px solid #004680; height: 10%;">${event.event_status}</span>
											</div>
											<div class="d-flex justify-content-end">
												<a class = "btn btn-primary btn-sm" href="${contextPath}/board/eventDetail.do?event_num=${event.event_num}">자세히 보기</a>
											</div>
											<hr class = "event_hr col-md-12">
										</c:if>
									</c:forEach>
								</c:otherwise>
							</c:choose>
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