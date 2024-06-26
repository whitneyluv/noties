package com.example.Noties.services;

import com.example.Noties.models.Notice;
import com.example.Noties.models.User;
import com.example.Noties.repositories.notiesRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class NoticeService {
    private final notiesRepository notiesRepository;

    public List<Notice> listNoties(String title2) {
        if (title2 != null) {
            return notiesRepository.findByTitle(title2);
        } else {
            return notiesRepository.findAll();
        }
    }


    public void savenotice(Notice notice) {
        if (notice.getId() != null) {
            Notice existingNotice = notiesRepository.findById(notice.getId()).orElse(null);
            if (existingNotice != null) {
                existingNotice.setTitle(notice.getTitle());
                existingNotice.setDescription(notice.getDescription());
                log.info("Updating notice with id {}: {}", notice.getId(), existingNotice);
                notiesRepository.save(existingNotice);
            } else {
                log.error("Notice with id {} not found, cannot update", notice.getId());
            }
        } else {
            log.info("Saving new notice: {}", notice);
            notiesRepository.save(notice);
        }
    }

    public void deleteNotice(Long id) {
        notiesRepository.deleteById(id);
    }

    public Notice getNoticeById(Long id) {
        return notiesRepository.findById(id).orElse(null);
    }
}
