<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    isELIgnored="false"
    %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>패키지 상세 페이지</title>
<!-- CSS only -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script>
  $(document).ready(function() {
    $("#datepicker").datepicker({
      dateFormat: "yy-mm-dd"
    });
  });
</script>
<script>
  $(document).ready(function() {
    $("#datepicker1").datepicker({
      dateFormat: "yy-mm-dd"
    });
  });
</script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style type="text/css">
#search {
   margin-bottom: 20px;
   text-align: center;
}
.date{
   padding-left:5px;
   border:none;
   background-color:#E0E0E0;
   text-align: center;
   height:20px;
}
.mainText {
   text-align: center;
    width: 400px;
    display: inline-block; 
    white-space: nowrap;
    margin-left: 370px;
}
.mainPrice {
   text-align: center;
    width: 800px;
    display: inline-block; 
    white-space: nowrap;
    
}

.select {
    width: 200px;
    text-align: center;
    display: inline-block; 
    white-space: nowrap;
    }
select option[value=""][disabled] {
   display: none;
}

hr {
   clear: both;
   width: 50%;
}
.explain {
   width: 800px;
   height: 200px;
   float: center;
   text-align: left;
   margin-left: 400px;
}

</style>
</head>
<body>

<%-- <form id="search"> 
       <span>
       <img class="icon" alt="car_icon" src="${contextPath}/resources/image/car.png"> <!-- 검색창 왼쪽 자동차아이콘 -->
       <input type="text" name="search" id="searchtitle"  placeholder="호텔 검색"/>
       체크인 <span id="searchtitle1"> 
       <input class="date" type="date" name="start"/> <!-- 출발달력 -->
       </span>
       체크아웃 <input class="date" type="date" name="start"/> <!-- 도착달력 -->
       </span>
       <button type="submit" class="btn btn-link">
             <img src="${contextPath}/resources/image/search.png" alt="검색" width="20px" height="25px"> <!-- submit 검색버튼 -->
       </button>
</form> --%>
<c:forEach var="pack" items="${packList}">
<div class="mainText">
   <h3>${pack.goods_name}</h3>
</div>
<div class="mainPrice">
   <p><strong>${pack.goods_price}</strong>&nbsp;<small>(1인 기준)총 금액</small>&nbsp;&nbsp;
<!-- <div class="select">
   <select>
       <option value="" disabled selected>룸 타입 선택</option>
         <option value="1">싱글</option>
         <option value="2">더블</option>
         <option value="3">디럭스 싱글</option>
         <option value="4">디럭스 더블</option>
         <option value="5">스위트 싱글</option>
         <option value="6">스위트 더블</option>
    </select>
</div> -->
  <input type=button value="지금 예약">&nbsp;&nbsp;
          <input type=button value="장바구니">
        </p>
</div>

<div class="container justify-content-start">
   <div id="carouselExampleIndicators" class="carousel slide col-md-7" style="margin-left: 200px;">
     <div class="carousel-indicators">
       <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
       <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
       <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
     </div>
     <div class="carousel-inner">
       <div class="carousel-item active">
         <img src="${contextPath}/resources/image/hotel/hotel1.jpg" class="d-block w-100" alt="..." height="300px">
       </div>
       <div class="carousel-item">
         <img src="${contextPath}/resources/image/hotel/hotel2.jpg" class="d-block w-100" alt="..." height="300px">
       </div>
       <div class="carousel-item">
         <img src="${contextPath}/resources/image/hotel/hotel3.jpg" class="d-block w-100" alt="..." height="300px">
       </div>
     </div>
     <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
       <span class="carousel-control-prev-icon" aria-hidden="true"></span>
       <span class="visually-hidden">Previous</span>
     </button>
     <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
       <span class="carousel-control-next-icon" aria-hidden="true"></span>
       <span class="visually-hidden">Next</span>
     </button>
   </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<div class="explain">
<hr style = "margin: 0 auto;"> <br>
<p>상품번호: ${pack.goods_code }</p>
<p>상품설명: ${pack.goods_exp}</p>
<p>적립 마일리지: ${pack.goods_mileage }</p>
</div>
</c:forEach>
<!-- JavaScript Bundle with Popper -->
   
</body>
</html>