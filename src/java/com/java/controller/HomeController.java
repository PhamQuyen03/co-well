/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.controller;

import com.java.dao.AboutDAO;
import com.java.dao.NewsDAO;
import com.java.dao.RecruitmentDAO;
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

    NewsDAO spNews = new NewsDAO();
    RecruitmentDAO spRecs = new RecruitmentDAO();
    AboutDAO spAbout = new AboutDAO();
//phần của news

    @RequestMapping(value = "/support", method = RequestMethod.GET)
    public String indexNews(Model model) {
        List<News> news = spNews.getPosted();
        List<News> wait = spNews.getWaited();
        model.addAttribute("news", news);
        model.addAttribute("news_wait", wait);
        return "admin/Supporter";
    }

    @RequestMapping(value = "/support/{id}", method = RequestMethod.GET)
    public String detailNews(@PathVariable("id") int id, Model model) {
        News news = spNews.findById(id);
        model.addAttribute("detail", news);
        return "admin/Edit_News";
    }

    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public String error() {
        return "admin/Error";
    }

    @RequestMapping(value = "/support", method = RequestMethod.POST)
    public String insertNews(@RequestParam("id_category") int id_category, @RequestParam("title") String title, @RequestParam("description") String des, @RequestParam("contents") String contents,
            @RequestParam("img") String img, @RequestParam("author") String author, @RequestParam("create_at") Date create_at, @RequestParam("update_at") Date update_at,
            @RequestParam("status") int status, Model model) {
        if (spNews.insert(id_category, title, des, contents, img, author, create_at, update_at, status)) {
            return "redirect:/support";
        } else {
            return "redirect:/error";
        }
    }

    @RequestMapping(value = "/support/{id}", method = RequestMethod.POST)
    public String updateNews(@RequestParam("id") int id, @RequestParam("id_category") int id_category, @RequestParam("description") String des, @RequestParam("title") String title, @RequestParam("contents") String content,
            @RequestParam("img") String img, @RequestParam("author") String author, @RequestParam("create_at") Date create_at, @RequestParam("update_at") Date update_at,
            @RequestParam("status") int status, Model model) {

        spNews.update(id, id_category, title, des, content, img, author, update_at, update_at, status);
        List<News> news = spNews.getPosted();
        model.addAttribute("news", news);
        return "redirect:/support";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public @ResponseBody
    void deleteNews(@RequestParam("id") int id) {
        spNews.delete(id);
    }

//@CONTROLLER RECRUITMENT
    @RequestMapping(value = "/support/recruitment", method = RequestMethod.GET)
    public String indexRecruitment(Model model) {
        List<Recruitment> recs = spRecs.paginationWaited(0, 4);
        List<Recruitment> recNum = spRecs.getWaited();
        int num;
        if(recNum.size()%4 == 0) {
            num = recNum.size() / 4;
        } else {
            num = recNum.size()/4 + 1;
        }
        model.addAttribute("numPage", num);
        model.addAttribute("recs", recs);
        return "admin/Recruitment";
    }

    @RequestMapping(value = "/support/recruitment", method = RequestMethod.POST)
    public String insertRecruitment(@RequestParam("nameRec") String name, @RequestParam("summary") String sumary, @RequestParam("descriptionRec") String des, @RequestParam("requirementRec") String requirement, @RequestParam("interestRec") String interest, @RequestParam("addressRec") String address,
            @RequestParam("create_atRc") Date create, @RequestParam("start_recruitmentRec") Date start, @RequestParam("end_recruitmentRec") Date end, @RequestParam("statusRec") int status) {
        spRecs.insert(name, sumary, des, requirement, interest, address, create, start, end, status);
        return "redirect:/support/recruitment";
    }

    @RequestMapping(value = "/support/recruitment/{id}", method = RequestMethod.GET)
    public String detailRecruitment(@PathVariable("id") int id, Model model) {
        Recruitment rec = new Recruitment();
        rec = spRecs.findId(id);
        model.addAttribute("recEdit", rec);
        return "admin/Edit_Recruitment";
    }

    @RequestMapping(value = "/support/recruitment/{id}", method = RequestMethod.POST)
    public String updateRecruitment(@PathVariable("id") int id, Model model, @RequestParam("nameRec") String name, @RequestParam("summary") String sumay, @RequestParam("descriptionRec") String des, @RequestParam("requirementRec") String requirement, @RequestParam("interestRec") String interest, @RequestParam("addressRec") String address,
            @RequestParam("create_atRc") Date create, @RequestParam("start_recruitmentRec") Date start, @RequestParam("end_recruitmentRec") Date end, @RequestParam("statusRec") int status) {
        Recruitment rec = new Recruitment();
        spRecs.update(id, name, sumay, des, requirement, interest, address, create, start, end, status);
        return "redirect:/support/recruitment";
    }

    @RequestMapping(value = "/support/recruitment/page/{page}", method = RequestMethod.GET)
    public String paginationRecruitment(@PathVariable("page") int page, Model model) {

        List<Recruitment> recs = spRecs.paginationWaited((page - 1) * 4, ((page - 1) * 4) + 4);
        List<Recruitment> recNum = spRecs.getWaited();
        int num;
        if(recNum.size()%4 == 0) {
            num = recNum.size() / 4;
        } else {
            num = recNum.size()/4 + 1;
        }
        model.addAttribute("recs", recs);
        model.addAttribute("numPage", num);
        return "admin/Recruitment";
    }

    @RequestMapping(value = "/support/recruitment/deletRe", method = RequestMethod.POST)
    public @ResponseBody
    String deleteReRecruitment(@RequestParam("idRe") int idRe) {
        spRecs.delete(idRe);
        return "admin/Recruitment";
    }

//    @CONTROLLER ABOUT
    @RequestMapping(value = "/support/about", method = RequestMethod.GET)
    public String indexAbout(Model model) {
        List<About> abouts = spAbout.getAboutWaited();
        model.addAttribute("abouts", abouts);
        return "admin/About";
    }

    @RequestMapping(value = "/support/about", method = RequestMethod.POST)
    public String insertAbout(@RequestParam("titleAbout") String title, @RequestParam("contentAbout") String content, @RequestParam("create_atAbout") Date create_at, @RequestParam("update_atAbout") Date update_at, @RequestParam("statusAbout") int status) {
        spAbout.insert(title, "img", content, create_at, update_at, status);
        return "redirect:/support/about";
    }

    @RequestMapping(value = "/support/about/{id}", method = RequestMethod.GET)
    public String detailAbout(@PathVariable("id") int id, Model model) {
        About about = spAbout.findById(id);
        model.addAttribute("aboutEdit", about);
        return "admin/Edit_About";
    }

    @RequestMapping(value = "/support/about/{id}", method = RequestMethod.POST)
    public String updateAbout(@PathVariable("id") int id, @RequestParam("titleAbout") String title, @RequestParam("contentAbout") String content, @RequestParam("create_atAbout") Date create_at, @RequestParam("update_atAbout") Date update_at, @RequestParam("statusAbout") int status) {
        spAbout.update(id, title, "img", content, create_at, update_at, status);
        return "redirect:/support/about";
    }

    @RequestMapping(value = "/support/about/delete", method = RequestMethod.POST)
    public @ResponseBody
    String deleteAbout(@RequestParam("id") int id) {
        spAbout.delete(id);
        return "admin/About";
    }
}
