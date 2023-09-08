<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<style>
	.panel.panel-default.sideBox .list-group.list-group-flush > li {
		font-size : 1.2em;
		font-weight : bold;
	}
	
	div > ul > li > a {
		text-decoration : none;
	}
	
</style>
	<div class="panel panel-default sideBox">
		<c:choose>
			<%-- 관리자 - 고객센터 사이드바 --%>
			<c:when test="${side_menu=='customercenter_mode'}">
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><a href="${contextPath}/board/faq.do">FAQ</a>
					<li class="list-group-item"><a href="${contextPath}/board/noticeList.do">공지사항</a></li>
					<li class="list-group-item"><a href="${contextPath}/board/oneQnaForm.do">1:1 문의</a></li>
				</ul>
			</c:when>
			<%-- 관리자 모드 - 매출관리 사이드바 --%>
			<c:when test="${side_menu =='salesManage_mode' }">
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><a href="#">관리자 매출관리</a></li>
				</ul>
			</c:when>
			<%-- 관리자 모드 - 상품관리 사이드바 --%>
			<c:when test="${side_menu =='goodsManage_mode' }">
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><a href="#">전체 상품조회</a></li>
					<li class="list-group-item"><a href="#">숙박</a></li>
					<li class="list-group-item"><a href="#">렌트</a></li>
					<li class="list-group-item"><a href="#">항공</a></li>
					<li class="list-group-item"><a href="#">패키지</a></li>
					<li class="list-group-item"><a href="#">상품 승인</a></li>
				</ul>
			</c:when>
			<%-- 관리자 모드 - 예약관리 사이드바 --%>
			<c:when test="${side_menu =='reservationManage_mode' }">
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><a href="#">전체 주문조회</a></li>
					<li class="list-group-item"><a href="#">숙박</a></li>
					<li class="list-group-item"><a href="#">렌트</a></li>
					<li class="list-group-item"><a href="#">항공</a></li>
					<li class="list-group-item"><a href="#">패키지</a></li>
				</ul>
			</c:when>
			<%-- 관리자 모드 - 가입자관리 사이드바 --%>
			<c:when test="${side_menu =='memberManage_mode' }">
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><a href="#">회원 관리</a></li>
					<li class="list-group-item"><a href="#">사업체 관리</a></li>
				</ul>
			</c:when>
			<%-- 관리자 모드 - 게시글관리 사이드바 --%>
			<c:when test="${side_menu =='reviewManage_mode' }">
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><a href="#">공지사항 관리</a></li>
					<li class="list-group-item"><a href="#">FAQ 관리</a></li>
					<li class="list-group-item"><a href="#">이벤트 관리</a></li>
					<li class="list-group-item"><a href="#">문의 관리</a></li>
					<li class="list-group-item"><a href="#">후기 관리</a></li>
					<li class="list-group-item"><a href="#">사업체 이벤트 관리</a></li>
				</ul>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>	
	</div>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>