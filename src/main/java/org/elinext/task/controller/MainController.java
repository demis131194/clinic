package org.elinext.task.controller;

import org.elinext.task.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    private UserService userService;

    @Autowired
    public MainController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/")
    public String index(Model model) {
//        List<User> allUsers = userService.findAll();
//        model.addAttribute("users", allUsers);
        return "index";
    }

    @GetMapping(value = "/index.jsp")
    public String index() {
        return "main";
    }

    @GetMapping("/test")
    public String hello() {
        return "hello";
    }
}
