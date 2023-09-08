<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 조회</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script></head>
	
<style>
/* a태그 밑줄제거 */
.textnone{
	text-decoration:none;
	color:black;
}
/* 텍스트 중앙정렬 */
.textal{
	text-align:center;
}

</style>
<body>
	<!-- 상단 간략화 메뉴 -->
	<nav class="text-end" style="margin-top:0.5%; text-align:center;" aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="${contextPath}/mypage/myInfo.do" style="text-decoration:none; color:black;">마이페이지</a></li>
			<li class="breadcrumb-item active" aria-current="page">예약 조회</li>
		</ol>
	</nav>
	
	<!-- 주제목 -->
	<table class="table col-md-10 mt-3">
  <thead>
    <tr class="table-light">
      <th class="col-md-3" scope="col">예약/구매정보</th>
      <th class="textal col-md-1" scope="col">결제금액</th>
      <th class="textal col-md-1" scope="col">진행상태</th>
    </tr>
  </thead>
  <c:forEach var="item" items="${orderInfo}">
  <tbody>
    <tr >
      <td class="col-md-3"><a class="textnone" href="#">${item.goods_name}</a></td>
      <td class="textal col-md-1">
      <c:if test="${item.goods_saleprice != ''}">결제금액 : ${item.goods_saleprice}<br></c:if>
      </td>
      <td class="textal col-md-1">
      <c:if test="${item.order_status == 1}">결제완료</c:if>
      <c:if test="${item.order_status == 2}">결제준비중</c:if>
      </td>
    </tr>
  </tbody>
  </c:forEach>
</table>

</body>
</html>