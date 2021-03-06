package com.mmall.controller.view;

import com.google.common.collect.Maps;
import com.mmall.common.Const;
import com.mmall.common.ServerResponse;
import com.mmall.pojo.Product;
import com.mmall.pojo.User;
import com.mmall.service.ICategoryService;
import com.mmall.service.IFileService;
import com.mmall.service.IProductService;
import com.mmall.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("/manage")
public class BackendController {

    @Autowired
    private IProductService iProductService;

    @Autowired
    private ICategoryService iCategoryService;

    @Autowired
    private IUserService iUserService;

    @RequestMapping("login")
    public String login(){
        return "manage_login";
    }

    @RequestMapping("index")
    public ModelAndView index(HttpSession session, @RequestParam(value = "pageNum",defaultValue = "1") int pageNum, @RequestParam(value = "pageSize",defaultValue = "11") int pageSize){
        ModelAndView modelAndView = new ModelAndView();
        ServerResponse serverResponse = iProductService.getProductList(pageNum,pageSize);
        modelAndView.addObject("data",serverResponse.getData());
        modelAndView.setViewName("manage_index");
        return modelAndView;

    }

    @RequestMapping("login_out")
    public String loginOut(HttpSession session){
        session.removeAttribute(Const.ADMIN_USER);
        return "redirect:/manage/login";
    }

    @RequestMapping("add")
    public ModelAndView productAdd(HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        ServerResponse serverResponse = iCategoryService.getAllCategory();
        modelAndView.addObject("data",serverResponse.getData());
        modelAndView.setViewName("manage_add");
        return modelAndView;
    }

    @RequestMapping("category")
    public ModelAndView productCatrgory(HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        ServerResponse serverResponse = iCategoryService.getAllCategory();
        modelAndView.addObject("data",serverResponse.getData());
        modelAndView.setViewName("manage_category");
        return modelAndView;

    }
    @RequestMapping("update")
    public ModelAndView productUpdate(HttpSession session,Integer productId){
        ModelAndView modelAndView = new ModelAndView();
        Map data = Maps.newHashMap();
        ServerResponse serverResponse1 = iProductService.getProductDetail(productId);
        ServerResponse serverResponse2 = iCategoryService.getAllCategory();
        data.put("categoryList",serverResponse2.getData());
        data.put("productVo",serverResponse1.getData());
        modelAndView.addAllObjects(data);
        modelAndView.setViewName("manage_update");
        return modelAndView;
    }

    @RequestMapping("request404")
    public String request404(){
        return ("404");
    }
}
