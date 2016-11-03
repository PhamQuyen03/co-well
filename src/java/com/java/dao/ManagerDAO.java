/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.dao;

import com.java.model.News;
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
public class ManagerDAO {
    public List<News> getAll() {

        List<News> ns = new ArrayList<>();
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String sql = "SELECT * FROM NEWS WHERE STATUS =" + 1 + "ORDER BY ID DESC";
            ResultSet rs = stt.executeQuery(sql);
            while (rs.next()) {
                String header = rs.getString("HEADER");
                String content = rs.getString("CONTENTS");
                String author = rs.getString("AUTHOR");
                Date dateS = rs.getDate("DATE_START");
                Date dateE = rs.getDate("DATE_END");
                int status = rs.getInt("STATUS");
                int id = rs.getInt("ID");
//                News n = new News(id, header, content, author, dateS, dateE, status);
//                ns.add(n);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ns;
    }

    public List<News> getAllPosted() {

        List<News> ns = new ArrayList<>();
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String sql = "SELECT * FROM NEWS WHERE STATUS =" + 2 + "ORDER BY ID DESC";
            ResultSet rs = stt.executeQuery(sql);
            while (rs.next()) {
                String header = rs.getString("HEADER");
                String content = rs.getString("CONTENTS");
                String author = rs.getString("AUTHOR");
                Date dateS = rs.getDate("DATE_START");
                Date dateE = rs.getDate("DATE_END");
                int status = rs.getInt("STATUS");
                int id = rs.getInt("ID");
//                News n = new News(id, header, content, author, dateS, dateE, status);
//                ns.add(n);
            }
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ns;
    }

    public News findNews(int id) {
        News n = new News();
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String sql = "SELECT * FROM NEWS WHERE ID = " + id;
            ResultSet rs = stt.executeQuery(sql);
            while (rs.next()) {
                String header = rs.getString("HEADER");
                String content = rs.getString("CONTENTS");
                String author = rs.getString("AUTHOR");
                Date dateS = rs.getDate("DATE_START");
                Date dateE = rs.getDate("DATE_END");
                int status = rs.getInt("STATUS");
//                n = new News(id, header, content, author, dateS, dateE, status);

            }
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public News findNewsBytitle(String title) {
        News n = new News();
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String sql = "SELECT * FROM NEWS WHERE HEADER = '" + title + "'";
            ResultSet rs = stt.executeQuery(sql);
            while (rs.next()) {
                String header = rs.getString("HEADER");
                String content = rs.getString("CONTENTS");
                String author = rs.getString("AUTHOR");
                Date dateS = rs.getDate("DATE_START");
                Date dateE = rs.getDate("DATE_END");
                int status = rs.getInt("STATUS");
                int id = rs.getInt("ID");
//                n = new News(id, header, content, author, dateS, dateE, status);

            }
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

//    public boolean insertNews(String header, String textArea, String author, Date dateStart, Date dateEnd, int Status) {
//
//        try {
//            Connection con = ConnectDB.Connected();
//            Statement stt = con.createStatement();
//            String sql = "INSERT INTO NEWS " + "VALUES (N'" + header + "', N'" + textArea + "', N'" + author + "', '" + dateStart + "', '" + dateEnd + "', " + Status + ")";
//            stt.executeUpdate(sql);
//            con.close();
//            return true;
//        } catch (ClassNotFoundException | SQLException ex) {
//            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return false;
//    }

    public boolean updateNews(int id, String header, String textArea, String author, Date dateStart, Date dateEnd, int Status) {
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String update = "UPDATE News " + "SET HEADER = N'" + header + "', CONTENTS = N'" + textArea + "', AUTHOR = N'" + author + "', DATE_START = '" + dateStart + "', DATE_END = '" + dateEnd + "', STATUS = " + Status + "WHERE ID = " + id;
            stt.executeUpdate(update);
            con.createStatement();
            con.close();
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean deleteNEWS(int id) {
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String sql = "DELETE FROM NEWS" + "WHERE ID=" + id;
            stt.executeUpdate(sql);
            con.close();
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
