package ru.spring.vedo.v1.entity;

import javax.persistence.*;

@Entity
@Table(name = "sub")
public class Subprogram {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    private String name;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "progId")
    private Program program;

    public Subprogram() { }

    public Subprogram(String name, Program program) {
        this.name = name;
        this.program = program;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProgramName() {
        return program != null ? program.getName() : "<none>";
    }
}
