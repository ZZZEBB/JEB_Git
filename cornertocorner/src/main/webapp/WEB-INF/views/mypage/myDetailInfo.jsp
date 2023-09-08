<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>회원정보 상세페이지</title>
   <!-- CSS only -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
   <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
   <script src="https://code.jquery.com/jquery-3.6.4.js"></script>
   <script>
   
      function dm(){
         alert("수정되었습니다.");
      }
      
      
      //우편번호
      function execDaumPostcode() {
           new daum.Postcode({
             oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
      
               // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
               var extraRoadAddr = ''; // 도로명 조합형 주소 변수
      
               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                 extraRoadAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment === 'Y'){
                 extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if(extraRoadAddr !== ''){
                 extraRoadAddr = ' (' + extraRoadAddr + ')';
               }
               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
               if(fullRoadAddr !== ''){
                 fullRoadAddr += extraRoadAddr;
               }
      
               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               document.getElementById('member_zipcode').value = data.zonecode; //5자리 새우편번호 사용
               document.getElementById('member_road_address').value = fullRoadAddr;
               document.getElementById('member_local_address').value = data.jibunAddress;
      
               // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
               if(data.autoRoadAddress) {
                 //예상되는 도로명 주소에 조합형 주소를 추가한다.
                 var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                 document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
      
               } else if(data.autoJibunAddress) {
                   var expJibunAddr = data.autoJibunAddress;
                   document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
               } else {
                   document.getElementById('guide').innerHTML = '';
               }
               
              
             }
           }).open();
         }
      
      //(id, ID, 아이디) 유효성검사, 중복체크
      function fn_overlapped(){
          var _id=$("#id").val();
          var $resultMsg = $('#id-check-warn'); //$resultMsg 사용하기위한 변수선언
          
          //아이디 유효성검사
          var idRegExp = /^[a-z0-9]{4,16}$/;
         /*  if(_id==''){
             alert("ID를 입력하세요");
             return;
          } */
          if (_id == "") {
            //alert("아이디를 입력해주세요.");
            $resultMsg.html("아이디를 입력해주세요.");
            $resultMsg.css('color','red');
            return;
         }
         if (!idRegExp.test(_id)) {
            //alert("아이디는 4~16자리의 영문 소문자, 숫자로 구성되어야 합니다.");
            $resultMsg.html('아이디는 4~16자리의 영문 소문자, 숫자로 구성되어야 합니다.');
            $resultMsg.css('color','red');
            return;
         }
         //아이디 중복체크
          $.ajax({
             type:"post",
             async:false,  
             url:"${contextPath}/joinAndLogin/overlapped.do",
             dataType:"text",
             data: {id:_id},
             success:function (data,textStatus){
                if(data=='false'){
                    alert("사용할 수 있는 ID입니다.");
                    $('#btnOverlapped').prop("disabled", true);
                    $('#id').prop("disabled", true);
                    $('#member_id').val(_id);
                }else{
                   alert("사용할 수 없는 ID입니다.");
                }
             },
             error:function(data,textStatus){
                //alert("에러가 발생했습니다.");ㅣ
             },
             complete:function(data,textStatus){
                //alert("작업을완료 했습니다");
             }
          });  //end ajax    
       }//(아이디,id,ID)end
       
       
       //(pwd, 비밀번호) 유효성검사
      function validatePassword() {
        var passwordRegExp = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()]).{8,}$/;
        var password = $("#member_pw").val();
        var $passwordWarn = $("#password-warn");
        var $passwordConfirm = $("#password-confirm");
        
        if (!password) {
             $passwordWarn.html('');
             return false;
           } else if (!passwordRegExp.test(password)) {
             $passwordWarn.html('비밀번호는 8~16자리의 영문 대/소문자, 숫자, 특수문자(!@#$%^&*())를 포함해야 합니다.');
             $passwordWarn.css('color', 'red');
             return false;
           } else {
             $passwordWarn.html('사용할 수 있는 비밀번호입니다.');
             $passwordWarn.css('color', 'green');
             $passwordConfirm.attr('disabled', false);
             return true;
           }
      }
      
      //(pwd, 비밀번호) 비밀번호일치확인
      function validatePasswordConfirm() {
        var password = $("#member_pw").val();
        var confirmPassword = $("#password-confirm").val();
        var $passwordConfirmWarn = $("#password-confirm-warn");
      
        if (password !== confirmPassword) {
          $passwordConfirmWarn.html('비밀번호와 비밀번호 확인이 일치하지 않습니다.');
          $passwordConfirmWarn.css('color', 'red');
          return false;
        } else {
          $passwordConfirmWarn.html('비밀번호와 비밀번호 확인이 일치합니다.');
          $passwordConfirmWarn.css('color', 'green');
          return true;
        }
      }
      
       $(document).ready(function() {
           $("#member_pw").on("blur", function() {
             validatePassword();
           });
           
           $("#password-confirm").on("blur", function() {
             validatePasswordConfirm();
           });
         });
      
      /*  위 코드에서 $("#member_pw").on("blur", ...)는 "member_pw" 입력 필드가 포커스를 잃을 때
       (validatePassword 함수 실행) 이벤트가 발생할 때 실행됩니다.
       $("#password-confirm").on("blur", ...)는 "password-confirm" 
       입력 필드가 포커스를 잃을 때(validatePasswordConfirm 함수 실행) 이벤트가 발생할 때 실행됩니다. */
       
       //(pwd,비밀번호 password) end
       
       
       
       //(name,이름) 유효성검사
       function validateName() {
        var nameRegExp = /^[a-zA-Z가-힣]{2,5}$/;
        var name = $("#member_name").val();
        var $nameWarn = $("#name-warn");
      
        if (!name) {
          $nameWarn.html('이름을 입력해주세요.');
          $nameWarn.css('color', 'red');
          return false;
        } else if (!nameRegExp.test(name)) {
          $nameWarn.html('이름은 2~5자리의 한글, 영문으로 구성되어야 합니다.');
          $nameWarn.css('color', 'red');
          return false;
        } else {
          $nameWarn.html('');
          return true;
        }
      } //(name,이름) 유효성검사 end
       
       
       //(rrn, RRN, 주민등록번호) 유효성검사
      function validateRRN() {
         var rrn1 = document.getElementById("member_rrn1").value;
         var rrn2 = document.getElementById("member_rrn2").value;
      
         // rrn1 검증
         if (!/^\d{6}$/.test(rrn1)) {
         document.getElementById("rrn-warn").innerHTML = "주민등록번호 앞 6자리는 숫자로 구성되어야 합니다.";
         document.getElementById("rrn-warn").style.color ="red";
         return false;
         }
      
         // rrn2 검증
         if (!/^\d{7}$/.test(rrn2)) {
         document.getElementById("rrn-warn").innerHTML = "주민등록번호 뒤 7자리는 숫자로 구성되어야 합니다.";
         document.getElementById("rrn-warn").style.color ="red";
         return false;
         }
      
         // 모두 통과하면 경고 메시지 제거
         document.getElementById("rrn-warn").innerHTML = "";
         // true 반환
         return true;
         } //(rrn, RRN, 주민등록번호) 유효성검사 end
      
         
         
         //(ph,phn,전화번호,휴대폰번호)유효성검사
         function validatePh() {
             var ph1 = document.getElementsByName("member_ph1")[0].value;
             var ph2 = document.getElementsByName("member_ph2")[0].value;
             var ph3 = document.getElementsByName("member_ph3")[0].value;
      
             // ph1 검증
             if (!/^\d{3}$/.test(ph1)) {
                 document.getElementById("ph-warn").innerHTML = "휴대폰번호 앞 3자리는 숫자로 구성되어야 합니다.";
                 return false;
             }
      
             // ph2 검증
             if (!/^\d{4}$/.test(ph2)) {
                 document.getElementById("ph-warn").innerHTML = "휴대폰번호 중간 4자리는 숫자로 구성되어야 합니다.";
                 return false;
             }
      
             // ph3 검증
             if (!/^\d{4}$/.test(ph3)) {
                 document.getElementById("ph-warn").innerHTML = "휴대폰번호 뒤 4자리는 숫자로 구성되어야 합니다.";
                 return false;
             }
      
             // 모두 통과하면 경고 메시지 제거
             document.getElementById("ph-warn").innerHTML = "";
             // true 반환
             return true;
         }//(ph,phn,전화번호,휴대폰번호)유효성검사end
         
         
         
         
       
       //(이메일 e-mail) 유효성검사, 메일전송, 인증확인
      function fn_sendauthmail() {
         const email = $('#member_email').val(); // 이메일 주소값 얻어오기!
         const $resultMsg = $('#mail-warn'); //$resultMsg 사용하기위한 변수선언
         
         // 이메일 유효성 검사
         const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
         if (!emailRegex.test(email)) {
            //alert('유효한 이메일 주소를 입력해주세요.');
            $resultMsg.html("유효한 이메일 주소를 입력해주세요.");
            $resultMsg.css('color','red');
            return;
         }
      
         const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
         
         $.ajax({
            type : 'get',
            url : '<c:url value ="/mail/sendMail.do?email="/>'+email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
            success : function (data) {
               console.log("data : " +  data);
               checkInput.attr('disabled',false);
               code = data;
               alert('인증번호가 전송되었습니다.');
            }         
         }); // end ajax
      }; // end send eamil
      
      // 인증번호 비교 
      // blur -> focus가 벗어나는 경우 발생
      function fn_checkmail() {
         const inputCode = $(".mail-check-input").val();
         const $resultMsg = $('#mail-check-warn'); //$resultMsg 사용하기위한 변수선언
         
         if(inputCode === code){
            $resultMsg.html('인증번호가 일치합니다.');
            $resultMsg.css('color','green');
            $('#mail_sendauthmail').attr('disabled',true);
            $('#member_email').attr('readonly',true);
            $('#member_email').attr('onFocus', 'this.initialSelect = this.selectedIndex');
               $('#member_email').attr('onChange', 'this.selectedIndex = this.initialSelect');
               $('#member_email_yn').val('y');
         }else{
            $resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
            $resultMsg.css('color','red');
         }
      };//(이메일 e-mail) end
   
   </script>
