package com.spring.ctc.joinandlogin.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ctc.joinandlogin.dao.JoinAndLoginDAO;
import com.spring.ctc.joinandlogin.service.JoinAndLoginService;
import com.spring.ctc.joinandlogin.vo.CompanyVO;
import com.spring.ctc.joinandlogin.vo.MemberVO;

@Controller("joinAndLoginController")
@RequestMapping(value="/joinAndLogin")
public class JoinAndLoginControllerImpl implements JoinAndLoginController {
	
	@Autowired
   private JoinAndLoginService joinAndLoginService;
   @Autowired
   private MemberVO memberVO;
   @Autowired
   private CompanyVO companyVO;
   @Autowired
   private JoinAndLoginDAO joinAndLoginDAO;

   @Override
   @RequestMapping(value = "/login.do", method={RequestMethod.POST,RequestMethod.GET})
   public ModelAndView login(@RequestParam Map<String, String> loginMap, 
                              HttpServletRequest request, HttpServletResponse response) throws Exception {
       ModelAndView mav = new ModelAndView();
       MemberVO memberVO=joinAndLoginService.login(loginMap);
       if(memberVO!= null && memberVO.getMember_id()!=null){
           HttpSession session=request.getSession();
           session.setAttribute("isLogOn", true);
           session.setAttribute("memberInfo", memberVO);

        // returnUrl 정보가 있는 경우 이전 페이지로 리다이렉트
           String returnUrl = (String) session.getAttribute("returnUrl");
           if (returnUrl != null && !returnUrl.isEmpty()) {
               session.removeAttribute("returnUrl");
               mav.setViewName("redirect:" + returnUrl);
           } else {
               mav.setViewName("redirect:/main/main.do");
           }
       } else {
           String message="메세지";
           mav.addObject("message", message);
           mav.setViewName("/joinAndLogin/loginForm");
       }
       return mav;
   }
   
   @Override
   @RequestMapping(value = "loginCom.do", method={RequestMethod.POST,RequestMethod.GET})
   public ModelAndView loginCom(@RequestParam Map<String, String> loginComMap, 
                           HttpServletRequest request, HttpServletResponse response) throws Exception {
      ModelAndView mav = new ModelAndView();
      companyVO=joinAndLoginService.loginCom(loginComMap);
      if (companyVO!=null && companyVO.getCom_id()!=null) {
         HttpSession session=request.getSession();
         session=request.getSession();
         session.setAttribute("isLogonCom", true);
         session.setAttribute("comInfo", companyVO);
         mav.setViewName("redirect:/main/main.do");
         
      } else {
         String message="메세지";
         mav.addObject("message", message);
         mav.setViewName("/joinAndLogin/loginFormCom");
      }
      return mav;
   }
   
