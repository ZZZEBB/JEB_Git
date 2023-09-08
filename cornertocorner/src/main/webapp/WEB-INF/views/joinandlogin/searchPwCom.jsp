<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>사업체 비밀번호 찾기</title>
<script>
window.onload = function() {
      document.getElementById('submit').onclick = function() {
         
         if ( document.pfrm.com_id.value.trim() == '' ) {
            alert( '아이디를 입력해주세요' );
            return false;
         }
         if ( document.pfrm.com_ceo.value.trim() == '' ) {
            alert( '사업자 대표명을 입력해주세요' );
            return false; //return false로 아무 값도 제출하지 않는다.
         }
         if ( document.pfrm.com_crn1.value.trim() == '' ) {
             alert( '사업자등록번호를 입력해주세요' );
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
	<h3 id="join_member">사업체 비밀번호 찾기</h3>
	<form action="${contextPath}/joinAndLogin/findPwCom.do" method="post" name="pfrm">	
	<div id="detail_table">
		<table>
			<tbody>
				<tr class="dot_line">
					<td class="fixed_join">사업체 아이디</td>
					<td>
					  <input type="text" name="com_id"  id="com_id"  size="20" placeholder="아이디를 입력하세요" />
					</td>
				</tr>
				
					<tr class="dot_line">
					<td class="fixed_join">대표자명</td>
					<td>
						<input type="text" name="com_ceo" id="com_ceo" size="20" placeholder="대표자명을 입력해주세요.">
					</td>
				</tr>
		
				<tr class="dot_line">
					<td class="fixed_join">사업자등록번호</td>
					<td> 
						<input size="10px"  type="text" name="com_crn1" id="com_crn1"> - <input size="10px"  type="text" name="com_crn2" id="com_crn2"> - <input size="10px"  type="text" name="com_crn3" id="com_crn3">
						
						
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
				<input type="submit" id="submit" value="비밀번호 찾기">
			</td>
		</tr>
	</table>
	</div>
</form>	

</body>
</html>