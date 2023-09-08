<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>회원 아이디 찾기</title>
<script>
window.onload = function() {
      document.getElementById('submit').onclick = function() {
         
         if ( document.pfrm.member_name.value.trim() == '' ) {
            alert( '이름을 입력해주세요' );
            return false;
         }
         if ( document.pfrm.member_email.value.trim() == '' ) {
            alert( '메일을 입력해주세요' );
            return false; //return false로 아무 값도 제출하지 않는다.
         }
         document.pfrm.submit();
      }
   }
</script>
<style>
</style>
</head>
<body>
<div class="w3-content w3-container w3-margin-top">
      <div class="w3-container w3-card-4">
         <form action="${contextPath}/joinAndLogin/findId.do" method="get" name="pfrm">
            <div class="w3-center w3-large w3-margin-top">
               <h3>개인 아이디 찾기</h3>
            </div>
            <div>
               <p>
                  <label>이름</label>
                  <input class="w3-input" type="text" id="member_name" name="member_name" placeholder="이름을 입력하세요" required>
                  <label>이메일</label>
                  <input class="w3-input" type="text" id="member_email" name="member_email" placeholder="이메일을 입력하세요" required>
               </p>
               <p class="w3-center">
                  <button type="submit" id="submit" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">확인</button>
                  <button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">취소</button>
               </p>
            </div>
         </form>
      </div>
   </div>
</body>
</html>