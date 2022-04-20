package ru.spring.vedo.v1.entity;

import javax.persistence.*;

@Entity
@Table(name = "coex")
public class Coex {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "userId")
    private User user;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "progId")
    private Program program;

    public Coex() { }

    public Coex(User user, Program program) {
        this.user = user;
        this.program = program;
    }

    public int getId() {
        return id;
    }

    public String getUserName() {
        return user != null ? user.getUsername() : "<none>";
    }

    public String getProgramName() {
        return program != null ? program.getName() : "<none>";
    }

}
