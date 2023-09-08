<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"
   isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 창</title>
<link href="${contextPath}/resources/css/main.css" rel="stylesheet" type="text/css" media="screen">
</head>
<body>
 <h3>회원탈퇴</h3>
<form action ="${contextPath}/member/deleteMember.do" method="post">
   <div id="detail_table">
      <table>
         <tbody>
            <tr class="dot_line">
               <td class="fixed_join">아이디</td>
               <td>
          		   <input type="text" name="id" size="20">
               </td>
            </tr>
            <tr class="dot_line">
               <td class="fixed_join">비밀번호</td>
               <td><input type="password" name="pwd" size="20"></td>
            </tr>
  	 </tbody>
  	 </table>
      <table align=center>
      <tr >
         <td >
            <input type="submit"  value="회원 탈퇴">
            <input  type="reset"  value="다시입력">
         </td>
      </tr>
   </table>
  	 </div>
  	 </form>
</body>
</html>