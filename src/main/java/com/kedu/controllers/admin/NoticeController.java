package com.kedu.controllers.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kedu.dao.admin.NoticeDAO;
import com.kedu.dto.NoticeDTO;

@Controller
@RequestMapping("/admin/notice")
public class NoticeController {

	@Autowired
	private NoticeDAO noticeDAO;

	// 공지사항 목록 + 검색
	@RequestMapping("")
	public String notice(
			@RequestParam(value = "category", required = false, defaultValue = "all") String category,
			@RequestParam(value = "search", required = false, defaultValue = "") String search,
			Model model) {

		List<NoticeDTO> noticeList;

		// 검색어가 없는 경우 → 전체 목록
		if (search.trim().isEmpty()) {
			noticeList = noticeDAO.selectAll();
		// 제목 검색
		} else if ("title".equals(category)) {
			noticeList = noticeDAO.searchByTitle(search);
		// 내용 검색
		} else if ("contents".equals(category)) {
			noticeList = noticeDAO.searchByContents(search);
		// 전체 검색 → 제목 + 내용
		} else {
			noticeList = noticeDAO.searchByAll(search);
		}

		model.addAttribute("noticeList", noticeList);
		model.addAttribute("category", category);
		model.addAttribute("search", search);

		return "admin/notice";
	}

	// 공지사항 상세
	@RequestMapping("/detail")
	public String detail(int notice_seq, Model model) {
		noticeDAO.viewCount(notice_seq);
		NoticeDTO notice = noticeDAO.selectBySeq(notice_seq);
		model.addAttribute("notice", notice);
		return "admin/detail";
	}

	// 공지사항 작성 페이지
	@RequestMapping("/write")
	public String write() {
		return "admin/write";
	}

	// 공지사항 작성 처리
	@RequestMapping("/writeProc")
	public String writeProc(NoticeDTO dto, HttpSession session) {
		String admin_id = (String) session.getAttribute("admin_id");
		dto.setWriter(admin_id);

		int notice_seq = noticeDAO.getNextSeq();
		dto.setNotice_seq(notice_seq);

		noticeDAO.insert(dto);
		return "redirect:/admin/notice/detail?notice_seq=" + notice_seq;
	}

	// 공지사항 수정 페이지
	@RequestMapping("/edit")
	public String edit(int notice_seq, Model model) {
		NoticeDTO notice = noticeDAO.selectBySeq(notice_seq);
		model.addAttribute("notice", notice);
		return "admin/write";
	}

	// 공지사항 수정 처리
	@RequestMapping("/editProc")
	public String editProc(NoticeDTO dto) {
		noticeDAO.update(dto);
		return "redirect:/admin/notice/detail?notice_seq=" + dto.getNotice_seq();
	}

	// 공지사항 삭제
	@RequestMapping("/delete")
	public String delete(int notice_seq) {
		noticeDAO.delete(notice_seq);
		return "redirect:/admin/notice";
	}

}