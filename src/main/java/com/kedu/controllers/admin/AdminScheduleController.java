package com.kedu.controllers.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kedu.dao.admin.AdminScheduleDAO;
import com.kedu.dto.PageDTO;
import com.kedu.dto.ScheduleDTO;

@Controller
@RequestMapping("/admin/schedule")
public class AdminScheduleController {

	@Autowired
	private AdminScheduleDAO scheduleDAO;

	// 경기 전체 목록
	@RequestMapping("")
	public String selectAll(@RequestParam(value = "cpage", defaultValue = "1") int cpage, Model model) {

		// 전체 경기 개수
		int recordCount = scheduleDAO.getCount();

		// 한 페이지에 10개
		int recordsPerPage = 10;

		// 페이지 정보 생성
		PageDTO page = new PageDTO(cpage, recordCount, recordsPerPage);

		// 현재 페이지에 해당하는 경기 목록
		List<ScheduleDTO> list = scheduleDAO.selectAll(page);

		model.addAttribute("list", list);
		model.addAttribute("page", page);

		return "admin/schedule";
	}

	// 경기 검색
	@RequestMapping("/search")
	public String search(@RequestParam(value = "searchType") String searchType,
			@RequestParam(value = "keyword") String keyword,
			@RequestParam(value = "cpage", defaultValue = "1") int cpage, Model model) {

		// 검색 결과 개수
		int recordCount = scheduleDAO.getSearchCount(searchType, keyword);

		// 한 페이지에 10개
		int recordsPerPage = 10;

		// 검색 결과에 대한 페이지 정보
		PageDTO page = new PageDTO(cpage, recordCount, recordsPerPage);

		// 현재 페이지의 검색 결과
		List<ScheduleDTO> list = scheduleDAO.search(searchType, keyword, page);

		model.addAttribute("list", list);
		model.addAttribute("page", page);

		// 검색 조건 유지
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);

		return "admin/schedule";
	}

	// 경기 상세 조회
	@RequestMapping("/detail")
	public String detail(@RequestParam("game_id") int game_id, Model model) {

		ScheduleDTO schedule = scheduleDAO.selectById(game_id);

		model.addAttribute("schedule", schedule);

		return "admin/scheduleDetail";
	}

	// 경기 수정 페이지
	@RequestMapping("/edit")
	public String edit(@RequestParam("game_id") int game_id, Model model) {

		ScheduleDTO schedule = scheduleDAO.selectById(game_id);

		// 경기예정인 경우에만 수정 페이지 접근 가능
		if (!"경기예정".equals(schedule.getGame_status())) {
			return "redirect:/admin/schedule/detail?game_id=" + game_id;
		}

		model.addAttribute("schedule", schedule);

		return "admin/scheduleEdit";
	}

	// 경기 수정 처리
	@RequestMapping(value = "/editProc", method = RequestMethod.POST)
	public String editProc(@RequestParam("game_id") int game_id, @RequestParam("title") String title,
			@RequestParam("location") String location, @RequestParam("start_date") String start_date,
			@RequestParam("home_id") int home_id, @RequestParam("away_id") int away_id,
			@RequestParam("naver_game_id") String naver_game_id) {

		// 홈팀과 원정팀이 같은 경우 수정하지 않음
		if (home_id == away_id) {
			return "redirect:/admin/schedule/edit?game_id=" + game_id;
		}

		scheduleDAO.update(game_id, title, location, start_date, home_id, away_id, naver_game_id);

		return "redirect:/admin/schedule/detail?game_id=" + game_id;
	}

	// 경기 등록 페이지
	@RequestMapping("/write")
	public String write() {

		return "admin/scheduleWrite";
	}

	// 경기 등록 처리
	@RequestMapping(value = "/writeProc", method = RequestMethod.POST)
	public String writeProc(@RequestParam("title") String title, @RequestParam("location") String location,
			@RequestParam("start_date") String start_date, @RequestParam("home_id") int home_id,
			@RequestParam("away_id") int away_id, @RequestParam("naver_game_id") String naver_game_id) {

		// 홈팀과 원정팀이 같은 경우 등록하지 않음
		if (home_id == away_id) {
			return "redirect:/admin/schedule/write";
		}

		int game_id = scheduleDAO.insert(title, location, start_date, home_id, away_id, naver_game_id);

		return "redirect:/admin/schedule/detail?game_id=" + game_id;
	}

	// 경기 삭제
	@RequestMapping("/delete")
	public String delete(@RequestParam("game_id") int game_id) {

		scheduleDAO.delete(game_id);

		return "redirect:/admin/schedule";
	}

}