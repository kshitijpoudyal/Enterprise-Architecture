package com.kshitij.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Created by kcp on 8/7/17.
 */
@Entity
public class Artist {
    private String name;
    private String placeOfBirth;
    private String biography;
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    public Artist() {
    }

    public Artist(String name, String placeOfBirth, String biography) {
        this.name = name;
        this.placeOfBirth = placeOfBirth;
        this.biography = biography;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPlaceOfBirth() {
        return placeOfBirth;
    }

    public void setPlaceOfBirth(String placeOfBirth) {
        this.placeOfBirth = placeOfBirth;
    }

    public String getBiography() {
        return biography;
    }

    public void setBiography(String biography) {
        this.biography = biography;
    }

    @Override
    public String toString() {
        return "Artist{" +
                "name='" + name + '\'' +
                ", placeOfBirth='" + placeOfBirth + '\'' +
                ", biography='" + biography + '\'' +
                ", id=" + id +
                '}';
    }
}
