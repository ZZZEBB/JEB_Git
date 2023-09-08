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
   <title>나의 문의내역</title>
   <!-- CSS only -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style>
.tbl table{
      width: 100%; 
      border-top-color:#bed0d9; 
      border-bottom-color:#bed0d9; 
      border-top-width: 2px; 
      border-bottom-width: 2px; 
      border-top-style: solid; 
      border-bottom-style: solid; 
      border-collapse: collapse;
      margin-top:1%;
      /* margin-left: 10%; */
      text-align: center;
}
   
.tbl tr{
      border-bottom-color: #bed0d9;
      border-bottom-width: 1px;
      border-bottom-style: solid;
}
.paginate{
      text-align: center;
}
.right_cont{
      text-align: right;
      
}
.title{
       background-color: #eceff2;
}
</style>  
<script>
  $(document).ready(function() {
    // 각 행을 클릭했을 때 모달 열기
    $('.qna-row').on('click', function() {
      // 해당 행의 데이터 읽기
      var qnaNum = $(this).data('qna-num');
      var qnaType = $(this).find('td:eq(0)').text();
      var qnaTitle = $(this).find('td:eq(1)').text();
      var qnaContent = $(this).find('td:eq(2)').text();
      var boardFileName = $(this).find('td:eq(3)').text();
      var qnaWriteDate = $(this).find('td:eq(4)').text();
      var qnaStatus = $(this).find('td:eq(5)').text();
      
      // 모달 열기
      $('#myQnaModal .modal-title').text(qnaTitle);
      $('#myQnaModal #qnaType').text(qnaType);
      $('#myQnaModal #qnaTitle').text(qnaTitle);
      $('#myQnaModal #qnaContent').text(qnaContent);
      $('#myQnaModal #boardFileName').text(boardFileName);
      $('#myQnaModal #qnaWriteDate').text(qnaWriteDate);
      $('#myQnaModal #qnaStatus').text(qnaStatus);
      $('#myQnaModal').modal('show');
    });
  });
</script>
</head>
<body>

<!-- 모달 코드 -->
<div class="modal fade" id="myQnaModal" tabindex="-1" role="dialog" aria-labelledby="myQnaModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title " id="myQnaModalLabel">문의 상세보기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      <table class="table table-bordered border-secondary border-opacity-50">
      <tr>
      <td class = "col-md-2 table-secondary border-secondary border-opacity-50">문의 유형</td>
      <td class="border-secondary border-opacity-50" id="qnaType"></td>
      </tr>
      <tr>
      <td class = "col-md-2 table-secondary border-secondary border-opacity-50">문의 제목</td>
      <td class="border-secondary border-opacity-50" id="qnaTitle"></td>
      </tr>
      <tr>
      <td class = "col-md-2 table-secondary border-secondary border-opacity-50">문의 내용</td>
      <td class="border-secondary border-opacity-50" id="qnaContent"></td>
      </tr>
      </table>
      
      <table class="table table-bordered mt-3 border-secondary border-opacity-50">
      <tr>
      <td class = "col-md-2 table-secondary border-secondary border-opacity-50">파일 첨부</td>
      <td class="border-secondary border-opacity-50" id="boardFileName"></td>
      </tr>
       </table>
       
      <table class="table table-bordered float-left col-md-7 border-secondary border-opacity-50" >
      <tr>
      <td class = "col-md-2 table-secondary border-secondary border-opacity-50">작성일</td>
      <td class = "col-md-2 border-secondary border-opacity-50" id="qnaWriteDate"></td>
      </tr>
      </table>
      <table class="table table-bordered float-right col-md-4 border-secondary border-opacity-50">
      <tr>
      <td class = "col-md-2 table-secondary border-secondary border-opacity-50">답변 상태</td>
      <td class = "col-md-2 border-secondary border-opacity-50" id="qnaStatus"></td>
      </tr>
     </table>
       <!--  <div id="myQnaModalBody"></div> -->
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>




<div class= "col-md-10">
   <div id="contents" class="contents">
     <!-- 상단 간략화 메뉴 -->
	<nav class="text-end" style="margin-top:0.5%; text-align:center;" aria-label="breadcrumb">
		<ol class="breadcrumb">
			<li class="breadcrumb-item"><a href="${contextPath}/mypage/myInfo.do" style="text-decoration:none; color:black;">마이페이지</a></li>
			<li class="breadcrumb-item active" aria-current="page">나의 문의내역 조회</li>
		</ol>
	</nav>
     <div class="tbl mt-3">
       <table class="board_type">
         <colgroup>
           <col style="width: 20%;">
           <col>
           <col style="width: 15%;">
           <col style="width: 15%;">
         </colgroup>
         <thead>
           <tr class = "title">
             <th>유형</th>
             <th>제목</th>
             <th>작성일</th>
             <th>답변상태</th>
           </tr>
         </thead>
         <c:choose>
        <c:when test="${empty myQnaList}">
          <tr>
            <td colspan="4">
              <strong>상담 문의내역이 없습니다.</strong>
            </td>
          </tr>
        </c:when>
        <c:otherwise>
        <c:forEach var="myqna" items="${myQnaList}" varStatus="cnt">
  <tbody>
    <tr class="qna-row" data-qna-num="${myqna.qna_num}">
      <td>${myqna.qna_type}</td>
      <td>${myqna.qna_title}</td>
      <td hidden>${myqna.qna_content}</td>
      <td hidden>${myqna.board_fileName }</td>
      <td>${myqna.qna_write_date}</td>
      <td>${myqna.qna_status}</td>
    </tr>         
  </tbody>
</c:forEach>

        </c:otherwise>
      </c:choose>
       </table>
     </div>
     <div class="paginate_wrap">
       <div class="paginate">
         <div>
           <a href="#none" class="direction prevend" style="display: none;">처음</a>
           <a href="#none" class="direction prev" style="display: none;">이전</a>
           <span>
             <a>1</a>
           </span>
           <a href="#none" class="direction next" style="display: none;">다음</a>
           <a href="#none" class="direction nextend" style="display: none;">끝</a>
         </div>
       </div>
       <span class="float-right">
         <a href="${contextPath}/board/oneQnaForm.do" class="btn btn-outline-secondary">1:1 문의</a> <!-- 고객센터의문의페이지로이동 -->
       </span>
     </div>
   </div>
</div>
   <!-- JavaScript Bundle with Popper -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>