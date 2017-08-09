package com.kshitij.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Created by kcp on 8/7/17.
 */
@Entity
public class Comment {
    private String comment;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    public Comment() {
    }

    public Comment(String comment) {
        this.comment = comment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
