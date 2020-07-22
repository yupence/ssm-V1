package com.zr.service.impl;

import com.zr.bean.User;
import com.zr.dao.IUserDao;
import com.zr.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


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

    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public void deleteByID(int id) {
        userDao.deleteByID(id);
    }

    @Override
    public void add(User user) {
        userDao.add(user);
    }

    @Override
    public User selectUserByID(int id) {
       return userDao.selectUserByID(id);
    }

    @Override
    public void update(User user) {
        userDao.update(user);
    }
}