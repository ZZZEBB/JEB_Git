<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<c:if test='${not empty message }'>
<script>
window.onload=function()
{
  result();
}

function result(){
   alert("아이디나  비밀번호가 틀립니다. 다시 로그인해주세요");
}

</script>

</c:if>
<script src="http://code.jquery.com/jquery-latest.js"></script>

<style type="text/css">
@use postcss-preset-env;
@import url(https://meyerweb.com/eric/tools/css/reset/reset.css);

body {
   /* background: #f4f4f4; */
   color: #5a5656;
  display: grid;
  line-height: 1.5;
  margin: 0;
  min-height: 100vh;
  place-items: center;
}

a { text-decoration: none; }

h1 { font-size: 1em; }

h1, p {
   margin-bottom: 10px;
}

strong {
   font-weight: bold;
}

.uppercase { text-transform: uppercase; }

/* ---------- LOGIN ---------- */

#login {
   margin: 50px auto;
   width: 300px;
}

form fieldset input[type="text"],
input[type="password"] {
  appearance: none;
   background: #e5e5e5;
   border: none;
   border-radius: 3px;
   color: #5a5656;
   font-family: inherit;
   font-size: 14px;
   height: 50px;
   outline: none;
   padding: 0px 10px;
   width: 280px;
}

form fieldset input[type="submit"] {
  appearance: none;
   background-color: #008dde;
   border: none;
   border-radius: 3px;
   color: #f4f4f4;
   cursor: pointer;
   font-family: inherit;
   height: 50px;
   text-transform: uppercase;
   width: 280px;
}

form fieldset a {
   color: #5a5656;
   font-size: 10px;
}

form fieldset a:hover { text-decoration: underline; }

.btn-round {
   background: #5a5656;
   border-radius: 50%;
   color: #f4f4f4;
   display: block;
   font-size: 12px;
   height: 50px;
   line-height: 50px;
   margin: 30px 125px;
   text-align: center;
   text-transform: uppercase;
   width: 50px;
}

.facebook-before {
   background: #0064ab;
   border-radius: 3px 0px 0px 3px;
   color: #f4f4f4;
   display: block;
   float: left;
   height: 50px;
   line-height: 50px;
   text-align: center;
   width: 50px;
}

.facebook {
   background: #0079ce;
   border: none;
   border-radius: 0px 3px 3px 0px;
   color: #f4f4f4;
   cursor: pointer;
   height: 50px;
   text-transform: uppercase;
   width: 230px;
}

.twitter-before {
   background: #189bcb;
   border-radius: 3px 0px 0px 3px;
   color: #f4f4f4;
   display: block;
   float: left;
   height: 50px;
   line-height: 50px;
   text-align: center;
   width: 50px;
}


.twitter {
   background: #1bb2e9;
   border: none;
   border-radius: 0px 3px 3px 0px;
   color: #f4f4f4;
   cursor: pointer;
   height: 50px;
   text-transform: uppercase;
   width: 230px;
}
</style>

</head>
<body>
   <div id="login">

  <h1><strong>사업체 로그인</strong></h1>


  <form action="${contextPath}/joinAndLogin/loginCom.do" method="post" >
	
    <fieldset>

      <p><input type="text" placeholder="아이디" name="com_id" required></p>

      <p><input type="password" placeholder="비밀번호" name="com_pw" required></p>
      
      <p><a href="${contextPath}/joinAndLogin/searchIdCom.do">아이디 찾기</a> | <a href="${contextPath}/joinAndLogin/searchPwCom.do">비밀번호 찾기</a> | <a href="${contextPath}/member/memberForm.do">회원가입</a></p>
      <p><input type="submit" value="로그인"></p>

    </fieldset>

  </form>
  
   


  <p><span class="btn-round">or</span></p>

 

</div>
</body>
</html>