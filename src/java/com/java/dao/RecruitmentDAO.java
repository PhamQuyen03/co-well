/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.dao;

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
public class RecruitmentDAO {

    public List<Recruitment> getAll() {

        List<Recruitment> recruitments = new ArrayList<>();
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String sql = "SELECT * FROM Recruitments ORDER BY ID DESC";
            ResultSet rs = stt.executeQuery(sql);
            while (rs.next()) {
                String name = rs.getString("name");
                String summary = rs.getString("summary");
                String des = rs.getString("description");
                String requirement = rs.getString("requirement");
                String interest = rs.getString("interest");
                String address = rs.getString("address");
                Date create_at = rs.getDate("create_at");
                Date start_recruitment = rs.getDate("start_recruitment");
                Date end_recruitment = rs.getDate("end_recruitment");
                int status = rs.getInt("status");
                int id = rs.getInt("id");
                Recruitment recruitment = new Recruitment(id, name, summary, des, requirement, interest, address, create_at, start_recruitment, end_recruitment, status);
                recruitments.add(recruitment);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(RecruitmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return recruitments;
    }

    public List<Recruitment> getPosted() {
        RecruitmentDAO db = new RecruitmentDAO();
        List<Recruitment> recs = new ArrayList<>();
        for (Recruitment item : db.getAll()) {
            if (item.getStatus() == 1) {
                recs.add(item);
            }
        }
        return recs;
    }

    public List<Recruitment> getWaited() {
        RecruitmentDAO db = new RecruitmentDAO();
        List<Recruitment> recs = new ArrayList<>();
        for (Recruitment item : db.getAll()) {
            if (item.getStatus() == 2) {
                recs.add(item);
            }
        }
        return recs;
    }

    public List<Recruitment> paginationPosted(int first, int last) {
        List<Recruitment> recs = new ArrayList<>();
        RecruitmentDAO db = new RecruitmentDAO();
        List<Recruitment> list = db.getPosted();
        if(last> list.size())
            last = list.size();
        for (int i = first; i < last; i++) {
            recs.add(list.get(i));
        }
        return recs;
    }

    public List<Recruitment> paginationWaited(int first, int last) {
        List<Recruitment> recs = new ArrayList<>();
        RecruitmentDAO db = new RecruitmentDAO();
        List<Recruitment> list = db.getWaited();
        if(last> list.size())
            last = list.size();
        for (int i = first; i < last; i++) {
            recs.add(list.get(i));
        }
        return recs;
    }

    public Recruitment findId(int id) {
        Recruitment rec = new Recruitment();
        RecruitmentDAO db = new RecruitmentDAO();
        for (Recruitment item : db.getAll()) {
            if (item.getId() == id) {
                rec = item;
                break;
            }
        }
        return rec;
    }
    public boolean insert(String name, String summary, String des, String requirement, String interest, String address, Date create_at, Date start_req, Date end_req, int status) {
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String insert = "INSERT INTO Recruitments VALUES (N'" + name + "',N'" + summary + "', N'" + des + "', N'" + requirement + "', N'" + interest + "', N'" + address + "', '" + create_at + "','" + start_req + "','" + end_req + "', " + status + ")";
            stt.executeUpdate(insert);
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(RecruitmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean update(int id, String name, String summary, String des, String requirement, String interest, String address, Date create_at, Date start_req, Date end_req, int status) {
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String update = "UPDATE Recruitments SET name = N'" + name + "', summary = N'" + summary + "', description = N'" + des + "', requirement = N'" + requirement + "', interest = N'" + interest + "', address = N'" + address + "', create_at = '" + create_at + "', start_recruitment = '" + start_req + "', end_recruitment = '" + end_req + "', status = " + status + "WHERE id = " + id;
            stt.executeUpdate(update);
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(RecruitmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean delete(int id) {
        try {
            Connection con = ConnectDB.Connected();
            Statement stt = con.createStatement();
            String delete = "DELETE FROM Recruitments WHERE ID = " + id;
            stt.executeUpdate(delete);
            con.close();
            return true;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(RecruitmentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
