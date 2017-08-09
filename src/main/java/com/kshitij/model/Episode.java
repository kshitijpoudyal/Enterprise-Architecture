package com.kshitij.model;

import javax.persistence.*;
import java.util.List;

/**
 * Created by kcp on 8/7/17.
 */
@Entity
public class Episode {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String name;
    @OneToMany(cascade = {CascadeType.ALL})
    @JoinColumn(name = "episode_id")
    private List<Comment> comments;

    public Episode() {
    }

    public Episode(String name, List<Comment> comments) {
        this.name = name;
        this.comments = comments;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
