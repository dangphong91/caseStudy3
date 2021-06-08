package com.phong.order.dao;

import com.phong.connectSQL.ConnecSQL;
import com.phong.order.model.Order;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO implements IOrderDAO {
    private final ConnecSQL CONNECTSQL = new ConnecSQL();

    private static final String INSERT = "INSERT INTO orders (account, idProduct, count) " +
            "VALUES (?,?,1);";
    private static final String COUNT_ORDER = "SELECT COUNT(account) AS count FROM orders WHERE account=?;";
    private static final String SELECT_USER = "SELECT o.id AS idOrder, o.date AS dateOrder, p.name AS nameProduct, p.type AS typeProduct, p.price AS priceProduct, o.count AS countOrder" +
            " FROM orders o INNER JOIN products p ON o.idProduct = p.id WHERE o.account=?;";
    private static final String DELETE = "DELETE FROM orders WHERE id=?;";
    private static final String SELECT_ID = "SELECT p.name AS nameProduct, p.type AS typeProduct, p.price AS priceProduct, o.count AS countOrder" +
            " FROM orders o INNER JOIN products p ON o.idProduct = p.id WHERE o.id=?;";

    @Override
    public void insertOrder(Order order){
        System.out.println(INSERT);
        try (Connection connection = CONNECTSQL.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT)) {
            preparedStatement.setString(1,order.getAccount());
            preparedStatement.setInt(2, order.getIdProduct());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int getCount(String account){
        int count = 0;
        try (Connection connection = CONNECTSQL.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(COUNT_ORDER)) {
            preparedStatement.setString(1,account);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                count = rs.getInt("count");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    @Override
    public List<Order> selectOrderByUser(String user) {
        List<Order> orders = new ArrayList<>();
        try (Connection connection = CONNECTSQL.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER)) {
            preparedStatement.setString(1, user);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("idOrder");
                String date = rs.getString("dateOrder");
                String name = rs.getString("nameProduct");
                String type = rs.getString("typeProduct");
                double price = rs.getDouble("priceProduct");
                int count = rs.getInt("countOrder");
                orders.add(new Order(id, date, name, type, price, count));
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    @Override
    public boolean deleteOrder(int id) throws SQLException {
        boolean rowDelete;
        try (Connection connection = CONNECTSQL.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE)){
            preparedStatement.setInt(1, id);
            rowDelete = preparedStatement.executeUpdate() >0;
        }
        return rowDelete;
    }

    @Override
    public Order selectOrderById(int id) {
        Order order = null;
        try (Connection connection = CONNECTSQL.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ID)){
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("nameProduct");
                String type = rs.getString("typeProduct");
                double price = rs.getDouble("priceProduct");
                int count = rs.getInt("countOrder");
                order = new Order(name, type, price, count);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }
}
