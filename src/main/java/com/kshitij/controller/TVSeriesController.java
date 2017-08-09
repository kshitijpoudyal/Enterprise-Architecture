package com.kshitij.controller;
import com.kshitij.dao.ArtistRepository;
import com.kshitij.dao.EpisodeRepository;
import com.kshitij.dao.SeasonRepository;
import com.kshitij.dao.TVSeriesRepository;
import com.kshitij.exception.NoSuchResourceException;
import com.kshitij.model.*;
import com.kshitij.services.TVSeriesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by kcp on 8/7/17.
 */
@Controller
public class TVSeriesController {

    @Autowired
    private TVSeriesRepository tvSeriesRepository;
    @Autowired
    private SeasonRepository seasonRepository;
    @Autowired
    private EpisodeRepository episodeRepository;
    @Autowired
    private ArtistRepository artistRepository;

    @RequestMapping("/")
    public String redirectRoot() {
        return "redirect:/series";
    }

    @RequestMapping(value="/series", method= RequestMethod.GET)
    public String getAll(Model model) {
        model.addAttribute("series", tvSeriesRepository.findAll());
        return "index";
    }

    @RequestMapping(value="/user")
    public String redirectUser() {
        return "redirect:/series";
    }

    @RequestMapping(value="/admin")
    public String redirectAdmin(Model model) {
        model.addAttribute("series", tvSeriesRepository.findAll());
        return "admin";
    }

    @RequestMapping(value = "/admin/series/add", method = RequestMethod.POST)
    public String addSeries(@ModelAttribute("tvSeries") TVSeries tvSeries){
        tvSeriesRepository.save(tvSeries);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/admin/series/delete", method = RequestMethod.POST)
    public String deleteSeries(int tvSeries_id){
        tvSeriesRepository.delete(tvSeries_id);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/admin/series/season/add", method = RequestMethod.POST)
    public String addSeriesSeason(@ModelAttribute("season") Season season, int tvSeries_id){
        TVSeries tvSeries = tvSeriesRepository.findOne(tvSeries_id);
        tvSeries.getSeasons().add(season);
        tvSeriesRepository.save(tvSeries);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/admin/series/episode/add", method = RequestMethod.POST)
    public String addSeriesEpisode(@ModelAttribute("episode") Episode episode,int tvSeries_id, int season_id){
        Season season = seasonRepository.findOne(season_id);
        season.getEpisodes().add(episode);
        seasonRepository.save(season);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/admin/series/cast/add", method = RequestMethod.POST)
    public String addSeriesArtist(@ModelAttribute("artist") Artist artist, int tvSeries_id){
        TVSeries tvSeries = tvSeriesRepository.findOne(tvSeries_id);
        tvSeries.getArtists().add(artist);
        tvSeriesRepository.save(tvSeries);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/admin/series/episode/comment", method = RequestMethod.POST)
    public String addEpisodeComment(@ModelAttribute("comment") Comment comment, int episode_id){
        Episode episode = episodeRepository.findOne(episode_id);
        episode.getComments().add(comment);
        episodeRepository.save(episode);
        return "redirect:/user";
    }

    @ExceptionHandler(value=NoSuchResourceException.class)
    public ModelAndView handle(Exception e) {
        ModelAndView mv = new ModelAndView();
        mv.getModel().put("e", e);
        mv.setViewName("noSuchResource");
        return mv;
    }
}
