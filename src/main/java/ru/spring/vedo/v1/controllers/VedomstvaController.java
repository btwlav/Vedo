package ru.spring.vedo.v1.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.spring.vedo.v1.entity.Program;
import ru.spring.vedo.v1.entity.User;
import ru.spring.vedo.v1.repos.UserRepo;

@Controller
public class VedomstvaController {

    @Autowired
    private UserRepo userRepo;

    @GetMapping("/vedomstva")
    public String vedomstva(@RequestParam(required = false) String filterText, Model model) {
        Iterable<User> users = userRepo.findAll();
        filterText = filterText == null || filterText.isEmpty() ? "" : filterText;

        if (!filterText.isEmpty()) {
            users = userRepo.findByUsernameContaining(filterText);
        }

        model.addAttribute("filter", filterText);
        model.addAttribute("vedomstva", users);
        return "vedomstva";
    }
}
