/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.dao;

import com.java.model.About;
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
public class AboutDAO {

    public List<About> getALL() {

        List<About> abs = new ArrayList<>();
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String sql = "SELECT * FROM About ORDER BY ID DESC";
            ResultSet rs = stt.executeQuery(sql);
            while (rs.next()) {
                String title = rs.getString("title");
                String img = rs.getString("image");
                String content = rs.getString("contents");
                Date create_at = rs.getDate("created_at");
                Date update_at = rs.getDate("updated_at");
                int status = rs.getInt("status");
                int id = rs.getInt("id");
                About ab = new About(id, title, img, content, create_at, update_at, status);
                abs.add(ab);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AboutDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return abs;
    }

    public AboutDAO() {
    }
    
    public List<About> getAboutPosted() {
        AboutDAO db = new AboutDAO();
        List<About> abouts = new ArrayList<>();
        List<About> list = db.getALL();
        for (About about : list) {
            if (about.getStatus() == 1) {
                abouts.add(about);
            }
        }
        return abouts;
    }
    
    public List<About> getAboutWaited() {
        AboutDAO db = new AboutDAO();
        List<About> abouts = new ArrayList<>();
        List<About> list = db.getALL();
        for (About about : list) {
            if (about.getStatus() == 2) {
                abouts.add(about);
            }
        }
        return abouts;
    }
    
    public List<About> paginationPosted(int first, int last) {
        AboutDAO db = new AboutDAO();
        List<About> abouts = new ArrayList<>();
        List<About> list = db.getAboutPosted();
        for (int i = first; i < last; i++) {
            abouts.add(list.get(i));
        }
        return abouts;
    }
    
    public List<About> paginationWaited(int first, int last) {
        AboutDAO db = new AboutDAO();
        List<About> abouts = new ArrayList<>();
        List<About> list = db.getAboutWaited();
        for (int i = first; i < last; i++) {
            abouts.add(list.get(i));
        }
        return abouts;
    }
    
    public About findById(int id) {
        AboutDAO db = new AboutDAO();
        About about = new About();
        for(About item : db.getALL()) {
            if(item.getId() == id) {
                about = item;
                break;
            }
        }
        return about;
    }
    
    public boolean insert(String title, String img, String contents, Date create_at, Date update_at, int status) {

        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String insert = "INSERT INTO About VALUES (N'" + title + "','" + img + "', N'" + contents + "', '" + create_at + "', '" + update_at + "', " + status + ")";
            stt.executeUpdate(insert);
            con.close();
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AboutDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

    public boolean update(int id, String title, String img, String contents, Date create_at, Date update_at, int status) {
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String update = "UPDATE About SET title = N'" + title + "',image = '" + img + "', contents = N'" + contents + "', created_at = '" + create_at + "', updated_at = '" + update_at + "', status = " + status + "WHERE id = " + id;
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
            String delete = "DELETE FROM About WHERE ID = " + id;
            stt.executeUpdate(delete);
            con.close();
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AboutDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    
}
