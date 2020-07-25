package com.zr.dao;

import com.zr.bean.Role;
import com.zr.bean.UserRole;

import java.util.List;

public interface IRoleDao {
    List<Integer> findRoleIdsByUserId(int id);

    List<Role> findNotRoleByUserId(int id);
    void addRole(UserRole userRole);
}
