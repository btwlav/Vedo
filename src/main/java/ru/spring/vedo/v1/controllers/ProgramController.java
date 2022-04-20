package ru.spring.vedo.v1.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ru.spring.vedo.v1.entity.Program;
import ru.spring.vedo.v1.entity.User;
import ru.spring.vedo.v1.repos.ProgramRepo;
import ru.spring.vedo.v1.repos.UserRepo;

@Controller
public class ProgramController {
    @Autowired
    private UserRepo userRepo;

    @Autowired
    private ProgramRepo programRepo;

    @GetMapping("/programs")
    public String programs(@RequestParam(required = false) String filterText,
                           @RequestParam(value = "filterCry", required = false) String filterCry, Model model) {
        Iterable<Program> programs = programRepo.findAll();

        filterText = filterText == null || filterText.isEmpty() ? "" : filterText;

        if (!filterText.isEmpty()) {
            switch (filterCry) {
                case ("Без фильтра") -> programs = programRepo.findAll();
                case ("Название программы") -> programs = programRepo.findByNameContaining(filterText);
                case ("Год начала") -> programs = programRepo.findByStartContaining(filterText);
                case ("Год конца") -> programs = programRepo.findByEndContaining(filterText);
            }
        }

        model.addAttribute("filter", filterText);
        model.addAttribute("programs", programs);
        return "programs";
    }

    @PostMapping("/programs")
    public String addProgram(@RequestParam(required = false) String name,
                             @RequestParam(required = false) String start,
                             @RequestParam(required = false) String end, Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = userRepo.findByUsername(authentication.getName());
        Program program = new Program(name, start, end, user);
        programRepo.save(program);

        Iterable<Program> programs = programRepo.findAll();
        model.addAttribute("filter", "");
        model.addAttribute("programs", programs);
        return "redirect:/programs";
    }
    ////////////////edit!!!!!!!!
    @PostMapping("/programs/edit")
    public String editProgram(@RequestParam String id,
                              @RequestParam String name,
                              @RequestParam String start,
                              @RequestParam String end, Model model) {
        Program program = programRepo.findById(Integer.parseInt(id));
        program.setName("ABC");
        program.setStart(start);
        program.setEnd(end);
        programRepo.save(program);

        Iterable<Program> programs = programRepo.findAll();
        model.addAttribute("filter", "");
        model.addAttribute("programs", programs);
        return "redirect:/programs";
    }

    @PostMapping("/programs/delete")
    public String deleteProgram(@RequestParam String id, Model model) {
        programRepo.delete(programRepo.findById(Integer.parseInt(id)));

        Iterable<Program> programs = programRepo.findAll();
        model.addAttribute("filter", "");
        model.addAttribute("programs", programs);
        return "redirect:/programs";
    }
}