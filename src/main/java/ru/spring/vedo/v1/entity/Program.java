package ru.spring.vedo.v1.entity;

import javax.persistence.*;

@Entity
@Table(name = "prog")
public class Program {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    private String name;
    private String start;
    private String end;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    public Program() { }

    public Program(String name, String start, String end, User user) {
        this.name = name;
        this.start = start;
        this.end = end;
        this.user = user;
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

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public String getUserName() {
        return user != null ? user.getUsername() : "<none>";
    }
}
