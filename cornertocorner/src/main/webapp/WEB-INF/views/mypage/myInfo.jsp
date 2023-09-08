<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>마이페이지 메인(나의 정보)</title>
   <!-- CSS only -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
   
   <style>
   
   </style>
</head>
<body>
<div class="container mt-1">
   <!-- 상단 간략화 메뉴 -->
	<nav class="text-end" style="margin-top:0.5%; text-align:center;" aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="${contextPath}/mypage/myInfo.do" style="text-decoration:none; color:black;">마이페이지</a></li>
			<li class="breadcrumb-item active" aria-current="page">나의 정보</li>
		</ol>
	</nav>
   <!-- 개인이미지 칸-->
   <div class = "mt-3">
      <div style="float:left;margin-left:50px;background-color:#D1D1D1;width:100px;height:100px;border-radius:50px;text-align:center;padding-top:35px;">
			<c:choose>
				<c:when test="${not empty member.member_name}">${member.member_name}</c:when>
				<c:when test="${not empty com.com_name}">${com.com_name}</c:when>
			</c:choose>
      </div>
      <div style="float:right; margin-right:20%;">
         <table>
            <tr>
               <td style="padding-top:30px;width:500px;">
               <a style="font-size:24px;text-decoration:none;color:black;" href="${contextPath}/mypage/myDetailInfo.do">
               <img alt="사람아이콘"src="${contextPath}/resources/image/mypage/user.png" width="25px" height="25px"> 회원정보 수정</a>
               <a style="font-size:24px;text-decoration:none;margin-left:100px;color:black;" href="${contextPath}/mypage/mypageDelete.do">
               <img alt="사람아이콘"src="${contextPath}/resources/image/mypage/user.png" width="25px" height="25px"> 회원정보 탈퇴</a></td>
            </tr>
         </table>
      </div>
   </div>
</div>

<!-- JavaScript Bundle with Popper -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>