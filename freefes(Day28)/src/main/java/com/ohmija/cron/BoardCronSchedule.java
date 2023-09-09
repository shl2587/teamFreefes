package com.ohmija.cron;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.ohmija.service.Admin_boardService;

@Component
public class BoardCronSchedule {

    @Autowired
    private Admin_boardService admin_boardService;


// 현재 시간에서 -3을 뺀 시간과 작성시간을 비교하여 삭제
    public void deleteSchedule() {
        LocalDateTime threeDays = LocalDateTime.now().minusDays(3);
        admin_boardService.deleteSchedule(threeDays);
    }
}