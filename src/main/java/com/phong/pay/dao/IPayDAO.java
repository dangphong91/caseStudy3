package com.phong.pay.dao;


import com.phong.pay.model.Pay;

import java.sql.SQLException;
import java.util.List;

public interface IPayDAO {
    void insertPay(Pay pay) throws SQLException;
    List<Pay> selectAllPays();
    boolean deletePay(int id) throws SQLException;
    List<Pay> searchPays(String key);
}
