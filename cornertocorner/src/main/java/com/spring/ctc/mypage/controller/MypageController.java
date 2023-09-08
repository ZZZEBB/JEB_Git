package com.spring.ctc.mypage.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ctc.board.vo.QnaVO;
import com.spring.ctc.joinandlogin.vo.CompanyVO;
import com.spring.ctc.joinandlogin.vo.MemberVO;
import com.spring.ctc.mypage.service.MypageService;
import com.spring.ctc.mypage.vo.ReviewVO;
import com.spring.ctc.order.vo.OrderVO;

@Controller
@RequestMapping(value="/mypage")
public class MypageController {
	private static final String REVIEW_IMAGE_REPO = "C:\\board\\article_image";
		@Autowired
		MypageService mypageService;
		@Autowired
		MemberVO memberVO;
		CompanyVO comVO;
		
	      //마이페이지 클릭시(/myInfo.do)
	      //나의 회원정보 페이지가 출력됨
	      @RequestMapping(value= "/myInfo.do" ,method={RequestMethod.POST,RequestMethod.GET})
	      public ModelAndView myInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
	         String viewName = (String)request.getAttribute("viewName");
	         HttpSession session = request.getSession();
	         ModelAndView mav = new ModelAndView();
	         mav.setViewName(viewName);
	         memberVO = (MemberVO)session.getAttribute("memberInfo");
	         comVO = (CompanyVO)session.getAttribute("comInfo");
	         
