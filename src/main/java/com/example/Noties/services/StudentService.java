package com.example.Noties.services;

import com.example.Noties.models.Image;
import com.example.Noties.models.Student;
import com.example.Noties.models.User;
import com.example.Noties.repositories.StudentRepository;
import com.example.Noties.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class StudentService {
    private final StudentRepository studentRepository;
    private final UserRepository userRepository;

    @Transactional
    public List<Student> listStudent(String title) {
        if (title != null) return studentRepository.findByTitle(title);
        return studentRepository.findAll();
    }

    @Transactional
    public void saveStudent(Principal principal, Student student, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException {
        student.setUser(getUserByPrincipal(principal));
        Image image1;
        Image image2;
        Image image3;
        if (file1.getSize() != 0) {
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            student.addImageToStudent(image1);
        }
        if (file2.getSize() != 0) {
            image2 = toImageEntity(file2);
            student.addImageToStudent(image2);
        }
        if (file3.getSize() != 0) {
            image3 = toImageEntity(file3);
            student.addImageToStudent(image3);
        }
        log.info("Сохранен новый ученик,  {}", student.getTitle());
        Student studentFromDb = studentRepository.save(student);
        studentFromDb.setPreviewImageId(studentFromDb.getImages().get(0).getId());
        studentRepository.save(student);
    }

    @Transactional
    public void updateStudent(Long id, Principal principal, Student updatedStudent, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException {
        Student existingStudent = studentRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Student not found"));

        existingStudent.setTitle(updatedStudent.getTitle());


        handleImageUploads(existingStudent, file1, file2, file3);

        log.info("Updated student: ID: {}; Имя: {}" , id, existingStudent.getTitle());
        studentRepository.save(existingStudent);
    }

    @Transactional
    public void deleteStudent(Long id) {
        studentRepository.deleteById(id);
    }

    public Student getStudentById(Long id) {
        return studentRepository.findById(id).orElse(null);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    private void handleImageUploads(Student student, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException {
        if (file1 != null && !file1.isEmpty()) {
            Image image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            student.addImageToStudent(image1);
        }
        if (file2 != null && !file2.isEmpty()) {
            Image image2 = toImageEntity(file2);
            student.addImageToStudent(image2);
        }
        if (file3 != null && !file3.isEmpty()) {
            Image image3 = toImageEntity(file3);
            student.addImageToStudent(image3);
        }
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFileName(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
    }
}