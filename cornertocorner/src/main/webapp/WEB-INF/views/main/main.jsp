<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>입력</title>
<style>
   body {
      width : 100%;
   }
input:focus, button:focus {
  outline: none;
}
    
</style>
<!-- css 스타일시트 추가 -->
<link href="${contextPath}/resources/css/main.css" rel="stylesheet" type="text/css">
<link href="${contextPath}/resources/css/swiper.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="${contextPath}/resources/jquery/swiper.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<!-- moment.js 로딩 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/locale/ko.js"></script>

<!-- Pikaday 로딩 -->
<script src="https://cdn.jsdelivr.net/npm/pikaday/pikaday.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/pikaday/css/pikaday.css">


<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script>
/** 렌터카 슬라이드*/
new Swiper('#ConEvnt2', {
    slidesPerView: 1,
    paginationClickable: true,
    nextButton: '#rcNextBtn',
    prevButton: '#rcPrevBtn',
    autoplay: 3000,
    loop: true
});

document.addEventListener('DOMContentLoaded', () => {
     const menuItems = document.querySelectorAll('.tab-menu-item');
     const tabs = document.querySelectorAll('.tab-pane');

     menuItems.forEach(item => {
       item.addEventListener('click', () => {
         // 모든 메뉴 아이템에서 active 클래스 제거
         menuItems.forEach(item => item.classList.remove('active'));
         // 클릭한 메뉴 아이템에 active 클래스 추가
         item.classList.add('active');

         // 모든 탭 내용에서 active 클래스 제거
         tabs.forEach(tab => tab.classList.remove('active'));
         // 클릭한 메뉴 아이템에 해당하는 탭 내용에 active 클래스 추가
         const target = item.dataset.target;
         document.querySelector(target).classList.add('active');
       });
     });
   });

document.addEventListener('DOMContentLoaded', () => {
     const dropdownMenu = document.querySelector('.dropdown-menu');
     const dropdownInput = document.querySelector('#departure-input');
     const startdateInput = document.getElementById('startdate');

     dropdownMenu.addEventListener('click', (event) => {
       if (event.target.classList.contains('dropdown-item')) {
         dropdownInput.value = event.target.dataset.value;
         dropdownMenu.style.display = 'none';
       }
     });

     dropdownInput.addEventListener('click', () => {
       if (dropdownMenu.style.display === 'none') {
         dropdownMenu.style.display = 'block';
       } else {
         dropdownMenu.style.display = 'none';
       }
     });

     // 드롭다운 메뉴를 <div class="dropdown"> 안에 추가
     dropdownInput.parentElement.appendChild(dropdownMenu);

     const today = new Date();

     // 이전에 선택할 수 없는 날짜 비활성화
     const disablePreviousDays = (day) => {
       return day.getTime() < today.getTime();
     }

     const startdatePicker = new Pikaday({
       field: startdateInput,
       format: 'YYYY-MM-DD',
       i18n: {
         previousMonth: '이전달',
         nextMonth: '다음달',
         months: moment.months(),
         weekdays: moment.weekdays(),
         weekdaysShort: moment.weekdaysShort()
       },
       disableDayFn: disablePreviousDays, // 이전 날짜 비활성화
       onSelect: function() {
         startdateInput.value = startdatePicker.toString();
       }
     });
   });

</script>
</head>
<body>
<div class="submain" id="sliderdiv">
<div class= "item item01" id="sliderdiv_center">
<div class="inr lywrap">
   <div class="inr left">
   <p class="ment">고객님, <br>
  <strong>어떤 여행을 꿈꾸시나요?</strong>
