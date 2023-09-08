package com.spring.ctc.joinandlogin.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ctc.joinandlogin.vo.CompanyVO;
import com.spring.ctc.joinandlogin.vo.MemberVO;

public interface JoinAndLoginController {

	public ModelAndView findId(@RequestParam Map<String, String> findIdMap,HttpServletResponse response, HttpServletRequest request) throws Exception;

	/*영민*/
	public ModelAndView login(@RequestParam Map<String, String> loginMap,HttpServletRequest request, HttpServletResponse response) throws Exception;
	   //public ModelAndView findId(@RequestParam Map<String, String> findIdMap,HttpServletResponse response, HttpServletRequest request) throws Exception;
	   public ModelAndView loginCom(@RequestParam Map<String, String> loginComMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	   public ModelAndView loginForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	   
	   /*민선*/
	   /* 회원가입 메인페이지 이동 */
	   public ModelAndView joinMain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	   /* 개인회원가입 이동 */
	   public ModelAndView joinMember(HttpServletRequest request, HttpServletResponse response) throws Exception;
	   /* 사업자회원가입 이동 */
	   public ModelAndView joinCom(HttpServletRequest request, HttpServletResponse response) throws Exception;
	   
	public ResponseEntity addMember(@ModelAttribute("memberVO") MemberVO _memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity overlapped(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addCom(@ModelAttribute("companyVO") CompanyVO companyVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
}
