package com.kedu.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kedu.dao.ScheduleDAO;
import com.kedu.dto.ScheduleDTO;

@Controller
@RequestMapping("/booking")
public class BookingController {
    
    @Autowired
    private ScheduleDAO scheduleDAO;

    @RequestMapping("/{game_id}")
    public String booking(
            @PathVariable int game_id,
            Model model) {

        ScheduleDTO game = scheduleDAO.selectByGameId(game_id);

        model.addAttribute("game", game);

        return "/main-book/booking";
    }
    
}
