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
         tbody > tr > td > a {
            text-decoration: none;
         }
   </style>
   <script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
	<nav class="text-end" style="margin-top:0.5%; text-align:center;" aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="#" style="text-decoration:none; color:black;">고객센터</a></li>
			<li class="breadcrumb-item active" aria-current="page">공지사항</li>
		</ol>
	</nav>
	<div class = "col-md-11">
      <ul class="nav nav-tabs nav-fill justify-content-center mt-3" id="myTab" role="tablist">
         <li class="nav-item" role="presentation">
           <button class="nav-link active" id="all-tab" data-bs-toggle="tab" data-bs-target="#all" type="button" role="tab" aria-controls="all" aria-selected="true">전체</button>
         </li>
         <li class="nav-item" role="presentation">
           <button class="nav-link" id="general-tab" data-bs-toggle="tab" data-bs-target="#general" type="button" role="tab" aria-controls="general" aria-selected="false">일반</button>
         </li>
         <li class="nav-item" role="presentation">
           <button class="nav-link" id="info-tab" data-bs-toggle="tab" data-bs-target="#info" type="button" role="tab" aria-controls="info" aria-selected="false">안전정보</button>
         </li>
         <li class="nav-item" role="presentation">
           <button class="nav-link" id="service-tab" data-bs-toggle="tab" data-bs-target="#service" type="button" role="tab" aria-controls="service" aria-selected="false">서비스</button>
         </li>
         <li class="nav-item" role="presentation">
           <button class="nav-link" id="pre-tab" data-bs-toggle="tab" data-bs-target="#pre" type="button" role="tab" aria-controls="pre" aria-selected="false">당첨자발표</button>
         </li>
      </ul>
      <div class="tab-content" id="myTabContent">
           <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="all-tab">
            <div class="row justify-content-center">
                   <div>
                    <div class="list-group list-group-flush">
                          <table class="table table-hover table-bordered text-center">
                    <thead>
                      <tr>
                        <th class="col-md-1">번호</th>
                        <th class="col-md-2">구분</th>
                        <th class="col-md-7">제목</th>
                        <th class="col-md-3">등록일</th>
                      </tr>
                    </thead>
                       <c:forEach var="notice" items="${noticeList}">
                       <tbody>
                         <tr>
                           <td>${notice.notice_num}</td>
                           <td>${notice.notice_category}</td>
                           <td class = "text-start"><a href="${contextPath}/board/noticeDetail.do?notice_num=${notice.notice_num}">${notice.notice_title}</a></td>
                           <td><fmt:formatDate value="${notice.notice_write_date}" pattern="yyyy-MM-dd"/></td>
                         </tr>
                       </tbody>
                    </c:forEach>
                  </table>
                     </div>
                  </div>
                 </div>
             </div>
        
        <div class="tab-pane fade" id="general" role="tabpanel" aria-labelledby="general-tab">
           <div class="row justify-content-center">
                  <div>
                    <div class="list-group list-group-flush">
                          <table class="table table-hover table-bordered text-center">
                    <thead>
                      <tr>
                        <th class="col-md-1">번호</th>
                        <th class="col-md-7">제목</th>
                        <th class="col-md-3">등록일</th>
                      </tr>
                    </thead>
                       <c:forEach var="notice" items="${noticeList}">
                       <c:if test="${notice.notice_category == '일반'}">
                       <tbody>
                         <tr>
                           <td>${notice.notice_num}</td>
                           <td class = "text-start"><a href="${contextPath}/board/noticeDetail.do?notice_num=${notice.notice_num}">${notice.notice_title}</a></td>
                           <td><fmt:formatDate value="${notice.notice_write_date}" pattern="yyyy-MM-dd"/></td>
                         </tr>
                       </tbody>
                     </c:if>
                       </c:forEach>
                  </table>
                     </div>
                  </div>
              </div>
        </div>
        <div class="tab-pane fade" id="info" role="tabpanel" aria-labelledby="info-tab">
           <div class="row justify-content-center">
                  <div>
                    <div class="list-group list-group-flush">
                          <table class="table table-hover table-bordered text-center">
                    <thead>
                      <tr>
                        <th class="col-md-1">번호</th>
                        <th class="col-md-7">제목</th>
                        <th class="col-md-3">등록일</th>
                      </tr>
                    </thead>
                       <c:forEach var="notice" items="${noticeList}">
                       <c:if test="${notice.notice_category == '안전정보'}">
                       <tbody>
                         <tr>
                           <td>${notice.notice_num}</td>
                           <td class = "text-start"><a href="${contextPath}/board/noticeDetail.do?notice_num=${notice.notice_num}">${notice.notice_title}</a></td>
                           <td><fmt:formatDate value="${notice.notice_write_date}" pattern="yyyy-MM-dd"/></td>
                         </tr>
                       </tbody>
                     </c:if>
                       </c:forEach>
                  </table>
                     </div>
                  </div>
              </div>
        </div>
        <div class="tab-pane fade" id="service" role="tabpanel" aria-labelledby="service-tab">
        <div class="row justify-content-center">
                  <div>
                    <div class="list-group list-group-flush">
                          <table class="table table-hover table-bordered text-center">
                    <thead>
                      <tr>
                        <th class="col-md-1">번호</th>
                        <th class="col-md-7">제목</th>
                        <th class="col-md-3">등록일</th>
                      </tr>
                    </thead>
                       <c:forEach var="notice" items="${noticeList}">
                       <c:if test="${notice.notice_category == '서비스'}">
                       <tbody>
                         <tr>
                           <td>${notice.notice_num}</td>
                           <td class = "text-start"><a href="${contextPath}/board/noticeDetail.do?notice_num=${notice.notice_num}">${notice.notice_title}</a></td>
                           <td><fmt:formatDate value="${notice.notice_write_date}" pattern="yyyy-MM-dd"/></td>
                         </tr>
                       </tbody>
                     </c:if>
                       </c:forEach>
                  </table>
                     </div>
                  </div>
              </div>
        </div>
        <div class="tab-pane fade" id="pre" role="tabpanel" aria-labelledby="pre-tab">
        <div class="row justify-content-center">
                  <div>
                    <div class="list-group list-group-flush">
                          <table class="table table-hover table-bordered text-center">
                    <thead>
                      <tr>
                        <th class="col-md-1">번호</th>
                        <th class="col-md-7">제목</th>
                        <th class="col-md-3">등록일</th>
                      </tr>
                    </thead>
                       <c:forEach var="notice" items="${noticeList}">
                       <c:if test="${notice.notice_category == '당첨자발표'}">
                       <tbody>
                         <tr>
                           <td>${notice.notice_num}</td>
                           <td class = "text-start"><a href="${contextPath}/board/noticeDetail.do?notice_num=${notice.notice_num}">${notice.notice_title}</a></td>
                           <td><fmt:formatDate value="${notice.notice_write_date}" pattern="yyyy-MM-dd"/></td>
                         </tr>
                       </tbody>
                     </c:if>
                       </c:forEach>
                  </table>
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