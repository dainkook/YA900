package com.kedu.controllers;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kedu.dao.PlayerHitterDAO;
import com.kedu.dao.PlayerPitcherDAO;
import com.kedu.dao.ScheduleDAO;

@Controller
public class HomeController {
	
	@Autowired
    private PlayerHitterDAO playerHitterDAO;
	
	@Autowired
	private PlayerPitcherDAO playerPitcherDAO;
	
	@Autowired
    private ScheduleDAO scheduleDAO;
	
	@RequestMapping(value = "/")
	public String home(Locale locale, Model model) {
	
		model.addAttribute("hitterRanking", playerHitterDAO.getTop10Hitters());
		model.addAttribute("pitcherRanking", playerPitcherDAO.getTop10Pitchers());
		model.addAttribute("scheduleList", scheduleDAO.selectHomeSchedules());
		
		return "home";
	}
	
}
