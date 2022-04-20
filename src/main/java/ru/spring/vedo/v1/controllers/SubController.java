package ru.spring.vedo.v1.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.spring.vedo.v1.entity.Program;
import ru.spring.vedo.v1.entity.Subprogram;
import ru.spring.vedo.v1.repos.ProgramRepo;
import ru.spring.vedo.v1.repos.SubRepo;

@Controller
public class SubController {

    @Autowired
    private ProgramRepo programRepo;

    @Autowired
    private SubRepo subRepo;

    @GetMapping("/subs")
    public String getSubs(@RequestParam(required = false) String filterText,
                          @RequestParam(value = "filterCry", required = false) String filterCry, Model model) {
        Iterable<Subprogram> subs = subRepo.findAll();
        Iterable<Program> programs = programRepo.findAll();
        filterText = filterText == null || filterText.isEmpty() ? "" : filterText;

        if (filterText != "" && !filterText.isEmpty()) {
            switch (filterCry) {
                case ("Название подпрограммы") -> subs = subRepo.findByNameContaining(filterText);
                case ("Название программы") -> subs = subRepo.findByProgram_NameContaining(filterText);

            }
        }

        model.addAttribute("filter", filterText);
        model.addAttribute("subs", subs);
        model.addAttribute("programs", programs);
        return "subprograms";
    }

    @PostMapping("/subs/add")
    public String addSub(@RequestParam String name,
                         @RequestParam(value = "progName") String programName, Model model) {
        Subprogram sub = new Subprogram(name, programRepo.findByName(programName));
        subRepo.save(sub);

        Iterable<Program> programs = programRepo.findAll();
        Iterable<Subprogram> subs = subRepo.findAll();
        model.addAttribute("filter", "");
        model.addAttribute("programs", programs);
        model.addAttribute("subs", subs);
        return "subprograms";
    }

    @PostMapping("/subs/edit")
    public String editSub(@RequestParam String id, Model model) {
        subRepo.delete(subRepo.findById(Integer.parseInt(id)));

        Iterable<Program> programs = programRepo.findAll();
        Iterable<Subprogram> subs = subRepo.findAll();
        model.addAttribute("filter", "");
        model.addAttribute("programs", programs);
        model.addAttribute("subs", subs);
        return "subprograms";
    }
}
