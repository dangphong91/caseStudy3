package com.phong.pay.dao;

import com.phong.connectSQL.ConnecSQL;
import com.phong.order.model.Order;
import com.phong.pay.model.Pay;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PayDAO implements IPayDAO {
    private final ConnecSQL CONNECTSQL = new ConnecSQL();

    private static final String SELECT_ALL = "SELECT * FROM pays;";
    private static final String INSERT = "INSERT INTO pays (user, nameProduct, typeProduct, priceProduct, countProduct) " +
            "VALUES (?,?,?,?,?);";
    private static final String SEARCH = "SELECT * FROM pays WHERE user=?;";
    private static final String COUNT_PAY = "SELECT COUNT(user) AS countPay FROM pays";
    private static final String DELETE = "DELETE FROM pays WHERE id=?;";

    public PayDAO() {
    }

    @Override
    public void insertPay(Pay pay) throws SQLException {
        System.out.println(INSERT);
        try (Connection connection = CONNECTSQL.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT)) {
            preparedStatement.setString(1, pay.getUser());
            preparedStatement.setString(2, pay.getName());
            preparedStatement.setString(3, pay.getType());
            preparedStatement.setDouble(4, pay.getPrice());
            preparedStatement.setInt(5, pay.getCount());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Pay> selectAllPays() {
        List<Pay> pays = new ArrayList<>();
        try (Connection connection = CONNECTSQL.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("idPay");
                String user = rs.getString("user");
                String date = rs.getString("datePay");
                String name = rs.getString("nameProduct");
                String type = rs.getString("typeProduct");
                double price = rs.getDouble("priceProduct");
                int count = rs.getInt("countProduct");
                pays.add(new Pay(id,user, date, name, type, price, count));
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return pays;
    }

    @Override
    public boolean deletePay(int id) throws SQLException {
        return false;
    }

    @Override
    public List<Pay> searchPays(String key) {
        List<Pay> pays = new ArrayList<>();
        try (Connection connection = CONNECTSQL.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH)) {
            preparedStatement.setString(1, key);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("idPay");
                String user = rs.getString("user");
                String date = rs.getString("datePay");
                String name = rs.getString("nameProduct");
                String type = rs.getString("typeProduct");
                double price = rs.getDouble("priceProduct");
                int count = rs.getInt("countProduct");
                pays.add(new Pay(id,user, date, name, type, price, count));
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return pays;
    }

    public int getCount(){
        int count = 0;
        try (Connection connection = CONNECTSQL.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(COUNT_PAY)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                count = rs.getInt("countPay");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
}
