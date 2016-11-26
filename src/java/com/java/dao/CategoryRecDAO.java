/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.dao;

import com.java.model.CategoryRec;
import java.sql.Connection;
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
public class CategoryRecDAO {
    
    public List<CategoryRec> getAll() {

        List<CategoryRec> categorys = new ArrayList<>();
        try {
            Connection con = ConnectDB.Connected();
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM Category_Rec ORDER BY ID DESC");
            while (rs.next()) {
                String name = rs.getString("name");
                int id = rs.getInt("id");
                CategoryRec category = new CategoryRec(id, name);
                categorys.add(category);

            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AdminDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categorys;
    }
}
