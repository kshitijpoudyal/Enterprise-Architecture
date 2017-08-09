package com.kshitij.dao;

import com.kshitij.model.Season;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by kcp on 8/8/17.
 */
public interface SeasonRepository extends JpaRepository<Season, Integer> {
}
