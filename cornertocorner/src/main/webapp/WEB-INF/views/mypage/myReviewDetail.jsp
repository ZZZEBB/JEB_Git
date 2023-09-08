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
   <title>여행후기 상세페이지</title>
      <style>
     #tr_file_upload{
       display:none;
     }
     #tr_btn_modify{
       display:none;
     }
   
   </style>
   <!-- CSS only -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
   <script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
      <script type="text/javascript" >
     function backToList(obj){
       obj.action="${contextPath}/mypage/myReviewDetail.do";
       obj.submit();
     }
     
     function backToListed(obj){
        obj.action="${contextPath}/mypage/myReview.do";
        obj.submit();
      }
 
    function fn_enable(obj){
       document.getElementById("i_title").disabled=false;
       document.getElementById("i_content").disabled=false;
       document.getElementById("i_imageFileName").disabled=false;
       document.getElementById("tr_btn_modify").style.display="block";
       document.getElementById("tr_file_upload").style.display="block";
       document.getElementById("tr_btn").style.display="none";
    }
    
    function fn_modify_review(obj){
       obj.action="${contextPath}/mypage/modReview.do";
       obj.submit();
    }
    
    function fn_remove_review(url,review_num){
       var form = document.createElement("form");
       form.setAttribute("method", "post");
       form.setAttribute("action", url);
        var review_numInput = document.createElement("input");
        review_numInput.setAttribute("type","hidden");
        review_numInput.setAttribute("name","review_num");
        review_numInput.setAttribute("value", review_num);
       
        form.appendChild(review_numInput);
        document.body.appendChild(form);
        form.submit();
    
    }
    
    function fn_reply_form(url, parent_num){
       var form = document.createElement("form");
       form.setAttribute("method", "post");
       form.setAttribute("action", url);
        var parent_numInput = document.createElement("input");
        parent_numInput.setAttribute("type","hidden");
        parent_numInput.setAttribute("name","parentNO");
        parent_numInput.setAttribute("value", parent_num);
       
        form.appendChild(parent_numInput);
        document.body.appendChild(form);
       form.submit();
    }
    
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#preview').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }  
 </script>
</head>
<body>
	<div class = "container">
	<!-- 상단 간략화 메뉴 -->
	<nav class="text-end" style="margin-top:0.5%; text-align:center;" aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="${contextPath}/mypage/myReview.do" style="text-decoration:none; color:black;">나의 여행후기</a></li>
			<li class="breadcrumb-item active" aria-current="page">나의 여행후기</li>
		</ol>
	</nav>
  <form name="frmReview" method="post"  action="${contextPath}"  enctype="multipart/form-data">
  <table  border=0  align="center">
  <tr>
   <td width=150 align="center" bgcolor=#FF9933>
      글번호
   </td>
   <td >
    <input type="text"  value="${reviewMap.review_num}"  disabled />
    <input type="hidden" name="review_num" value="${reviewMap.review_num}"  />
   </td>
  </tr>
  <tr>
    <td width="150" align="center" bgcolor="#FF9933">
      작성자 아이디
   </td>
   <td >
    <input type=text value="${reviewMap.member_id }" name="writer"  disabled />
   </td>
  </tr>
  <tr>
    <td width="150" align="center" bgcolor="#FF9933">
      제목 
   </td>
   <td>
    <input type=text value="${reviewMap.review_title }"  name="title"  id="i_title" disabled />
   </td>   
  </tr>
  <tr>
    <td width="150" align="center" bgcolor="#FF9933">
      내용
   </td>
   <td>
    <textarea rows="20" cols="60"  name="content"  id="i_content"  disabled />${reviewMap.review_content }</textarea>
   </td>  
  </tr>
  
     
  <c:choose> 
     <c:when test="${not empty reviewMap.imageFileName && reviewMap.imageFileName!='null' }">
         <tr>
          <td width="150" align="center" bgcolor="#FF9933"  rowspan="2">
            이미지
         </td>
         <td>
           <input  type= "hidden"   name="originalFileName" value="${reviewMap.imageFileName }" />
          <img src="${contextPath}/mypage/download.do?review_num=${reviewMap.review_num}&imageFileName=${reviewMap.imageFileName}" id="preview"  /><br>
         </td>   
        </tr>  
        <tr>
          <td ></td>
          <td>
             <input  type="file"  name="imageFileName " id="i_imageFileName"   disabled   onchange="readURL(this);"   />
          </td>
        </tr> 
       </c:when>
       <c:otherwise>
          <tr  id="tr_file_upload" >
                <td width="150" align="center" bgcolor="#FF9933"  rowspan="2">
                  이미지
                </td>
                <td>
                  <input  type= "hidden"   name="originalFileName" value="${reviewMap.imageFileName }" />
                </td>
             </tr>
             <tr>
                <td ></td>
                <td>
                   <img id="preview"  /><br>
                   <input  type="file"  name="imageFileName " id="i_imageFileName"   disabled   onchange="readURL(this);"   />
                </td>
           </tr>
       </c:otherwise>
    </c:choose>
  <tr>
      <td width="150" align="center" bgcolor="#FF9933">
         등록일자
      </td>
      <td>
       <input type=text value="<fmt:formatDate value="${reviewMap.review_write_date}" />" disabled />
      </td>   
  </tr>
  <tr   id="tr_btn_modify"  align="center"  >
      <td colspan="2"   >
          <input type=button value="수정반영하기"   onClick="fn_modify_review(frmReview)"  >
           <input type=button value="취소"  onClick="backToList(frmReview)">
      </td>   
  </tr>
    
  <tr  id="tr_btn"    >
   <td colspan="2" align="center">
       <c:if test="${memberInfo.member_id == reviewMap.member_id }">
         <input type=button value="수정하기" onClick="fn_enable(this.form)">
         <input type=button value="삭제하기" onClick="fn_remove_article('${contextPath}/mypage/removeReview.do', ${reviewMap.review_num})">
       </c:if>
       <input type=button value="리스트로 돌아가기"  onClick="backToListed(frmReview)">
        <%-- <input type=button value="답글쓰기"  onClick="fn_reply_form('${contextPath}/mypage/replyForm.do', ${reviewMap.review_num})"> --%>
   </td>
  </tr>
 </table>
 </form>
 </div>
</html>
