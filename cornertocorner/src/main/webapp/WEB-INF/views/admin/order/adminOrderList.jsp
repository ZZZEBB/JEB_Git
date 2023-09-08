<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>관리자 주문관리 페이지</title>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
	<link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />
	<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class = "container">
	<!-- 상단 간략화 메뉴 -->
	<nav class="text-end" style="margin-top:0.5%; text-align:center;" aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="${contextPath}/adminOrder/adminOrderList.do" style="text-decoration:none; color:black;">주문 관리</a></li>
			<li class="breadcrumb-item active" aria-current="page">전체주문 조회</li>
		</ol>
	</nav>
                 <div class="card-body">
                   <table id="datatablesSimple">
                       <thead>
                           <tr>
                               <th>번호</th>
                               <th>회원 이름</th>
                               <th>주문 상품</th>
                               <th>주문 상태</th>
                               <th>주문 완료일시</th>
                               <th>결제 금액</th>
                               <th>결제 완료일시</th>
                               <th>환불 금액</th>
                               <th>결제 상태</th>
                           </tr>
                       </thead>
                       <tfoot>
                           <tr>
                               <th>번호</th>
                               <th>회원 이름</th>
                               <th>주문 상품</th>
                               <th>주문 상태</th>
                               <th>주문 완료일시</th>
                               <th>결제 금액</th>
                               <th>결제 완료일시</th>
                               <th>환불 금액</th>
                               <th>결제 상태</th>
                           </tr>
                       </tfoot>
                       <tbody>
                       	<c:forEach var="item" items="${orderInfo}">
                       		<tr>
                                <td>${item.order_num}</td>
                                <td>${item.member_id}</td>
                                <td>${item.goods_name}</td>
                                <td>${item.order_status}</td>
                                <td><fmt:formatDate value="${item.order_date}" pattern="yyyy-MM-dd hh:ss" /></td>
                                <td>${item.goods_saleprice}</td>
                                <td><fmt:formatDate value="${item.pay_order_time}" pattern="yyyy-MM-dd hh:ss" /></td>
                                <td>${item.refund_price}</td>
                                <td>${item.pay_status}</td>
                           	</tr>
                       	</c:forEach>
                       </tbody>
                   </table>
               </div>
           </div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${contextPath}/resources/jquery/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="${contextPath}/resources/assets/demo/chart-area-demo.js"></script>
	<script src="${contextPath}/resources/assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
	<script src="${contextPath}/resources/jquery/datatables-simple-demo.js"></script>
</body>
</html>