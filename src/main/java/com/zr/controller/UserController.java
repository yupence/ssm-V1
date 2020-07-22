package com.zr.controller;

import com.zr.bean.User;
import com.zr.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
// 处理user路径下的请求
@RequestMapping("user")
public class UserController {

    @Autowired
    private IUserService userService;
// 处理登录请求
    @RequestMapping("login.do")
    public ModelAndView login(User user){
        String username = user.getUsername();
        String password = user.getPassword();
        boolean flag = userService.login(username, password);
        ModelAndView modelAndView = new ModelAndView();
        if(flag==true){
            modelAndView.setViewName("main");
        }else {
            modelAndView.setViewName("../failer");
        }
        return modelAndView;

    }
//  查找所有用户请求
    @RequestMapping("findAll.do")
    public ModelAndView findAll(){
        List<User> users = userService.findAll();
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user-list");
        mv.addObject("users",users);
        return mv;
    }
// 删除用户请求
    @RequestMapping("deleteByID.do")
    public String delete(int id){
        userService.deleteByID(id);
        return "redirect:findAll.do";
    }
// 添加用户请求
    @RequestMapping("add.do")
    public String add(User user){
        userService.add(user);
        return "redirect:findAll.do";
    }
// 确定更新用户对象
    @RequestMapping("toUpdate.do")
    public ModelAndView toUpdate(int id){
        User user = userService.selectUserByID(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("user",user);
        modelAndView.setViewName("user-update");
        return modelAndView;
    }
// 进行更新请求
    @RequestMapping("update.do")
    public String update(User user){
        userService.update(user);
        return "redirect:findAll.do";

    }
}