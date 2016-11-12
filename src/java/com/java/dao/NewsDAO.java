/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.dao;

import com.java.model.News;
import java.sql.Array;
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
public class NewsDAO {

    public NewsDAO() {
    }

    public List<News> getAll() {
        List<News> news = new ArrayList<>();
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String sql = "SELECT * FROM News ORDER BY ID DESC";
            ResultSet rs = stt.executeQuery(sql);
            while (rs.next()) {
                int id_category = rs.getInt("id_category");
                String title = rs.getString("title");
                String description = rs.getString("description");
                String content = rs.getString("contents");
                String img = rs.getString("image");
                String author = rs.getString("AUTHOR");
                Date create_at = rs.getDate("create_at");
                Date update_at = rs.getDate("update_at");
                int status = rs.getInt("status");
                int id = rs.getInt("id");
                News n = new News(id, id_category, title, description, content, img, author, create_at, update_at, status);
                news.add(n);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return news;
    }

    public List<News> getPosted() {
        NewsDAO db = new NewsDAO();
        List<News> list = db.getAll();
        List<News> posted = new ArrayList<>();
        for (News item : list) {
            if (item.getStatus() == 1) {
                posted.add(item);
            }
        }
        return posted;
    }

    public List<News> getWaited() {
        NewsDAO db = new NewsDAO();
        List<News> list = db.getAll();
        List<News> post = new ArrayList<>();
        for (News item : list) {
            if (item.getStatus() == 2) {
                post.add(item);
            }
        }
        return post;
    }

    public News findById(int id) {
        NewsDAO db = new NewsDAO();
        News news = new News();
        List<News> list = db.getAll();
        for (News item : list) {

            if (item.getId() == id) {

                news = item;
                break;
            }
        }
        return news;
    }

    public List<News> findById_category(int id) {
        NewsDAO db = new NewsDAO();
        List<News> news = new ArrayList<>();
        List<News> list = db.getWaited();
        for (News item : list) {

            if (item.getId_category()== id)
                news.add(item);
        }
        return news;
    }

    public List<News> paginationPosted(int fist, int last) {
        NewsDAO db = new NewsDAO();
        List<News> list = db.getPosted();
        List<News> listPagination = new ArrayList<>();
        if(last> list.size())
            last = list.size();
        for (int i = fist; i < last; i++) {
            listPagination.add(list.get(i));
        }
        return listPagination;
    }

    public List<News> paginationWaited(int fist, int last) {
        NewsDAO db = new NewsDAO();
        List<News> list = db.getWaited();
        List<News> listPagination = new ArrayList<>();
        if(last> list.size())
            last = list.size();
        for (int i = fist; i < last; i++) {
            listPagination.add(list.get(i));
        }
        return listPagination;
    }
    
    public List<News> paginationCategory(int id_category, int fist, int last) {
        NewsDAO db = new NewsDAO();
        List<News> list = db.findById_category(id_category);
        List<News> listPagination = new ArrayList<>();
        if(last> list.size())
            last = list.size();
        for (int i = fist; i < last; i++) {
            listPagination.add(list.get(i));
        }
        return listPagination;
    }

    public boolean insert(int id_cate, String title, String des, String contents, String img, String author, Date create_at, Date update_at, int Status) {

        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String insert = "INSERT INTO News VALUES (" + id_cate + ",N'" + title + "','" + img + "', N'" + des + "', N'" + contents + "', N'" + author + "', '" + create_at + "', '" + update_at + "', " + Status + ")";
            stt.executeUpdate(insert);
            con.close();
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean update(int id, int id_category, String title, String des, String content, String img, String author, Date create_at, Date update_at, int Status) {
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String update = "UPDATE News " + "SET id_category = " + id_category + ", title = N'" + title + "',image = '" + img + "', description = N'" + des + "', contents = N'" + content + "', author = N'" + author + "', create_at = '" + create_at + "', update_at = '" + update_at + "', status = " + Status + "WHERE id = " + id;
            stt.executeUpdate(update);
            con.createStatement();
            con.close();
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean delete(int id) {
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String delete = "DELETE FROM News WHERE ID = " + id;
            stt.executeUpdate(delete);
            con.close();
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
