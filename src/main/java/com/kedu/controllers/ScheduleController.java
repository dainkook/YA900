package com.kedu.controllers;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kedu.dao.ScheduleDAO;
import com.kedu.dto.ScheduleDTO;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {

    @Autowired
    private ScheduleDAO dao;

    @RequestMapping("/schedule")
    public String schedule(
            @RequestParam(value = "month", required = false) Integer month,
            Model model) {

        Calendar calendar = Calendar.getInstance();

        if (month == null) {
            month = calendar.get(Calendar.MONTH) + 1;
        }

        calendar.set(Calendar.HOUR_OF_DAY, 0);
        calendar.set(Calendar.MINUTE, 0);
        calendar.set(Calendar.SECOND, 0);
        calendar.set(Calendar.MILLISECOND, 0);

        Timestamp today = new Timestamp(calendar.getTimeInMillis());

        List<ScheduleDTO> list = dao.selectByMonth(month);

        model.addAttribute("list", list);
        model.addAttribute("month", month);
        model.addAttribute("now", today);

        return "detail/dashboard";
    }
}