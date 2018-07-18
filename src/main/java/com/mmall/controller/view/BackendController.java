package com.mmall.controller.view;

import com.mmall.common.Const;
import com.mmall.common.ServerResponse;
import com.mmall.service.ICategoryService;
import com.mmall.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/manage/view")
public class BackendController {

    @Autowired
    private IProductService iProductService;

    @Autowired
    private ICategoryService iCategoryService;

    @RequestMapping("login")
    public String login(){
        return "manage_login";
    }

    @RequestMapping("index")
    public ModelAndView index(HttpSession session, @RequestParam(value = "pageNum",defaultValue = "1") int pageNum, @RequestParam(value = "pageSize",defaultValue = "10") int pageSize){
        ModelAndView modelAndView = new ModelAndView();
        if (null == session.getAttribute(Const.CURRENT_USER)) {
            modelAndView.setViewName("manage_login");
            return modelAndView;
        }else {
            ServerResponse serverResponse = iProductService.getProductList(pageNum,pageSize);
            modelAndView.addObject("data",serverResponse.getData());
            modelAndView.setViewName("manage_index");
            return modelAndView;
        }
    }

    @RequestMapping("login_out")
    public String loginOut(HttpSession session){
        if (null == session.getAttribute(Const.CURRENT_USER)) {
            return "manage_login";
        }
        session.removeAttribute(Const.CURRENT_USER);
        return "manage_login";
    }

    @RequestMapping("add")
    public ModelAndView productAdd(HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        if (null == session.getAttribute(Const.CURRENT_USER)) {
            modelAndView.setViewName("manage_login");
            return modelAndView;
        }else {
            ServerResponse serverResponse = iCategoryService.getCategory();
            modelAndView.addObject("data",serverResponse.getData());
            modelAndView.setViewName("manage_add");
            return modelAndView;
        }
    }

    @RequestMapping("category")
    public ModelAndView productCatrgory(HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        if (null == session.getAttribute(Const.CURRENT_USER)) {
            modelAndView.setViewName("manage_login");
            return modelAndView;
        }else {
            ServerResponse serverResponse = iCategoryService.getCategory();
            modelAndView.addObject("data",serverResponse.getData());
            modelAndView.setViewName("manage_category");
            return modelAndView;
        }
    }
    @RequestMapping("update")
    public String productUpdate(HttpSession session,String prductId){
        if (null == session.getAttribute(Const.CURRENT_USER)) {
            return "manage_login";
        }else {
            return "manage_update";
        }
    }
}
