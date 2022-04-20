package ru.spring.vedo.v1.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import ru.spring.vedo.v1.entity.Coex;
import ru.spring.vedo.v1.entity.Program;
import ru.spring.vedo.v1.entity.User;

import java.util.List;

public interface CoexRepo extends CrudRepository<Coex, Integer> {
    Coex findById(int id);
    List<Coex> findByProgram_NameContaining(String name);
    List<Coex> findByUser_UsernameContaining(String name);

}