</p>
  <div class="tab-wrap">
    <ul class="tab-menu">
      <li class="tab-menu-item active" data-target="#package">패키지</li>
      <li class="tab-menu-item" data-target="#flight">항공</li>
      <li class="tab-menu-item" data-target="#hotel">호텔</li>
    </ul>
    <div class="tab-content">
    
      <div class="tab-pane active" id="package">
        <!-- 패키지 검색 폼 -->
      <form class="package-search-form">
        <input type="text" name="destination" class="form-control mb-3" placeholder="어디로 떠나시나요?">
        <div class="d-flex justify-content-between">
          <div class="dropdown">
            <input type="text" name="departure" class="form-control" placeholder="여행 출발지" readonly="readonly" style="width: 118px;" id="departure-input">
            <ul class="dropdown-menu" aria-labelledby="departure-dropdown">
              <li class="dropdown-item" data-value="인천">인천</li>
              <li class="dropdown-item" data-value="김포">김포</li>
              <li class="dropdown-item" data-value="부산">부산</li>
              <li class="dropdown-item" data-value="제주">제주</li>
            </ul>
          </div>
          <input type="text" name="startdate" id="startdate" class="form-control" placeholder="여행시작일" readonly="readonly" style="width: 118px;">
        </div>        
        <button type="submit" class="btn btn-primary opacity-75 w-100 my-3">패키지 검색</button>
      </form>
      </div>
      
      
      <div class="tab-pane" id="flight">
  <!-- 항공 검색 폼 -->
  <form class="flight-search-form">

    <input type="radio" class="btn-check mx-3" name="tripType" id="roundtrip" value="roundtrip" autocomplete="off" checked>
   <label class="btn btn-light" for="roundtrip">왕복</label>
    <input type="radio" class="btn-check " name="tripType" id="oneway"  value="oneway" autocomplete="off">
   <label class="btn btn-light" for="oneway">편도</label>
    
    <div class="d-flex justify-content-between">
    <input type="text" name="departure" placeholder="출발지 선택" class="form-control my-3 mx-3"  readonly="readonly" style="width: 118px;">
    <input type="text" name="arrival" placeholder="도착지 선택" class="form-control my-3"  readonly="readonly" style="width: 118px;">
    </div>
    <div class="d-flex justify-content-between">
    <input type="text" name="departDate" placeholder="가는 날 선택" class="form-control mb-3 mx-3" readonly="readonly" style="width: 118px;">
    <input type="text" name="returnDate" placeholder="오는 날 선택" class="form-control mb-3" readonly="readonly" style="width: 118px;">
    </div>
    <button type="submit" class="btn btn-primary opacity-75 w-100 my-3">항공권 검색</button>
  </form>
</div>

<script>
    // 왕복/편도 선택에 따라 오는 날짜 입력란을 표시/숨김 처리
    const tripTypeRadios = document.querySelectorAll('input[name="tripType"]');
    const returnDateInput = document.querySelector('input[name="returnDate"]');

    for (let i = 0; i < tripTypeRadios.length; i++) {
        tripTypeRadios[i].addEventListener('change', function() {
            if (this.value === 'oneway') {
                returnDateInput.style.display = 'none';
            } else {
                returnDateInput.style.display = 'inline-block';
            }
        });
    }
</script>
      
      <div class="tab-pane" id="hotel">
        <!-- 호텔 검색 폼 -->
        <form class="hotel-search-form">
          <input type="text" name="destination" class="form-control mb-3" placeholder="어디로 떠나시나요?">
           <div class="d-flex justify-content-between">
           <input type="text" name="checkin" id="startdate" class="form-control" placeholder="체크인 날짜" readonly="readonly" style="width: 118px;">
           <input type="text" name="checkout" id="startdate" class="form-control" placeholder="체크아웃날짜" readonly="readonly" style="width: 118px;">
           </div>
          <button type="submit" class="btn btn-primary opacity-75 w-100 my-3">호텔 검색</button>
        </form>
      </div>
    </div>
  </div>
</div>

   <div class="inr right">
  <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="10000">
      <img src="${contextPath}/resources/image/event/event_1.png" class="d-block w-100" alt="캐러셀1">
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="${contextPath}/resources/image/event/event_2.png" class="d-block w-100" alt="캐러셀2">
    </div>
    <div class="carousel-item">
      <img src="${contextPath}/resources/image/event/event_3.png" class="d-block w-100" alt="캐러셀3">
    </div>
    <div class="carousel-item">
      <img src="${contextPath}/resources/image/event/event_4.png" class="d-block w-100" alt="캐러셀3">
    </div>      
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden"></span>
  </button>
