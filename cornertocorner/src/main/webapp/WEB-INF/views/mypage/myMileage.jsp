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
   <title>나의 마일리지</title>
   <!-- CSS only -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
   <script>
   function search_order_history(fixedSearchPeriod){
      var formObj=document.createElement("form");
      var i_fixedSearch_period = document.createElement("input");
      i_fixedSearch_period.name="fixedSearchPeriod";
      i_fixedSearch_period.value=fixedSearchPeriod;
       formObj.appendChild(i_fixedSearch_period);
       document.body.appendChild(formObj); 
       formObj.method="get";
       formObj.action="${contextPath}/mypage/listMyOrderHistory.do";
       formObj.submit();
   }
   </script>
   <style type="text/css">
      .mainText {
      margin-bottom: 100px;
      }
      .Text {
      margin-left: 250px;
      margin-bottom: 100px;
      }
   </style>
</head>
<body>
<form action="post">
<div class = "container">
   
   <!-- 상단 간략화 메뉴 -->
	<nav class="text-end" style="margin-top:0.5%; text-align:center;" aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="${contextPath}/mypage/myInfo.do" style="text-decoration:none; color:black;">마이페이지</a></li>
			<li class="breadcrumb-item active" aria-current="page">나의 마일리지 조회</li>
		</ol>
	</nav>
   
   <p class="Text">${member.member_name}님의 사용가능한 마일리지는 ${member.member_mileage}M 입니다.</p>
   
   <div class="align-baseline mt-3" id="mainContent">
      <span class="fs-6">최근 내역 조회</span>
      <a href="javascript:search_order_history('today')"><span><input type="button" class="btn btn-light btn-outline-dark" value="당일"></span></a>
      <a href="javascript:search_order_history('one_week')"><span><input type="button" class="btn btn-light btn-outline-dark" value="1주"></span></a>
      <!-- <span><input type="button" class="btn btn-light btn-outline-dark" value="2주"></span> -->
      <a href="javascript:search_order_history('one_month')"><span><input type="button" class="btn btn-light btn-outline-dark" value="1개월"></span></a>
      <!-- <span><input type="button" class="btn btn-light btn-outline-dark" value="2개월"></span> -->
      <a href="javascript:search_order_history('three_month')"><span><input type="button" class="btn btn-light btn-outline-dark" value="3개월"></span></a>
      <!-- <span><input type="button" class="btn btn-light btn-outline-dark" value="4개월"></span> -->
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      
      <!-- <span class="fs-6">기간 조회</span>
      <span><input class="date" type="date" name="start"/></span>~
      <span><input class="date" type="date" name="start"/></span>
      <span><input type="submit" class="btn btn-light btn-outline-dark" value="조회"></span> -->
   </div>
   <br>
   <table class="table" style="width: 80%">
  <thead>
    <tr>
      <th scope="col">일자</th>
      <th scope="col">적립 및 사용처</th>
      <th scope="col">사용 마일리지</th>
      <!-- <th scope="col">예약번호</th> -->
      <th scope="col">상품코드</th>
      
    </tr>
  </thead>
  <c:forEach var="mileage" items="${myOrderHistList}">
  <tbody>
    <tr>
      <th scope="row"><fmt:formatDate value="${mileage.pay_order_time}" pattern="yyyy-MM-dd" />  </th>
      <td>${mileage.goods_name}</td>
      <td>${mileage.use_mileage}</td>
      <td>${mileage.goods_code}</td>
      
     </tr>
<!--     <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
      <td>@mdo</td>
      <td>@mdo</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td>Larry the Bird</td>
      <td>@twitter</td>
      <td>@mdo</td>
      <td>@mdo</td>
      <td>@mdo</td>
       <td>@mdo</td>
    </tr> -->
  </tbody>
  </c:forEach>
</table>
   
</div>
</form>
<!-- JavaScript Bundle with Popper -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>