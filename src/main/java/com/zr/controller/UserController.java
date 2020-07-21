package com.zr.controller;

import com.zr.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping
public class UserController {

    @Autowired
    private IUserService userService;

    @RequestMapping("login.do")
    public ModelAndView login(String username,String password){
        boolean flag = userService.login(username, password);
        ModelAndView modelAndView = new ModelAndView();
        if(flag==true){
            modelAndView.setViewName("../ok");
        }else {
            modelAndView.setViewName("../failure");
        }
        return modelAndView;
    }
}