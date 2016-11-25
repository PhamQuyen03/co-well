/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.dao;

import com.java.model.User;
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
public class AdminDAO {

    public List<User> getAll() {

        List<User> users = new ArrayList<>();
        try {
            Connection con = ConnectDB.Connected();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM Users ORDER BY ID DESC");
            while (rs.next()) {
                String email = rs.getString("email");
                String pass = rs.getString("password");
                String name = rs.getString("name");
                int role = rs.getInt("role");
                int id = rs.getInt("id");
                User user = new User(name, pass, email, role, id);
                users.add(user);

            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
    }

    public List<User> paginationList(int first, int num) {
        List<User> users = new ArrayList<>();
        try {
            Connection con = ConnectDB.Connected();
            Statement stmt = con.createStatement();
            String sql1 = "SELECT * FROM Users ORDER BY ID DESC OFFSET " + first + " ROWS FETCH NEXT " + num + " ROWS ONLY";
            String sql2 = "SELECT * FROM USERS ORDER BY ID DESC";
            ResultSet rs = stmt.executeQuery(sql1);
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String pass = rs.getString("password");
                int role = rs.getInt("role");
                int id = rs.getInt("ID");
                User user = new User(name, pass, email, role, id);
                users.add(user);

            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
    }

    public User login(String email, String pass) {

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

    public User findUser(int id) {
        User user = new User();
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String sql = "SELECT * FROM USERS WHERE ID = " + id;
            ResultSet rs = stt.executeQuery(sql);
            while (rs.next()) {
                String name = rs.getString("name");
                String pass = rs.getString("password");
                String email = rs.getString("email");
                int role = rs.getInt("role");
                user = new User(name, pass, email, role, id);
            }
            con.close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    public boolean insertUser(String email, String password, String name, int role) {

        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String sql = "INSERT INTO Users " + "VALUES ('" + email + "', '" + password + "', N'" + name + "', " + role + ")";
            stt.executeUpdate(sql);
            con.close();
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean updateUser(int id, String email, String password, String name, int role) {
        try {
            Connection Con = ConnectDB.Connected();
            Statement stmt = Con.createStatement();
            stmt.executeUpdate("UPDATE Users " + "SET email = N'" + email + "', password = N'" + password + "', name = N'" + name + "', ROLE = " + role + " WHERE ID = " + id);
            Con.close();
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean deleteUse(int id) {
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String sql = "DELETE FROM Users WHERE ID = " + id;
            stt.executeUpdate(sql);
            con.close();
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
