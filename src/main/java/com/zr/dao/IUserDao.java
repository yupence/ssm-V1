package com.zr.dao;

import com.zr.bean.User;

public interface IUserDao {
    User findUserByUserName(String username);
}
