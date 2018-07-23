package com.mmall.controller.view;

import com.mmall.common.ServerResponse;
import com.mmall.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class PortalController {

    @Autowired
    IProductService iProductService;

    @RequestMapping("/index")
    public ModelAndView portalIndex(HttpSession session){
        ModelAndView modelAndView = new ModelAndView();
        ServerResponse serverResponse = iProductService.getIndexProduct();
        modelAndView.addObject("productList",serverResponse.getData());
        modelAndView.setViewName("index");
        return modelAndView;
    }
}
