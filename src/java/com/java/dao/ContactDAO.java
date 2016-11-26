/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.dao;

import com.java.model.Contact;
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
public class ContactDAO {
    
    public List<Contact> getContact() {

        List<Contact> contacts = new ArrayList<>();
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String sql = "SELECT * FROM Contact ORDER BY ID DESC";
            ResultSet rs = stt.executeQuery(sql);
            while (rs.next()) {
                String name = rs.getString("name");
                String company = rs.getString("company");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String branch = rs.getString("branch");
                String content = rs.getString("content");
                int id = rs.getInt("id");
//                Contact contact = new Contact(id, name, company, email, phone, branch, create_at, update_at);
//                contacts.add(contact);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ContactDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return contacts;
    }
    public boolean insert(String name, String company, String email, String phone, String branch, String content) {
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String insert = "INSERT INTO Contact VALUES (N'" + name + "', N'" + company + "', N'" + email + "', N'" + phone + "', N'" + branch + "', N'" + content + "'"+")";
            stt.executeUpdate(insert);
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ContactDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
