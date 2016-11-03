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
public class Recruitment {
    private int id;
    private String name;
    private  String image;
    private String description;
    private String requirement;
    private String interest;
    private String address;
    private Date create_at;
    private Date start_recruitment;
    private Date end_recruitment;
    private int status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getRequirement() {
        return requirement;
    }

    public void setRequirement(String requirement) {
        this.requirement = requirement;
    }

    public String getInterest() {
        return interest;
    }

    public void setInterest(String interest) {
        this.interest = interest;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getCreate_at() {
        return create_at;
    }

    public void setCreate_at(Date create_at) {
        this.create_at = create_at;
    }

    public Date getStart_recruitment() {
        return start_recruitment;
    }

    public void setStart_recruitment(Date start_recruitment) {
        this.start_recruitment = start_recruitment;
    }

    public Date getEnd_recruitment() {
        return end_recruitment;
    }

    public void setEnd_recruitment(Date end_recruitment) {
        this.end_recruitment = end_recruitment;
    }

    public Recruitment() {
    }

    public Recruitment(int id, String name, String image, String description, String requirement, String interest, String address, Date create_at, Date start_recruitment, Date end_recruitment, int status) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.description = description;
        this.requirement = requirement;
        this.interest = interest;
        this.address = address;
        this.create_at = create_at;
        this.start_recruitment = start_recruitment;
        this.end_recruitment = end_recruitment;
        this.status = status;
    }
    
}
