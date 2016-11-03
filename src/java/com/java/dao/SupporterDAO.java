/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.dao;

import com.java.model.About;
import com.java.model.Contact;
import com.java.model.News;
import com.java.model.Recruitment;
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
public class SupporterDAO {

    public List<News> getAllNewsPosted() {

        List<News> ns = new ArrayList<>();
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String sql = "SELECT * FROM News WHERE STATUS =" + 1 + "ORDER BY ID DESC";
            ResultSet rs = stt.executeQuery(sql);
            while (rs.next()) {
                int id_category = rs.getInt("id_category");
                String title = rs.getString("title");
                String description = rs.getString("description");
                String content = rs.getString("contents");
                String author = rs.getString("AUTHOR");
                Date create_at = rs.getDate("create_at");
                Date update_at = rs.getDate("update_at");
                int status = rs.getInt("status");
                int id = rs.getInt("id");
                News n = new News(id, id_category, title, description, content, author, create_at, update_at, status);
                ns.add(n);
            }
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ns;
    }

    public List<News> getNewsPost() {

        List<News> ns = new ArrayList<>();
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String sql = "SELECT * FROM NEWS WHERE STATUS =" + 2 + "ORDER BY ID DESC";
            ResultSet rs = stt.executeQuery(sql);
            while (rs.next()) {
                int id_category = rs.getInt("id_category");
                String title = rs.getString("title");
                String description = rs.getString("description");
                String content = rs.getString("contents");
                String author = rs.getString("AUTHOR");
                Date create_at = rs.getDate("create_at");
                Date update_at = rs.getDate("update_at");
                int status = rs.getInt("status");
                int id = rs.getInt("id");
                News n = new News(id, id_category, title, description, content, author, create_at, update_at, status);
                ns.add(n);
            }
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ns;
    }

