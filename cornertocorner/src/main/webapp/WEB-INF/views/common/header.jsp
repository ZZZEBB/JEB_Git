<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
   <script type="text/javascript">

   var loopSearch=true;
   function keywordSearch(){
      if(loopSearch==false)
         return;
    var value=document.frmSearch.searchWord.value;
      $.ajax({
         type : "get",
         async : true, //false인 경우 동기식으로 처리한다.
         url : "${contextPath}/goods/keywordSearch.do",
         data : {keyword:value},
         success : function(data, textStatus) {
             var jsonInfo = JSON.parse(data);
            displayResult(jsonInfo);
         },
         /* error : function(data, textStatus) {
            alert("에러가 발생했습니다."+data); */
         },
         complete : function(data, textStatus) {
            //alert("작업을완료 했습니다");
            
         }
      }); //end ajax   
   }
   
   function displayResult(jsonInfo){
      var count = jsonInfo.keyword.length;
      if(count > 0) {
          var html = '';
          for(var i in jsonInfo.keyword){
            html += "<a href=\"javascript:select('"+jsonInfo.keyword[i]+"')\">"+jsonInfo.keyword[i]+"</a><br/>";
          }
          var listView = document.getElementById("suggestList");
          listView.innerHTML = html;
          show('suggest');
      }else{
          hide('suggest');
      } 
   }
   
   function select(selectedKeyword) {
       document.frmSearch.searchWord.value=selectedKeyword;
       loopSearch = false;
       hide('suggest');
   }
      
   function show(elementId) {
       var element = document.getElementById(elementId);
       if(element) {
        element.style.display = 'block';
       }
      }
   
   function hide(elementId){
      var element = document.getElementById(elementId);
      if(element){
        element.style.display = 'none';
      }
   }

</script>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>HEADER</title>

   <!-- CSS only -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

   <style>
	* {
		font-family: 'Noto Sans KR', sans-serif;
	}
   .main_hr {
      background-color : #dce4f0;
      margin : 0 auto;
      width : 80%;
      border : none;
      height : 5px;
   }
   </style>

</head>
<body>
    <div class="container">
        <header class="p-3 mt-2 text">
            <div class="container-fluid">
               <div class="d-flex flex-wrap">
                   <!-- <form class="d-flex me-lg-auto justify-content-between" role="search"> -->
                   <form class="d-flex me-lg-auto justify-content-between" role="search">
                      <a href="${contextPath}/main/main.do" class="navbar-brand mt-2">
                     <img src="${contextPath}/resources/image/logo.png" alt="로고" width="40" height="30">
                     <img src="${contextPath}/resources/image/ctc.png" alt="이름" width="250" height="30">
                  </a>
                  <div class=" col-lg-6 d-flex justify-content-center">
                         <input class="form-control" type="search" placeholder="검색어를 입력해주세요" aria-label="Search" style="margin-left : 30px;">
                  </div>  
                      <button type = "button" class="btn btn-link"  onclick="location.href='${contextPath}/main/totalSearch.do'">
                         <img src="${contextPath}/resources/image/search.png" alt="검색" width="15" height="15">
                      </button>
                   </form>
                 <!-- 기본 상단 헤더 -->
                   <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                         <c:choose>
                            <c:when test="${isLogOn==true and not empty memberInfo}">
                            	<c:choose>
                            		<c:when test="${memberInfo.member_id == 'admin'}">
                            			<li><a href="${contextPath}/joinAndLogin/logout.do" class="nav-link px-2 text-dark">${memberInfo.member_name}님 로그아웃</a></li>
										<li><a href="${contextPath}/board/faq.do" class="nav-link px-2 text-dark">고객센터</a></li>
										<li><a href="${contextPath}/main/intro.do" class="nav-link px-2 text-dark">회사소개</a></li>
										<li><a href="${contextPath}/adminSales/adminSalesMain.do" class="nav-link px-2 text-dark">관리자</a></li>
                            		</c:when>
                            		<c:otherwise>
                            			<li><a href="${contextPath}/joinAndLogin/logout.do" class="nav-link px-2 text-dark">${memberInfo.member_name}님 로그아웃</a></li>
		                               <li><a href="${contextPath}/mypage/myInfo.do" class="nav-link px-2 text-dark">마이페이지</a></li>
		                               <li><a href="${contextPath}/cart/cartList.do" class="nav-link px-2 text-dark">장바구니</a></li>
		                               <li><a href="${contextPath}/board/faq.do" class="nav-link px-2 text-dark">고객센터</a></li>
		                               <li><a href="${contextPath}/main/intro.do" class="nav-link px-2 text-dark">회사소개</a></li>
                            		</c:otherwise>
                            	</c:choose>
                             </c:when>
                             <c:when test="${isLogonCom==true and not empty comInfo}">
                               <li><a href="${contextPath}/joinAndLogin/logout.do" class="nav-link px-2 text-dark">${comInfo.com_name}님 로그아웃</a></li>
                               <li><a href="${contextPath}/mypage/myInfo.do" class="nav-link px-2 text-dark">마이페이지</a></li>
                               <li><a href="${contextPath}/board/faq.do" class="nav-link px-2 text-dark">고객센터</a></li>
                               <li><a href="${contextPath}/main/intro.do" class="nav-link px-2 text-dark">회사소개</a></li>
                               <li><a href="${contextPath}/comOrder/reservation.do" class="nav-link px-2 text-dark">사업자</a></li>
                             </c:when>
                             <c:otherwise>
								<li><a href="${contextPath}/joinAndLogin/selectLogin.do" class="nav-link px-2 text-dark">로그인</a></li>
								<li><a href="${contextPath}/joinAndLogin/joinMain.do" class="nav-link px-2 text-dark">회원가입</a></li>
								<li><a href="${contextPath}/board/faq.do" class="nav-link px-2 text-dark">고객센터</a></li>
								<li><a href="${contextPath}/main/intro.do" class="nav-link px-2 text-dark">회사소개</a></li>
                             </c:otherwise>
                   		</c:choose>
                   </ul>
					<div class="container-fluid">
						<div class="d-flex flex-wrap align-items-center justify-content-center">
							<ul class="nav justify-content-center">
								<li class="nav-item fs-4">
									<a class="nav-link link-dark" href="${contextPath}/goods/goodsHotelSearch.do">호텔</a>
								</li>
								<li class="nav-item fs-4">
									<a class="nav-link link-dark" href="${contextPath}/goods/goodsFlightSearch.do">항공</a>
								</li>
								<li class="nav-item fs-4">
									<a class="nav-link link-dark" href="${contextPath}/goods/goodsRentSearch.do">렌트</a>
								</li>
								<li class="nav-item fs-4">
									<a class="nav-link link-dark" href="${contextPath}/goods/goodsPackageSearch.do">패키지</a>
								</li> 
								<li class="nav-item fs-4">
									<a class="nav-link link-dark" href="${contextPath}/board/eventList.do">이벤트</a>
								</li>
							</ul>
						</div>
					</div>
               </div>
            </div>
        </header>
    </div>
    <hr class = "main_hr">
    <!-- JavaScript Bundle with Popper -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>