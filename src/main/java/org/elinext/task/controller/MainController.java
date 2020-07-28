package org.elinext.task.controller;

import org.elinext.task.model.Room;
import org.elinext.task.model.RoomStatus;
import org.elinext.task.model.User;
import org.elinext.task.model.UserRole;
import org.elinext.task.service.ReservationService;
import org.elinext.task.service.RoomService;
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
    private RoomService roomService;
    private ReservationService reservationService;

    @Autowired
    public MainController(UserService userService, RoomService roomService, ReservationService reservationService) {
        this.userService = userService;
        this.roomService = roomService;
        this.reservationService = reservationService;
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
    public String updateUser(Model model, @ModelAttribute("user") User user) {
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

    @GetMapping("/rooms")
    public String rooms(Model model) {
        List<Room> allRooms = roomService.findAll();
        model.addAttribute("rooms", allRooms);
        return "room-view";
    }

    @GetMapping("/save-room")
    public String updateRoom(Model model, @ModelAttribute("room") Room room) {
        model.addAttribute("statuses", RoomStatus.values());
        model.addAttribute("room", room);
        return "room-save";
    }

    @PostMapping("/save-room")
    public String saveRoom(@ModelAttribute("room") Room room) {
        roomService.save(room);
        return "redirect:rooms";
    }

    @GetMapping("/delete-room")
    public String deleteRoom(@RequestParam Long userId) {
        roomService.deleteById(userId);
        return "redirect:rooms";
    }

}
