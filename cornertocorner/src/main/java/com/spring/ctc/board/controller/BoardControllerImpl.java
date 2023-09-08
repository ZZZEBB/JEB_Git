package com.spring.ctc.board.controller;

import java.io.File;
import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ctc.board.service.BoardService;
import com.spring.ctc.board.vo.BoardDetailImageVO;
import com.spring.ctc.board.vo.EventVO;
import com.spring.ctc.board.vo.FaqVO;
import com.spring.ctc.board.vo.NoticeVO;
import com.spring.ctc.joinandlogin.vo.CompanyVO;
import com.spring.ctc.joinandlogin.vo.MemberVO;

@Controller
@RequestMapping(value="/board")
public class BoardControllerImpl implements BoardController {
	private static final String CURR_IMAGE_REPO_PATH = "C:\\ctc\\file_repo";
	
	@Autowired
	private BoardService boardService;
	private EventVO eventVO;
	MemberVO memberVO;
	CompanyVO comVO;
	
	BoardDetailImageVO boardDetailImageVO;
	
	//고객센터 메인 - 자주묻는질문 페이지 이동(/faq.do)
	@RequestMapping(value= "/faq.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView faq(HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		session = request.getSession();
		String viewName = (String)request.getAttribute("viewName");
		int hotel = 1; 
		int flight = 2; 
		int rent = 3; 
		int packages = 4; 
		List<FaqVO> faqhotel = boardService.faqList(hotel);
		List<FaqVO> faqflight = boardService.faqList(flight);
		List<FaqVO> faqrent = boardService.faqList(rent);
		List<FaqVO> faqpackage = boardService.faqList(packages);
		
		memberVO = (MemberVO)session.getAttribute("memberInfo");
		comVO = (CompanyVO)session.getAttribute("comInfo");
		
		mav.setViewName(viewName);
		mav.addObject("faqhotel" , faqhotel);
		mav.addObject("faqflight" , faqflight);
		mav.addObject("faqrent" , faqrent);
		mav.addObject("faqpackage" , faqpackage);
		
		if(memberVO != null) {
	         mav.addObject("member", memberVO);
	         //고객 - 마이페이지 사이드메뉴
	         session.setAttribute("side_menu", "mem_customercenter_mode"); 
       }
       else if(comVO != null) {
			 mav.addObject("com", comVO);
			 //사업체 - 마이페이지 사이드메뉴
			 session.setAttribute("side_menu", "com_customercenter_mode"); 
       }
		return mav;
	}
	
	//이벤트 목록 조회(/eventList.do)
	@Override
	@RequestMapping(value= "/eventList.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView eventList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session = request.getSession();
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		eventVO = (EventVO)session.getAttribute("eventLists");
		List<EventVO> eventLists = boardService.eventList();
		for(int i = 0; i < eventLists.size(); i++) {
			System.out.println("##" + eventLists.get(i).getEvent_num());
		}
		
		mav.addObject("eventLists", eventLists);
		return mav;
	}
	
	//이벤트 상세 조회(/eventDetail.do)
	@Override
	@RequestMapping(value= "/eventDetail.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView eventDetail(@RequestParam("event_num") int event_num, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		Map eventMap = boardService.eventDetail(event_num);
		mav.addObject("eventMap", eventMap);
		EventVO eventVO = (EventVO) eventMap.get("eventVO");
		return mav;
	}
	
	//고객센터 - 1:1 문의 페이지 이동 (/oneQnaForm.do)
	@Override
	@RequestMapping(value= "/oneQnaForm.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView oneQnaForm(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		
		memberVO = (MemberVO)session.getAttribute("memberInfo");
		comVO = (CompanyVO)session.getAttribute("comInfo");
		
		if(memberVO != null) {
	         mav.addObject("member", memberVO);
	         //고객 - 마이페이지 사이드메뉴
	         session.setAttribute("side_menu", "mem_customercenter_mode"); 
       }
       else if(comVO != null) {
			 mav.addObject("com", comVO);
			 //사업체 - 마이페이지 사이드메뉴
			 session.setAttribute("side_menu", "com_customercenter_mode"); 
       }
       
        return mav;
	}
	

	//고객센터 - 공지사항 목록페이지 이동(/noticeList.do)
   @Override
   @RequestMapping(value= "/noticeList.do" ,method={RequestMethod.POST,RequestMethod.GET})
   public ModelAndView noticeList(HttpServletRequest request, HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		session = request.getSession();
		String viewName = (String)request.getAttribute("viewName");
		List<NoticeVO> noticeList = boardService.noticeList();
		ModelAndView mav = new ModelAndView(viewName);
		
		//고객센터 사이드메뉴
		session.setAttribute("side_menu", "mem_customercenter_mode");
		
		mav.addObject("noticeList", noticeList);
		
		memberVO = (MemberVO)session.getAttribute("memberInfo");
		comVO = (CompanyVO)session.getAttribute("comInfo");
		
		if(memberVO != null) {
	         mav.addObject("member", memberVO);
	         //고객 - 마이페이지 사이드메뉴
	         session.setAttribute("side_menu", "mem_customercenter_mode"); 
       }
       else if(comVO != null) {
			 mav.addObject("com", comVO);
			 //사업체 - 마이페이지 사이드메뉴
			 session.setAttribute("side_menu", "com_customercenter_mode"); 
       }
       
        return mav;
   }
   
