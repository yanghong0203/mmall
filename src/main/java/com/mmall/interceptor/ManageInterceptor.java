package com.mmall.interceptor;

import com.mmall.common.Const;
import com.mmall.pojo.User;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ManageInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object handler) throws Exception {
        HttpSession session = httpServletRequest.getSession();
        User user = (User) session.getAttribute(Const.ADMIN_USER);
        HandlerMethod handlerMethod = (HandlerMethod) handler;
        try {
            if (user != null || handlerMethod.getMethod().getName().equals("login")){
                return true;
            }
        }catch (Exception e){
            httpServletRequest.getRequestDispatcher("request404").forward(httpServletRequest,httpServletResponse);
            return false;
        }
        httpServletResponse.sendRedirect("/manage/login");
        return false;
    }
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object handler, Exception e) throws Exception {

    }
}
