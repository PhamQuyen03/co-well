/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.dao;

import com.java.model.Customer;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tuong
 */
public class CustomerDAO {

    public List<Customer> getAll() {
        List<Customer> customers = new ArrayList<>();
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String sql = "SELECT * FROM Customer ORDER BY ID DESC";
            ResultSet rs = stt.executeQuery(sql);
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String logo = rs.getString("logo");
                String content = rs.getString("contents");
                String des = rs.getString("description");
                String address = rs.getString("address");
                Date create_at = rs.getDate("create_at");
                Date update_at = rs.getDate("update_at");
                Customer cus = new Customer(id, name, logo, des, content, address, create_at, update_at);
                customers.add(cus);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customers;
    }

    public boolean insert(String name, String logo, String address, String description, String contents, Date create_at, Date update_at) {

        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String insert = "INSERT INTO Customer VALUES (N'" + name + "','" + logo + "', N'" + address + "', N'" + description + "', N'" + contents + "', '" + create_at + "', '" + update_at + "')";
            stt.executeUpdate(insert);
            con.close();
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AboutDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

    public boolean update(int id, String name, String logo, String address, String description, String contents, Date create_at, Date update_at) {
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String update = "UPDATE Customer SET name = N'" + name + "',logo = '" + logo + "', contents = N'" + address + "', contents = N'" + description + "', contents = N'" + contents + "', create_at = '" + create_at + "', update_at = '" + update_at + "'" + "WHERE id = " + id;
            stt.executeUpdate(update);
            con.close();
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AboutDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean delete(int id) {
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String delete = "DELETE FROM Customer WHERE ID = " + id;
            stt.executeUpdate(delete);
            con.close();
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AboutDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
