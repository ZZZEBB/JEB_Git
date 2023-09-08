<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
   <script>
      function frm_btn(obj){
         obj.method = "post";
         obj.submit();
      }
   </script>
   <meta charset="UTF-8">
   <title>회원 정보</title>
</head>
<body>
   <form method = "post" action = "${contextPath}/test9.do">
      <input type = "button" value = "회원 정보 조회" onClick="frm_btn(this.form);" />
   </form>
</body>
</html>