package com.zr.service;

import com.zr.bean.PageInfo;
import com.zr.bean.User;

public interface IUserService {
    int login(String username, String password);
    PageInfo<User> findAll(int currentPage,String username);
    void deleteByID(int id);
    void add(User user);
    User selectUserByID(int id);
    void update(User user);

}
