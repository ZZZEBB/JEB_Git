package com.spring.ctc.main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.ctc.main.service.MainService;

import net.sf.json.JSONObject;

@Controller("mainController")
public class MainController {
	@Autowired
	MainService mainService;
	
	@RequestMapping(value= "/main/main.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	@RequestMapping(value= "/main/intro.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView intro(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	//통합검색
	/*
	 * @RequestMapping(value="/keywordSearch.do",method = RequestMethod.GET,produces
	 * = "application/text; charset=utf8") public @ResponseBody String
	 * keywordSearch(@RequestParam("keyword") String keyword, HttpServletRequest
	 * request, HttpServletResponse response) throws Exception{
	 * response.setContentType("text/html;charset=utf-8");
	 * response.setCharacterEncoding("utf-8"); //System.out.println(keyword);
	 * if(keyword == null || keyword.equals("")) return null ;
	 * 
	 * keyword = keyword.toUpperCase(); List<String> keywordList
	 * =mainService.keywordSearch(keyword);
	 * 
	 * // ���� �ϼ��� JSONObject ����(��ü) JSONObject jsonObject = new JSONObject();
	 * jsonObject.put("keyword", keywordList);
	 * 
	 * String jsonInfo = jsonObject.toString(); // System.out.println(jsonInfo);
	 * return jsonInfo ; }
	 */
	
	//통합검색결과창
	@RequestMapping(value= "/main/totalSearch.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView totalSearch(HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		String viewName = (String)request.getAttribute("viewName");
		mav.setViewName(viewName);
		return mav;
	}
	
	
}
