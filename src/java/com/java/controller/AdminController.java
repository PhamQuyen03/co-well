/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.java.controller;

import com.java.dao.AdminDAO;
import com.java.model.User;
import java.util.ArrayList;
import java.util.List;
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

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String index(Model model) {

        List<User> users = new ArrayList<>();
//        users = ad.getAll();
        users = ad.getList(0, 8);

        model.addAttribute("users", users);
        return "admin/Admin";
    }

    @RequestMapping(value = "/admin/page/{page1}", method = RequestMethod.GET)
    public String pagination(@PathVariable("page1") int page, Model model) {
        List<User> users_page = new ArrayList<>();
        if (page != 0) {
            users_page = ad.getList(page * 8, 8);
        } else {
            users_page = ad.getList(0, 8);
        }
        model.addAttribute("page", users_page);
        return "admin/Admin";
    }

    @RequestMapping(value = "/User/{id}", method = RequestMethod.GET)
    public String findUser(@PathVariable("id") int id, Model model) {

        User user = ad.findUser(id);
        model.addAttribute("edit_user", user);
        return "admin/Edit_User";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.POST)
    public String insertUser(@RequestParam("email_create") String email, @RequestParam("Password_create") String password, @RequestParam("Username_create") String name, @RequestParam("Role") int role) {
        ad.insertUser(email, password, name, role);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/User/{id}", method = RequestMethod.POST)
    public String updateUser(@RequestParam("userid") int id, @RequestParam("email_edit") String email, @RequestParam("Username_edit") String name, @RequestParam("Password_edit") String password, @RequestParam("Role_edit") int role) {

        ad.updateUser(id, email, password, name, role);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/deleteAd", method = RequestMethod.POST)
    public @ResponseBody
    String deleteAd(@RequestParam("id") int id) {
        ad.deleteUse(id);
        return "admin/Admin";
    }

    @RequestMapping(value = "/userAjax", method = RequestMethod.GET)
    public @ResponseBody
    ModelAndView load(@RequestParam("num") int num, Model model) {
        List<User> users = new ArrayList<>();
        users = ad.getList(num, 2);
        ModelAndView mc = new ModelAndView("admin/LoadUserAjax","userList", users);
        return mc;
    }
}
