<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>호텔 상세 페이지</title>
    <script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
   <!-- CSS only -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <!-- jQuery 라이브러리 -->
   <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
   <!-- Popper.js 라이브러리 -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
   <!-- Bootstrap JS -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
   
   <script>
     $(document).ready(function() {
       $("#datepicker1").datepicker({
         dateFormat: "yy-mm-dd"
       });
     });
   </script>
   <script type="text/javascript">
      function add_cart(goods_code) {
         $.ajax({
            type : "post",
            async : false, //false인 경우 동기식으로 처리한다.
            /* Ajax를 이용해 장바구니에 추가할 상품 번호를 전송합니다. */
            url : "${contextPath}/cart/addGoodsInCart.do",
            data : {
               goods_code:goods_code
               
               
            },
            success : function(data, textStatus) {
               //alert(data);
            //   $('#message').append(data);
            /* 장바구니에 추가하면 알림창을 표시 */
               if(data.trim()=='add_success'){
                  imagePopup('open', '.layer01');   
                  alert("장바구니에 담았습니다.");
               }else if(data.trim()=='already_existed'){
                  alert("이미 카트에 등록된 상품입니다. 장바구니로 이동합니다.");
                  location.href = "${contextPath}/cart/cartList.do";
               }
               
            },
            error : function(data, textStatus) {
               alert("로그인 후 이용해주세요.");
               location.href = "${contextPath}/joinAndLogin/loginForm.do";
            },
            complete : function(data, textStatus) {
               //alert("작업을완료 했습니다");
            }
         }); //end ajax   
      }
   
      function imagePopup(type) {
         if (type == 'open') {
            // 팝업창을 연다.
            jQuery('#layer').attr('style', 'visibility:visible');
   
            // 페이지를 가리기위한 레이어 영역의 높이를 페이지 전체의 높이와 같게 한다.
            jQuery('#layer').height(jQuery(document).height());
         }
   
         else if (type == 'close') {
   
            // 팝업창을 닫는다.
            jQuery('#layer').attr('style', 'visibility:hidden');
         }
      }
      
   function fn_order_each_goods(goods_code,goods_name,goods_price,goods_saleprice,goods_category){
      var _isLogOn=document.getElementById("isLogOn");
      var isLogOn=_isLogOn.value;
      
       if(isLogOn=="false" || isLogOn=='' ){
         alert("로그인 후 이용해주세요.");
      } 
      
      
         var total_price,final_total_price;
         /* var order_headcount=document.getElementById("order_headcount"); */
         
         var formObj=document.createElement("form");
         var i_goods_code = document.createElement("input"); 
       var i_goods_name = document.createElement("input");
       var i_goods_price=document.createElement("input");
       var i_goods_saleprice=document.createElement("input");
       var i_goods_category=document.createElement("input");
       /* var i_fileName=document.createElement("input"); */
       /* var i_order_headcount=document.createElement("input"); */
       
       i_goods_code.name="goods_code";
       i_goods_name.name="goods_name";
       i_goods_price.name="goods_price";
       i_goods_saleprice.name="goods_saleprice";
       i_goods_category.name="goods_category";
       /* i_fileName.name="goods_fileName"; */
       /* i_order_headcount.name="order_headcount"; */
       
       i_goods_code.value=goods_code;
       /* i_order_headcount.value=order_headcount.value; */
       i_goods_name.value=goods_name;
       i_goods_price.value=goods_price;
       i_goods_saleprice.value=goods_saleprice;
       i_goods_category.value=goods_category;
       /* i_fileName.value=fileName; */
       
       formObj.appendChild(i_goods_code);
       formObj.appendChild(i_goods_name);
       formObj.appendChild(i_goods_price);
       formObj.appendChild(i_goods_saleprice);
       formObj.appendChild(i_goods_category);
       /* formObj.appendChild(i_fileName); */
       /* formObj.appendChild(i_order_goods_qty); */
   
       document.body.appendChild(formObj); 
       formObj.method="post";
       formObj.action="${contextPath}/order/orderEachGoods.do";
       formObj.submit();
      }   
   </script>
   <style type="text/css">
      #search {
         margin-bottom: 20px;
         text-align: center;
      }
      .date{
         padding-left:5px;
         border:none;
         background-color:#E0E0E0;
         text-align: center;
         height:20px;
      }
      .carousel-link .thumb {
         width: 25%;
         cursor: pointer;
         float: left;
      }
      .carousel-link .thumb img {
         width: 100%;
      }
      .carousel-link .thumb:first-of-type img {
         margin-left: 0;
      }
      .carousel-link .thumb:last-of-type img {
         margin-right: 0;
      }
      .thumb > * {
           height: calc(100% * var(--ratio));
       }
   </style>
   <script>
       $(function() {
           var firstImgHeight = $("#firstImg").height();
           $(".thumb > *").css("--ratio", firstImgHeight / 100 + "");
       });
