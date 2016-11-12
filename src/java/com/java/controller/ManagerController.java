/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.controller;

import com.java.dao.NewsDAO;
import com.java.model.News;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author tuong
 */
@Controller
public class ManagerController {
    NewsDAO mgNews = new NewsDAO();
    @RequestMapping(value = "/manager", method = RequestMethod.GET)
    public String index(Model model) {
        
        List<News> posted = mgNews.getPosted();
        List<News> wait = mgNews.getWaited();
        model.addAttribute("newsMg", posted);
        model.addAttribute("wait_newsMg", wait);
        return"admin/Manager";
    }
}
