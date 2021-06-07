package com.phong.order.dao;

import com.phong.order.model.Order;

import java.sql.SQLException;
import java.util.List;

public interface IOrderDAO {
    void insertOrder(Order order) throws SQLException;
    List<Order> selectOrderByUser(String user);
    boolean deleteOrder(int id) throws SQLException;
    Order selectOrderById(int id);
}