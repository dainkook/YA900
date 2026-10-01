package com.kedu.controllers;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kedu.dao.BoardDAO;
import com.kedu.dao.PlayerHitterDAO;
import com.kedu.dao.PlayerPitcherDAO;
import com.kedu.dao.ScheduleDAO;
import com.kedu.dao.TeamRankDAO;
import com.kedu.dto.BoardDTO;

@Controller
public class HomeController {
	
	@Autowired
	private TeamRankDAO teamRankDAO;
	
	@Autowired
    private PlayerHitterDAO playerHitterDAO;
	
	@Autowired
	private PlayerPitcherDAO playerPitcherDAO;
	
	@Autowired
	private BoardDAO boardDAO;
	
	@Autowired
    private ScheduleDAO scheduleDAO;
	
	@RequestMapping(value = "/")
	public String home(Locale locale, Model model) {
	
		model.addAttribute("teamRanking", teamRankDAO.selectAll());
		model.addAttribute("hitterRanking", playerHitterDAO.getTop10Hitters());
		model.addAttribute("pitcherRanking", playerPitcherDAO.getTop10Pitchers());
		model.addAttribute("scheduleList", scheduleDAO.selectHomeSchedules());

		List<BoardDTO> recentBoards = boardDAO.getRecentBoards();
		model.addAttribute("recentBoards", recentBoards);
		
		return "home";
	}
	
}