   @Override
   @RequestMapping(value= "/loginForm.do" ,method={RequestMethod.POST,RequestMethod.GET})
   public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ModelAndView mav = new ModelAndView();
      String viewName = (String)request.getAttribute("viewName");
      mav.setViewName(viewName);
      return mav;
   }
   
   @RequestMapping(value= "/loginFormCom.do" ,method={RequestMethod.POST,RequestMethod.GET})
   public ModelAndView loginFormCom(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ModelAndView mav = new ModelAndView();
      String viewName = (String)request.getAttribute("viewName");
      mav.setViewName(viewName);
      return mav;
   }
   
   @RequestMapping(value= "/searchId.do" ,method={RequestMethod.POST,RequestMethod.GET})
   public ModelAndView search(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ModelAndView mav = new ModelAndView();
      String viewName = (String)request.getAttribute("viewName");
      mav.setViewName(viewName);
      return mav;
   }
   
   /* 아이디 찾기 */
   @RequestMapping(value= "/findId.do" ,method={RequestMethod.POST,RequestMethod.GET})
   public ModelAndView find(@RequestParam Map<String, String> findIdMap ,HttpServletRequest request, HttpServletResponse response) throws Exception {
      ModelAndView mav = new ModelAndView();
      String viewName = (String)request.getAttribute("viewName");
      mav.setViewName(viewName);
       
           memberVO = joinAndLoginService.findId(findIdMap);
           System.out.println(1);
           if (memberVO!= null) {
              System.out.println(1);
              String memberId = memberVO.getMember_id();
              HttpSession session=request.getSession();
               session.setAttribute("id", memberId);
               //System.out.println(1);
            /* mav.setViewName("forward:/joinandlogin/findId.do"); */
               //System.out.println(1);
         } else {
            
            String message="이름 또는 이메일이 일치하지 않습니다. 회원정보를 확인해주세요.";
            mav.addObject("id", message);
            /*
             * mav.setViewName("forward:/joinandlogin/findId.do"); //forward는 맵핑값이랑 이름 같으면
             * 오류(찾는거 무한 반복)
             */       
            }

        return mav;
   }
   
   /* 사업체 아이디 찾기 */
   @RequestMapping(value= "/findIdCom.do" ,method={RequestMethod.POST,RequestMethod.GET})
   public ModelAndView findCom(@RequestParam Map<String, String> findIdComMap ,HttpServletRequest request, HttpServletResponse response) throws Exception {
      ModelAndView mav = new ModelAndView();
      String viewName = (String)request.getAttribute("viewName");
      mav.setViewName(viewName);
      System.out.println(findIdComMap.get("com_name"));
      System.out.println(findIdComMap.get("com_email"));
      
      companyVO = joinAndLoginService.findIdCom(findIdComMap);
      
           if (companyVO!= null) {
              String comId = companyVO.getCom_id();
              HttpSession session=request.getSession();
               session.setAttribute("comId", comId);
               //System.out.println(1);
            /* mav.setViewName("forward:/joinandlogin/findId.do"); */
               //System.out.println(1);
         } else {
            
            String message="상호명 또는 이메일이 일치하지 않습니다. 사업체 정보를 확인해주세요.";
            mav.addObject("comId", message);
            /*
             * mav.setViewName("forward:/joinandlogin/findId.do"); //forward는 맵핑값이랑 이름 같으면
             * 오류(찾는거 무한 반복)
             */       
            }

        return mav;
   }
   
   @RequestMapping(value= "/searchIdCom.do" ,method={RequestMethod.POST,RequestMethod.GET})
   public ModelAndView searchIdCom(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ModelAndView mav = new ModelAndView();
      String viewName = (String)request.getAttribute("viewName");
      mav.setViewName(viewName);
      return mav;
   }
   
   
   
   @RequestMapping(value= "/select_find_id.do" ,method={RequestMethod.POST,RequestMethod.GET})
   public ModelAndView selectIdForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ModelAndView mav = new ModelAndView();
      String viewName = (String)request.getAttribute("viewName");
      mav.setViewName(viewName);
      return mav;
   }
   
   @RequestMapping(value= "/select_find_pw.do" ,method={RequestMethod.POST,RequestMethod.GET})
   public ModelAndView selectPwForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ModelAndView mav = new ModelAndView();
      String viewName = (String)request.getAttribute("viewName");
      mav.setViewName(viewName);
      return mav;
   }
   
   @RequestMapping(value= "/searchPw.do" ,method={RequestMethod.POST,RequestMethod.GET})
   public ModelAndView searchPw(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ModelAndView mav = new ModelAndView();
      String viewName = (String)request.getAttribute("viewName");
      mav.setViewName(viewName);
      return mav;
   }
   
   @RequestMapping(value= "/selectLogin.do" ,method={RequestMethod.POST,RequestMethod.GET})
   public ModelAndView selectLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ModelAndView mav = new ModelAndView();
      String viewName = (String)request.getAttribute("viewName");
      mav.setViewName(viewName);
      return mav;
   }
   
   @RequestMapping(value= "/searchPwCom.do" ,method={RequestMethod.POST,RequestMethod.GET})
   public ModelAndView searchPwCom(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ModelAndView mav = new ModelAndView();
      String viewName = (String)request.getAttribute("viewName");
      mav.setViewName(viewName);
      return mav;
   }
   
   
   
   /* 비밀번호 찾기 */
   @RequestMapping(value= "/findPw.do" ,method={RequestMethod.POST,RequestMethod.GET})
   public ModelAndView findPw(@RequestParam Map<String, String> findPwMap ,HttpServletRequest request, HttpServletResponse response) throws Exception {
      ModelAndView mav = new ModelAndView();
      String viewName = (String)request.getAttribute("viewName");
      mav.setViewName(viewName);
       
           memberVO = joinAndLoginService.findPw(findPwMap);
           System.out.println(1);
           if (memberVO!= null) {
              System.out.println(1);
              String memberPw = memberVO.getMember_pw();
              HttpSession session=request.getSession();
               session.setAttribute("pw", memberPw);
               //System.out.println(1);
            /* mav.setViewName("forward:/joinandlogin/findId.do"); */
               //System.out.println(1);
         } else {
            
            String message="아이디 또는 주민등록번호가 일치하지 않습니다. 회원정보를 확인해주세요.";
            mav.addObject("pw", message);
            /*
             * mav.setViewName("forward:/joinandlogin/findId.do"); //forward는 맵핑값이랑 이름 같으면
             * 오류(찾는거 무한 반복)
             */       
            }

        return mav;
   }
   
   /* 사업체 비밀번호 찾기 */
   @RequestMapping(value= "/findPwCom.do" ,method={RequestMethod.POST,RequestMethod.GET})
   public ModelAndView findPwCom(@RequestParam Map<String, String> findPwComMap ,HttpServletRequest request, HttpServletResponse response) throws Exception {
      ModelAndView mav = new ModelAndView();
      String viewName = (String)request.getAttribute("viewName");
      mav.setViewName(viewName);
       
           companyVO = joinAndLoginService.findPwCom(findPwComMap);
           System.out.println(1);
           if (companyVO!= null) {
              System.out.println(1);
              String comPw = companyVO.getCom_pw();
              HttpSession session=request.getSession();
               session.setAttribute("pw", comPw);
               //System.out.println(1);
            /* mav.setViewName("forward:/joinandlogin/findId.do"); */
               //System.out.println(1);
         } else {
            
            String message="아이디 또는 대표자명 또는 사업자등록번호가 일치하지 않습니다. 사업체 정보를 확인해주세요.";
            mav.addObject("pw", message);
            /*
             * mav.setViewName("forward:/joinandlogin/findId.do"); //forward는 맵핑값이랑 이름 같으면
             * 오류(찾는거 무한 반복)
             */
            }

        return mav;
   }
   
   /* 로그아웃 */
   @RequestMapping(value="/logout.do" ,method = RequestMethod.GET)
   public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ModelAndView mav = new ModelAndView();
      HttpSession session=request.getSession();
      session.setAttribute("isLogOn", false);
      session.setAttribute("isLogOnCom", false);
      session.removeAttribute("memberInfo");
      session.removeAttribute("comInfo");
      mav.setViewName("redirect:/main/main.do");
      return mav;
   }

	 
	
	@Override
	@RequestMapping(value="/lookup_id.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView findId(@RequestParam Map<String, String> findIdMap, HttpServletResponse response, HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		MemberVO memberVO = joinAndLoginService.findId(findIdMap);
		
		if (memberVO!= null) {
			String memberId = memberVO.getMember_id();
			HttpSession session=request.getSession();
			session.setAttribute("id", memberId);
			mav.setViewName("forward:/joinAndLogin/findId.do"); 
		} else {
			String message="아이디가 틀립니다. 다시 한번 입력해주세요.";
			mav.addObject("id", message);
			mav.setViewName("forward:/joinAndLogin/findId.do"); //forward 뒗 留듯븨媛믪씠 옉  씠由  媛숈쑝硫   삤瑜 (李얜뒗嫄  臾댄븳 諛섎났)
		}
		return mav;
	}
	
	/*민선*/
	/* 회원가입 메인페이지 이동 */
	@RequestMapping(value= "/joinMain.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView joinMain(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	/* 개인 회원 가입 이동 */
	@RequestMapping(value= "/joinMember.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView joinMember(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	/* 사업자 회원 가입 이동 */
	@RequestMapping(value= "/joinCom.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView joinCom(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	/* 회원가입 */ 
	@RequestMapping(value="/addMember.do" ,method= {RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity addMember(@ModelAttribute("memberVO") MemberVO memberVO,
            HttpServletRequest request, HttpServletResponse response) throws Exception {
			response.setContentType("text/html; charset=UTF-8");
			request.setCharacterEncoding("utf-8");
			String message = null;
			ResponseEntity resEntity = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			try {
				joinAndLoginDAO.insertNewMember(memberVO);
			message  = "<script>";
			message +=" alert('회원 가입을 마쳤습니다.로그인창으로 이동합니다.');";
			message += " location.href='"+request.getContextPath()+"/joinAndLogin/loginForm.do';";
			message += " </script>";
			
			}catch(Exception e) {
			message  = "<script>";
			message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
			message += " location.href='"+request.getContextPath()+"/joinAndLogin/joinMember.do';";
			message += " </script>";
			e.printStackTrace();
			}
			resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
			return resEntity;
	}
	@RequestMapping(value="/addCom.do" ,method= {RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity addCom(@ModelAttribute("companyVO") CompanyVO companyVO,
            HttpServletRequest request, HttpServletResponse response) throws Exception {
			response.setContentType("text/html; charset=UTF-8");
			request.setCharacterEncoding("utf-8");
			String message = null;
			ResponseEntity resEntity = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			try {
				joinAndLoginDAO.insertNewCom(companyVO);
			message  = "<script>";
			message +=" alert('회원 가입을 마쳤습니다.로그인창으로 이동합니다.');";
			message += " location.href='"+request.getContextPath()+"/joinAndLogin/loginFormCom.do';";
			message += " </script>";
			
			}catch(Exception e) {
			message  = "<script>";
			message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
			message += " location.href='"+request.getContextPath()+"/joinAndLogin/joinCom.do';";  
			message += " </script>";
			e.printStackTrace();
			}
			resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
			return resEntity;
	}
	
	@Override
	@RequestMapping(value="/overlapped.do" ,method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		
		String result = joinAndLoginService.overlapped(id);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
}
