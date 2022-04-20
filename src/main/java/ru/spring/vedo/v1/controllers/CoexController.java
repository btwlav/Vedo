package ru.spring.vedo.v1.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.spring.vedo.v1.entity.Coex;
import ru.spring.vedo.v1.entity.Program;
import ru.spring.vedo.v1.entity.User;
import ru.spring.vedo.v1.repos.CoexRepo;
import ru.spring.vedo.v1.repos.ProgramRepo;
import ru.spring.vedo.v1.repos.UserRepo;

@Controller
public class CoexController {

    @Autowired
    private ProgramRepo programRepo;

    @Autowired
    private UserRepo userRepo;

    @Autowired
    private CoexRepo coexRepo;

    @GetMapping("/coex")
    public String getCoex(@RequestParam(required = false) String filterText,
                          @RequestParam(value = "filterCry", required = false) String filterCry, Model model) {
        Iterable<Coex> coexes = coexRepo.findAll();
        Iterable<Program> programs = programRepo.findAll();
        Iterable<User> users = userRepo.findAll();
        filterText = filterText == null || filterText.isEmpty() ? "" : filterText;

        if (filterText != "" && !filterText.isEmpty()) {
            switch (filterCry) {
                case ("Название программы") -> coexes = coexRepo.findByProgram_NameContaining(filterText);
                case ("Исполнитель") -> coexes = coexRepo.findByUser_UsernameContaining(filterText);

            }
        }

        model.addAttribute("filter", filterText);
        model.addAttribute("coexs", coexes);
        model.addAttribute("vedomstva", users);
        model.addAttribute("programs", programs);
        return "coex";
    }

    @PostMapping("/coex/add")
    public String addCoex(@RequestParam(value = "progName") String programName,
                          @RequestParam(value = "vedName") String vedName, Model model) {
        Coex coex = new Coex(userRepo.findByUsername(vedName), programRepo.findByName(programName));
        coexRepo.save(coex);

        Iterable<Coex> coexes = coexRepo.findAll();
        Iterable<User> users = userRepo.findAll();
        Iterable<Program> programs = programRepo.findAll();

        model.addAttribute("filter", "");
        model.addAttribute("coexs", coexes);
        model.addAttribute("vedomstva", users);
        model.addAttribute("programs", programs);
        return "coex";
    }

    @PostMapping("/coex/edit")
    public String editCoex(@RequestParam String id, Model model) {
        coexRepo.delete(coexRepo.findById(Integer.parseInt(id)));

        Iterable<Coex> coexes = coexRepo.findAll();
        Iterable<User> users = userRepo.findAll();
        Iterable<Program> programs = programRepo.findAll();

        model.addAttribute("filter", "");
        model.addAttribute("coexs", coexes);
        model.addAttribute("vedomstva", users);
        model.addAttribute("programs", programs);
        return "coex";
    }
}
