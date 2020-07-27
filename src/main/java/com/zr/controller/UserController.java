package com.zr.controller;

import com.zr.bean.PageInfo;
import com.zr.bean.Role;
import com.zr.bean.User;
import com.zr.service.IRoleService;
import com.zr.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
// 处理user路径下的请求
@RequestMapping("user")
public class UserController {

    @Autowired
    private IUserService userService;

    @Autowired
    private IRoleService roleServive;
// 处理登录请求
    @RequestMapping("login.do")
    public ModelAndView login(User user,HttpSession session){
        int id = userService.login(user.getUsername(), user.getPassword());
        ModelAndView modelAndView = new ModelAndView();
        if(id !=-1){
            List<Integer> roleIds = roleServive.findRoleByUserId(id);
            session.setAttribute("roleIds",roleIds);
            session.setAttribute("user",user);
            modelAndView.setViewName("main");
        }else {
            modelAndView.setViewName("../failer");
        }
        return modelAndView;
    }
//  查找所有用户请求
    @RequestMapping("findAll.do")
    public ModelAndView findAll(@RequestParam(defaultValue = "1") int currentPage, String username,
             @RequestParam(defaultValue = "0") int type,
             HttpSession session){
        if(type==1){
            session.setAttribute("searchname",username);
        }else if(type==0) {
            username = (String) session.getAttribute("searchname");
        }else if(type==2){
            session.removeAttribute("searchname");
        }

        PageInfo<User> pageInfo = userService.findAll(currentPage,username);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("user-list");
        mv.addObject("pageInfo",pageInfo);
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

    @RequestMapping("logout.do")
    public String logout(HttpSession session){
        session.removeAttribute("user");
        return "../login";
    }
    @RequestMapping("toAddRole.do")
    public ModelAndView toAddRole(int id){
        List<Role> roleList = roleServive.findNotRoleByUserId(id);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("roles",roleList);
        modelAndView.setViewName("user-role-add");
        modelAndView.addObject("id",id);
        return modelAndView;
    }

    @RequestMapping("addRole.do")
    public String addRole(String roleIds,String userId){
        String[] strs = roleIds.split(",");
        List<Integer> ids = new ArrayList<>();
        for(String s:strs){
            ids.add(Integer.parseInt(s));
        }
        roleServive.addRole(ids,Integer.parseInt(userId));
        return "redirect:findAll.do";

    }

    @PostMapping("deleteAll.do")
    @ResponseBody
    public String deleteAll(String userList){
        String[] strings = userList.split(",");
        List<Integer> ids = new ArrayList<>();
        for(String s:strings){
            ids.add(Integer.parseInt(s));
        }
        userService.deleteAll(ids);
        return "";
    }


}