package com.kshitij.model;

import javax.persistence.*;
import java.util.List;

/**
 * Created by kcp on 8/7/17.
 */
@Entity
public class Season {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String name;
    private String description;
    private String releasedDate;
    @OneToMany(cascade = {CascadeType.ALL})
    @JoinColumn(name = "season_id")
    private List<Episode> episodes;

    public Season() {
    }

    public Season(String name, String description, String releasedDate, List<Episode> episodes) {
        this.name = name;
        this.description = description;
        this.releasedDate = releasedDate;
        this.episodes = episodes;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getReleasedDate() {
        return releasedDate;
    }

    public void setReleasedDate(String releasedDate) {
        this.releasedDate = releasedDate;
    }

    public List<Episode> getEpisodes() {
        return episodes;
    }

    public void setEpisodes(List<Episode> episodes) {
        this.episodes = episodes;
    }
}
