package ru.spring.vedo.v1.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.spring.vedo.v1.repos.ProgramRepo;

@Service
public class ProgramService {

    private final ProgramRepo programRepo;

    public ProgramService(ProgramRepo programRepo) {
        this.programRepo = programRepo;
    }

//    public
}
