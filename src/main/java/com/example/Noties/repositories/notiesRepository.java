package com.example.Noties.repositories;

import com.example.Noties.models.Notice;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface notiesRepository extends JpaRepository<Notice, Long> {
    List<Notice> findByTitle(String title2);
}