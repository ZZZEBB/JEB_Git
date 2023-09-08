<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>사업체 회원가입</title>
<style>
input[type=reset] {
   border: 1px solid #00aff0;
   background-color: #00aff0;
   color: #ffffff;
   padding: 1em 3em 1em 3em;
}
</style>
<!-- css 스타일시트 추가 -->
<link href="${contextPath}/resources/css/joinForm.css" rel="stylesheet" type="text/css">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script>
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
         document.getElementById('com_zipcode').value = data.zonecode; //5자리 새우편번호 사용
         document.getElementById('com_road_address').value = fullRoadAddr;
         document.getElementById('com_local_address').value = data.jibunAddress;

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
              $('#com_id').val(_id);
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
   var password = $("#com_pw").val();
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
   var password = $("#com_pw").val();
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
      $("#com_pw").on("blur", function() {
        validatePassword();
      });
      
      $("#password-confirm").on("blur", function() {
        validatePasswordConfirm();
      });
    }); //(pwd, 비밀번호) 비밀번호일치확인end
 
    
    //(com_ceo,대표자명) 유효성검사
     function validateCEO() {
      var ceoRegExp = /^[a-zA-Z가-힣]{2,5}$/;
      var ceo = $("#com_ceo").val();
      var $ceoWarn = $("#ceo-warn");

      if (!ceo) {
        $ceoWarn.html('이름을 입력해주세요.');
        $ceoWarn.css('color', 'red');
        return false;
      } else if (!ceoRegExp.test(ceo)) {
        $ceoWarn.html('이름은 2~5자리의 한글, 영문으로 구성되어야 합니다.');
        $ceoWarn.css('color', 'red');
        return false;
      } else {
        $ceoWarn.html('');
        return true;
      }
    } //(com_ceo,대표자명) 유효성검사 end   
    
    
    
    //(ph,tel,전화번호,휴대폰번호)유효성검사
   function validateTel() {
       var tel1 = document.getElementsByName("com_tel1")[0].value;
       var tel2 = document.getElementsByName("com_tel2")[0].value;
       var tel3 = document.getElementsByName("com_tel3")[0].value;

       // ph1 검증
       if (!/^\d{3,4}$/.test(tel1)) {
           document.getElementById("tel-warn").innerHTML = "앞자리는 숫자로 구성되어야 합니다.";
           return false;
       }

       // ph2 검증
       if (!/^\d{4}$/.test(tel2)) {
           document.getElementById("tel-warn").innerHTML = "중간자리는 숫자로 구성되어야 합니다.";
           return false;
       }

       // ph3 검증
       if (!/^\d{4}$/.test(tel3)) {
           document.getElementById("tel-warn").innerHTML = "마지막자리 숫자로 구성되어야 합니다.";
           return false;
       }

       // 모두 통과하면 경고 메시지 제거
       document.getElementById("tel-warn").innerHTML = "";
       // true 반환
       return true;
   }//(ph,phn,전화번호,휴대폰번호)유효성검사end
   
    
    
 
 
//(이메일 e-mail) 유효성검사, 메일전송, 인증확인
  function fn_sendauthmail() {
     const email = $('#com_email').val(); // 이메일 주소값 얻어오기!
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
   const $resultMsg = $('#mail-check-warn');
   
   if(inputCode === code){
      $resultMsg.html('인증번호가 일치합니다.');
      $resultMsg.css('color','green');
      $('#mail_sendauthmail').attr('disabled',true);
      $('#com_email').attr('readonly',true);
      $('#com_email').attr('onFocus', 'this.initialSelect = this.selectedIndex');
         $('#com_email').attr('onChange', 'this.selectedIndex = this.initialSelect');
         $('#com_email_yn').val('y');
   }else{
      $resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
      $resultMsg.css('color','red');
   }
};

