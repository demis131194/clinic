package org.elinext.task.controller;

import org.elinext.task.model.User;
import org.elinext.task.model.UserRole;
import org.elinext.task.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class MainController {

    private UserService userService;

    @Autowired
    public MainController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/users")
    public String users(Model model) {
        List<User> allUsers = userService.findAll();
        model.addAttribute("users", allUsers);
        return "user-view";
    }

    @GetMapping("/save-user")
    public String userAdd(Model model, @ModelAttribute("user") User user) {
        model.addAttribute("roles", UserRole.values());
        model.addAttribute("user", user);
        return "user-save";
    }

    @PostMapping("/save-user")
    public String saveUser(@ModelAttribute("user") User user) {
        userService.save(user);
        return "redirect:users";
    }

    @GetMapping("/delete-user")
    public String deleteUser(@RequestParam Long userId) {
        userService.deleteById(userId);
        return "redirect:users";
    }

}
