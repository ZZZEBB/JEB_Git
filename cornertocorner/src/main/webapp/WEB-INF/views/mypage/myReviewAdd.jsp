<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
  request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>여행후기 등록 페이지</title>
   <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
   function readURL(input) {
      if (input.files && input.files[0]) {
         var reader = new FileReader();
         reader.onload = function (e) {
           $('#preview').attr('src', e.target.result);
          }
         reader.readAsDataURL(input.files[0]);
      }
  }  
  function backToList(obj){
    obj.action="${contextPath}/mypage/myReview.do";
    obj.submit();
  }
  
  var cnt=1;
  function fn_addFile(){
     $("#d_file").append("<br>"+"<input type='file' name='file"+cnt+"' />");
     cnt++;
  }  

</script>
</head>
<body>
	<div class = "container">
		<!-- 상단 간략화 메뉴 -->
		<nav class="text-end" style="margin-top:0.5%; text-align:center;" aria-label="breadcrumb">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="${contextPath}/mypage/myReview.do" style="text-decoration:none; color:black;">나의 여행후기</a></li>
				<li class="breadcrumb-item active" aria-current="page">나의 여행후기 등록하기</li>
			</ol>
		</nav>
  <form name="articleForm" method="post"   action="${contextPath}/mypage/addNewReview.do"   enctype="multipart/form-data">
    <table border="0" align="center">
      <tr>
               <td align="right"> 작성자</td>
               <td colspan=2  align="left"><input type="text" size="20" maxlength="100"  name="member_id" value="${memberInfo.member_id }" readonly/> </td>
         </tr>
        <tr>
            <td align="right">글제목: </td>
            <td colspan="2"><input type="text" size="67"  maxlength="500" name="review_title" /></td>
       </tr>
          <tr>
            <td align="right" valign="top"><br>글내용: </td>
            <td colspan=2><textarea name="review_content" rows="10" cols="65" maxlength="4000"></textarea> </td>
     </tr>
     <tr>
           <td align="right">이미지파일 첨부:  </td>
           <td> <input type="file" name="imageFileName"  onchange="readURL(this);" /></td>
           <td><img  id="preview" src="#"   width=200 height=200/></td>
           
           
           <td align="right">이미지파일 첨부</td>
            <td align="left"> <input type="button" value="파일 추가" onClick="fn_addFile()"/></td>
            
            
      </tr>
      <tr>
         <td colspan="4"><div id="d_file"></div></td>
      </tr>
       <tr>
         <td align="right"> </td>
         <td colspan="2">
          <input type="submit" value="글쓰기" />
          <input type=button value="목록보기"onClick="backToList(this.form)" />
         </td>
     </tr>
    </table>
  </form>
  </div>
</body>
</html>