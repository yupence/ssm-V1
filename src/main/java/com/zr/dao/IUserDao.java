package com.zr.dao;

import com.zr.bean.PageInfo;
import com.zr.bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IUserDao {
    User findUserByUserName(String username);
    List<User> findAll(@Param("start") int start,@Param("size") int size,@Param("username") String username);

    void deleteByID(int id);

    void add(User user);

    User selectUserByID(int id);

    void update(User user);
    int getTotalCount(@Param("username") String username);
    void deleteAll(@Param("ids") List<Integer> ids);

}
