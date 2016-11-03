/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.model;

import java.sql.Date;

/**
 *
 * @author tuong
 */
public class About {
    private int id;
    private  String title;
    private String image;
    private String contents;
    private Date create_at;
    private Date update_at;
    private int status;

    public About(int id, String title, String image, String contents, Date create_at, Date update_at, int status) {
        this.id = id;
        this.title = title;
        this.image = image;
        this.contents = contents;
        this.create_at = create_at;
        this.update_at = update_at;
        this.status = status;
    }

    public About() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public Date getCreate_at() {
        return create_at;
    }

    public void setCreate_at(Date create_at) {
        this.create_at = create_at;
    }

    public Date getUpdate_at() {
        return update_at;
    }

    public void setUpdate_at(Date update_at) {
        this.update_at = update_at;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
}
