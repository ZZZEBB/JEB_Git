<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>사업체 아이디 찾기</title>
<script>
window.onload = function() {
      document.getElementById('submit').onclick = function() {
         
         if ( document.pfrm.com_name.value.trim() == '' ) {
            alert( '상호명을 입력해주세요' );
            return false;
         }
         if ( document.pfrm.com_email.value.trim() == '' ) {
            alert( '메일을 입력해주세요' );
            return false; //return false로 아무 값도 제출하지 않는다.
         }
         document.pfrm.submit();
      }
   }
</script>
<style>
</style>
<!-- css 스타일시트 추가 -->
<link href="${contextPath}/resources/css/joinForm.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
</head>
<body>
	<h3 id="join_member">사업체 아이디 찾기</h3>
	<form action="${contextPath}/joinAndLogin/findIdCom.do" method="get" name="pfrm">	
	<div id="detail_table">
		<table>
			<tbody>
				<tr class="dot_line">
					<td class="fixed_join">상호명</td>
					<td>
					  <input type="text" name="com_name"  id="com_name"  size="20" placeholder="상호명을 입력하세요"/>
					</td>
				</tr>
			
				<tr class="dot_line">
					<td class="fixed_join">이메일</td>
					<td> 
						<input size="30"  type="text" name="com_email" id="com_email" placeholder="이메일을 입력하세요" />
					</td>				
				</tr>
			
			</tbody>
			
		</table>
		</div>
		
		<div class="clear">
		<br><br>
		<table align=center>
		<tr >
			<td >
				<input type="submit" id="submit"  value="아이디 찾기" width="100px" height="100px">
				<input type="button" id="submit" onclick="history.go(-1)"  value="취소" width="100px" height="100px">
			</td>
		</tr>
	</table>
	</div>
</form>	

</body>
</html>