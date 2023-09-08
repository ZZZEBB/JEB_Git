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
   <title>상품 예약/결제</title>
   <!-- CSS only -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   
   <div class = "container text-center">
      <div class = "mt-5 h-100 align-middle">
         <img src = "${contextPath}/resources/image/receipt.png" alt = "결제완료" class = "mb-2">
         <h3>예약/결제가 정상적으로 완료되었습니다.</h3>
         <p>예약/결제 내역 상세 확인 및 취소, 변경 등의 서비스는 <a href = "${contextPath}/mypage/myOrder.do">마이페이지 > 나의 예약조회</a>에서 확인하실 수 있습니다.</p>
      </div>
      <table class="mt-5 table caption-top table table-bordered align-middle">
         <%-- <caption class="fs-5">주문 번호 <span style = "color : #808080; font-size : 0.8em;">MHJ-OD23032302471GQP001</span></caption> --%>
         <tr>
            <th class="col-md-5">상품 코드</th>
            <th class="col-md-2">상품명</th>
            <th class="col-md-3">결제 금액</th>
         </tr>
         <tr>
         <c:forEach var="item" items="${myOrderList}">
               
            <th class="col-md-5">${item.goods_code}</th>
            <th class="col-md-2">
               ${item.goods_name}<br>
               <span class = "fw-bolder" style = "color : #808080; font-size : 0.8em;">상품구분 <span>${item.goods_category}</span></span>
            </th>
            <th class="col-md-3" style = "color : #ff0000;">${item.goods_saleprice} 원</th>
            
            </c:forEach>
         </tr>
      </table>
      <button type = "button" class = "btn btn-primary btn-lg" onclick="location.href='${contextPath}/main/main.do'">계속 쇼핑하기</button>
   </div>
   <!-- JavaScript Bundle with Popper -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>