/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.controller;

import com.java.dao.SupporterDAO;
import com.java.model.About;
import com.java.model.News;
import com.java.model.Recruitment;
import java.sql.Date;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author tuong
 */
@Controller
public class HomeController {

    SupporterDAO sp = new SupporterDAO();
//phần của news

    @RequestMapping(value = "/support", method = RequestMethod.GET)
    public String index(Model model) {
        List<News> news = sp.getAllNewsPosted();
        List<News> wait = sp.getNewsPost();
        model.addAttribute("news", news);
        model.addAttribute("news_wait", wait);
        return "admin/Supporter";
    }

    @RequestMapping(value = "/support/{id}", method = RequestMethod.GET)
    public String detail(@PathVariable("id") int id, Model model) {
        News news = sp.findNewsById(id);
        model.addAttribute("detail", news);
        return "admin/Edit_News";
    }

    @RequestMapping(value = "/support/title={header}", method = RequestMethod.GET)
    public String find(@PathVariable("header") String header, Model model) {
        News news = sp.findNewsBytitle(header);
        model.addAttribute("detail", news);
        return "admin/Edit_News";
    }

    @RequestMapping(value = "/support", method = RequestMethod.POST)
    public String insertNews(@RequestParam("id_category") int id_category, @RequestParam("title") String title, @RequestParam("description") String des, @RequestParam("contents") String contents,
            @RequestParam("img") String img, @RequestParam("author") String author, @RequestParam("create_at") Date create_at, @RequestParam("update_at") Date update_at,
            @RequestParam("status") int status, Model model) {
        sp.insertNews(id_category, title, des, contents, img, author, create_at, update_at, status);
        return "redirect:/support";
    }

    @RequestMapping(value = "/support/{id}", method = RequestMethod.POST)
    public String update(@RequestParam("id") int id, @RequestParam("id_category") int id_category, @RequestParam("description") String des, @RequestParam("title") String title, @RequestParam("contents") String content,
            @RequestParam("img") String img, @RequestParam("author") String author, @RequestParam("create_at") Date create_at, @RequestParam("update_at") Date update_at,
            @RequestParam("status") int status, Model model) {

        sp.updateNews(id, id_category, title, des, content, img, author, update_at, update_at, status);
        List<News> news = sp.getAllNewsPosted();
        model.addAttribute("news", news);
        return "redirect:/support";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public @ResponseBody
    String delete(@RequestParam("id") int id) {
        sp.deleteNEWS(id);
        return "admin/Supporter";
    }

    @RequestMapping(value = "/support/recruitment", method = RequestMethod.GET)
    public String displayRec(Model model) {
        List<Recruitment> recs = sp.paginationRec(0, 4);
        List<Recruitment> recNum = sp.getRecruitment();
        model.addAttribute("numPage", recNum.size()/5);
        model.addAttribute("recs", recs);
        return "admin/Recruitment";
    }

    @RequestMapping(value = "/support/recruitment", method = RequestMethod.POST)
    public String insertRecruitment(@RequestParam("nameRec") String name, @RequestParam("descriptionRec") String des, @RequestParam("requirementRec") String requirement, @RequestParam("interestRec") String interest, @RequestParam("addressRec") String address,
            @RequestParam("create_atRc") Date create, @RequestParam("start_recruitmentRec") Date start, @RequestParam("end_recruitmentRec") Date end, @RequestParam("statusRec") int status) {
        sp.insertRecuitment(name, "img", des, requirement, interest, address, create, start, end, status);
        return "redirect:/support/recruitment";
    }

    @RequestMapping(value = "/support/recruitment/{id}", method = RequestMethod.GET)
    public String detailRec(@PathVariable("id") int id, Model model) {
        Recruitment rec = new Recruitment();
        rec = sp.findRecruitmentById(id);
        model.addAttribute("recEdit", rec);
        return "admin/Edit_Recruitment";
    }

    @RequestMapping(value = "/support/recruitment/{id}", method = RequestMethod.POST)
    public String editRec(@PathVariable("id") int id, Model model, @RequestParam("nameRec") String name, @RequestParam("descriptionRec") String des, @RequestParam("requirementRec") String requirement, @RequestParam("interestRec") String interest, @RequestParam("addressRec") String address,
            @RequestParam("create_atRc") Date create, @RequestParam("start_recruitmentRec") Date start, @RequestParam("end_recruitmentRec") Date end, @RequestParam("statusRec") int status) {
        Recruitment rec = new Recruitment();
        sp.updateRecuitment(id, name, "img", des, requirement, interest, address, create, start, end, status);
        return "redirect:/support/recruitment";
    }

    @RequestMapping(value = "/support/recruitment/page/{page}", method = RequestMethod.GET)
    public String paginationRec(@PathVariable("page") int page, Model model) {

        List<Recruitment> recs = sp.paginationRec(page * 4, 4);
        List<Recruitment> recNum = sp.getRecruitment();
        int num = recNum.size()/5;
        model.addAttribute("recs", recs);
        model.addAttribute("numPage", num);
        return "admin/Recruitment";
    }

    @RequestMapping(value = "/support/recruitment/deletRe", method = RequestMethod.POST)
    public @ResponseBody
    String deleteRe(@RequestParam("idRe") int idRe) {
        sp.deleteRecruitment(idRe);
        return "admin/Recruitment";
    }
    
//    About
    
    @RequestMapping(value = "/support/about", method = RequestMethod.GET)
    public String displayAbout(Model model) {
        List<About> abouts = sp.getAbout();
        model.addAttribute("abouts", abouts);
        return "admin/About";
    }
    
    @RequestMapping(value = "/support/about", method = RequestMethod.POST)
    public String insertAbout(@RequestParam("titleAbout") String title, @RequestParam("contentAbout") String content, @RequestParam("create_atAbout") Date create_at, @RequestParam("update_atAbout") Date update_at, @RequestParam("statusAbout") int status) {
        sp.insertAbout(title, "img", content, create_at, update_at, status);
        return "redirect:/support/about";
    }
    
    @RequestMapping(value = "/support/about/{id}", method = RequestMethod.GET)
    public String displayEdit(@PathVariable("id") int id, Model model) {
        About about = sp.findAboutById(id);
        model.addAttribute("aboutEdit", about);
        return "admin/Edit_About";
    }
    @RequestMapping(value = "/support/about/{id}", method = RequestMethod.POST)
    public String updateAbout(@PathVariable("id") int id, @RequestParam("titleAbout") String title, @RequestParam("contentAbout") String content, @RequestParam("create_atAbout") Date create_at, @RequestParam("update_atAbout") Date update_at, @RequestParam("statusAbout") int status) {
        sp.updateAbout(id, title, "img", content, create_at, update_at, status);
        return "redirect:/support/about";
    }
    
    @RequestMapping(value = "/support/about/delete", method = RequestMethod.POST)
    public @ResponseBody
    String deleteAbout(@RequestParam("id") int id) {
        sp.deleteAbout(id);
        return "admin/About";
    }
}
