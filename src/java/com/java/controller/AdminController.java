/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.controller;

import com.java.dao.AdminDAO;
import com.java.model.User;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author tuong
 */
@Controller
public class AdminController {

    AdminDAO ad = new AdminDAO();
    LocalDate localDate = LocalDate.now();

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam("email") String email, @RequestParam("password") String pass, HttpServletRequest session) {
        User user = ad.login(email, pass);
        if (user.getRole() == 1) {
            session.getSession().setAttribute("userSession", user);
            return "redirect:/admin";
        } else if (user.getRole() == 2) {
            session.getSession().setAttribute("userSession", user);
            return "redirect:/support";
        }
        return "admin/login_Admin";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLogin() {
        return "admin/login_Admin";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/login";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String index(Model model) {
        List<User> users = new ArrayList<>();
//        users = ad.getAll();
        users = ad.paginationList(0, 4);
        int num;

        if (ad.getAll().size() % 4 == 0) {
            num = ad.getAll().size() / 4;
        } else {
            num = ad.getAll().size() / 4 + 1;
        }
        model.addAttribute("sizeList", num);
        model.addAttribute("users", users);
        model.addAttribute("today", localDate);
        return "admin/Admin";
    }

    @RequestMapping(value = "/pagination", method = RequestMethod.GET)
    public @ResponseBody
    ModelAndView pagination(@RequestParam("num_page") int page, Model model) {
        List<User> users_page = new ArrayList<>();
        if (page != 0) {
            users_page = ad.paginationList(page * 4 - 4, 4);
        } else {
            users_page = ad.paginationList(0, 4);
        }
        int sz = ad.getAll().size();
        if (sz % 4 == 0) {
            int num = sz / 4;
        } else {
            int num = sz / 4 + 1;
        }
        model.addAttribute("sizeList", sz);
//        model.addAttribute("page", users_page);
        ModelAndView mc = new ModelAndView("admin/ContentAdmin", "listUser", users_page);
        return mc;
    }

    @RequestMapping(value = "/admin", method = RequestMethod.POST)
    public String insertUser(@RequestParam("email_create") String email, @RequestParam("Password_create") String password, @RequestParam("Username_create") String name, @RequestParam("Role") int role) {
        ad.insertUser(email, password, name, role);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/deleteAd", method = RequestMethod.POST)
    public @ResponseBody
    String deleteAd(@RequestParam("id") int id) {
        ad.deleteUse(id);
        return "admin/Admin";
    }

    @RequestMapping(value = "/profile/{id}", method = RequestMethod.GET)
    public String indexUser(@PathVariable("id") int id, Model model) {
        User user = ad.findUser(id);
        model.addAttribute("edit_user", user);
        return "admin/Profile";
    }

    @RequestMapping(value = "/setting/profile/{id}", method = RequestMethod.GET)
    public String editUser(@PathVariable("id") int id, Model model) {
        User user = ad.findUser(id);
        model.addAttribute("edit_user", user);
        return "admin/Edit_Profile";
    }

    @RequestMapping(value = "/profile/edit", method = RequestMethod.POST)
    public String changeProfile(@RequestParam("userid") int id, @RequestParam("email_edit") String email, @RequestParam("Username_edit") String name, @RequestParam("Password_edit") String password, @RequestParam("old") String oldPass, @RequestParam("new") String newPass, @RequestParam("confirm") String confirm, @RequestParam("Role_edit") int role, HttpServletRequest session) {

        if (!newPass.trim().equals("") && !confirm.trim().equals("") && password.endsWith(oldPass.trim()) && newPass.trim().equals(confirm.trim())) {
            ad.updateUser(id, email, newPass, name, role);
            User user = new User(name, newPass, email, role, id);
            session.getSession().setAttribute("userSession", user);
            return "admin/Profile";
        } else {
            ad.updateUser(id, email, password, name, role);
            User user = new User(name, password, email, role, id);
            session.getSession().setAttribute("userSession", user);
            return "admin/Profile";
        }

    }

    @RequestMapping(value = "/userAjax", method = RequestMethod.GET)
    public @ResponseBody
    ModelAndView load(@RequestParam("num") int num, Model model) {
        List<User> users = new ArrayList<>();
        users = ad.paginationList(num, 2);
        ModelAndView mc = new ModelAndView("admin/LoadUserAjax", "userList", users);
        return mc;
    }

    @RequestMapping(value = "/User/edit", method = RequestMethod.GET)
    public @ResponseBody
    ModelAndView findUser(@RequestParam("id") int id, Model model) {

        User user = ad.findUser(id);
        //        model.addAttribute("edit_user", user);
        ModelAndView mc = new ModelAndView("admin/Edit_User", "edit_user", user);
        return mc;
    }
//    User/edit

    @RequestMapping(value = "/User/edit", method = RequestMethod.POST)
    public String updateUser(@RequestParam("userid") int id, @RequestParam("email_edit") String email, @RequestParam("Username_edit") String name, @RequestParam("Password_edit") String password, @RequestParam("Role_edit") int role) {

        ad.updateUser(id, email, password, name, role);
        return "redirect:/admin";
    }
}
