/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.dao;

import com.java.model.User;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author tuong
 */
public class UserDAO {

    public User check(String email, String pass) {

        User user = new User();
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String sql = "SELECT * FROM Users WHERE email = N'" + email + "' and password= N'" + pass + "'";
            ResultSet rs = stt.executeQuery(sql);
            while (rs.next()) {
                int id = rs.getInt("id");
                String email1 = rs.getString("email");
                String password = rs.getString("password");
                String name = rs.getString("name");
                int role = rs.getInt("role");
                user = new User(name, password, email, role, id);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            ex.getStackTrace();
        }
        return user;
    }
}
