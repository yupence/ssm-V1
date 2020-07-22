package com.zr.dao;

import com.zr.bean.User;

import java.util.List;

public interface IUserDao {
    User findUserByUserName(String username);
    List<User> findAll();

    void deleteByID(int id);

    void add(User user);

    User selectUserByID(int id);

    void update(User user);
}
