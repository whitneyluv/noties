package com.example.Noties.controllers;

import com.example.Noties.models.Student;
import com.example.Noties.services.NoticeService;
import com.example.Noties.services.StudentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class StudentController {
    private final StudentService studentService;
    private final NoticeService noticeService;

    @GetMapping("/")
    public String products(@RequestParam(name = "title", required = false) String title, Principal principal, Model model) {
        model.addAttribute("student", studentService.listStudent(title));
        model.addAttribute("user", studentService.getUserByPrincipal(principal));
        return "student";
    }

    @GetMapping("/student/{id}")
    public String productInfo(@PathVariable Long id, Model model,String title2, Principal principal) {
        Student student = studentService.getStudentById(id);
        model.addAttribute("user", studentService.getUserByPrincipal(principal));
        model.addAttribute("notice", noticeService.listNoties(title2));
        model.addAttribute("student", student);
        model.addAttribute("images", student.getImages());
        return "student-info";
    }

    @PostMapping("/student/create")
    public String createStudent(@RequestParam("file1") MultipartFile file1,
                                @RequestParam("file2") MultipartFile file2,
                                @RequestParam("file3") MultipartFile file3,
                                Student student, Principal principal) throws IOException {
        studentService.saveStudent(principal, student, file1, file2, file3);
        return "redirect:/";
    }

    @PostMapping("/student/delete/{id}")
    public String deleteStudent(@PathVariable Long id) {
        studentService.deleteStudent(id);
        return "redirect:/";
    }

    @GetMapping("/student/edit/{id}")
    public String editStudentForm(@PathVariable Long id, Model model, Principal principal) {
        Student student = studentService.getStudentById(id);
        model.addAttribute("user", studentService.getUserByPrincipal(principal));
        model.addAttribute("student", student);
        return "edit-student";
    }

    @PostMapping("/student/edit/{id}")
    public String editStudentSubmit(@PathVariable Long id,
                                    @RequestParam("file1") MultipartFile file1,
                                    @RequestParam("file2") MultipartFile file2,
                                    @RequestParam("file3") MultipartFile file3,
                                    Student student, Principal principal) throws IOException {
        studentService.updateStudent(id, principal, student, file1, file2, file3);
        return "redirect:/student/" + id;
    }
}