   //고객센터 - 공지사항 상세페이지 이동(/noticeDetail.do)
   @Override
   @RequestMapping(value= "/noticeDetail.do" ,method={RequestMethod.POST,RequestMethod.GET})
   public ModelAndView noticeDetail(@RequestParam("notice_num") int notice_num, HttpServletRequest request, HttpServletResponse response) throws Exception {
	   	HttpSession session = request.getSession();
		session = request.getSession();
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		memberVO = (MemberVO)session.getAttribute("memberInfo");
		comVO = (CompanyVO)session.getAttribute("comInfo");
		
		if(memberVO != null) {
	         mav.addObject("member", memberVO);
	         //고객 - 마이페이지 사이드메뉴
	         session.setAttribute("side_menu", "mem_customercenter_mode"); 
       }
       else if(comVO != null) {
			 mav.addObject("com", comVO);
			 //사업체 - 마이페이지 사이드메뉴
			 session.setAttribute("side_menu", "com_customercenter_mode"); 
       }
				
		Map noticeMap = boardService.noticeDetail(notice_num);
		mav.addObject("noticeMap", noticeMap);
		NoticeVO noticeVO = (NoticeVO) noticeMap.get("noticeVO");
		return mav;
   }
   
   @Override
   @RequestMapping(value="/addNewQna.do" ,method={RequestMethod.POST})
   public ResponseEntity addNewQna(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception{
	   multipartRequest.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		// board_fileName 변수 선언을 null 값으로 하지 않고 빈 문자열("")로 초기화합니다.
		String board_fileName = "";
				
		Map<String, Object> newQnaMap = new HashMap<>();
		Enumeration enu=multipartRequest.getParameterNames();

		while(enu.hasMoreElements()){
		    String name=(String)enu.nextElement();
		    String value=multipartRequest.getParameter(name);
		    newQnaMap.put(name,value);
		}
	
		//로그인한 회원의 정보를 세션에서 가져와서 Map에 추가합니다.
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberInfo");
		String member_id = memberVO.getMember_id();
		newQnaMap.put("member_id", member_id);
		newQnaMap.put("board_reg_id", member_id);
		newQnaMap.put("qna_num", 0);

		List<String> fileList = upload(multipartRequest);
		List<BoardDetailImageVO> imageFileList = null;
		if(fileList != null && !fileList.isEmpty()) {
		    board_fileName = fileList.get(0);
		    imageFileList = new ArrayList<BoardDetailImageVO>();
		    for(String fileName : fileList) {
		        BoardDetailImageVO boardDetailImageVO = new BoardDetailImageVO();
		        boardDetailImageVO.setBoard_fileName(fileName);
		        imageFileList.add(boardDetailImageVO);
		    }
		    newQnaMap.put("imageFileList", imageFileList);
		} else {
		    imageFileList = new ArrayList<BoardDetailImageVO>();
		    newQnaMap.put("imageFileList", imageFileList);
		}

		// board_fileName을 newQnaMap에 추가합니다.
		newQnaMap.put("board_fileName", board_fileName);

		String message;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    int qna_num = boardService.addNewQna(newQnaMap);
		    if(imageFileList!=null && imageFileList.size()!=0) {
		        for(BoardDetailImageVO  boardDetailImageVO:imageFileList) {
		            board_fileName = boardDetailImageVO.getBoard_fileName();
		            File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + board_fileName);
		            File destDir = new File(CURR_IMAGE_REPO_PATH + "\\" + qna_num);
		            FileUtils.moveFileToDirectory(srcFile, destDir,true);
		        }
		    }
		    message= "<script>";
		    message += " alert('1대1문의글을 작성했습니다.');";
		    message +=" location.href='"+multipartRequest.getContextPath()+"/mypage/myQna.do';";
		    message +=("</script>");
		    resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		}catch(Exception e) {
		    if(imageFileList!=null && imageFileList.size()!=0) {
		        for(BoardDetailImageVO boardDetailImageVO : imageFileList) {
		            board_fileName = boardDetailImageVO.getBoard_fileName();
		            File srcFile = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + board_fileName);
		            if (srcFile.exists()) {
		                srcFile.delete();
		            }
		        }
		    }
			
			message= "<script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/board/oneQnaForm.do';";
			message +=("</script>");
			resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
			e.printStackTrace();
		}
		
		return resEntity;	
   }
   
  private List<String> upload(MultipartHttpServletRequest multipartRequest) throws Exception {
	    List<String> fileList = new ArrayList<>();
	    Iterator<String> fileNames = multipartRequest.getFileNames();
	    while (fileNames.hasNext()) {
	        String fileName = fileNames.next();
	        MultipartFile mFile = multipartRequest.getFile(fileName);
	        String originalFileName = mFile.getOriginalFilename();
	        if (originalFileName == null || originalFileName.isEmpty()) {
	            continue; // 파일이 첨부되지 않은 경우 건너뜀
	        }
	        fileList.add(originalFileName);
	        File file = new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + fileName);
	        if (mFile.getSize() != 0) { // 파일이 첨부된 경우에만 이동시킴
	            if (!file.exists()) {
	                if (file.getParentFile().mkdirs()) {
	                    file.createNewFile();
	                }
	            }
	            mFile.transferTo(new File(CURR_IMAGE_REPO_PATH + "\\" + "temp" + "\\" + originalFileName));
	        }
	    }
	    return fileList.isEmpty() ? null : fileList;
	}
	
}