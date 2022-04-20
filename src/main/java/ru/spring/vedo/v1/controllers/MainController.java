package ru.spring.vedo.v1.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/")
    public String main(Model model) {
        return "main";
    }

    @GetMapping("/test")
    public String test(Model model) {
        return "test";
    }
}