</head>
<body>
   <div class = "container col-md-8 justify-content-center text-center">
      <!-- 상단 간략화 메뉴 -->
	<nav class="text-end" aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="${contextPath}/mypage/myInfo.do" style="text-decoration:none; color:black;">마이페이지</a></li>
			<li class="breadcrumb-item active" aria-current="page">나의 상세정보</li>
		</ol>
	</nav>
      <c:if test="${not empty memberInfo}">
      <form action="${contextPath}/mypage/modifyMyInfo.do" method="post">   
         <table class="table table align-middle">
            <tr>
               <th class = "col-md-2">아이디</th>
               <td>
                  <input class = "form-control" type="text" name="member_id"  id="id" value="${memberInfo.member_id}" readonly/>
                  <label for = "member_id" id = "id-check-warn"></label>
               </td>
            </tr>
            <tr>
               <th>비밀번호</th>
               <td>
                  <div class="row g-3">
                     <div class="col">
                        <input type="password" id="member_pw" name="member_pw" class="form-control" minlength="8" maxlength="16" oninput="validatePassword()" required>
                        <label for = "member_pw" id = "password-warn"></label>
                     </div>
                  </div>
               </td>
            </tr>
            <tr>
               <th>비밀번호 확인</th>
               <td>
                  <div class="row g-3">
                     <div class="col">
                        <input type="password" id="password-confirm" name="password-confirm" class="form-control" placeholder="비밀번호 재입력" minlength="8" maxlength="16" oninput="validatePasswordConfirm()" required>
                        <label for = "password-confirm" id = "password-confirm-warn"></label>
                     </div>
                  </div>
               </td>
            </tr>
            <tr>
               <th class = "col-md-2">이름</th>
               <td>
                  <input class = "form-control" name="member_name" id="member_name" type="text" value="${memberInfo.member_name}" readonly oninput="validateName()"/>
                  <label for = "member_name" id = "name-warn"></label>
               </td>
            </tr>
            <tr>
               <th>주민등록번호</th>
               <td>
                  <div class="d-flex g-3 align-middle text-center">
                     <div class="col">
                        <input type="text" class="form-control" id="member_rrn1" name="member_rrn1" minlength="6" maxlength="6" placeholder="주민번호 앞 6자리를 입력해주세요." required oninput="validateRRN()">
                     </div><span>-</span>
                     <div class="col">
                        <input type="password" class="form-control" placeholder="주민번호 뒤 7자리를 입력해주세요." id="member_rrn2" name="member_rrn2" minlength="7" maxlength="7" required oninput="validateRRN()">
                     </div>
                         <br><span id="rrn-warn"></span>
                  </div>
                     -
               </td>
            </tr>
            <tr>
               <th>휴대폰번호</th>
               <td>
                  <div class="d-flex g-3 align-middle text-center">
                     <div class="col">
                        <input type="text" name="member_ph1" value="${memberInfo.member_ph1}" class="form-control" id="inputBirth" minlength="3" maxlength="3" required oninput="validatePh()">
                     </div><span>-</span>
                     <div class="col">
                        <input type="text" name="member_ph2" value="${memberInfo.member_ph2}" class="form-control" id="inputBirth" minlength="4" maxlength="4" required oninput="validatePh()">
                     </div><span>-</span>
                     <div class="col">
                        <input type="text" name="member_ph3" value="${memberInfo.member_ph3}" class="form-control" id="inputBirth" minlength="4" maxlength="4" required oninput="validatePh()">
                     </div>
                     <br><span id="ph-warn"></span>
                  </div>
               </td>
            </tr>
            <tr>
               <th class = "col-md-2">이메일(e-mail)</th>
               <td>
                  <input class = "form-control" type="text" name="member_email" id="member_email" value="${memberInfo.member_email}" placeholder="xxx@xxx.xxx 형식"/>
                  <label for = "mail-warn">&nbsp;-&nbsp;</label>
               </td>
            </tr>
            <tr>
               <th>주소</th>
               <td>
                  <div class="row g-3">
                     <div class="col-md">
                        <input type="text" class="form-control" id="member_zipcode" name="member_zipcode">
                        <label for="member_zipcode"><a href="javascript:execDaumPostcode()">우편번호검색</a></label>
                     </div>
                     <div class="form-floating">
                        <input type="text" class="form-control" id="member_local_address" value="${memberInfo.member_road_address}" name="member_local_address">
                        <label for="member_local_address">도로명주소</label>
                  </div>
                  <div class="form-floating">
                     <input type="text" class="form-control" id="member_road_address" value="${memberInfo.member_local_address}" name="member_road_address">
                     <label for="member_road_address">지번주소</label>
                  </div>
                  <div class="form-floating">
                     <input type="text" class="form-control" id="member_rest_address" value="${memberInfo.member_rest_address}" name="member_rest_address">
                        <label for="member_rest_address">나머지주소</label>
                     </div>
                  </div>
               </td>
            </tr>
         </table>
      <div class="col-md-10 justify-content-center">
         <input class = "btn btn-primary btn-md" type="submit"  value="회원정보수정">
         <!-- <input class = "btn btn-primary btn-md" type="submit"  value="회원정보수정" onclick="dm()"> -->
         <input class = "btn btn-primary btn-md" type="reset"  value="다시입력">
      </div>
      </form>
      </c:if>
      
      <c:if test="${not empty comInfo}">
      <form action="${contextPath}/mypage/modifyMyInfo.do" method="post">   
         <table class="table table align-middle">
            <tr>
               <th class = "col-md-2">아이디</th>
               <td>
                  <input class = "form-control" type="text" name="com_id"  id="id" value="${comInfo.com_id}" readonly/>
                  <label for = "member_id" id = "id-check-warn"></label>
               </td>
            </tr>
            <tr>
               <th>비밀번호</th>
               <td>
                  <div class="row g-3">
                     <div class="col">
                        <input type="password" id="member_pw" name="com_pw" class="form-control" minlength="8" maxlength="16" oninput="validatePassword()" required>
                        <label for = "com_pw" id = "password-warn"></label>
                     </div>
                  </div>
               </td>
            </tr>
            <tr>
               <th>비밀번호 확인</th>
               <td>
                  <div class="row g-3">
                     <div class="col">
                        <input type="password" id="password-confirm" name="password-confirm" class="form-control" placeholder="비밀번호 재입력" minlength="8" maxlength="16" oninput="validatePasswordConfirm()" required>
                        <label for = "password-confirm" id = "password-confirm-warn"></label>
                     </div>
                  </div>
               </td>
            </tr>
            <tr>
               <th class = "col-md-2">이름</th>
               <td>
                  <input class = "form-control" name="com_name" id="com_name" type="text" value="${comInfo.com_name}" readonly oninput="validateName()"/>
                  <label for = "member_name" id = "name-warn"></label>
               </td>
            </tr>
            <tr>
               <th>휴대폰번호</th>
               <td>
                  <div class="d-flex g-3 align-middle text-center">
                     <div class="col">
                        <input type="text" name="member_ph1" value="${comInfo.com_tel1}" class="form-control" id="inputBirth" minlength="3" maxlength="3" required oninput="validatePh()">
                     </div><span>-</span>
                     <div class="col">
                        <input type="text" name="member_ph2" value="${comInfo.com_tel2}" class="form-control" id="inputBirth" minlength="4" maxlength="4" required oninput="validatePh()">
                     </div><span>-</span>
                     <div class="col">
                        <input type="text" name="member_ph3" value="${comInfo.com_tel3}" class="form-control" id="inputBirth" minlength="4" maxlength="4" required oninput="validatePh()">
                     </div>
                     <br><span id="ph-warn"></span>
                  </div>
               </td>
            </tr>
            <tr>
               <th class = "col-md-2">이메일(e-mail)</th>
               <td>
                  <input class = "form-control" type="text" name="com_email" id="com_email" value="${comInfo.com_email}" placeholder="xxx@xxx.xxx 형식"/>
                  <label for = "mail-warn">&nbsp;&nbsp;</label>
               </td>
            </tr>
            <tr>
               <th>주소</th>
               <td>
                  <div class="row g-3">
                     <div class="col-md">
                        <input type="text" id="com_zipcode" name="com_zipcode">
                        <a href="javascript:execDaumPostcode()">우편번호검색</a>
                     </div>
                     <div class="form-floating">
                        <input type="text" class="form-control" id="com_local_address" value="${comInfo.com_local_address}" name="com_local_address">
                        <label for="member_local_address">도로명주소</label>
                  </div>
                  <div class="form-floating">
                     <input type="text" class="form-control" id="com_road_address" value="${comInfo.com_road_address}" name="com_road_address">
                     <label for="member_road_address">지번주소</label>
                  </div>
                  <div class="form-floating">
                     <input type="text" class="form-control" id="com_rest_address" value="${comInfo.com_rest_address}" name="com_rest_address">
                        <label for="member_rest_address">나머지주소</label>
                     </div>
                  </div>
               </td>
            </tr>
         </table>
      <div class="col-md-10 justify-content-center">
         <input class = "btn btn-primary btn-md" type="submit"  value="회원정보수정">
         <!-- <input class = "btn btn-primary btn-md" type="submit"  value="회원정보수정" onclick="dm()"> -->
         <input class = "btn btn-primary btn-md" type="reset"  value="다시입력">
      </div>
      </form>
      </c:if>
   </div>
   <!-- JavaScript Bundle with Popper -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>