package com.example.Noties.repositories;

import com.example.Noties.models.Student;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StudentRepository extends JpaRepository<Student, Long> {
    List<Student> findByTitle(String title);
}
