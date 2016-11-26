/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.controller;

import com.java.dao.ContactDAO;
import com.java.dao.NewsDAO;
import com.java.dao.RecruitmentDAO;
import com.java.dao.SlideDAO;
import com.java.model.News;
import com.java.model.Recruitment;
import com.java.model.Slide;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import jdk.nashorn.internal.parser.TokenType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author tuong
 */
@Controller
public class ClientController {

    NewsDAO dbNews = new NewsDAO();
    RecruitmentDAO dbRecruitment = new RecruitmentDAO();
    ContactDAO dbContact = new ContactDAO();
    SlideDAO dbSlide = new SlideDAO();

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String started(Model model, HttpServletRequest request) {
        List<Recruitment> recIndex = dbRecruitment.paginationWaited(0, 5);
        List<News> newsIndex = dbNews.paginationWaited(0, 3);
        List<Slide> slide = dbSlide.getList(0, 3);
        model.addAttribute("newsIndex", newsIndex);
        model.addAttribute("recIndex", recIndex);
        model.addAttribute("slide", slide);
//        user active
//        System.out.println("test : "+request.getSession().getServletContext().getAttribute("userActive"));
        return "client/index";
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model, HttpServletRequest request) {

        List<Recruitment> recIndex = dbRecruitment.paginationWaited(0, 5);
        List<News> newsIndex = dbNews.paginationWaited(0, 3);
        List<Slide> slide = dbSlide.getList(0, 3);
        model.addAttribute("newsIndex", newsIndex);
        model.addAttribute("recIndex", recIndex);
        model.addAttribute("slide", slide);
        return "client/index";
    }

    @RequestMapping(value = "/news", method = RequestMethod.GET)
    public String getNews(Model model) {
        List<News> list = dbNews.paginationWaited(0, 3);
        List<News> new_list = dbNews.paginationWaited(0, 3);
        List<News> lists = dbNews.getWaited();
        int num = lists.size() / 3;
        model.addAttribute("pageNews", list);
        model.addAttribute("new_list", new_list);
        model.addAttribute("numPage", num);
        return "client/News";
    }

    @RequestMapping(value = "/news/{id}", method = RequestMethod.GET)
    public String detailNews(@PathVariable("id") int id, Model model) {
        List<News> new_list = dbNews.paginationWaited(0, 3);
        News ns = new News();
        ns = dbNews.findById(id);
        List<News> category = dbNews.paginationCategory(ns.getId_category(), 0, 3);
        model.addAttribute("detailnews", ns);
        model.addAttribute("listDetailNews", category);
        model.addAttribute("new_list", new_list);
        return "client/DetailNews";
    }

    @RequestMapping(value = "/news/page/{page}", method = RequestMethod.GET)
    public String paginationNews(@PathVariable("page") int page, Model model) {
        List<News> new_list = dbNews.paginationWaited(0, 3);
        List<News> list = dbNews.paginationWaited((page - 1) * 3, (page - 1) * 3 + 3);
        List<News> lists = dbNews.getWaited();
        int num;
        if (lists.size() % 3 == 0) {
            num = lists.size() / 3;
        } else {
            num = lists.size() / 3 + 1;
        }
        model.addAttribute("pageNews", list);
        model.addAttribute("new_list", new_list);
        model.addAttribute("numPage", num);
        return "client/News";
    }

    @RequestMapping(value = "/recruitment", method = RequestMethod.GET)
    public String recruitment(Model model) {
        List<Recruitment> list = dbRecruitment.paginationWaited(0, 3);
        int num;
        if (dbRecruitment.getWaited().size() % 3 == 0) {
            num = dbRecruitment.getWaited().size() / 3;
        } else {
            num = dbRecruitment.getWaited().size() / 3 + 1;
        }
        model.addAttribute("clientRec", list);
        model.addAttribute("numRec", num);
        return "client/Recruitment";
    }

    @RequestMapping(value = "/recruitment/{id}", method = RequestMethod.GET)
    public String detailRec(Model model, @PathVariable("id") int id) {
        Recruitment rc = dbRecruitment.findId(id);
        List<Recruitment> list = dbRecruitment.paginationWaited(0, 3);
        model.addAttribute("clientRecDetail", rc);
        model.addAttribute("listRecDetail", list);
        return "client/DetailRecruitment";
    }

    @RequestMapping(value = "/recruitment/page/{page}", method = RequestMethod.GET)
    public String paginationRec(@PathVariable("page") int page, Model model) {
        List<Recruitment> list = dbRecruitment.paginationWaited((page - 1) * 3, (page - 1) * 3 + 3);
        int num;
        if (dbRecruitment.getWaited().size() % 3 == 0) {
            num = dbRecruitment.getWaited().size() / 3;
        } else {
            num = dbRecruitment.getWaited().size() / 3 + 1;
        }
        model.addAttribute("clientRec", list);
        model.addAttribute("numRec", num);
        return "client/Recruitment";
    }

    @RequestMapping(value = "/partners", method = RequestMethod.GET)
    public String showPartner(Model model) {
        return "client/Partners";
    }

    @RequestMapping(value = "/outsourcing", method = RequestMethod.GET)
    public String showConsult(Model model) {
        return "client/OutSourcing";
    }

    @RequestMapping(value = "/consulting", method = RequestMethod.GET)
    public String showOutSourcing(Model model) {
        return "client/Consulting";
    }

    @RequestMapping(value = "/system-integration", method = RequestMethod.GET)
    public String showSI(Model model) {
        return "client/SystemIntegration";
    }

    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String showContact(Model model) {
        return "client/Contact";
    }

    @RequestMapping(value = "/contact", method = RequestMethod.POST)
    public String addContact(Model model, @RequestParam("name") String name, @RequestParam("company") String company, @RequestParam("phone") String phone, @RequestParam("email") String email, @RequestParam("position") String branch, @RequestParam("aboutme") String content) {
        if (!name.trim().equals("") && !email.trim().equals("") &&!phone.trim().equals("")&& !name.trim().equals("") && dbContact.insert(name, company, email, phone, branch, content)) {
            
            return "redirect:/index";
        }
        return "redirect:/ErrorPage";
    }
        @RequestMapping(value = "/ErrorPage", method = RequestMethod.GET)
    public String displayError(Model model) {
        return "client/Error";
    }

}
