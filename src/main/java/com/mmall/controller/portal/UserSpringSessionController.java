package com.mmall.controller.portal;

import com.mmall.common.Const;
import com.mmall.common.ResponseCode;
import com.mmall.common.ServerResponse;
import com.mmall.pojo.User;
import com.mmall.service.IUserService;
import com.mmall.util.CookieUtil;
import com.mmall.util.JsonUtil;
import com.mmall.util.RedisShardedPoolUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user/springsession")
public class UserSpringSessionController {
    @Autowired
    private IUserService iUserService;

    // 用户登录
    @RequestMapping("login.do")
    @ResponseBody
    public ServerResponse<User> login(String username, String password, HttpSession session, HttpServletResponse response) {
        // service-->mybatis->dao
        ServerResponse<User> serverResponse = iUserService.login(username, password);
        if (serverResponse.isSuccess()) {
            // session.setAttribute(Const.CURRENT_USER, response.getData());
            CookieUtil.writeLoginToken(response,session.getId());
            RedisShardedPoolUtil.setEx(session.getId(),JsonUtil.obj2String(serverResponse.getData()),Const.RedisCacheExtime.REDIS_SESSION_EXTIME);
        }
        return serverResponse;
    }
    @RequestMapping("logout.do")
    @ResponseBody
    public ServerResponse<User> logout(HttpServletRequest request,HttpServletResponse response) {
        // service-->mybatis->dao
        String loginTooken = CookieUtil.readLoginToken(request);
        CookieUtil.delLoginToken(request,response);
        RedisShardedPoolUtil.del(loginTooken);
        return ServerResponse.createBySuccess();
    }

    // 获取用户信息
    @RequestMapping("get_user_info.do")
    @ResponseBody
    public ServerResponse<User> getUserInfo(HttpServletRequest request, HttpSession session) {
        /*String loginToken = CookieUtil.readLoginToken(request);
        if (StringUtils.isEmpty(loginToken)){
            return ServerResponse.createByErrorMessage("用户未登录，无法获取当前用户的信息");
        }
        String userJosnStr = RedisShardedPoolUtil.get(loginToken);
        User user = JsonUtil.string2Obj(userJosnStr,User.class);*/
        User user = (User) session.getAttribute(Const.CURRENT_USER);
        if (user != null){
            return ServerResponse.createBySuccess(user);
        }
        return ServerResponse.createByErrorMessage("用户未登录，无法获取当前用户的信息");
    }

}
