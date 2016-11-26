/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.dao;

import com.java.model.Status;
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
public class StatusDAO {
    public List<Status> getAll() {

        List<Status> list = new ArrayList<>();
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String sql = "SELECT * FROM Status ORDER BY ID";
            ResultSet rs = stt.executeQuery(sql);
            while (rs.next()) {
                String name = rs.getString("name");
                int id = rs.getInt("id");
                Status status = new Status(id, name);
                list.add(status);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(RecruitmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
