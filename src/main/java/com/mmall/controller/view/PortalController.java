package com.mmall.controller.view;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class PortalController {


    @RequestMapping("/index")
    public ModelAndView portalIndex(HttpSession session){
        return null;
    }

}
