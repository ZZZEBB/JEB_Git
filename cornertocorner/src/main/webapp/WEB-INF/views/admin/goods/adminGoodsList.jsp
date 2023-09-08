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
<title>관리자 상품 관리</title>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
<script type="text/javascript">
function search_order_history(fixedSearchPeriod){
    var formObj=document.createElement("form");
    var i_fixedSearch_period = document.createElement("input");
    i_fixedSearch_period.name="fixedSearchPeriod";
    i_fixedSearch_period.value=fixedSearchPeriod;
     formObj.appendChild(i_fixedSearch_period);
     document.body.appendChild(formObj); 
     formObj.method="get";
     formObj.action="${contextPath}/adminGoods/listGoodsHistory.do";
     formObj.submit();
}
</script>
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
<div class = "container ms-2 text-center">
   <!-- 상단 간략화 메뉴 -->
   <nav class="text-end" style="margin-top:0.5%; text-align:center;" aria-label="breadcrumb">
      <ol class="breadcrumb">
         <li class="breadcrumb-item"><a href="${contextPath}/adminGoods/adminGoodsList.do" style="text-decoration:none; color:black;">상품 관리</a></li>
         <li class="breadcrumb-item active" aria-current="page">상품 목록 조회</li>
      </ol>
   </nav>
      <div id="mainContent" style="float:left; margin:1% auto;">
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
      <table class="table table-hover text-center col-md-12 justify-content-center">
         <tr class = "table-active" style = "height:50px;">
            <td><input type="checkbox"/></td>
            <td>사업체</td>
            <td>상품 코드</td>
            <td>상품 이름</td>
            <td>상품 분류</td>
            <td>상품 등록 날짜</td>
            <td>상품 금액</td>
            <%-- <td><a href="#"><img src = "${contextPath}/resources/image/x.png"></a></td> --%>
        <!-- 주문리스트를 뽑아야하는데 orderhistList가 들어있어서 주석처리하고 베껴서 다시 만들예정임 -->
       <!-- <c:if test="${not empty myOrderHistList}">
            <c:forEach var="item1" items="${myOrderHistList}" varStatus="status">
            <c:if test="${item1.goods_status == 1}">
            <tr style="height:50px; text-align:center; border-bottom:1px solid #CCCCCC;">
               <td><input type="checkbox"/></td>
               <td>${item1.com_id}</td>
               <td>${item1.goods_code}</td>
               <td>${item1.goods_name}</td>
               <td>${item1.goods_category}</td>
               <td><fmt:formatDate value="${item1.goods_entered_date}" pattern="yyyy-MM-dd" /></td>
               <td>${item1.goods_saleprice} 원</td>
               <%-- <td><a href="#"><img src = "${contextPath}/resources/image/x.png"></a></td> --%>
            </tr>
            </c:if>
         </c:forEach>
         </c:if> -->
         <!-- goodsList뽑을거임 -->
         <c:if test="${not empty myOrderHistList}">
            <c:forEach var="item1" items="${myOrderHistList}" varStatus="status">
            <c:if test="${item1.goods_status == 1}">
            <tr style="height:50px; text-align:center; border-bottom:1px solid #CCCCCC;">
               <td><input type="checkbox"/></td>
               <td>${item1.com_id}</td>
               <td>${item1.goods_code}</td>
               <td>${item1.goods_name}</td>
               <td>${item1.goods_category}</td>
               <td><fmt:formatDate value="${item1.goods_entered_date}" pattern="yyyy-MM-dd" /></td>
               <td>${item1.goods_saleprice} 원</td>
               <%-- <td><a href="#"><img src = "${contextPath}/resources/image/x.png"></a></td> --%>
            </tr>
            </c:if>
         </c:forEach>
         </c:if> 
   </table>
</div>
</body>
</html>