	         if(memberVO != null) {
		         mav.addObject("member", memberVO);
		         //고객 - 마이페이지 사이드메뉴
		         session.setAttribute("side_menu", "my_page"); 
	         }
	         else if(comVO != null) {
	        	 mav.addObject("com", comVO);
	        	 //사업체 - 마이페이지 사이드메뉴
	        	 session.setAttribute("side_menu", "com_my_page"); 
	         }
	         return mav;
	      }
		
		//나의 문의내역 페이지 조회(/myQna.do)
      @RequestMapping(value= "/myQna.do", method={RequestMethod.POST, RequestMethod.GET})
		public ModelAndView myQna(HttpServletRequest request, HttpServletResponse response) throws Exception {
		    String viewName = (String) request.getAttribute("viewName");
		    ModelAndView mav = new ModelAndView(viewName);
		    HttpSession session = request.getSession();
		    MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		    String member_id = memberVO.getMember_id();
		    
		    // QnaVO 객체를 생성하고 초기화합니다.
		    QnaVO qnaVO = new QnaVO();
		    qnaVO.setMember_id(member_id);
		    
		    List myQnaList = mypageService.myQnaList(qnaVO);
		    session.setAttribute("myQnaList", myQnaList);
		    
		    return mav;
		}
      
		//나의 예약내역 조회(/myOrder.do)
		@RequestMapping(value= "/myOrder.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView myOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String viewName = (String)request.getAttribute("viewName");
			HttpSession session = request.getSession();
			//마이페이지 사이드메뉴
			session.setAttribute("side_menu", "my_page");
			ModelAndView mav = new ModelAndView();
			MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo");
			List<OrderVO> reservation = mypageService.selectOrder(memberVO);
			
			mav.setViewName(viewName);
			mav.addObject("orderInfo" , reservation);
			return mav;
		}
		
		//회원 정보 수정 페이지(/myDetailInfo.do)
		@RequestMapping(value="/myDetailInfo.do" ,method = RequestMethod.GET)
		public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response)  throws Exception {
			HttpSession session = request.getSession();
			MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo");
			String viewName=(String)request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(viewName);
			mav.addObject("memberInfo" , memberVO);
			return mav;
		}	
		
		//회원 정보 수정 (/myModify.do)
		@RequestMapping(value="/modifyMyInfo.do" ,method={RequestMethod.POST,RequestMethod.GET})
		public ModelAndView modifyMyInfo(@RequestParam Map<String,String> memberDify,HttpServletRequest request, HttpServletResponse response)  throws Exception {
			String viewName=(String)request.getAttribute("viewName");
			mypageService.difyMember(memberDify);
			ModelAndView mav = new ModelAndView("/main/main");
			return mav;
		}
		
		//회원 정보 탈퇴 페이지 이동(/mypageDelete.do)
		@RequestMapping(value="/mypageDelete.do" ,method={RequestMethod.POST,RequestMethod.GET})
	      public ModelAndView mypageDelete(HttpServletRequest request, HttpServletResponse response)  throws Exception {
	         HttpSession session = request.getSession();
	         MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo");
	         String viewName=(String)request.getAttribute("viewName");
	         ModelAndView mav = new ModelAndView(viewName);
	         mav.addObject("memberInfo" , memberVO);
	         return mav;
	      }   

	      
		//회원 정보 탈퇴 (/delMember.do)
        @RequestMapping(value="/delMember.do" ,method={RequestMethod.POST,RequestMethod.GET})
        public ModelAndView delMember(@RequestParam Map<String,String> member , HttpServletRequest request, HttpServletResponse response)  throws Exception {
           HttpSession session = request.getSession();
           MemberVO memberVO = (MemberVO)session.getAttribute("memberInfo");
           CompanyVO companyVO = (CompanyVO)session.getAttribute("comInfo");
           if(memberVO != null) {
              mypageService.deleteMember(member);
           }
           else if(companyVO != null) {
              mypageService.deleteCompany(member);
           }
           String viewName=(String)request.getAttribute("viewName");
           ModelAndView mav = new ModelAndView("/main/main");
           return mav;
        }   
		
		 @RequestMapping(value = "/listMyOrderHistory.do", method={RequestMethod.POST,RequestMethod.GET})
	      public ModelAndView listMyOrderHistory(@RequestParam Map<String, String> dateMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
	         String viewName = (String)request.getAttribute("viewName");
	         
	         ModelAndView mav = new ModelAndView(viewName);
	         HttpSession session = request.getSession();
	         //마이페이지 사이드메뉴
	         session.setAttribute("side_menu", "my_page");
	         memberVO = (MemberVO)session.getAttribute("memberInfo");
	         String member_id = memberVO.getMember_id();
	         String fixedSearchPeriod = dateMap.get("fixedSearchPeriod");
	         String beginDate = null, endDate = null;
	         String[] tempDate = calcSearchPeriod(fixedSearchPeriod).split(",");
	         beginDate=tempDate[0];
	         endDate=tempDate[1];
	         dateMap.put("beginDate", beginDate);
	         dateMap.put("endDate", endDate);
	         dateMap.put("member_id", member_id);
	         List<OrderVO> myOrderHistList=mypageService.listMyOrderHistory(dateMap);
	         String beginDate1[]=beginDate.split("-");
	         String endDate1[]=endDate.split("-");
	         mav.addObject("beginYear", beginDate1[0]);
	         mav.addObject("beginMonth", beginDate1[1]);
	         mav.addObject("beginDay", beginDate1[2]);
	         mav.addObject("endYear", endDate1[0]);
	         mav.addObject("endYear", endDate1[1]);
	         mav.addObject("endYear", endDate1[2]);
	         mav.addObject("myOrderHistList", myOrderHistList);
	         mav.addObject("member", memberVO);
	         return mav;
	      }
	      
	      protected String calcSearchPeriod(String fixedSearchPeriod){
	         String beginDate=null;
	         String endDate=null;
	         String endYear=null;
	         String endMonth=null;
	         String endDay=null;
	         String beginYear=null;
	         String beginMonth=null;
	         String beginDay=null;
	         DecimalFormat df = new DecimalFormat("00");
	         Calendar cal=Calendar.getInstance();
	         
	         endYear   = Integer.toString(cal.get(Calendar.YEAR));
	         endMonth  = df.format(cal.get(Calendar.MONTH) + 1);
	         endDay   = df.format(cal.get(Calendar.DATE));
	         endDate = endYear +"-"+ endMonth +"-"+endDay;
	         
	         if(fixedSearchPeriod == null) {
	            cal.add(cal.MONTH,-4);
	         }else if(fixedSearchPeriod.equals("one_week")) {
	            cal.add(Calendar.DAY_OF_YEAR, -7);
	         }else if(fixedSearchPeriod.equals("two_week")) {
	            cal.add(Calendar.DAY_OF_YEAR, -14);
	         }else if(fixedSearchPeriod.equals("one_month")) {
	            cal.add(cal.MONTH,-1);
	         }else if(fixedSearchPeriod.equals("two_month")) {
	            cal.add(cal.MONTH,-2);
	         }else if(fixedSearchPeriod.equals("three_month")) {
	            cal.add(cal.MONTH,-3);
	         }else if(fixedSearchPeriod.equals("four_month")) {
	            cal.add(cal.MONTH,-4);
	         }
	         
	         beginYear   = Integer.toString(cal.get(Calendar.YEAR));
	         beginMonth  = df.format(cal.get(Calendar.MONTH) + 1);
	         beginDay   = df.format(cal.get(Calendar.DATE));
	         beginDate = beginYear +"-"+ beginMonth +"-"+beginDay;
	         
	         return beginDate+","+endDate;
	      }
	      
	    //나의 여행 후기 조회(/myReview.do)
	      @RequestMapping(value= "/myReview.do" ,method={RequestMethod.POST,RequestMethod.GET})
	      public ModelAndView myReview(HttpServletRequest request, HttpServletResponse response) throws Exception {
	         String viewName = (String)request.getAttribute("viewName");
	         ModelAndView mav = new ModelAndView(viewName);
	         HttpSession session = request.getSession();
	         //마이페이지 사이드메뉴
	         session.setAttribute("side_menu", "my_page"); 
	         memberVO = (MemberVO)session.getAttribute("memberInfo");
	         String member_id = memberVO.getMember_id();
	         
	         List<ReviewVO> reviewList = mypageService.reviewList(member_id);
	         mav.addObject("review", reviewList);
	         mav.addObject("member", memberVO);
	         return mav;
	      }
	      
	      //이미지 글쓰기
	      @RequestMapping(value = "/addNewReview.do", method={RequestMethod.POST,RequestMethod.GET})
	      @ResponseBody
	      public ResponseEntity addNewReview(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
	         multipartRequest.setCharacterEncoding("utf-8");
	         Map<String, Object> reviewMap = new HashMap<String, Object>();
	         Enumeration enu = multipartRequest.getParameterNames();
	         while (enu.hasMoreElements()) {
	            String name = (String)enu.nextElement();
	            String value = multipartRequest.getParameter(name);
	            reviewMap.put(name, value);
	         }
	         String imageFileName = upload(multipartRequest);
	         HttpSession session = multipartRequest.getSession();
	         memberVO = (MemberVO)session.getAttribute("memberInfo");
	         String id = memberVO.getMember_id();
	         reviewMap.put("parent_num", 0);
	         reviewMap.put("id", id);
	         reviewMap.put("imageFileName", imageFileName);
	         
	         String message;
	         ResponseEntity resEnt = null;
	         HttpHeaders responseHeaders = new HttpHeaders();
	         responseHeaders.add("Content-type", "text/html; charset=utf-8");
	         try {
	            int review_num = mypageService.addNewReview(reviewMap);
	            if (imageFileName!=null && imageFileName.length()!=0) {
	               File srcFile = new File(REVIEW_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
	               File destDir = new File(REVIEW_IMAGE_REPO + "\\" + review_num);
	               FileUtils.moveFileToDirectory(srcFile, destDir, true);
	            }
	            message = "<script>";
	            message += " alert('새글을 추가했습니다.');";
	            message += " location.href='"+multipartRequest.getContextPath()+"/mypage/myReview.do'; ";
	            message +=" </script>";
	             resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	         } catch (Exception e) {
	            File srcFile = new File(REVIEW_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
	            srcFile.delete();
	            
	            message = " <script>";
	            message +=" alert('오류가 발생했습니다. 다시 시도해 주세요');');";
	            message +=" location.href='"+multipartRequest.getContextPath()+"/mypage/reviewForm.do'; ";
	            message +=" </script>";
	            resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	            e.printStackTrace();
	         }
	         return resEnt;
	      }
	            
	      //나의 여행 후기 상세 페이지
	      @RequestMapping(value = "/myReviewDetail.do", method = {RequestMethod.POST,RequestMethod.GET})
	      public ModelAndView myReviewDetail(@RequestParam("review_num") int review_num, HttpServletRequest request, HttpServletResponse response) throws Exception {
	         HttpSession session = request.getSession();
	         session = request.getSession();
	         String viewName = (String)request.getAttribute("viewName");
	         ModelAndView mav = new ModelAndView(viewName);
	         session.setAttribute("side_menu", "my_page");
	         ReviewVO reviewMap = mypageService.reviewDetail(review_num);
	         mav.addObject("reviewMap", reviewMap);
	         
	         return mav;
	         
	      }
	            
	      //한 개 이미지 수정 기능
	      @RequestMapping(value = "/modReview.do", method={RequestMethod.POST,RequestMethod.GET})
	      @ResponseBody
	      public ResponseEntity modReview(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
	         multipartRequest.setCharacterEncoding("utf-8");
	         Map<String, Object> reviewMap = new HashMap<String, Object>();
	         Enumeration enu = multipartRequest.getParameterNames();
	         while (enu.hasMoreElements()) {
	            String name = (String)enu.nextElement();
	            String value = multipartRequest.getParameter(name);
	            reviewMap.put(name, value);
	         }
	         String imageFileName = upload(multipartRequest);
	         reviewMap.put("imageFileName", imageFileName);
	         String review_num = (String)reviewMap.get("review_num");
	         String message;
	         ResponseEntity resEnt = null;
	         HttpHeaders responseHeaders = new HttpHeaders();
	         responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	            try {
	                mypageService.modReview(reviewMap);
	                if(imageFileName!=null && imageFileName.length()!=0) {
	                  File srcFile = new File(REVIEW_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
	                  File destDir = new File(REVIEW_IMAGE_REPO+"\\"+ review_num);
	                  FileUtils.moveFileToDirectory(srcFile, destDir, true);
	                  
	                  String originalFileName = (String)reviewMap.get("originalFileName");
	                  File oldFile = new File(REVIEW_IMAGE_REPO+"\\"+ review_num +"\\"+originalFileName);
	                  oldFile.delete();
	                }   
	                message = "<script>";
	               message += " alert('글을 수정했습니다.');";
	               message += " location.href='"+multipartRequest.getContextPath()+"/mypage/myReviewDetail.do?review_num="+review_num+"';";
	               message +=" </script>";
	                resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	             }catch(Exception e) {
	               File srcFile = new File(REVIEW_IMAGE_REPO+"\\"+"temp"+"\\"+imageFileName);
	               srcFile.delete();
	               message = "<script>";
	              message += " alert('오류가 발생했습니다.다시 수정해주세요');";
	              message += " location.href='"+multipartRequest.getContextPath()+"/mypage/myReviewDetail.do?review_num="+review_num+"';";
	              message +=" </script>";
	               resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	             }
	             return resEnt;
	           }
	      
	      @RequestMapping(value = "/removeReview.do", method = {RequestMethod.POST,RequestMethod.GET})
	      @ResponseBody
	      public ResponseEntity removeReview(@RequestParam("review_num") int review_num, HttpServletRequest request, HttpServletResponse response) throws Exception {
	         response.setContentType("text/html; charset=UTF-8");
	         String message;
	         ResponseEntity resEnt=null;
	         HttpHeaders responseHeaders = new HttpHeaders();
	         responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	         try {
	            mypageService.removeReview(review_num);
	            File destDir = new File(REVIEW_IMAGE_REPO+"\\"+review_num);
	            FileUtils.deleteDirectory(destDir);
	            
	            message = "<script>";
	            message += " alert('글을 삭제했습니다.');";
	            message += " location.href='"+request.getContextPath()+"/myReview.do';";
	            message +=" </script>";
	             resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	                
	         }catch(Exception e) {
	            message = "<script>";
	            message += " alert('작업중 오류가 발생했습니다.다시 시도해 주세요.');";
	            message += " location.href='"+request.getContextPath()+"/myReview.do';";
	            message +=" </script>";
	             resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	             e.printStackTrace();
	         }
	         return resEnt;
	      }
	      
	      @RequestMapping(value = "/*Form.do", method={RequestMethod.POST,RequestMethod.GET})
	      private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
	         String viewName = (String)request.getAttribute("viewName");
	         ModelAndView mav = new ModelAndView();
	         mav.setViewName(viewName);
	         return mav;
	      }
	      
	      //한개 이미지 업로드하기
	      private String upload(MultipartHttpServletRequest multipartRequest) throws Exception{
	         String imageFileName= null;
	         Iterator<String> fileNames = multipartRequest.getFileNames();
	         
	         while(fileNames.hasNext()){
	            String fileName = fileNames.next();
	            MultipartFile mFile = multipartRequest.getFile(fileName);
	            imageFileName=mFile.getOriginalFilename();
	            File file = new File(REVIEW_IMAGE_REPO +"\\"+"temp"+"\\" + fileName);
	            if(mFile.getSize()!=0){ //File Null Check
	               if(!file.exists()){ //경로상에 파일이 존재하지 않을 경우
	                  file.getParentFile().mkdirs();  //경로에 해당하는 디렉토리들을 생성
	                  mFile.transferTo(new File(REVIEW_IMAGE_REPO +"\\"+"temp"+ "\\"+imageFileName)); //임시로 저장된 multipartFile을 실제 파일로 전송
	               }
	            }
	            
	         }
	         return imageFileName;
	      }
	      
	      @RequestMapping("/download.do")
	      protected void download(@RequestParam("imageFileName") String imageFileName,
	                             @RequestParam("review_num") String review_num,
	                             HttpServletResponse response) throws Exception {
	         OutputStream out = response.getOutputStream();
	         String filePath= REVIEW_IMAGE_REPO+"\\" + review_num + "\\" +imageFileName;
	         File image=new File(filePath);

	         response.setHeader("Cache-Control","no-cache");
	         response.addHeader("Content-disposition", "attachment; fileName="+imageFileName);
	         FileInputStream in=new FileInputStream(image); 
	         byte[] buffer=new byte[1024*8];
	         while(true){
	            int count=in.read(buffer); 
	            if(count==-1)  {
	               break;
	            }
	            out.write(buffer,0,count);
	         }
	         in.close();
	         out.close();
	      }
}
