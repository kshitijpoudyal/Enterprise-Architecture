package com.kshitij.dao;

import com.kshitij.model.Artist;
import com.kshitij.model.TVSeries;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by kcp on 8/8/17.
 */
@Repository
public interface TVSeriesRepository extends JpaRepository<TVSeries, Integer> {
    //List<TVSeries> findByNameAndDescription(String name, String description);
}
