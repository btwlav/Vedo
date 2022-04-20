package ru.spring.vedo.v1.repos;

import org.springframework.data.repository.CrudRepository;
import ru.spring.vedo.v1.entity.Program;

import java.util.List;

public interface ProgramRepo extends CrudRepository<Program, Integer> {
    Program findById(int id);
    Program findByName(String name);
    List<Program> findByNameContaining(String name);
    List<Program> findByStartContaining(String year);
    List<Program> findByEndContaining(String year);

}