</div>
</div>
</div>
<script>
$('#carouselExampleInterval').on('slide.bs.carousel', function (e) {
     var index = $(e.relatedTarget).index();
     var images = [
       '${contextPath}/resources/image/event/event_1.png',
       '${contextPath}/resources/image/event/event_2.png',
       '${contextPath}/resources/image/event/event_3.png',
       '${contextPath}/resources/image/event/event_4.png',
     ];
     /*슬라이드 4개의 배경색*/
     var colors = ['#e0f0d7', '#d9edf7', '#ebd7ff', '#fcf8e3'];
     /*슬라이드 5개의 배경색*/
     /* var colors = ['#c6ffc4', '#d9edf7', '#ebd7ff', '#fcf8e3', '#f2dede']; */
     var sliderdiv = $('#sliderdiv_center');
     sliderdiv.css('background-color', colors[index % colors.length]);
   });
</script>
</div>
</div>


<%-- <!-- 메인 슬라이더 -->
<div id="sliderdiv">
<div id="sliderdiv_center">
<div id="main_searchform">

<h3 style="margin-top:140px; font-size:1.5em; color : #00aff0; font-weight: 900;">고객님<br><br> 어디로 떠나시나요?</h3><br><br>

<form name="mainSearch" action="${contextPath}/goods/searchGoods.do" >
         <input name="searchWord" class="main_input" type="text"  onKeyUp="keywordSearch()"> 
         <input type="submit" name="search" class="btn1"  value="검 색" style="display:none;" >
      </form>

</div>
<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="10000">
      <img src="${contextPath}/resources/image/event/event_1.png" class="d-block w-100" alt="캐러셀1">
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="${contextPath}/resources/image/event/event_2.png" class="d-block w-100" alt="캐러셀2">
    </div>
    <div class="carousel-item">
      <img src="${contextPath}/resources/image/event/event_3.png" class="d-block w-100" alt="캐러셀3">
    </div>
    <div class="carousel-item">
      <img src="${contextPath}/resources/image/event/event_4.png" class="d-block w-100" alt="캐러셀3">
    </div>      
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden"></span>
  </button>
</div>
</div>
</div>
<script>
$('#carouselExampleInterval').on('slide.bs.carousel', function (e) {
     var index = $(e.relatedTarget).index();
     var images = [
       '${contextPath}/resources/image/event/event_1.png',
       '${contextPath}/resources/image/event/event_2.png',
       '${contextPath}/resources/image/event/event_3.png',
       '${contextPath}/resources/image/event/event_4.png',
     ];
     /*슬라이드 4개의 배경색*/
     var colors = ['#e0f0d7', '#d9edf7', '#ebd7ff', '#fcf8e3'];
     /*슬라이드 5개의 배경색*/
     /* var colors = ['#c6ffc4', '#d9edf7', '#ebd7ff', '#fcf8e3', '#f2dede']; */
     var sliderdiv = $('#sliderdiv_center');
     sliderdiv.css('background-color', colors[index % colors.length]);
   });
