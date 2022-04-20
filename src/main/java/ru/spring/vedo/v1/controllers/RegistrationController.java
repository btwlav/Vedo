package ru.spring.vedo.v1.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import ru.spring.vedo.v1.entity.Role;
import ru.spring.vedo.v1.entity.User;
import ru.spring.vedo.v1.repos.UserRepo;

import java.util.Collections;
import java.util.Map;
import java.util.regex.Pattern;

@Controller
public class RegistrationController {
    @Autowired
    private UserRepo userRepo;

    @GetMapping("/registration")
    public String registration(Map<String, Object> model) {
        model.put("message", "");
        model.put("login", "");
        model.put("password", "");
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model) {
        User userFromDb = userRepo.findByUsername(user.getUsername());
        model.put("message", "");

        if (userFromDb != null) {
            model.put("message", "Пользователь с таким логином уже существует!");
            model.put("login", user.getUsername());
            model.put("password", user.getPassword());
            return "registration";
        }

        String hasDigit = "^(?=.*[0-9])";
        String hasUpperChar = "(?=.*[A-Z])";
        String hasSpecialSymbol = "(?=.*[\\W])";
        String hasEightChars = ".{8,}$";

        if (Pattern.matches(hasDigit+hasUpperChar+hasSpecialSymbol+hasEightChars, user.getPassword())) {
            user.setActive(true);
            user.setRoles(Collections.singleton(Role.USER));
            userRepo.save(user);
        } else {
            model.put("message", "Введен некорректный пароль");
            model.put("login", user.getUsername());
            model.put("password", user.getPassword());
            return "registration";
        }

        return "redirect:/login";
    }
}
