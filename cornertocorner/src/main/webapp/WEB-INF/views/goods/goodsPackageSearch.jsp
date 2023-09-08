<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
   <script>
   </script>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>패키지 페이지</title>
   <!-- CSS only -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style type="text/css">
#search {
   margin-bottom: 20px;
   text-align: center;
}
</style>
</head>
<body>
	<form id="search"> 
	   <span> 
	      <input type="text" name="search" id="searchtitle"  placeholder="패키지 검색"/> 
	         출발일 <span id="searchtitle1"> 
	          <input class="date" type="date" name="start"/> <!-- 출발달력 -->
	    </span> 
	          도착일 <input class="date" type="date" name="start"/> <!-- 도착달력 --> 
	    </span>
	       <button type="submit" class="btn btn-link">
	             <img src="${contextPath}/resources/image/search.png" alt="검색" width="20px" height="25px"> <!-- submit 검색버튼 -->
	       </button>
	</form>
	
   <div class="container">
       <div class = "row row-cols-1 row-cols-md-4 g-4">
         <c:forEach var="pack" items="${packList}">
         <c:if test="${pack.goods_category == '패키지'}">
                <div class = "col">
                   <div class = "card h-100">
                      <img src="${contextPath}/resources/image/package/pckItem01.jpg" class="card-img-top" alt="이벤트상품이미지">
                      <div class = "card-body">
                        <p class = "card-text">${pack.goods_name}</p>
                           <h5 class = "card-title">${pack.goods_price} 원</h5>
                        <a href="${contextPath}/goods/goodsPackageDetail.do?package_name=${pack.goods_name}" class = "btn btn-secondary btn-sm">자세히보기</a>
                      </div>
                   </div>
                </div>
         </c:if>
         </c:forEach> 
         </div>
    </div>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>