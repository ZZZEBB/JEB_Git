<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔 상품 조회</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>

    //뭐지이거..??
   console.log('http://www.abdullahkahriman.com');
    
</script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
*{
   font-family: 'OTWelcomeRA';
   font-weight:bold;
}
/* 상품제목 위치조정 */
.rentDetailtitle{
   margin-left:300px;
}
/* hr태크 길이조정 */
hr{
   width:900px;
   margin-left:300px;
}
/* 상풍 이미지및 설명 위치조정 */
.rentmaintitle{
    float:left;
    height:300px;
}
/* 상품 이미지 좌측고정 */
.rentmaintitle img{
    float:left;
}
/* 상품 상세설명 위치조정 */
.rentmaintitle h5{
   margin-top:10px;
   margin-left:30px;
   float:left;
   width:1100px;
}
/* 아이콘및 설명 */
.minititle{
   margin:15px auto 15px 25px;
   float:left;
   width:550px;
}
.minititle tr td{
   float:left;
   width:300px;
}
/* 이용시간및 이하 내용 위치조정 */
.minititle1 li {
   margin: 5px auto 5px 25px;
   display : inline-block;
   width : 300px;
   list-style : none;
   font-size:12px;
   float:left;
}
.minititle1 li img{
   margin: auto 5px auto auto;
}
/* 운전자 정보입력칸 위치조정 */
#licensebox{
   margin:20px auto 20px 300px;
}
/* 지금예약버튼 위치조정 */
#button1{
   margin:20px auto 20px auto;   
}
.productmap{
    float:right;
    width:324.5px;
    height:355.5px;
    border:1px solid black;
    margin:-20px 10% auto auto;
}

</style>
</head>
<body>
 <c:forEach var="product" items="${carList}">
    <div class="rentDetailtitle">
       <h4>${product.goods_name}</h4>
       <hr>
   </div>
    <div class="rentmaintitle">
      <img style="margin-left:15%;" alt="소형이미지" src="${contextPath}/resources/image/car.png" width="400px" height="300px">
      <div class="productmap">
       <!-- 지도를 표시할 div 입니다 -->
      <div id="staticMap" style="width:325px;height:355px;"></div>
      
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2e253b59d2cc8f52b94e061355413a9e"></script>
      <script>
      var markers = [
          {
              position: new kakao.maps.LatLng(${product.goods_latitude},${product.goods_longitude})
          },
          {
              position: new kakao.maps.LatLng(${product.goods_latitude},${product.goods_longitude}), 
              text: '${product.goods_name} 위치입니다.' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
          }
      ];

      var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
          staticMapOption = { 
              center: new kakao.maps.LatLng(${product.goods_latitude},${product.goods_longitude}), // 이미지 지도의 중심좌표
              level: 3, // 이미지 지도의 확대 레벨
              marker: markers // 이미지 지도에 표시할 마커 
          };    
      // 이미지 지도를 생성합니다
      var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
      </script>
    </div>
   
      <table class="minititle">
         <tr id="minititleOne" style="list-style: none; display:inline-block;">
            <td style="width:100px;"><img alt="미니카" src="${contextPath}/resources/image/rent/frontcar.png" width="35px" height="25px">소형</td>
            <td style="width:100px;"><img alt="좌석" src="${contextPath}/resources/image/rent/seat.png" width="35px" height="25px">4인승</td>
            <td style="width:105px;"><img alt="핸들" src="${contextPath}/resources/image/rent/handle.png" width="35px" height="25px">자동변속</td>
            <td style="width:100px;"><img alt="기름" src="${contextPath}/resources/image/rent/gasoline.png" width="35px" height="25px">휘발유</td>
         </tr>
      </table>
      <ul class="minititle1">
         <li><img alt="캘린더" src="${contextPath}/resources/image/rent/calender.png" width="20px" height="15px">이용일 : <span>${user_date}</span></li>         
         <li><img alt="시계" src="${contextPath}/resources/image/rent/watch.png" width="20px" height="15px">이용 시간 : <span>${user_time}</span></li>
         <li><img alt="시계" src="${contextPath}/resources/image/rent/watch.png" width="20px" height="15px">인수 장소 : <span>${product.goods_location}</span></li>
         <li><img alt="시계" src="${contextPath}/resources/image/rent/watch.png" width="20px" height="15px">반납 장소 : <span>${product.goods_location}</span></li>
         <li><img alt="시계" src="${contextPath}/resources/image/rent/watch.png" width="20px" height="15px">대여가능 나이 : <span>26세이상</span></li>
         <li><img alt="시계" src="${contextPath}/resources/image/rent/watch.png" width="20px" height="15px">대여가능 운전경력 : <span>1년이상</span></li>
      </ul>
                    
   </div>
   <form id="main">
   <div id="licensebox">
      <h5>운전자 정보 입력</h5>
      <hr>
      <p>여권상의 영문성, 영문이름과 같지않으면 서비스가 거부될수 있습니다.</p>
      <div>
      <p>면허 번호</p>
      <input type="text" name="license number" placeholder="면허 번호를 입력해주세요.">
      <p>발급 일자</p>
      <input type="text" name="published date" placeholder="예) 20150115"><br>
      
      <button id="button1" type="submit">지금 예약</button>
      </div>
   </div>
   </form>
</c:forEach>
</body>
</html>