    public News findNewsById(int id) {
        News n = new News();
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String sql = "SELECT * FROM NEWS WHERE ID = " + id;
            ResultSet rs = stt.executeQuery(sql);
            while (rs.next()) {
                int id_category = rs.getInt("id_category");
                String title = rs.getString("title");
                String description = rs.getString("description");
                String content = rs.getString("contents");
                String author = rs.getString("AUTHOR");
                Date create_at = rs.getDate("create_at");
                Date update_at = rs.getDate("update_at");
                int status = rs.getInt("status");
                n = new News(id, id_category, title, description, content, author, create_at, update_at, status);

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
            String sql = "SELECT * FROM NEWS WHERE HEADER = N'" + title + "'";
            ResultSet rs = stt.executeQuery(sql);
            while (rs.next()) {
                int id_category = rs.getInt("id_category");
                String description = rs.getString("description");
                String content = rs.getString("contents");
                String author = rs.getString("AUTHOR");
                Date create_at = rs.getDate("create_at");
                Date update_at = rs.getDate("update_at");
                int status = rs.getInt("status");
                int id = rs.getInt("id");
                n = new News(id, id_category, title, description, content, author, create_at, update_at, status);

            }
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public boolean insertNews(int id_cate, String title, String img, String des, String contents, String author, Date create_at, Date update_at, int Status) {

        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String insert = "INSERT INTO News VALUES (" + id_cate + ",N'" + title + "','" + img + "', N'" + des + "', N'" + contents + "', N'" + author + "', '" + create_at + "', '" + update_at + "', " + Status + ")";
            stt.executeUpdate(insert);
            con.close();
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean updateNews(int id, int id_category, String title, String img, String des, String content, String author, Date create_at, Date update_at, int Status) {
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String update = "UPDATE News " + "SET id_category = " + id_category + ", title = N'" + title + "',image = '" + img + "', description = N'" + des + "', contents = N'" + content + "', author = N'" + author + "', create_at = '" + create_at + "', update_at = '" + update_at + "', status = " + Status + "WHERE id = " + id;
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
            String delete = "DELETE FROM News WHERE ID = " + id;
            stt.executeUpdate(delete);
            con.close();
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public List<About> getAbout() {

        List<About> abs = new ArrayList<>();
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String sql = "SELECT * FROM About WHERE status =" + 2 + "ORDER BY ID DESC";
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
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return abs;
    }

    public About findAboutById(int id) {
        About ab = new About();
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String sql = "SELECT * FROM About WHERE id = " + id;
            ResultSet rs = stt.executeQuery(sql);
            while (rs.next()) {
                String title = rs.getString("title");
                String content = rs.getString("contents");
                String img = "img";
                Date create_at = rs.getDate("created_at");
                Date update_at = rs.getDate("updated_at");
                int status = rs.getInt("status");
                ab = new About(id, title, img, content, create_at, update_at, status);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ab;
    }

    public boolean insertAbout(String title, String img, String contents, Date create_at, Date update_at, int status) {

        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String insert = "INSERT INTO About VALUES (N'" + title + "','" + img + "', N'" + contents + "', '" + create_at + "', '" + update_at + "', " + status + ")";
            stt.executeUpdate(insert);
            con.close();
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

    public boolean updateAbout(int id, String title, String img, String contents, Date create_at, Date update_at, int status) {
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String update = "UPDATE About SET title = N'" + title + "',image = '" + img + "', contents = N'" + contents + "', created_at = '" + create_at + "', updated_at = '" + update_at + "', status = " + status + "WHERE id = " + id;
            stt.executeUpdate(update);
            con.close();
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean deleteAbout(int id) {
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String delete = "DELETE FROM About WHERE ID = " + id;
            stt.executeUpdate(delete);
            con.close();
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public List<Recruitment> getRecruitment() {

        List<Recruitment> recruitments = new ArrayList<>();
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String sql = "SELECT * FROM Recruitments WHERE STATUS =" + 2 + "ORDER BY ID DESC";
            ResultSet rs = stt.executeQuery(sql);
            while (rs.next()) {
                String name = rs.getString("name");
                String des = rs.getString("description");
                String requirement = rs.getString("requirement");
                String interest = rs.getString("interest");
                String address = rs.getString("address");
                String img = "img";
                Date create_at = rs.getDate("create_at");
                Date start_recruitment = rs.getDate("start_recruitment");
                Date end_recruitment = rs.getDate("end_recruitment");
                int status = rs.getInt("status");
                int id = rs.getInt("id");
                Recruitment recruitment = new Recruitment(id, name, img, des, requirement, interest, address, create_at, start_recruitment, end_recruitment, status);
                recruitments.add(recruitment);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return recruitments;
    }

    public List<Recruitment> paginationRec(int page, int num) {
        List<Recruitment> recs = new ArrayList<>();

        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String sql = "SELECT * FROM Recruitments ORDER BY ID DESC OFFSET " + page + " ROWS FETCH NEXT " + num + " ROWS ONLY";
            ResultSet rs = stt.executeQuery(sql);
            while (rs.next()) {
                String name = rs.getString("name");
                String des = rs.getString("description");
                String requirement = rs.getString("requirement");
                String interest = rs.getString("interest");
                String address = rs.getString("address");
                String img = "img";
                Date create_at = rs.getDate("create_at");
                Date start_recruitment = rs.getDate("start_recruitment");
                Date end_recruitment = rs.getDate("end_recruitment");
                int status = rs.getInt("status");
                int id = rs.getInt("id");
                Recruitment recruitment = new Recruitment(id, name, img, des, requirement, interest, address, create_at, start_recruitment, end_recruitment, status);
                recs.add(recruitment);
            }
            con.close();

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return recs;
    }

    public Recruitment findRecruitmentById(int id) {

        Recruitment recruitment = new Recruitment();
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String sql = "SELECT * FROM Recruitments WHERE ID = " + id;
            ResultSet rs = stt.executeQuery(sql);
            while (rs.next()) {
                String name = rs.getString("name");
                String des = rs.getString("description");
                String requirement = rs.getString("requirement");
                String interest = rs.getString("interest");
                String address = rs.getString("address");
                String img = "img";
                Date create_at = rs.getDate("create_at");
                Date start_recruitment = rs.getDate("start_recruitment");
                Date end_recruitment = rs.getDate("end_recruitment");
                int status = rs.getInt("status");
                recruitment = new Recruitment(id, name, img, des, requirement, interest, address, create_at, start_recruitment, end_recruitment, status);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return recruitment;
    }

    public boolean insertRecuitment(String name, String img, String des, String requirement, String interest, String address, Date create_at, Date start_req, Date end_req, int status) {
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String insert = "INSERT INTO Recruitments VALUES (N'" + name + "','" + img + "', N'" + des + "', N'" + requirement + "', N'" + interest + "', N'" + address + "', '" + create_at + "','" + start_req + "','" + end_req + "', " + status + ")";
            stt.executeUpdate(insert);
            return true;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean updateRecuitment(int id, String name, String img, String des, String requirement, String interest, String address, Date create_at, Date start_req, Date end_req, int status) {
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String update = "UPDATE Recruitments SET name = N'" + name + "', image = '" + img + "', description = N'" + des + "', requirement = N'" + requirement + "', interest = N'" + interest + "', address = N'" + address + "', create_at = '" + create_at + "', start_recruitment = '" + start_req + "', end_recruitment = '" + end_req + "', status = " + status + "WHERE id = " + id;
            stt.executeUpdate(update);
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean deleteRecruitment(int id) {
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String delete = "DELETE FROM Recruitments WHERE ID = " + id;
            stt.executeUpdate(delete);
            con.close();
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public List<Contact> getContact() {

        List<Contact> contacts = new ArrayList<>();
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String sql = "SELECT * FROM Contact WHERE STATUS =" + 1 + "ORDER BY ID DESC";
            ResultSet rs = stt.executeQuery(sql);
            while (rs.next()) {
                String name = rs.getString("name");
                String company = rs.getString("company");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String branch = rs.getString("branch");
                Date create_at = rs.getDate("create_at");
                Date update_at = rs.getDate("update_at");
                int status = rs.getInt("status");
                int id = rs.getInt("id");
                Contact contact = new Contact(id, name, company, email, phone, branch, create_at, update_at, status);
                contacts.add(contact);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return contacts;
    }

    public Contact findContactById(int id) {
        Contact contact = new Contact();
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String sql = "SELECT * FROM Contact WHERE ID = " + id;
            ResultSet rs = stt.executeQuery(sql);
            while (rs.next()) {
                String name = rs.getString("name");
                String company = rs.getString("company");
                String email = rs.getString("email");
                String phone = rs.getString("phone");
                String branch = rs.getString("branch");
                Date create_at = rs.getDate("create_at");
                Date update_at = rs.getDate("update_at");
                int status = rs.getInt("status");
                contact = new Contact(id, name, company, email, phone, branch, create_at, update_at, status);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return contact;
    }

    public boolean insertContact(String name, String company, String email, String phone, String branch, Date create_at, Date update_at, int status) {
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String insert = "INSERT INTO Contact VALUES (N'" + name + "', N'" + company + "', N'" + email + "', N'" + phone + "', N'" + branch + "', '" + create_at + "','" + update_at + "', " + status + ")";
            stt.executeUpdate(insert);
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean updateContact(int id, String name, String company, String email, String phone, String branch, Date create_at, Date update_at, int status) {
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String update = "UPDATE Recruitments SET name = N'" + name + "', company = N'" + company + "', email = N'" + email + "', phone = N'" + phone + "', branch = N'" + branch + "', create_at = '" + create_at + "', update_at = '" + update_at + "', status = " + status + ")";
            stt.executeUpdate(update);
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean dateleContact(int id) {
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String delete = "DELETE FROM Contact WHERE ID = " + id;
            stt.executeUpdate(delete);
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SupporterDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
