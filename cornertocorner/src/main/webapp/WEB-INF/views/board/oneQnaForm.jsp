<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
  request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>1:1문의 등록 페이지</title>
   <!-- CSS only -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
   <script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<style>

</style>

 <script>
 window.addEventListener('DOMContentLoaded', () => {
     const textArea = document.querySelector('textarea');
     const charCount = document.querySelector('.char_count');
     textArea.addEventListener('input', function () {
       const currentLength = textArea.value.length;
       charCount.textContent = currentLength;
       if (currentLength > 2500) {
         textArea.value = textArea.value.substring(0, 2500);
         alert("2500자 이내로 작성해주세요!");
       }
     });
   });

  </script>

</head>
<body>
   
   <nav class="text-end" style="margin-top:0.5%; text-align:center;" aria-label="breadcrumb">
      <ol class="breadcrumb">
         <li class="breadcrumb-item"><a href="#" style="text-decoration:none; color:black;">고객센터</a></li>
         <li class="breadcrumb-item active" aria-current="page">1:1 문의하기</li>
      </ol>
   </nav>
   <br><br>
   <form method="post" action="${contextPath}/board/addNewQna.do" enctype="multipart/form-data"> <!-- 파일 업로드를 위한 enctype 추가 -->
    <div class="container">
    <div class="notice_wrap mt0">
        <strong class="tit">문의하시기 전 확인해 주세요.</strong>
        <div class="clearfix">
          <ul class="list_bul disc">
            <li>고객님의 소중한 의견을 빠르고 정확하게 해결하기 위해 최선을 다하겠습니다.</li>
            <li>상품에 대한 문의는 상품상세페이지를 통해 문의해 주세요.</li>
            <li>예약한 상품에 대한 문의는 예약 대리점을 통해 문의해 주세요.</li>
            <li>예약한 상품의 취소는 예약 대리점을 통해 문의해 주세요. (취소 시 위약금 발생)</li>
            <li>문의에 대한 답변은 <a href="${contextPath}/mypage/myQna.do">
                <em>[마이페이지&gt;1:1 문의내역]</em>
              </a> 에서 확인할 수 있습니다. </li>
          </ul>
        </div>
      </div>
    </div>
    <br>
    <label for="writer" class="pb-2 mb-2 border-bottom"><b>작성자 아이디</b></label>
       <input class="form-control mt-2 mb-2" style="width:35%" type="text" id="writer" name="member_id" value="${sessionScope.memberInfo.member_id}" readonly disabled>
         <br>
    <label for="contact" class="pb-2 mb-2 border-bottom"><b>연락처 이메일</b></label>
         <input class="form-control mt-2 mb-2" style="width:35%" type="email" id="contact" name="qna_contact" value="${sessionScope.memberInfo.member_email}" readonly disabled>
       <br>
    <label for="qna_type" class="pb-2 mb-2 border-bottom"><b>문의 유형</b></label>
      <select id="qna_type" name="qna_type" class="form-select" style="width:150px" >
           <option value="국내여행">국내여행</option>
           <option value="기타여행">기타여행</option>
           <option value="법인여행">법인여행</option>
           <option value="상품문의">상품문의</option>
      </select>
       <br>
    <label for="qna_title" class="pb-2 mb-2 border-bottom"><b>문의 제목</b></label>
       <input type="text" id="qna_title" name="qna_title" class="form-control mt-2 mb-2" placeholder="제목을 입력해주세요." required>
       <br>
   
    <label for="qna_content" class="pb-2 mb-2 border-bottom"><b>문의 내용</b></label>
       <textarea class="form-control mt-2 mb-2" rows="10" id="content" name="qna_content" placeholder="최대 2500자까지 입력 가능합니다. 문의할 내용을 입력해 주세요." required></textarea>
       <br>
       <div class="char_count_group">
         <span class="char_count">0</span> / 2500
      </div>
      <br>
    <label for="image" class="pb-2 mb-2 border-bottom"><b>이미지 첨부</b></label>
       <br>
       <input type="file" class="btn btn-outline-secondary col-8 mt-2 mb-2" id="board_fileName" name="board_fileName" multiple="multiple">
       <!-- <input type="file" class="btn btn-outline-secondary col-8 mt-2 mb-2" id="board_fileName" name="board_fileName" multiple="multiple">
       <input type="file" class="btn btn-outline-secondary col-8 mt-2 mb-2" id="board_fileName" name="board_fileName" multiple="multiple"> -->
       <br>
    <div class="mt-3 mb-3"align="center">
    <input type="reset" class="btn btn-outline-danger mb-3" value="다시입력">
    <input type="submit" class="btn btn-outline-primary mb-3" value="문의등록">
    </div>
   </form>
   
</body>
</html>