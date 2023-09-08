<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="Tel" value="${orderer.member_ph1}-${orderer.member_ph2}-${orderer.member_ph3}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>상품 예약/결제</title>
   <!-- CSS only -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   <script>
      //부트스트랩 - 모달창 스크립트
      var myModal = document.getElementById('myModal')
      var myInput = document.getElementById('myInput')
      
      myModal.addEventListener('shown.bs.modal', function () {
        myInput.focus()
      })
   //ppt18번 - 1
function fn_process_pay_order(){
   alert("확인을 누르시면 최종결제가 완료됩니다.");
    var i_goods_name=document.getElementById("goods_name");
    var i_goods_code=document.getElementById("goods_code");
    var i_goods_category=document.getElementById("goods_category");
    var i_goods_saleprice=document.getElementById("goods_saleprice");
    var i_card_pay_month=document.getElementById("card_pay_month");
    var i_card_com_name = document.getElementById("card_com_name");

    var goods_name=i_goods_name.value;
    var goods_code=i_goods_code.value;
    var goods_category=i_goods_category.value;
    var card_pay_month = i_card_pay_month.value;
    var card_com_name = i_card_com_name.value;
    
    var formObj=document.createElement("form");
    var i_receiver_goods_name = document.createElement("input");    
    var i_receiver_goods_code = document.createElement("input");
    var i_receiver_name = document.createElement("input");
    var i_receiver_goods_category = document.createElement("input");
    var i_receiver_card_pay_month = document.createElement("input");
    var i_receiver_card_com_name = document.createElement("input");
  
   /*  i_receiver_goods_name="goods_name";
    i_receiver_goods_name.value=goods_name;
    formObj.appendChild(i_receiver_goods_name); 
    */ 
    i_receiver_card_pay_month.name="card_pay_month";
    i_receiver_card_pay_month.value=card_pay_month;
    i_receiver_card_com_name.name="card_com_name";
    i_receiver_card_com_name.value=card_com_name;
    
    
    formObj.appendChild(i_receiver_name);
    formObj.appendChild(i_receiver_card_pay_month);
    formObj.appendChild(i_receiver_card_com_name);

    
    document.body.appendChild(formObj); 
    formObj.method="post";
    formObj.action="${contextPath}/order/payToOrderGoods.do";
    formObj.submit();
}
      
      
   </script>
   <div class = "container justify-content-center mt-3">   
      <div class = "d-flex col-md-9 justify-content-between align-item-center">
         <h4>예약하기</h4>
      </div>
      <hr>
      <div class="col-md-12">
         <table class="table caption-top table table-bordered">
            <caption class="fs-5">상품 정보</caption>
            <tr>
               <th class="col-md-2">구분</th>
               <th class="col-md-5">상품정보</th>
               <th class="col-md-2">상품금액</th>
               <th class="col-md-3">최종금액</th>
            </tr>
            <c:forEach var="item" items="${myOrderList}">
            <tr>
               <td>${item.goods_category}</td>
               <td>
                  <p>
                     <span class = "fw-bolder"><input type="text" name="goods_name" id="goods_name" value="${item.goods_name}"/></span>
                  </p>
               </td>
               <td>${item.goods_saleprice} 원</td>
               <td>${item.goods_saleprice} 원</td>
            </tr>
               <input type="hidden" name="goods_code" id="goods_code" value="${item.goods_code}"/>
               <input type="hidden" name="goods_category" id="goods_category" value="${item.goods_category}"/>
               <input type="hidden" name="goods_saleprice" id="goods_saleprice" value="${item.goods_saleprice}"/>
            </c:forEach>
         </table>
      </div>
      <form class="col-md-12 needs-validation" novalidate>
         <div class="mt-3">
            <table class="table caption-top table table-bordered">
               <caption class="fs-5">예약자 정보</caption>
               <tr>
                  <th class="table-active" name="reservationName">이름</th>
                  <td colspan="4"><input type="text" value="${orderer.member_name}" readonly="readonly"></td>
               </tr>
               <tr>
                  <th class="table-active" name="reservationEmail">이메일</th>
                  <td><input type="text" value="${orderer.member_email}" readonly="readonly"></td>
               </tr>
               <tr>
                  <th class="table-active" name="reservationTel">휴대폰</th>
                  <td><input type="text" value="${orderer.member_ph1}" name="hp1" id="hp1" readonly="readonly">
                      <input type="text" value="${orderer.member_ph2}" name="hp2" id="hp2" readonly="readonly">
                      <input type="text" value="${orderer.member_ph3}" name="hp3" id="hp3" readonly="readonly"></td>
               </tr>
            </table>
         </div>
         <div class="mt-3">
            <p class="fs-5">마일리지</p>
            <div class = "d-flex mt-1 align-middle p-4" style = "background-color : #f5f5f5;">
               <div class = "col-md-2 col align-self-center">
                  <p>사용할 마일리지</p>
               </div>
               <div class = "col">
                  <p>장은빈님 사용가능 마일리지 <span>${orderer.member_mileage} 원</span></p>
                  <input type = "text" placeholder="1,000 이상 보유시 사용가능">
                  <button type = "button" class = "btn btn btn-outline-dark btn-sm">모두 사용</button>
                  <p style = "font-size : 12px;">
                     - 마일리지는 1,000 이상부터 사용 가능하며 항공권은 100 단위로 사용 가능합니다.<br>
                     - 마일리지 결제 후 항공권 환불 및 호텔 예약 취소 수수료는 마일리지로 차감이 불가하며 별도 입금 처리 또는 카드 결제가 필요합니다.<br>
                     - 마일리지 차감 불가 항목 : ctc 항공 발권대행/환불 대행 수수료, 항공사 환불 수수료, 호텔 취소 수수료 등<br>
                  </p>
               </div>
            </div>
         </div>
         <div class="col-md-9 mt-3">
            <table class="table caption-top table table-bordered">
               <caption class="fs-5">결제 정보</caption>
               <tr>
                  <th class="col-md-2">총상품금액</th>
                  <td><c:forEach var="item" items="${myOrderList}">${item.goods_saleprice}</c:forEach> 원</td>
               </tr>
               <tr>
                  <th>마일리지</th>
                  <td>${orderer.member_mileage} 마일리지</td>
               </tr>
               <tr>
                  <th>최종결제금액</th>
                  <td><c:forEach var="item" items="${myOrderList}">${item.goods_saleprice}</c:forEach> 원</td>
               </tr>
            </table>
         </div>
         <p>
            결제요청 이후에는 패널티가 발생 될 수 있으니 반드시 영문명과 일정을 확인하시기 바랍니다.<br>
            결제를 진행하시겠습니까?
         </p>
         <ul  style = "color : #808080; font-size : 0.8em;">
            <li>평일 업무시간 (09:00~17:00) 이외에는 취소, 변경, 환불, 상담 등의 업무처리가 불가합니다.</li>
            <li>결제 후 변경 및 취소 시 항공사의 규정에 따라 취소/변경 수수료가 부과되기에 구매하시는 항공권의 항공사 요금 규정 및 이용약관을 반드시 숙지하셔야 합니다.</li>
            <li>평일 업무시간 (09:00~17:00) 이후 결제 요청 시 확인이 필요한 일부 운임의 경우 영업일 내 처리되며 항공사 사정에 따라 기존 예약하신 요금이 인상되거나 항공권 발행이 불가할 수 있습니다.</li>
            <li>일부 항공권의 경우 당일취소가 불가능하고 정상업무시간에 환불로 접수되므로 결제 진행 시 신중하게 결제 부탁드립니다.</li>
         </ul>
      </form>
      <!-- 모달창 버튼 -->
      <a class="btn btn-primary" data-bs-toggle="modal" href="#exampleModalToggle1" role="button">결제하기</a>
      <!-- 모달창 -->
      <div class="modal fade" id="exampleModalToggle1" aria-hidden="true" aria-labelledby="exampleModalToggleLabel1" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalToggleLabel1">예약내역 최종 확인</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                 <p style = "color : #808080; font-size : 0.8em;">
                  ※ 입력하신 정보가 모두 정확한지 마지막으로 다시 확인해주시기 바랍니다.
               </p>
               <table class="table caption-top table table-bordered">
                  <caption class="fs-5">예약자 정보<span style = "color : #808080; font-size : 0.8em;"></span></caption>
                  <tr>
                     <th class="table-active">성함</th>
                     <th class="table-active">생년월일</th>
                  </tr>
                  <tr>
                     <td>${orderer.member_name} 님</td>
                     <td>${orderer.member_rrn1}</td>
                  </tr>
               </table>
               <table class="table caption-top table table-bordered">
                  <caption class="fs-5">예약자 연락정보 확인</caption>
                  <tr>
                     <th class="table-active">휴대폰 번호</th>
                     <td>${orderer.member_ph1}-${orderer.member_ph2}-${orderer.member_ph3}</td>
                     <th class="table-active">이메일</th>
                     <td>${orderer.member_email}</td>
                  </tr>
               </table>
               <h5>중복(이중)예약 안내</h5>
               <ul  style = "color : #808080; font-size : 0.8em;">
                  <li>해당 항공사는 규정 상 중복 예약이 있는 경우, 사전경고 없이 모든 예약이 취소될 수 있으므로 주의하시기 바랍니다.</li>
                  <li>이름이 신분증 또는 본인확인서류와 다른 경우 이용 및 탑승이 거절되며, 수수료가 부과될 수 있습니다.</li>
               </ul>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">뒤로</button>
              <button class="btn btn-primary" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal">다음</button>
            </div>
          </div>
        </div>
      </div>
      <div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalToggleLabel2">결제하기<span class ="fs-6 fw-lighter text-muted ms-2">지금 바로 구매하지 않으실 경우 항공권 예매가 자동으로 취소됩니다. (예약과 동시 구매)</span></h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                  <form class = "needs-validation" novalidate>
                  <table class="table caption-top table table-bordered align-middle">
                     <tr>
                        <th class = "col-md-2">결제금액</th>
                        <td>140,100 원</td>
                     </tr>
                     <tr>
                        <th class = "col-md-2">카드사</th>
                        <td><input type="text" class="form-control" placeholder="ex)신한카드" id="card_com_name" name="card_com_name" required></td>
                     </tr>
                     <tr>
                        <th>카드번호</th>
                        <td>
                           <div class="row g-3">
                              <div class="col-sm">
                                 <input type="text" class="form-control" placeholder="" aria-label="cardBox_01" required>
                              </div>
                              <div class="col-sm">
                                 <input type="text" class="form-control" placeholder="" aria-label="cardBox_02" required>
                              </div>
                              <div class="col-sm">
                                 <input type="text" class="form-control" placeholder="" aria-label="cardBox_03" required>
                              </div>
                              <div class="col-sm">
                                 <input type="text" class="form-control" placeholder="" aria-label="cardBox_04" required>
                              </div>
                           </div>
                        </td>
                     </tr>
                     <tr>
                        <th>카드유효기간</th>
                        <td>
                           <div class="row g-2">
                              <div class="col-md">
                                 <div class="form-floating">
                                    <select class="form-select" id="floatingSelect" name = "inputYear" aria-label="Floating label select example">
                                     </select>
                                    <label for="floatingSelect">년도 선택</label>
                                   </div>
                              </div>
                              <div class="col-md">
                                   <div class="form-floating">
                                    <select class="form-select" id="floatingSelect" aria-label="Floating label select example">
                                       <option selected value="Jan">1월</option>
                                       <option value="Feb">2월</option>
                                       <option value="Mar">3월</option>
                                       <option value="Apr">4월</option>
                                       <option value="May">5월</option>
                                       <option value="Jun">6월</option>
                                       <option value="Jul">7월</option>
                                       <option value="Aug">8월</option>
                                       <option value="Sep">9월</option>
                                       <option value="Oct">10월</option>
                                       <option value="Nov">11월</option>
                                       <option value="Dec">12월</option>
                                    </select>
                                    <label for="floatingSelect">월 선택</label>
                                 </div>
                              </div>
                              <script>
                                 /* select 박스에 연도 집어넣기 */
                                 $(document).ready(function(){
                                    setDateSelectBox();
                                 });    
                                 
                                 function setDateSelectBox(){
                                    var now = new Date();
                                    var now_year = now.getFullYear();
                                    
                                    $("#floatingSelect").append("<option value=''>선택</option>");
                                    
                                    /* 2005년 부터 올해까지 */
                                    for(var i = now_year; i <= 2033; i++){
                                    $("#floatingSelect").append("<option value='"+ i +"'>"+ i + "&nbsp;년" +"</option>");
                                    }
                                 }
                              </script>
                           </div>
                        </td>
                     </tr>
                     <tr>
                        <th>할부선택</th>
                        <td>
                           <div class="col">
                              <select id="card_pay_month" name="card_pay_month" class="form-select">
                                       <option value="일시불" selected>일시불</option>
                                       <option value="2개월">2개월</option>
                                       <option value="3개월">3개월</option>
                                       <option value="4개월">4개월</option>
                                       <option value="5개월">5개월</option>
                                       <option value="6개월">6개월</option>
                               </select>
                             </div>
                        </td>
                     </tr>
                     <tr>
                        <th>생년월일</th>
                        <td>
                           <div class="col">
                               <input type="text" class="form-control" id="inputBirth" required>
                             </div>
                        </td>
                     </tr>
                     <tr>
                        <th>카드비밀번호</th>
                        <td>
                           <div class="form-floating">
                              <input type="password" class="form-control" id="floatingPassword" required>
                              <label for="floatingPassword">(카드비밀번호 앞 두자리만 입력)</label>
                           </div>
                        </td>
                     </tr>
                  </table>
               </form>
            </div>
            <div class="modal-footer">
              <input class = "btn btn-primary" name="btn_process_pay_order" type="button" onClick="fn_process_pay_order()" value="최종결제하기">
            </div>
          </div>
        </div>
      </div>
   </div>
   <!-- JavaScript Bundle with Popper -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>