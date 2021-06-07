package com.phong.user.dao;

import com.phong.user.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
    void insertUser(User user) throws SQLException;
    User selectUser(String userName);
    List<User> selectAllUsers();
}
