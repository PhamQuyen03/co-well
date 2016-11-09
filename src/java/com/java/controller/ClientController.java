/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.controller;

import com.java.dao.SupporterDAO;
import com.java.model.News;
import com.java.model.Recruitment;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author tuong
 */
@Controller
public class ClientController {
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model) {
        
        SupporterDAO recruitments = new SupporterDAO();
        List<Recruitment> recIndex = recruitments.paginationRec(0, 5);
        model.addAttribute("recIndex", recIndex);
        return "client/index";
    }
    @RequestMapping(value = "/news", method = RequestMethod.GET)
    public String getNews(Model model) {
        SupporterDAO news = new SupporterDAO();
        List<News> list = news.paginationNews(0, 3);
        List<News> lists = news.getNewsPost();
        int num = lists.size()/3;
        model.addAttribute("pageNews",list);
        model.addAttribute("numPage",num);
        return "client/News";
    }
    @RequestMapping(value = "/news/{id}",method = RequestMethod.GET)
    public String detailNews(@PathVariable("id") int id, Model model) {
        SupporterDAO news = new SupporterDAO();
        News ns = new News();
        ns = news.findNewsById(id);
        model.addAttribute("detailnews", ns);
        return "client/DetailNews";
    }
    @RequestMapping(value = "/news/page/{page}",method = RequestMethod.GET)
    public String paginationNews(@PathVariable("page") int page, Model model) {
        SupporterDAO news = new SupporterDAO();
        List<News> list = news.paginationNews(page - 1, 3);
        List<News> lists = news.getNewsPost();
        int num = lists.size()/3;
        model.addAttribute("pageNews",list);
        model.addAttribute("numPage",num);
        return "client/News";
    }
    @RequestMapping(value = "/recruitment", method=RequestMethod.GET)
    public String recruitment(Model model) {
        
        return "client/Recruitment";
    }
}
