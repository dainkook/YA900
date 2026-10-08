package com.kedu.controllers.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kedu.dao.admin.MemberDAO;
import com.kedu.dao.admin.ReportDAO;
import com.kedu.dto.PageDTO;
import com.kedu.dto.ReportDTO;
import com.kedu.dto.UsersDTO;

@Controller
@RequestMapping("/admin/report")
public class ReportController {

	@Autowired
	private ReportDAO reportDAO;

	@Autowired
	private MemberDAO memberDAO;

	// 신고 목록
	@RequestMapping("")
	public String selectAll(
			@RequestParam(value = "cpage", defaultValue = "1") int cpage,
			Model model) {

		int recordCount = reportDAO.getCount();

		PageDTO page = new PageDTO(cpage, recordCount, 10);

		List<ReportDTO> list = reportDAO.selectAll(page);

		model.addAttribute("list", list);
		model.addAttribute("page", page);

		return "admin/report";
	}

	// 신고 상세
	@RequestMapping("detail")
	public String detail(int report_seq, Model model) {

		ReportDTO report = reportDAO.selectBySeq(report_seq);

		UsersDTO member = memberDAO.selectById(report.getTarget_id());

		model.addAttribute("report", report);
		model.addAttribute("member", member);

		return "admin/reportDetail";
	}

	// 신고 상태 변경
	@RequestMapping("/status")
	public String updateStatus(int report_seq, String status) {

		reportDAO.updateStatus(report_seq, status);

		return "redirect:/admin/report/detail?report_seq=" + report_seq;
	}
	
	@RequestMapping("/search")
	public String search(
	        @RequestParam(value = "searchType", defaultValue = "all") String searchType,
	        @RequestParam(value = "keyword", defaultValue = "") String keyword,
	        @RequestParam(value = "cpage", defaultValue = "1") int cpage,
	        Model model) {

	    int recordCount = reportDAO.getSearchCount(searchType, keyword);

	    PageDTO page = new PageDTO(cpage, recordCount, 10);

	    List<ReportDTO> list = reportDAO.search(searchType, keyword, page);

	    model.addAttribute("list", list);
	    model.addAttribute("page", page);

	    model.addAttribute("searchType", searchType);
	    model.addAttribute("keyword", keyword);

	    return "admin/report";
	}
}