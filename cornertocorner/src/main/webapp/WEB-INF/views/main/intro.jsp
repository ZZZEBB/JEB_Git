<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
   <head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>회사소개</title>
   <!-- CSS only -->
   <link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
   crossorigin="anonymous">
   <style>
	   #map {
	   	margin : 10px auto;
	   	padding : 20px;
	   }
   </style>
</head>
<body>
	<div class = "container">
		<div class = "row">
			<div class="text-center p-3 mx-2">
				<h3 id="introicon"><img id="icon" alt="intro_icon" src="${contextPath}/resources/image/company_bag.png" width="25px" height="25px">회사소개<img id="icon" alt="intro_icon" src="${contextPath}/resources/image/company_bag.png" width="25px" height="25px"></h3>
				<p id="introicon">ConerToConer는 국내여행 및 제주도 여행 렌트 항공 패키지 서비스를 운영하는 국내여행의 모든 서비스를 제공하는 전문 업체입니다.</p>
			</div>
			<hr>
			<div class ="row justify-content-center">
				<img id="introicon" alt="회사이미지" src="${contextPath}/resources/image/company_front.jpg" width="70%" height="500px">
				<img id="introicon" alt="회사이미지" src="${contextPath}/resources/image/company_main.png" width="70%" height="500px">
			</div>
		</div>
	</div>
	<!-- 지도를 표시할 div 입니다 -->
	<div id = "map" class = "container" style = "width : 80%; height : 250px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2e253b59d2cc8f52b94e061355413a9e"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(36.349242000000,127.377693500000), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(36.349242000000,127.377693500000); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	</script>
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>