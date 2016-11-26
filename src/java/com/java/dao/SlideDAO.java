/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.dao;

import com.java.model.Slide;
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
public class SlideDAO {
    public List<Slide> getAll() {

        List<Slide> slides = new ArrayList<>();
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String sql = "SELECT * FROM Slide ORDER BY ID";
            ResultSet rs = stt.executeQuery(sql);
            while (rs.next()) {
                String name = rs.getString("name");
                String img = rs.getString("img");
                String img1 = rs.getString("img1");
                String url = rs.getString("url");
                int id = rs.getInt("id");
                Slide slide = new Slide(id, name, img, url, img1);
                slides.add(slide);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(RecruitmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return slides;
    }
    
    public List<Slide> getList(int first, int last) {
        List<Slide> slide = new ArrayList<>();
        SlideDAO db = new SlideDAO();
        for (int i = first; i < last; i++) {
            slide.add(db.getAll().get(i));
        }
        return slide;
    }
}
