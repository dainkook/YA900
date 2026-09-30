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

	// 공지사항 목록 + 검색 + 페이지네이션
	@RequestMapping("")
	public String notice(
			@RequestParam(value = "category", required = false, defaultValue = "all") String category,
			@RequestParam(value = "search", required = false, defaultValue = "") String search,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			Model model) {

		// 한 페이지에 보여줄 게시글 수
		int pageSize = 10;

		// 한 번에 보여줄 페이지 번호 개수
		int pageBlock = 10;

		// 현재 페이지가 1보다 작으면 1로 설정
		if (page < 1) {
			page = 1;
		}

		// 검색어 앞뒤 공백 제거
		search = search.trim();

		// 현재 페이지의 시작 / 끝 번호
		int start = (page - 1) * pageSize + 1;
		int end = page * pageSize;

		List<NoticeDTO> noticeList;

		int totalCount;

		// 검색어가 없는 경우
		if (search.isEmpty()) {

			noticeList = noticeDAO.selectPage(start, end);
			totalCount = noticeDAO.getCount();

		// 제목 검색
		} else if ("title".equals(category)) {

			noticeList = noticeDAO.searchPageByTitle(search, start, end);
			totalCount = noticeDAO.getCountByTitle(search);

		// 내용 검색
		} else if ("contents".equals(category)) {

			noticeList = noticeDAO.searchPageByContents(search, start, end);
			totalCount = noticeDAO.getCountByContents(search);

		// 전체 검색
		} else {

			noticeList = noticeDAO.searchPageByAll(search, start, end);
			totalCount = noticeDAO.getCountByAll(search);
		}

		// 전체 페이지 수
		int totalPage = (int) Math.ceil((double) totalCount / pageSize);

		// 현재 페이지가 전체 페이지보다 크면 마지막 페이지로 이동
		if (totalPage > 0 && page > totalPage) {
			page = totalPage;

			start = (page - 1) * pageSize + 1;
			end = page * pageSize;

			if (search.isEmpty()) {
				noticeList = noticeDAO.selectPage(start, end);
			} else if ("title".equals(category)) {
				noticeList = noticeDAO.searchPageByTitle(search, start, end);
			} else if ("contents".equals(category)) {
				noticeList = noticeDAO.searchPageByContents(search, start, end);
			} else {
				noticeList = noticeDAO.searchPageByAll(search, start, end);
			}
		}

		// 현재 페이지가 속한 페이지 블록
		int startPage = ((page - 1) / pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;

		// 마지막 페이지가 블록보다 작으면 마지막 페이지까지만
		if (endPage > totalPage) {
			endPage = totalPage;
		}

		// 이전 페이지 블록
		int prevPage = startPage - 1;

		// 다음 페이지 블록
		int nextPage = endPage + 1;

		model.addAttribute("noticeList", noticeList);

		model.addAttribute("category", category);
		model.addAttribute("search", search);

		model.addAttribute("page", page);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("totalPage", totalPage);

		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("prevPage", prevPage);
		model.addAttribute("nextPage", nextPage);

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