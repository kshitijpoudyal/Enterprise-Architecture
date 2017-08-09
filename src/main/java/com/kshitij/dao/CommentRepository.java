package com.kshitij.dao;

import com.kshitij.model.Artist;
import com.kshitij.model.Comment;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by kcp on 8/8/17.
 */
public interface CommentRepository extends JpaRepository<Comment, Integer> {
}
