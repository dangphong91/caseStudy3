package com.phong.user.dao;

import com.phong.connectSQL.ConnecSQL;
import com.phong.user.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements IUserDAO{

    private final ConnecSQL CONNECTSQL = new ConnecSQL();
    private static final String SELECT_ALL = "SELECT * FROM users;";
    private static final String INSERT = "INSERT INTO users(name, password, fullname, address, phone) " +
            "VALUES (?,?,?,?,?);";
    private static final String SELECT_NAME = "SELECT * FROM users WHERE name=?;";

    public UserDAO() {
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        try (Connection connection = CONNECTSQL.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String user = rs.getString("name");
                String fullName = rs.getString("fullname");
                String address = rs.getString("address");
                String phone = rs.getString("phone");
                users.add(new User(user, fullName, address, phone));
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    @Override
    public void insertUser(User user) {
        System.out.println(INSERT);
        try (Connection connection = CONNECTSQL.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT)){
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getFullName());
            preparedStatement.setString(4, user.getAddress());
            preparedStatement.setString(5, user.getPhone());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public User selectUser(String userName) {
        User user = null;
        try (Connection connection = CONNECTSQL.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_NAME)){
            preparedStatement.setString(1, userName);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String password = rs.getString("password");
                user = new User(name, password);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}
