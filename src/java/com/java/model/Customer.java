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
public class Customer {
    private int id;
    private String name;
    private String logo;
    private String description;
    private String contents;
    private String adress;
    private Date create_at;
    private Date update_at;

    public Customer(int id, String name, String logo, String description, String contents, String adress, Date create_at, Date update_at) {
        this.id = id;
        this.name = name;
        this.logo = logo;
        this.description = description;
        this.contents = contents;
        this.adress = adress;
        this.create_at = create_at;
        this.update_at = update_at;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getContents() {
        return contents;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
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
    
    
    
}