</script>
</head>
<body>
   <div class = "container mt-4">
      <c:forEach var="hotel" items="${hotelList}">
         <div class="container">
             <div class="row">
                 <div class="col-md-6">
                     <div id="myCarousel" class="carousel slide" data-ride="carousel">
                         <div class="carousel-inner">
                             <div class="carousel-item active">
                                 <img src="${contextPath}/resources/image/hotel/hotel1.jpg">
                             </div>
                             <div class="carousel-item">
                                 <img src="${contextPath}/resources/image/hotel/hotel2.jpg">
                             </div>
                             <div class="carousel-item">
                                 <img src="${contextPath}/resources/image/hotel/hotel3.jpg">
                             </div>
                         </div>
                         <a class="carousel-control-prev" href="#myCarousel" data-slide="prev">
                             <span class="carousel-control-prev-icon"></span>
                         </a>
                         <a class="carousel-control-next" href="#myCarousel" data-slide="next">
                             <span class="carousel-control-next-icon"></span>
                         </a>
                         <div class="clearfix">
                             <div class="carousel-link">
                                 <div data-target="#myCarousel" data-slide-to="0" class="thumb">
                                     <img id="firstImg" src="${contextPath}/resources/image/hotel/hotel1.jpg" height = "100%">
                                 </div>
                                 <div data-target="#myCarousel" data-slide-to="1" class="thumb">
                                     <img src="${contextPath}/resources/image/hotel/hotel2.jpg" height = "100%">
                                 </div>
                                 <div data-target="#myCarousel" data-slide-to="2" class="thumb">
                                     <img src="${contextPath}/resources/image/hotel/hotel3.jpg" height = "100%">
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
                 <div class="col-md-6">
                     <h2>${hotel.goods_name}</h2>
                     <h3>${hotel.goods_price}<small>&nbsp;원 ~</small></h3>
                     <p>${hotel.goods_exp}</p>
                     <div class="row g-2">
                     <div class="col-md">
                          <div class="form-floating">
                           <select class="form-select" id="floatingSelect" aria-label="Floating label select example">
								<option value="1">싱글</option>
								<option value="2">더블</option>
								<option value="3">디럭스 싱글</option>
								<option value="4">디럭스 더블</option>
								<option value="5">스위트 싱글</option>
								<option value="6">스위트 더블</option>
                           </select>
                           <label for="floatingSelect">객실 선택</label>
                        </div>
                     </div>
                  </div>
                  <div class = "row g-2 mt-2 text-center">
                     <p>총 금액</p>
                     <p><fmt:formatNumber value = "${hotel.goods_saleprice}" type = "number" /> 원</p>
                  </div>
                  <div class = "d-flex g-2 mt-2 mx-3">
                     <a class="buy" href = "javascript:fn_order_each_goods('${hotel.goods_code }','${hotel.goods_name }','${hotel.goods_price}','${hotel.goods_saleprice}','${hotel.goods_category }');">
                        <input type = "button" class="btn btn-primary" value = "바로 예약하기">
                     </a>
                     <a class="cart" href="javascript:add_cart('${hotel.goods_code}','order_goods_qty')">
                        <input class="btn btn-primary btn-md" data-bs-toggle="modal" type = "button" value = "장바구니에 담기">
                     </a>
                  </div>
                 </div>
              </div>
          </div>
      </c:forEach>
   </div>
</body>
</html>
<input type="hidden" name="isLogOn" id="isLogOn" value="${isLogOn}"/>