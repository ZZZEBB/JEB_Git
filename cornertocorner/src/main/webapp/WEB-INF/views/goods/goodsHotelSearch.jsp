<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>호텔 목록 페이지</title>
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
   <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.1/themes/smoothness/jquery-ui.css">
   <script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
   <script>
      function printStars() {
        var num = parseInt(document.getElementById('numInput').value);
        // 숫자에 따라 별표 출력
        var stars = '';
        for (var i = 1; i <= num; i++) {
          stars += '*';
        }
        document.getElementById('starsOutput').innerHTML = stars;
      }

   </script>
   <style type="text/css">
      .date{
         border:none;
         background-color:#E0E0E0;
         text-align: center;
         height:20px;
      }
      .map {
         border: 2px solid #ccc;
         height: 140px;
      }
   </style>

</head>
<body>
   <div class = "container">   
      <div class = "row bg-light">
         <form id="search" class = "d-flex align-middle justify-content-between"> 
            <div class="form ms-3 col-md-4 p-1">
               <input type="text" class="form-control" name = "search" id="floatingInput" placeholder="어디로 떠나세요?">
            </div>
            <div class = "col-md-5 ms-3 p-1">
               <div class="input-daterange input-group" id="datepicker">
                  <input type="text" id="date-picker1" class="form-control bg-white border-1 small" aria-label="Search" aria-describedby="basic-addon2" th:value="|${year}-${month}|" name = "start">
                  <span class="input-group-addon">&nbsp;~&nbsp;</span>
                  <input type="text" id="date-picker2" class="form-control bg-white border-1 small" aria-label="Search" aria-describedby="basic-addon2" th:value="|${year}-${month}|" name = "end">
               </div>
               <script type = "text/javascript">
                  $(document).ready(function() {
                      $('#date-picker1').datepicker({
                          format: "yyyy-m",
                          minViewMode: 1,
                          language: "ko",
                          autoclose: true
                      })
                      
                      $('#date-picker2').datepicker({
                          format: "yyyy-m",
                          minViewMode: 1,
                          language: "ko",
                          autoclose: true
                      })
   
                      $('#get-history').on('click', function() {
                          const dateArr = $('#date-picker').val().split('-')
                          location.href = '/history?year=' + dateArr[0] + '&month=' + dateArr[1]
                      })
                  })
               </script>
            </div>
            <div class = "col-md-2 ms-3 p-1">
               <button type="submit" class="btn btn-primary">숙소검색</button>
            </div>
         </form>
      </div>
      <div class="map">
         <!-- 지도를 표시할 div 입니다 -->
         <div id = "map" style = "width:100%; height:139px;">
         </div>
         <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2e253b59d2cc8f52b94e061355413a9e"></script>
         <script>
         var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
             mapOption = { 
                 center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                 level: 3 // 지도의 확대 레벨
             };
         
         // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
         var map = new kakao.maps.Map(mapContainer, mapOption); 
         </script>
      </div>
      <!-- 첫번째 지역별 추천 상품 -->
      <div class="card-group text-white mt-5 p-2">
        <div class="card card-primary text-center border-0 mx-3">
          <a href = "${contextPath}/#"><img class="card-img-top rounded-circle" src="${contextPath}/resources/image/hotel/htList01.png" alt="제주-추천숙박상품"></a>
          <div class="card-img-overlay">
            <div class="card-title fs-3 fw-bold align-text-bottom">JEJU</div>
          </div>
        </div>
        <div class="card card-primary text-center border-0 mx-3">
          <img class="card-img-top rounded-circle" src="${contextPath}/resources/image/hotel/htList02.png" alt="부산-추천숙박상품">
          <div class="card-img-overlay">
            <div class="card-title fs-3 fw-bold align-text-bottom">BUSAN</div>
          </div>
        </div>
        <div class="card card-primary text-center border-0 mx-3">
          <img class="card-img-top rounded-circle" src="${contextPath}/resources/image/hotel/htList03.png" alt="전주-추천숙박상품">
          <div class="card-img-overlay">
            <div class="card-title fs-3 fw-bold align-text-bottom">JEONJU</div>
          </div>
        </div>
        <div class="card card-primary text-center border-0 mx-3">
          <img class="card-img-top rounded-circle" src="${contextPath}/resources/image/hotel/htList04.png" alt="동해-추천숙박상품">
          <div class="card-img-overlay">
            <div class="card-title fs-3 fw-bold align-text-bottom">DONGHAE</div>
          </div>
        </div>
      </div>
      
      <!-- 두번째 추천상품 리스트 -->
      <div class="container mt-5">
         <img src = "${contextPath}/resources/image/hotel/recomHotelList.jpg" alt = "제주호텔추천" width = "90%" class = "w-100">
         <div class = "row row-cols-1 row-cols-md-4 g-4 mt-4">
            <c:forEach var="hotel" items="${hotelList}">
               <c:if test="${hotel.goods_location == '제주' and hotel.goods_category == '숙박'}">
                  <div class = "col">
                     <div class = "card h-100 border-0">
                        <img src="${contextPath}/resources/image/hotel/jejuHtList01.jpg" class="card-img-top" alt="이벤트상품이미지">
                        <div class = "card-body">
                           <p class = "card-text">${hotel.goods_name}</p>
                           <h5 class = "card-title">${hotel.goods_price}<span class = "fs-6"> 원 ~</span></h5>
                           <a href="${contextPath}/goods/goodsHotelDetail.do?goods_code=${hotel.goods_code}"" class = "btn btn-secondary btn-sm">자세히보기</a>
                        </div>
                     </div>
                  </div>
               </c:if>
            </c:forEach> 
         </div>
      </div>
       <c:forEach var="hotel" items="${hotelList}">
         <div class="container mt-5">
            <c:if test="${hotel.goods_category == '숙박'}">
               <div class="row justify-content-center">
                  <div class="col-md-12 border-0">
                     <div class="list-group list-group-flush mb-4">
                        <a class="list-group-item" href="${contextPath}/goods/goodsHotelDetail.do?goods_code=${hotel.goods_code}">
                           <div class = "d-flex col-md-9">
                              <img src="${contextPath}/resources/image/hotel/C160000327_15.jpg" width="30%" height="170px">
                              <div class="mb-1 ms-4 p-2">
                                 <div class = "fs-5 fw-bolder">${hotel.goods_name}
                                    <span>
                                       <c:forEach begin="1" end="${hotel.class_grade}">
                                          <span class="starSize">★</span>
                                       </c:forEach>
                                    </span>
                                 </div>
                              </div>
                           </div>
                           <div class = "d-flex col-md-3">
                               <p>${hotel.goods_saleprice}<span class = "fs-6"> 원 ~</span> 
                              <button type = "button" onclick="location.href='${contextPath}/goods/goodsHotelDetail.do?goods_code=${hotel.goods_code}'">예약하기</button>
                           </div>
                        </a>
                     </div>
                  </div>
               </div>
               <hr>
            </c:if>
         </div>
      </c:forEach>
   </div>
   <!-- JavaScript Bundle with Popper -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>