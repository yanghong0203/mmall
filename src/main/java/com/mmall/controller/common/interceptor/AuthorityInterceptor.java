package com.mmall.controller.common.interceptor;

import com.google.common.collect.Maps;
import com.mmall.common.Const;
import com.mmall.common.ServerResponse;
import com.mmall.pojo.User;
import com.mmall.util.CookieUtil;
import com.mmall.util.JsonUtil;
import com.mmall.util.RedisShardedPoolUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Map;

@Slf4j
public class AuthorityInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object handler) throws Exception {
        HandlerMethod handlerMethod = (HandlerMethod) handler;
        // 解析HandlerMethod
        String methodName = handlerMethod.getMethod().getName();
        String className = handlerMethod.getBean().getClass().getSimpleName();

        // 解析参数，具体的参数key以及value是什么，我们打印日志
        StringBuilder requestParamBuffer = new StringBuilder();
        Map  paramMap = httpServletRequest.getParameterMap();
        Iterator iterator = paramMap.entrySet().iterator();
        while (iterator.hasNext()){
            Map.Entry entry = (Map.Entry) iterator.next();
            String mapKey = (String) entry.getKey();

            String mapValue = StringUtils.EMPTY;
            // request 这个参数的map，里面的value返回的是一个String[]
            Object o = entry.getValue();
            if (o instanceof String[]){
                String[] strings = (String[]) o;
                mapValue = Arrays.toString(strings);
            }
            requestParamBuffer.append(mapKey).append("=").append(mapValue);
        }

        if (StringUtils.equals(className,"UserManageController") && StringUtils.equals(methodName,"login")){
            log.info("权限拦截器拦截到请求，className:{},methodName:{}",className,methodName);
            return true;
        }
        // 获取参数
        User user = null;
        String loginToken = CookieUtil.readLoginToken(httpServletRequest);
        if (StringUtils.isNotEmpty(loginToken)){
            String userJsonStr = RedisShardedPoolUtil.get(loginToken);
            user = JsonUtil.string2Obj(userJsonStr,User.class);
        }
        if (user == null || (user.getRole().intValue() != Const.Role.ROLE_ADMIN)) {
            httpServletResponse.reset();  // 重置response，否则报异常
            httpServletResponse.setCharacterEncoding("UTF-8"); // 设置编码
            httpServletResponse.setContentType("application/json;charset=UTF-8"); // 设置返回值类型，因为接口全是json类型

            PrintWriter out = httpServletResponse.getWriter();
            // 由于富文本插件返回值的特俗要求，需要特殊处理
            if (user == null) {
                if (StringUtils.equals(className,"ProductManageController") && StringUtils.equals(methodName,"richtextImgUpload")){
                    Map resultMap = Maps.newHashMap();
                    resultMap.put("success",false);
                    resultMap.put("msg","请登录管理员");
                    out.print(JsonUtil.obj2String(resultMap));
                }else {
                    out.print(JsonUtil.obj2String(ServerResponse.createByErrorMessage("拦截器拦截，用户未登录")));
                }
            } else {
                if (StringUtils.equals(className,"ProductManageController") && StringUtils.equals(methodName,"richtextImgUpload")) {
                    Map resultMap = Maps.newHashMap();
                    resultMap.put("success", false);
                    resultMap.put("msg", "无权限操作");
                    out.print(JsonUtil.obj2String(resultMap));
                }else {
                    out.print(JsonUtil.obj2String(ServerResponse.createByErrorMessage("拦截器拦截，用户无权限操作")));
                }
            }
            out.flush();
            out.close();
            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
