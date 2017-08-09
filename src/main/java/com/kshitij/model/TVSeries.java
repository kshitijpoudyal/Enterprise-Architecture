package com.kshitij.model;

import javax.persistence.*;
import java.util.List;

/**
 * Created by kcp on 8/7/17.
 */
@Entity
public class TVSeries {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private String name;
    private String genre;
    private String rating;
    private String description;
    @OneToMany(cascade = {CascadeType.ALL})
    @JoinColumn(name = "tv_series_id")
    private List<Season> seasons;
    @OneToMany(cascade = {CascadeType.ALL})
    @JoinColumn(name="tv_series_id")
    private List<Artist> artists;
    private String director;

    public TVSeries() {
    }

    public TVSeries(String name, String genre, String rating, String description, List<Season> seasons, String director, List<Artist> artists) {
        this.name = name;
        this.genre = genre;
        this.rating = rating;
        this.description = description;
        this.seasons = seasons;
        this.director = director;
        this.artists = artists;
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

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Season> getSeasons() {
        return seasons;
    }

    public void setSeasons(List<Season> seasons) {
        this.seasons = seasons;
    }

    public List<Artist> getArtists() {
        return artists;
    }

    public void setArtists(List<Artist> artists) {
        this.artists = artists;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    @Override
    public String toString() {
        return "TVSeries{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", genre='" + genre + '\'' +
                ", rating='" + rating + '\'' +
                ", description='" + description + '\'' +
                ", seasons=" + seasons +
                ", artists=" + artists +
                ", director='" + director + '\'' +
                '}';
    }
}