</script> --%>

   <!-- 카테고리별 숙박/렌터카 추천 -->
   <div class="categoryPopularSection">
      <div class="inner">
         <h2 style="margin-top:550px;">카테고리별 추천상품</h2>

         <div class="PopularContent PopularContent1">
            <div class="col depth1">
               <h3>숙소</h3>
               <span class="con_more"><a href="#">상품 더 보기 ></a></span>
            </div>

            <div class="col depth2">
               <div id="ConEvnt"
                  class="ConEvnt swiper-container swiper-container-horizontal">
                  <ul class="swiper-wrapper">
                     <li class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="" style="width: 295px;">
                        <a href="${contextPath}/goods/goodsHotelDetail.do?goods_code=HT0005">
                           <div class="ConTx">
                              <pre>24시간 롱스테이</pre>
                              <span>호텔 브릿지 서귀포</span>
                           </div>
                           <div class="ConPhoto">
                              <img src="${contextPath}/resources/image/hotel/CADO220009_1.png" alt="">
                           </div>
                     </a>
                     </li>
                     <li class="swiper-slide">
                        <a href="#">
                           <div class="ConTx">
                              <pre>탐나오 숙박 고객에게 웰컴 드링크 제공</pre>
                              <span>코델리아호텔</span>
                           </div>
                           <div class="ConPhoto">
                              <img
                                 src="${contextPath}/resources/image/hotel/CADO220013_4.jpg"
                                 alt="">
                           </div>
                        </a>
                     </li>
                     <li class="swiper-slide">
                        <a href="#">
                           <div class="ConTx">
                              <pre>탐나오와 함께 즐기는 풀 문 나이트 인 뮤직</pre>
                              <span>히든 클리프 호텔 &amp; 네이쳐</span>
                           </div>
                           <div class="ConPhoto">
                              <img
                                 src="${contextPath}/resources/image/hotel/CADO220019_6.jpg"
                                 alt="">
                           </div>
                        </a>
                     </li>
                     <li class="swiper-slide"><a href="#">
                           <div class="ConTx">
                              <pre>무제한으로 즐기자!       시원한 생맥주 제공</pre>
                              <span>아이미 제주비치호텔</span>
                           </div>
                           <div class="ConPhoto">
                              <img
                                 src="${contextPath}/resources/image/hotel/CADO220001_1.jpg"
                                 alt="">
                           </div>
                     </a></li>
                     <li class="swiper-slide"><a href="#">
                           <div class="ConTx">
                              <pre>제주의 아름다운  경관 입욕스파와 함께</pre>
                              <span>골드원호텔&amp;스위트</span>
                           </div>
                           <div class="ConPhoto">
                              <img
                                 src="${contextPath}/resources/image/hotel/CADO190048_4.jpg"
                                 alt="">
                           </div>
                     </a></li>
                     <li class="swiper-slide"><a href="#">
                           <div class="ConTx">
                              <pre>탐나오 예약 고객 1인     조식뷔페 제공</pre>
                              <span>풀빌라소랑</span>
                           </div>
                           <div class="ConPhoto">
                              <img
                                 src="${contextPath}/resources/image/hotel/C160000327_15.jpg"
                                 alt="">
                           </div>
                     </a></li>
                  </ul>
               </div>
               <div class="bxBtn">
                  <a class="bx-prev" id="adPrevBtn" href="">Prev</a> 
                  <a class="bx-next" id="adNextBtn" href="">Next</a>
               </div>
            </div>

            <div class="col depth3">
               <div id="ADctgr" class="categoryPopularItems">
                  <ul class="col_3">
                     <li>
                        <a href="${contextPath}/goods/goodsHotelDetail.do?goods_code=HT0006" class="bx_list">
                           <div class="bxPhoto">
                              <img
                                 src="${contextPath}/resources/image/hotel/CADO210049_3.jpg"
                                 alt="product">
                           </div>
                           <div class="bxInfo">
                              <div class="bxTitle">기린빌라리조트</div>
                              <div class="bxEvent">프라이빗 힐링 NO1. 기린빌라리조트</div>
                              <div class="bxPrice">
                                 <span class="text__price">180,000</span> <span
                                    class="text__unit">원</span>
                              </div>
                              <div class="bxLabel">
                                 <!---->
                                 <span class="main_label">할인쿠폰</span>
                                 <!---->
                              </div>
                           </div>
                        </a>
                     </li>
                     <li><a href="${contextPath}/goods/goodsHotelDetail.do?goods_code=HT0007" class="bx_list">
                           <div class="bxPhoto">
                              <img src="${contextPath}/resources/image/hotel/CADO210031_1.jpg" alt="product">
                           </div>
                           <div class="bxInfo">
                              <div class="bxTitle">오션스위츠 제주호텔</div>
                              <div class="bxEvent">공항에서 10분거리. 아름다운 오션뷰</div>
                              <div class="bxPrice">
                                 <span class="text__price">140,000</span> <span
                                    class="text__unit">원</span>
                              </div>
                              <div class="bxLabel">
                                 <!---->
                                 <!---->
                                 <!---->
                              </div>
                           </div>
                     </a></li>
                     <li><a href="${contextPath}/goods/goodsHotelDetail.do?goods_code=HT0008" class="bx_list">
                           <div class="bxPhoto">
                              <img
                                 src="${contextPath}/resources/image/hotel/C160000058_1.jpg"
                                 alt="product">
                           </div>
                           <div class="bxInfo">
                              <div class="bxTitle">제이뷰호텔앤리조트</div>
                              <div class="bxEvent">편안한 제주만의 감성숙소</div>
                              <div class="bxPrice">
                                 <span class="text__price">89,000</span> <span
                                    class="text__unit">원</span>
                              </div>
                              <div class="bxLabel">
                                 <!---->
                                 <!---->
                                 <!---->
                              </div>
                           </div>
                     </a></li>
                     <li><a href="${contextPath}/goods/goodsHotelDetail.do?goods_code=HT0009" class="bx_list">
                           <div class="bxPhoto">
                              <img
                                 src="${contextPath}/resources/image/hotel/CADO200017_6.jpg"
                                 alt="product">
                           </div>
                           <div class="bxInfo">
                              <div class="bxTitle">씨오르리조트</div>
                              <div class="bxEvent">최고경관의 가족휴양지 올레길7코스위치</div>
                              <div class="bxPrice">
                                 <span class="text__price">77,500</span> <span
                                    class="text__unit">원</span>
                              </div>
                              <div class="bxLabel">
                                 <!---->
                                 <span class="main_label">할인쿠폰</span>
                                 <!---->
                              </div>
                           </div>
                     </a></li>
                     <li><a href="${contextPath}/goods/goodsHotelDetail.do?goods_code=HT0010" class="bx_list">
                           <div class="bxPhoto">
                              <img
                                 src="${contextPath}/resources/image/hotel/C160000461_9.jpg"
                                 alt="product">
                           </div>
                           <div class="bxInfo">
                              <div class="bxTitle">키아오라펜션</div>
                              <div class="bxEvent">성산일출봉/우도/섭지코지 근처</div>
                              <div class="bxPrice">
                                 <span class="text__price">55,000</span> <span
                                    class="text__unit">원</span>
                              </div>
                              <div class="bxLabel">
                                 <!---->
                                 <!---->
                                 <span class="main_label">당일특가</span>
                              </div>
                           </div>
                     </a></li>
                     <li><a href="${contextPath}/goods/goodsHotelDetail.do?goods_code=HT0011" class="bx_list">
                           <div class="bxPhoto">
                              <img
                                 src="${contextPath}/resources/image/hotel/C160000139_9.jpg"
                                 alt="product">
                           </div>
                           <div class="bxInfo">
                              <div class="bxTitle">어반아일랜드</div>
                              <div class="bxEvent">제주공항 5분! 유럽형 부띠끄호텔</div>
                              <div class="bxPrice">
                                 <span class="text__price">55,000</span> <span
                                    class="text__unit">원</span>
                              </div>
                              <div class="bxLabel">
                                 <!---->
                                 <!---->
                                 <!---->
                              </div>
                           </div>
                     </a></li>
                  </ul>
               </div>
            </div>
         </div>



         <div class="PopularContent PopularContent2">

            <div class="col depth1">
               <h3>렌터카</h3>
               <span class="con_more"><a href="#">상품 더 보기 ></a></span>
            </div>

            <div class="col depth2">
               <div id="ConEvnt2"
                  class="ConEvnt swiper-container swiper-container-horizontal">
                  <ul class="swiper-wrapper">
                     <li class="swiper-slide"><a href="#">
                           <div class="ConTx">
                              <pre>친환경 전기차</pre>
                              <span>청정제주와 함께하는 제주여행</span>
                           </div>
                           <div class="ConPhoto">
                              <img src="${contextPath}/resources/image/rent/cardiv_1.png"
                                 alt="전기차이미지">
                           </div>
                     </a></li>
                     <li class="swiper-slide"><a href="#">
                           <div class="ConTx">
                              <pre>중형차<br>모음</pre>
                              <span>넉넉한 공간, 합리적인 선택</span>
                           </div>
                           <div class="ConPhoto">
                              <img src="${contextPath}/resources/image/rent/cardiv_2.png"
                                 alt="중형차이미지">
                           </div>
                     </a></li>
                     <li class="swiper-slide"><a href="#">
                           <div class="ConTx">
                              <pre>고급차<br>모음</pre>
                              <span>럭셔리하고 편안한 제주여행</span>
                           </div>
                           <div class="ConPhoto">
                              <img src="${contextPath}/resources/image/rent/cardiv_3.png"
                                 alt="고급차이미지">
                           </div>
                     </a></li>
                     <li class="swiper-slide"><a href="#">
                           <div class="ConTx">
                              <pre>SUV/승합차<br>모음</pre>
                              <span>다같이 함께하는 즐거운 드라이빙</span>
                           </div>
                           <div class="ConPhoto">
                              <img src="${contextPath}/resources/image/rent/cardiv_4.png"
                                 alt="SUV/승합차이미지">
                           </div>
                     </a></li>
                     <li class="swiper-slide"><a href="#">
                           <div class="ConTx">
                              <pre>오픈카/수입차<br>모음</pre>
                              <span>새로운 경험, 특별한 제주여행!</span>
                           </div>
                           <div class="ConPhoto">
                              <img src="${contextPath}/resources/image/rent/cardiv_5.png"
                                 alt="오픈카/수입차이미지">
                           </div>
                     </a></li>
                     <li class="swiper-slide"><a href="#">
                           <div class="ConTx">
                              <pre>경차/소형차<br>모음</pre>
                              <span>합리적인 당신, 실속있는 선택!</span>
                           </div>
                           <div class="ConPhoto">
                              <img src="${contextPath}/resources/image/rent/cardiv_6.png"
                                 alt="경차/소형차이미지">
                           </div>
                     </a></li>
                  </ul>
               </div>
               <div class="bxBtn">
                  <a class="bx-prev" id="rcPrevBtn" href="">Prev</a> <a
                     class="bx-next" id="rcNextBtn" href="">Next</a>
               </div>
            </div>


            <div class="col depth3">
               <div id="RCctgr" class="categoryPopularItems">
                  <ul class="col_3">
                     <li><a href="#" class="bx_list">
                           <div class="bxPhoto">
                              <img src="${contextPath}/resources/image/rent/rent01.png"
                                 alt="product">
                           </div>
                           <div class="bxInfo">
                              <div class="bxTitle">캐스퍼</div>
                              <div class="bxEvent">(주)레드캡투어</div>
                              <div class="bxPrice">
                                 <span class="text__price">28,600</span> <span
                                    class="text__unit">원</span>
                              </div>
                              <div class="bxLabel">
                                 <!---->
                                 <!---->
                              </div>
                           </div>
                     </a></li>
                     <li><a href="#" class="bx_list">
                           <div class="bxPhoto">
                              <img src="${contextPath}/resources/image/rent/rent02.png"
                                 alt="product">
                           </div>
                           <div class="bxInfo">
                              <div class="bxTitle">쏘나타 DN8</div>
                              <div class="bxEvent">제주한라렌트카</div>
                              <div class="bxPrice">
                                 <span class="text__price">40,000</span> <span
                                    class="text__unit">원</span>
                              </div>
                              <div class="bxLabel">
                                 <!---->
                                 <!---->
                              </div>
                           </div>
                     </a></li>
                     <li><a href="#" class="bx_list">
                           <div class="bxPhoto">
                              <img src="${contextPath}/resources/image/rent/rent07.png"
                                 alt="product">
                           </div>
                           <div class="bxInfo">
                              <div class="bxTitle">코나 SX2</div>
                              <div class="bxEvent">제주공항렌터카</div>
                              <div class="bxPrice">
                                 <span class="text__price">25,100</span> <span
                                    class="text__unit">원</span>
                              </div>
                              <div class="bxLabel">
                                 <!---->
                                 <!---->
                              </div>
                           </div>
                     </a></li>
                     <li><a href="#" class="bx_list">
                           <div class="bxPhoto">
                              <img src="${contextPath}/resources/image/rent/rent05.png"
                                 alt="product">
                           </div>
                           <div class="bxInfo">
                              <div class="bxTitle">EV6 롱 레인지</div>
                              <div class="bxEvent">자유렌트카</div>
                              <div class="bxPrice">
                                 <span class="text__price">31,800</span> <span class="text__unit">원</span>
                              </div>
                              <div class="bxLabel">
                              </div>
                           </div>
                     </a></li>
                     <li><a href="#" class="bx_list">
                           <div class="bxPhoto">
                              <img src="${contextPath}/resources/image/rent/rent06.png"
                                 alt="product">
                           </div>
                           <div class="bxInfo">
                              <div class="bxTitle">미니 컨버터블</div>
                              <div class="bxEvent">블루렌트카</div>
                              <div class="bxPrice">
                                 <span class="text__price">594,000</span> <span
                                    class="text__unit">원</span>
                              </div>
                              <div class="bxLabel">
                                 <!---->
                                 <!---->
                              </div>
                           </div>
                     </a></li>
                     <li>
                        <a href="#" class="bx_list">
                           <div class="bxPhoto">
                              <img src="${contextPath}/resources/image/rent/rent03.png"
                                 alt="product">
                           </div>
                           <div class="bxInfo">
                              <div class="bxTitle">그랜드 스타렉스(12인승)</div>
                              <div class="bxEvent">(주)레츠고렌트카</div>
                              <div class="bxPrice">
                                 <span class="text__price">44,000</span> <span
                                    class="text__unit">원</span>
                              </div>
                              <div class="bxLabel">
                                 <!---->
                                 <!---->
                              </div>
                           </div>
                        </a>
                     </li>
                  </ul>
               </div>
            </div>
         </div>
         <div class="PopularContent PopularContent2">

            <div class="col depth1">
               <h3>패키지</h3>
               <span class="con_more"><a href="#">상품 더 보기 ></a></span>
            </div>

            <div class="col depth2">
               <div id="ConEvnt2"
                  class="ConEvnt swiper-container swiper-container-horizontal">
                  <ul class="swiper-wrapper">
                     <li class="swiper-slide"><a href="#">
                           <div class="ConTx">
                              <pre>이제는 울릉도다</pre>
                              <span>자연과 하나되어 만드는 여행</span>
                           </div>
                           <div class="ConPhoto">
                              <img src="${contextPath}/resources/image/package/package02.jpg"
                                 alt="패키지이미지">
                           </div>
                     </a></li>
                     <li class="swiper-slide"><a href="#">
                           <div class="ConTx">
                              <pre>중형차<br>모음</pre>
                              <span>넉넉한 공간, 합리적인 선택</span>
                           </div>
                           <div class="ConPhoto">
                              <img src="${contextPath}/resources/image/package/pckItem01.jpg"
                                 alt="중형차이미지">
                           </div>
                     </a></li>
                     <li class="swiper-slide"><a href="#">
                           <div class="ConTx">
                              <pre>고급차<br>모음</pre>
                              <span>럭셔리하고 편안한 제주여행</span>
                           </div>
                           <div class="ConPhoto">
                              <img src="${contextPath}/resources/image/package/pckItem02.jpg"
                                 alt="고급차이미지">
                           </div>
                     </a></li>
                     <li class="swiper-slide"><a href="#">
                           <div class="ConTx">
                              <pre>SUV/승합차<br>모음</pre>
                              <span>다같이 함께하는 즐거운 드라이빙</span>
                           </div>
                           <div class="ConPhoto">
                              <img src="${contextPath}/resources/image/package/pckItem03.jpg"
                                 alt="SUV/승합차이미지">
                           </div>
                     </a></li>
                     <li class="swiper-slide"><a href="#">
                           <div class="ConTx">
                              <pre>오픈카/수입차<br>모음</pre>
                              <span>새로운 경험, 특별한 제주여행!</span>
                           </div>
                           <div class="ConPhoto">
                              <img src="${contextPath}/resources/image/package/pckItem04.jpg"
                                 alt="오픈카/수입차이미지">
                           </div>
                     </a></li>
                     <li class="swiper-slide"><a href="#">
                           <div class="ConTx">
                              <pre>경차/소형차<br>모음</pre>
                              <span>합리적인 당신, 실속있는 선택!</span>
                           </div>
                           <div class="ConPhoto">
                              <img src="${contextPath}/resources/image/package/pckItem05.jpg"
                                 alt="경차/소형차이미지">
                           </div>
                     </a></li>
                  </ul>
               </div>
               <div class="bxBtn">
                  <a class="bx-prev" id="rcPrevBtn" href="">Prev</a> <a
                     class="bx-next" id="rcNextBtn" href="">Next</a>
               </div>
            </div>


            <div class="col depth3">
               <div id="RCctgr" class="categoryPopularItems">
                  <ul class="col_3">
                     <li><a href="#" class="bx_list">
                           <div class="bxPhoto">
                              <img src="${contextPath}/resources/image/package/pckItem01.jpg"
                                 alt="product">
                           </div>
                           <div class="bxInfo">
                              <div class="bxTitle">캐스퍼</div>
                              <div class="bxEvent">(주)레드캡투어</div>
                              <div class="bxPrice">
                                 <span class="text__price">28,600</span> <span
                                    class="text__unit">원</span>
                              </div>
                              <div class="bxLabel">
                                 <!---->
                                 <span class="main_label">할인쿠폰</span>
                                 <!---->
                              </div>
                           </div>
                     </a></li>
                     <li><a href="#" class="bx_list">
                           <div class="bxPhoto">
                              <img src="${contextPath}/resources/image/package/pckItem02.jpg"
                                 alt="product">
                           </div>
                           <div class="bxInfo">
                              <div class="bxTitle">쏘나타 DN8</div>
                              <div class="bxEvent">제주한라렌트카</div>
                              <div class="bxPrice">
                                 <span class="text__price">40,000</span> <span
                                    class="text__unit">원</span>
                              </div>
                              <div class="bxLabel">
                                 <!---->
                                 <span class="main_label">할인쿠폰</span>
                                 <!---->
                              </div>
                           </div>
                     </a></li>
                     <li><a href="#" class="bx_list">
                           <div class="bxPhoto">
                              <img src="${contextPath}/resources/image/package/pckItem03.jpg"
                                 alt="product">
                           </div>
                           <div class="bxInfo">
                              <div class="bxTitle">코나 SX2</div>
                              <div class="bxEvent">제주공항렌터카</div>
                              <div class="bxPrice">
                                 <span class="text__price">25,100</span> <span
                                    class="text__unit">원</span>
                              </div>
                              <div class="bxLabel">
                                 <!---->
                                 <span class="main_label">할인쿠폰</span>
                                 <!---->
                              </div>
                           </div>
                     </a></li>
                     <li><a href="#" class="bx_list">
                           <div class="bxPhoto">
                              <img src="${contextPath}/resources/image/package/pckItem04.jpg"
                                 alt="product">
                           </div>
                           <div class="bxInfo">
                              <div class="bxTitle">EV6 롱 레인지</div>
                              <div class="bxEvent">자유렌트카</div>
                              <div class="bxPrice">
                                 <span class="text__price">31,800</span> <span class="text__unit">원</span>
                              </div>
                              <div class="bxLabel">
                                 <!---->
                                 <span class="main_label">할인쿠폰</span>
                                 <!---->
                              </div>
                           </div>
                     </a></li>
                     <li><a href="#" class="bx_list">
                           <div class="bxPhoto">
                              <img src="${contextPath}/resources/image/package/pckItem05.jpg"
                                 alt="product">
                           </div>
                           <div class="bxInfo">
                              <div class="bxTitle">미니 컨버터블</div>
                              <div class="bxEvent">블루렌트카</div>
                              <div class="bxPrice">
                                 <span class="text__price">594,000</span> <span
                                    class="text__unit">원</span>
                              </div>
                              <div class="bxLabel">
                                 <!---->
                                 <span class="main_label">할인쿠폰</span>
                                 <!---->
                              </div>
                           </div>
                     </a></li>
                     <li>
                        <a href="#" class="bx_list">
                           <div class="bxPhoto">
                              <img src="${contextPath}/resources/image/package/pckItem06.jpg"
                                 alt="product">
                           </div>
                           <div class="bxInfo">
                              <div class="bxTitle">그랜드 스타렉스(12인승)</div>
                              <div class="bxEvent">(주)레츠고렌트카</div>
                              <div class="bxPrice">
                                 <span class="text__price">44,000</span> <span
                                    class="text__unit">원</span>
                              </div>
                              <div class="bxLabel">
                                 <!---->
                                 <span class="main_label">할인쿠폰</span>
                                 <!---->
                              </div>
                           </div>
                        </a>
                     </li>
                  </ul>
               </div>
            </div>
         </div>
      </div>
   </div>
<script type="text/javascript" src="${contextPath}/resources/jquery/swiper.js"></script>
</body>
</html>