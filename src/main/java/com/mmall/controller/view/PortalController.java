package com.mmall.controller.view;

import com.google.common.collect.Maps;
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
import java.util.List;
import java.util.Map;

@Controller
public class PortalController {

    @Autowired
    IProductService iProductService;

    @Autowired
    ICategoryService iCategoryService;
    @RequestMapping("/index")
    public ModelAndView portalIndex(){
        ModelAndView modelAndView = new ModelAndView();
        ServerResponse serverResponse = iProductService.getIndexProduct();
        modelAndView.addObject("productList",serverResponse.getData());
        modelAndView.setViewName("index");
        return modelAndView;
    }

    @RequestMapping("/list")
    public ModelAndView list(@RequestParam(value = "keyword",required = false) String keyword,
                             @RequestParam(value = "categoryId",required = false) Integer categoryId,
                             @RequestParam(value = "pageNum",defaultValue = "1") int pageNum,
                             @RequestParam(value = "pageSize",defaultValue = "24") int pageSize,
                             @RequestParam(value = "orderBy",defaultValue = "") String orderBy) {
        ModelAndView modelAndView = new ModelAndView();
        ServerResponse serverResponseProduct = iProductService.getProductByKeywordCategory(keyword,categoryId,pageNum,pageSize,orderBy);
        ServerResponse serverResponseCategory = iCategoryService.getCategory(categoryId);

        Map map = Maps.newHashMap();
        map.put("categoryList",serverResponseCategory.getData());
        map.put("productPageInfo",serverResponseProduct.getData());
        modelAndView.addAllObjects(map);
        modelAndView.setViewName("list");
        return modelAndView;
    }

    // 退出登录
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        if (null == session.getAttribute(Const.CURRENT_USER)) {
            return "redirect:/index";
        }
        session.removeAttribute(Const.CURRENT_USER);
        return "redirect:/index";
    }

    @RequestMapping("/login")
    public String login(HttpSession session) {
        return "sign_in";
    }
    @RequestMapping("/search")
    public String search(HttpSession session) {
        return "search";
    }
    @RequestMapping("/register")
    public String register(HttpSession session) {
        return "register";
    }
    @RequestMapping("/shopping_cart")
    public String shopping_cart(HttpSession session) {
        return "shopping_cart";
    }
    @RequestMapping("/product_detail")
    public ModelAndView productDetail(HttpSession session,Integer productId) {
        ModelAndView modelAndView = new ModelAndView();
        ServerResponse serverResponse = iProductService.getProductDetail(productId);
        modelAndView.addObject("product",serverResponse.getData());
        modelAndView.setViewName("commodity_details");
        return modelAndView;

    }
}
