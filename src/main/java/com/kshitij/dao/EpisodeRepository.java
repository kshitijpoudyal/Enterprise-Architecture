package com.kshitij.dao;

import com.kshitij.model.Episode;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by kcp on 8/8/17.
 */
public interface EpisodeRepository extends JpaRepository<Episode, Integer> {
}
