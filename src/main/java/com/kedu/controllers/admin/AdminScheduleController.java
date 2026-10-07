package com.kedu.controllers.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String selectAll(
			@RequestParam(value = "cpage", defaultValue = "1") int cpage,
			Model model) {

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
	public String search(
			@RequestParam(value = "searchType") String searchType,
			@RequestParam(value = "keyword") String keyword,
			@RequestParam(value = "cpage", defaultValue = "1") int cpage,
			Model model) {

		// 검색 결과 개수
		int recordCount = scheduleDAO.getSearchCount(searchType, keyword);

		// 한 페이지에 10개
		int recordsPerPage = 10;

		// 검색 결과에 대한 페이지 정보
		PageDTO page = new PageDTO(cpage, recordCount, recordsPerPage);

		// 현재 페이지의 검색 결과
		List<ScheduleDTO> list =
				scheduleDAO.search(searchType, keyword, page);

		model.addAttribute("list", list);
		model.addAttribute("page", page);

		// 검색 조건 유지
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);

		return "admin/schedule";
	}
}