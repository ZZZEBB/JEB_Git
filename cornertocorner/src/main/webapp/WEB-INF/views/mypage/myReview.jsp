<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="member" value="${member}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>나의 여행후기</title>
   <!-- CSS only -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
      <style type="text/css">
      .mainText {
      margin-bottom: 100px;
      }
      .Text {
      margin-left: 250px;
      margin-bottom: 100px;
      }
      .button1 {
      margin-left: 800px;
      }
   </style>
</head>
<script>
   function fn_reviewForm(reviewForm){
     
       location.href=reviewForm;
     
   }
</script>
<body>
<div class = "container">
   <!-- 상단 간략화 메뉴 -->
	<nav class="text-end" aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="${contextPath}/mypage/myInfo.do" style="text-decoration:none; color:black;">나의 여행후기</a></li>
			<li class="breadcrumb-item active" aria-current="page">나의 여행후기 조회</li>
		</ol>
	</nav>
   <table class="table" style="width: 80%">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">작성자ID</th>
      <!-- <th scope="col">상품코드</th> -->
      <th scope="col">제목</th>
      <th scope="col">작성일</th>
   </tr>
  </thead>
  <tbody>
     <c:choose>
        <c:when test="${ empty review }">
           <tr>
              <td class = "fs-4 fw-bolder text-center">등록된 여행후기가 없습니다.</td>
           </tr>
        </c:when>
     <c:otherwise>
        <c:forEach var="reviewList" items="${review}">
          <tr>
            <th scope="row">${reviewList.review_num}</th>
            <td>${reviewList.member_id}</td>
            <%-- <td>${reviewList.goods_code}</td> --%>
            <td><a href="${contextPath}/mypage/myReviewDetail.do?review_num=${reviewList.review_num}">${reviewList.review_title}</a></td>
            <td><fmt:formatDate value="${reviewList.review_write_date}" pattern="yyyy-MM-dd"/></td>
          </tr>
        </c:forEach>
     </c:otherwise>
     </c:choose>
  </tbody>
</table>
   <a href="javascript:fn_reviewForm('${contextPath}/mypage/reviewForm.do')"><input class="button1" type="button" value="등록"></a>
</div>


<!-- JavaScript Bundle with Popper -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>