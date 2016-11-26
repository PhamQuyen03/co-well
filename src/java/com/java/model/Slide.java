/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.model;

/**
 *
 * @author tuong
 */
public class Slide {
    private int id;
    private  String name;
    private  String img;
    private String url;
    private String img1;

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

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getImg1() {
        return img1;
    }

    public void setImg1(String img1) {
        this.img1 = img1;
    }

    public Slide() {
    }

    public Slide(int id, String name, String img, String url, String img1) {
        this.id = id;
        this.name = name;
        this.img = img;
        this.url = url;
        this.img1 = img1;
    }
 
}
