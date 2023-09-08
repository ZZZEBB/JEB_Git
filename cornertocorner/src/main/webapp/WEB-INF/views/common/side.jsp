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
			<%-- 사용자 - 고객센터 사이드바 --%>
			<c:when test="${side_menu=='mem_customercenter_mode'}">
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><a href="${contextPath}/board/faq.do">FAQ</a>
					<li class="list-group-item"><a href="${contextPath}/board/noticeList.do">공지사항</a></li>
					<li class="list-group-item"><a href="${contextPath}/board/oneQnaForm.do">1:1 문의</a></li>
				</ul>
			</c:when>
			<%-- 사업체 - 고객센터 사이드바 --%>
			<c:when test="${side_menu=='com_customercenter_mode'}">
				<ul class="list-group list-group-flush">
					<li class="list-group-item"><a href="${contextPath}/board/faq.do">FAQ</a>
					<li class="list-group-item"><a href="${contextPath}/board/noticeList.do">공지사항</a></li>
				</ul>
			</c:when>
			<%-- 마이페이지 사이드바 --%>
			<c:when test="${side_menu=='my_page'}">
				<ul class="list-group list-group-flush sideUl">
					<li class="list-group-item"><a href="${contextPath}/mypage/myInfo.do">나의 회원정보</a></li>
					<li class="list-group-item"><a href="${contextPath}/mypage/listMyOrderHistory.do">마일리지 확인</a></li>
					<li class="list-group-item"><a href="${contextPath}/mypage/myReview.do">나의 여행 후기</a></li>
					<li class="list-group-item"><a href="${contextPath}/mypage/myQna.do">나의 문의 내역</a></li>
					<li class="list-group-item"><a href="${contextPath}/mypage/myOrder.do">예약 조회</a></li>
				</ul>
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>	
	</div>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</html>