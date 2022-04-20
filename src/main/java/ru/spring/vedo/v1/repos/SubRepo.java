package ru.spring.vedo.v1.repos;

import org.springframework.data.repository.CrudRepository;
import ru.spring.vedo.v1.entity.Program;
import ru.spring.vedo.v1.entity.Subprogram;

import java.util.List;

public interface SubRepo extends CrudRepository<Subprogram, Integer> {
    Subprogram findById(int id);
    Subprogram findByName(String name);
    List<Subprogram> findByNameContaining(String name);
    List<Subprogram> findByProgram_NameContaining(String name);
}
