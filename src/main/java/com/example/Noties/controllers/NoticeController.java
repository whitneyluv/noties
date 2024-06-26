package com.example.Noties.controllers;

import com.example.Noties.models.Notice;
import com.example.Noties.services.NoticeService;
import com.example.Noties.services.StudentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class NoticeController {
    private final NoticeService noticeService;
    private final StudentService studentService;

    @GetMapping("/notice")
    public String notice(@RequestParam(name = "title", required = false) String title, Model model,Principal principal) {
        model.addAttribute("notice", noticeService.listNoties(title));
        model.addAttribute("user", studentService.getUserByPrincipal(principal));
        return "notice";
    }

    @PostMapping("/notice/create")
    public String createnotice(Notice notice) {
        noticeService.savenotice(notice);
        return "redirect:/";
    }

    @PostMapping("/notice/delete/{id}")
    public String deletenotice(@PathVariable Long id) {
        noticeService.deleteNotice(id);
        return "redirect:/";
    }

    @GetMapping("/notice/{id}")
    public String getNoticeById(@PathVariable Long id, Model model, Principal principal) {
        Notice notice = noticeService.getNoticeById(id);
        model.addAttribute("user", studentService.getUserByPrincipal(principal));
        if (notice != null) {
            model.addAttribute("notice", notice);
            return "noticeDetail";
        } else {
            return "error/404";
        }
    }

    @GetMapping("/notice/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model, Principal principal) {
        Notice notice = noticeService.getNoticeById(id);
        model.addAttribute("user", studentService.getUserByPrincipal(principal));
        if (notice != null) {
            model.addAttribute("notice", notice);
            return "editNotice";
        }
            return "error/404";

    }

    @PostMapping("/notice/edit/{id}")
    public String editNotice(@PathVariable Long id, Notice updatedNotice) {
        updatedNotice.setId(id);
        noticeService.savenotice(updatedNotice);
        return "redirect:/notice/{id}";
    }
}
