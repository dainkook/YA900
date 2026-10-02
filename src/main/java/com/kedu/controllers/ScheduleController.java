package com.kedu.controllers;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kedu.dao.GameLineUpDAO;
import com.kedu.dao.PlayerHitterDAO;
import com.kedu.dao.PlayerPitcherDAO;
import com.kedu.dao.ScheduleDAO;
import com.kedu.dao.TeamDefenDAO;
import com.kedu.dao.TeamOffenDAO;
import com.kedu.dao.TeamRankDAO;
import com.kedu.dto.GameLineUpDTO;
import com.kedu.dto.PlayerHitterDTO;
import com.kedu.dto.PlayerPitcherDTO;
import com.kedu.dto.ScheduleDTO;
import com.kedu.dto.TeamDefenDTO;
import com.kedu.dto.TeamOffenDTO;
import com.kedu.dto.TeamRankDTO;

@Controller
@RequestMapping("/schedule")
public class ScheduleController {

	@Autowired
	private ScheduleDAO scheduleDAO;

	@Autowired
	private TeamRankDAO teamRankDAO;

	@Autowired
	private PlayerPitcherDAO playerPitcherDAO;

	@Autowired
	private PlayerHitterDAO playerHitterDAO;

	@Autowired
	private GameLineUpDAO gameLineUpDAO;
	
	@Autowired
	private TeamOffenDAO teamOffenDAO;
	
	@Autowired
	private TeamDefenDAO teamDefenDAO;

	@RequestMapping("/schedule")
	public String schedule(@RequestParam(value = "month", required = false) Integer month, Model model) {

		Calendar calendar = Calendar.getInstance();

		if (month == null) {
			month = calendar.get(Calendar.MONTH) + 1;
		}

		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);

		Timestamp today = new Timestamp(calendar.getTimeInMillis());

		List<ScheduleDTO> list = scheduleDAO.selectByMonth(month);

		model.addAttribute("list", list);
		model.addAttribute("month", month);
		model.addAttribute("now", today);

		return "schedule/dashboard";
	}

	@RequestMapping("/scheduledetail")
	public String list(@RequestParam("game_id") int game_id, Model model) {

		ScheduleDTO schedule = scheduleDAO.selectByGameId(game_id);

		List<TeamRankDTO> teamList = teamRankDAO.selectAll();
		List<PlayerPitcherDTO> pitcherList = playerPitcherDAO.selectAll();
		List<PlayerHitterDTO> hitterList = playerHitterDAO.selectAll();

		List<GameLineUpDTO> lineupList = gameLineUpDAO.selectByGameId(schedule.getNaver_game_id());

		model.addAttribute("schedule", schedule);
		model.addAttribute("teamList", teamList);
		model.addAttribute("pitcherList", pitcherList);
		model.addAttribute("hitterList", hitterList);
		model.addAttribute("lineupList", lineupList);

		return "schedule/scheduledetail";
	}

	@RequestMapping("/rankdetail")
	public String rank(Model model) {

		List<TeamRankDTO> teamrankList = teamRankDAO.selectAll();
		List<PlayerPitcherDTO> pitcherList = playerPitcherDAO.selectAll();
		List<PlayerHitterDTO> hitterList = playerHitterDAO.selectAll();
		List<TeamOffenDTO> offenlist = teamOffenDAO.selectAll();
		List<TeamDefenDTO> dffenlist = teamDefenDAO.selectAll();

		
		model.addAttribute("teamrankList", teamrankList);
		model.addAttribute("pitcherList", pitcherList);
		model.addAttribute("hitterList", hitterList);
		model.addAttribute("offenlist", offenlist);
		model.addAttribute("dffenlist", dffenlist);
		

		return "schedule/rankdetail";
	}
	
	@ResponseBody
	@RequestMapping("/pitchers")
	public List<GameLineUpDTO> pitchers(@RequestParam("game_id") int game_id) {

	    ScheduleDTO schedule = scheduleDAO.selectByGameId(game_id);

	    return gameLineUpDAO.selectByGameId(schedule.getNaver_game_id());
	}
}