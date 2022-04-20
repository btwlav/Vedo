package ru.spring.vedo.v1.repos;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.spring.vedo.v1.entity.User;

import java.util.List;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);
    List<User> findByUsernameContaining(String username);
}
