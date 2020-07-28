package org.elinext.task.controller;

import org.elinext.task.model.*;
import org.elinext.task.service.ReservationService;
import org.elinext.task.service.RoomService;
import org.elinext.task.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

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

    @GetMapping("/reservations")
    public String reservations(Model model) {
        List<Reservation> allReservation = reservationService.findAll();
        model.addAttribute("reservations", allReservation);
        return "reservation-view";
    }

    @GetMapping("/save-reservation")
    public String updateReservation(Model model, @RequestParam(value = "reservationId", required = false, defaultValue = "0") Long reservationId) {
        Optional<Reservation> reservationBtId = reservationService.findById(reservationId);
        model.addAttribute("reservation", reservationBtId.orElse(new Reservation()));
        model.addAttribute("statuses", ReservationStatus.values());
        model.addAttribute("users", userService.findAll());
        model.addAttribute("rooms", roomService.findAll());
        return "reservation-save";
    }

    @PostMapping("/save-reservation")
    public String saveReservation(@ModelAttribute("reservation") Reservation reservation) {
        reservationService.save(reservation);
        return "redirect:reservations";
    }

    @GetMapping("/delete-reservation")
    public String deleteReservation(@RequestParam Long userId) {
        reservationService.deleteById(userId);
        return "redirect:reservations";
    }

    @ExceptionHandler(Exception.class)
    public ModelAndView exceptionHandler(Model model, Exception e) {
        ModelAndView modelAndView = new ModelAndView("error");
        model.addAttribute("error", e);
        return modelAndView;
    }

}