</script>
</head>
<body>
   <h3 id="join_member">사업체 회원 가입</h3>
   <form action="${contextPath}/joinAndLogin/addCom.do" method="post">   
   <div id="detail_table">
      <table>
         <tbody>
            <tr class="dot_line">
               <td class="fixed_join">아이디</td>
               <td>
                 <input type="text" name="id"  id="id"  size="20" required minlength="4" maxlength="16" pattern="[a-z0-9]+"/>
                 <input type="hidden" name="com_id"  id="com_id" />
                 
                 <input type="button"  id="btnOverlapped" value="중복 확인" onClick="fn_overlapped()" />
               <br>
               <span id="id-check-warn"></span>
               </td>
            </tr>
           </tr>
             <tr class="dot_line">
               <td class="fixed_join">비밀번호</td>
               <td>
                 <input type="password" id="com_pw" name="com_pw" required minlength="8" maxlength="16" oninput="validatePassword()">
                 <br>
                 <span id="password-warn"></span>
                 <br>
                 <input type="password" id="password-confirm" name="password-confirm" placeholder="비밀번호 재입력" required disabled minlength="8" maxlength="16" oninput="validatePasswordConfirm()">
                 <br>
                 <span id="password-confirm-warn"></span>
               </td>
             </tr>
            <tr class="dot_line">
               <td class="fixed_join">사업자등록번호</td>
               <td> 
                  <input size="10px"  type="text" name="com_crn1" required/> - 
                  <input size="10px"  type="text" name="com_crn2"required/> - 
                  <input size="10px"  type="text"name="com_crn3"required/>
                  
               </td>            
            </tr>
            <tr class="dot_line">
               <td class="fixed_join">상호명</td>
               <td><input name="com_name" type="text" size="20" required/></td>
            </tr>
            
            <tr class="dot_line">
              <td class="fixed_join">대표자명</td>
              <td>
                <input name="com_ceo" id="com_ceo" type="text" size="20" required  oninput="validateCEO()">
                <br>
                <span id="ceo-warn"></span>
              </td>
            </tr>

            <tr class="dot_line">
               <td class="fixed_join">사업체전화번호</td>
               <td> 
                  <input size="10px"  type="text" name="com_tel1" required minlength="3" maxlength="4" oninput=validateTel()> - 
                  <input size="10px"  type="text" name="com_tel2"required minlength="4" maxlength="4" oninput=validateTel()> - 
                  <input size="10px"  type="text"name="com_tel3" required minlength="4" maxlength="4" oninput=validateTel()>
                    <br>
                    <span id="tel-warn" style="color:red;"></span>
               </td>            
            </tr>
           <tr class="dot_line">
             <td class="fixed_join">이메일<br>(e-mail)</td>
             <td>
                 <input type="text" size="20px" name="com_email" id="com_email" placeholder="xxx@xxx.xxx 형식">
                 <input type="button" class="btn-primary" id="mail_sendauthmail" value="이메일인증" onClick="fn_sendauthmail()"/>
                 <br>
                 <span id="mail-warn"></span>
                 <br>
                 <div class="mail-check-box">
                     <input class="mail-check-input" size="20px" placeholder="인증번호 6자리 입력" disabled maxlength="6" />
                     <input type="hidden" id="com_email_yn" name="com_email_yn" value="n" />
                     <input type="button" class="btn-primary" id="mail_check_btn" value="인증 번호 확인" onClick="fn_checkmail()"/>
                 </div>
                 <span id="mail-check-warn"></span>
             </td>    
         </tr>
            <tr class="dot_line">
               <td class="fixed_join">주소</td>
               <td>
                  <input type="text" id="com_zipcode" name="com_zipcode" size="10" > <a href="javascript:execDaumPostcode()">우편번호검색</a>
                 <br>
                 <p> 
                  지번 주소:<br><input type="text" id="com_road_address"  name="com_road_address" size="50"><br><br>
                 도로명 주소: <input type="text" id="com_local_address" name="com_local_address" size="50"><br><br>
                 나머지 주소: <input type="text"  name="com_rest_address" size="50" />
                <!--   <span id="guide" style="color:#999"></span> -->
                  </p>
               </td>
            </tr>
         </tbody>
         <tfoot>
            <tr class="dot_line">
               <td colspan='2'>
               <input type="checkbox" name="" value="" />&nbsp;이용약관동의(필수)<br>
               <input type="checkbox" name="" value="" />&nbsp;개인정보수집 및 이용동의(필수)
               </td>
         </tr>
         </tfoot>
      </table>
      </div>
      
      <div class="clear">
      <br><br>
      <table align=center>
      <tr >
         <td >
            <input type="submit"  value="회원 가입">
            <input type="reset"  value="다시입력">
         </td>
      </tr>
   </table>
   </div>
</form>   

</body>
</html>