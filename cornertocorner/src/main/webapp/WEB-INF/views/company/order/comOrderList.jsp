<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업체 예약 관리 페이지</title>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
<style>
input{
   border-radius:5px;
   border:1px solid skyblue;
   /* text-align:center; */
}
.block{
   display:block;
   margin:10px;
}
#search{
   width:25px;
   height:25px;
   border:none;
}
</style>
</head>
<body>
<div class = "container ms-2 text-center">
   <!-- 상단 간략화 메뉴 -->
	<nav class="text-end" style="margin-top:0.5%; text-align:center;" aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="${contextPath}/comOrder/reservation.do" style="text-decoration:none; color:black;">예약 관리</a></li>
			<li class="breadcrumb-item active" aria-current="page">예약목록 조회</li>
		</ol>
	</nav>
   <form action="${contextPath}/comOrder/reservationfind.do" class = "col-md-10 justify-content-center">
      <table>
         <tr>
            <td class="block">예약자 명 <input type="text" name="member_id" placeholder="ex)조재명"/></td>
            <td class="block">상품 코드 <input type="text" name="goods_code"/></td>
            <td class="block">예약 일자 <input type="date" name="order_date1"/> ~ <input type="date" name="order_date2"/></td>
            <td class="block">상품 분류 
               <select>
                  <option value="">1</option>
                  <option value="">2</option>
                  <option value="">3</option>
                  <option value="">4</option>
                  <option value="">5</option>
               </select>
               <input type="image" id="search" src="${contextPath}/resources/image/search.png">
            </td>
         </tr>
      </table>
   </form>
      <table class="table table-hover text-center col-md-10 justify-content-center">
         <tr class = "table-active" style = "height:50px;">
            <td><input type="checkbox"/></td>
            <td>번호</td>
            <td>예약자</td>
            <td>상품 코드</td>
            <td>상품명</td>
            <td>예약 일자</td>
            <td>상품 금액</td>
            <td>결제 상태</td>
            <%-- <td><a href="#"><img src = "${contextPath}/resources/image/x.png"></a></td> --%>
         <c:if test="${not empty comReser}">
            <c:forEach var="item1" items="${comReser}" varStatus="status">
            <tr style="height:50px; text-align:center; border-bottom:1px solid #CCCCCC;">
               <td><input type="checkbox"/></td>
               <td>${item1.order_num}</td>
               <td>${item1.member_id}</td>
               <td>${item1.goods_code}</td>
               <td>${item1.goods_name}</td>
               <td><fmt:formatDate value="${item1.order_date}" pattern="yyyy-MM-dd" /></td>
               <td>${item1.goods_saleprice}</td>
               <td>
                  <c:if test="${item1.order_status == 1}">결제완료</c:if>
                  <c:if test="${item1.order_status == 2}">결제중</c:if>
               </td>
               <%-- <td><a href="#"><img src = "${contextPath}/resources/image/x.png"></a></td> --%>
            </tr>
         </c:forEach>
         </c:if>

         <c:if test="${empty comReser}">
         <c:forEach var="item" items="${reservation}" varStatus="status">
            <tr style="height:50px; text-align:center; border-bottom:1px solid #CCCCCC;">
               <td><input type="checkbox"/></td>
               <td>${item.order_num}</td>
               <td>${item.member_id}</td>
               <td>${item.goods_code}</td>
               <td>${item.goods_name}</td>
               <td><fmt:formatDate value="${item.order_date}" pattern="yyyy-MM-dd" /></td>
               <td>${item.goods_saleprice}</td>
               <td>
                  <c:if test="${item.order_status == 1}">결제완료</c:if>
                  <c:if test="${item.order_status == 2}">결제중</c:if>
               </td>
               <%-- <td><a href="#"><img src = "${contextPath}/resources/image/x.png"></a></td> --%>
            </tr>
         </c:forEach>
         </c:if>
   </table>
</div>
</body>
</html>