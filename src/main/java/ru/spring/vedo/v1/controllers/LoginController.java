package ru.spring.vedo.v1.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Map;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String login(Map<String, Object> model) {
        model.put("login", "");
        model.put("password", "");
        return "login";
    }
}
