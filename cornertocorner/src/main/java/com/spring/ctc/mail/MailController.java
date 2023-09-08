package com.spring.ctc.mail;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("mailController")
@RequestMapping(value="/mail")
public class MailController {
	@Autowired
	private MailService mailService;

	@RequestMapping(value = "/sendMail.do", method = RequestMethod.GET)
	public void sendMail(@RequestParam("email") String email, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html:charset=utf-8");
		System.out.println("이메일 인증 이메일 : " + email);
		String code = mailService.joinEmail(email);
		
		response.getWriter().write(code);
		
		
		
		
	}
}
