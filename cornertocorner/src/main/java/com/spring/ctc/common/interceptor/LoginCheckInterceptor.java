package com.spring.ctc.common.interceptor;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        Boolean isLogOn = (Boolean) session.getAttribute("isLogOn");
        Boolean isLogonCom = (Boolean) session.getAttribute("isLogonCom");

        // 요청 URL이 1:1문의 페이지에 대한 것인지 확인
        String requestURI = request.getRequestURI();
        if (requestURI.endsWith("/board/oneQnaForm.do")) {

            // 로그인 되어 있는 경우 1:1문의 페이지로 이동
            if ((isLogOn != null && isLogOn) || (isLogonCom != null && isLogonCom)) {
                return true;
            }
         // 로그인 되어 있지 않은 경우 로그인 페이지로 이동
            else {               
                session.setAttribute("returnUrl", requestURI.replace(request.getContextPath(), ""));
                response.sendRedirect(request.getContextPath() + "/joinAndLogin/loginForm.do");
                return false;
            }
        }
        // 1:1문의 페이지가 아닌 경우 요청을 허용
        return true;
    }
}
