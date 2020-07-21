package com.zr.service.impl;

import com.zr.bean.User;
import com.zr.dao.IUserDao;
import com.zr.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserServiceImpl implements IUserService {
    @Autowired
    private IUserDao userDao;

    @Override
    public boolean login(String username, String password) {
        User user = userDao.findUserByUserName(username);
        if(user!=null&&user.getPassword().equals(password)){
            return true;
        }
        return false;

    }
}