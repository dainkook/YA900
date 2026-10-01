package com.kedu.controllers.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kedu.dao.admin.MemberDAO;
import com.kedu.dto.PageDTO;
import com.kedu.dto.UsersDTO;

@Controller
@RequestMapping("/admin/member")
public class MemberController {

	@Autowired
	private MemberDAO memberDAO;

	@RequestMapping("")
	public String selectAll(@RequestParam(value = "cpage", defaultValue = "1") int cpage, Model model) {

		// 1. 전체 회원 수 조회
		int memberCount = memberDAO.getCount();

		// 2. PageDTO 생성
		PageDTO page = new PageDTO(cpage, memberCount, 10);

		// 3. 현재 페이지에 해당하는 회원만 조회
		List<UsersDTO> list = memberDAO.selectAll(page);

		// 4. JSP로 전달
		model.addAttribute("list", list);
		model.addAttribute("memberCount", memberCount);
		model.addAttribute("page", page);

		return "/admin/member";
	}

	@RequestMapping("/search")
	public String search(@RequestParam String searchType, @RequestParam String keyword,
			@RequestParam(value = "cpage", defaultValue = "1") int cpage, Model model) {

		// 1. 검색 결과 전체 개수
		int memberCount = memberDAO.getSearchCount(searchType, keyword);

		// 2. 페이지 계산
		PageDTO page = new PageDTO(cpage, memberCount, 10);

		// 3. 현재 페이지에 보여줄 회원 조회
		List<UsersDTO> list = memberDAO.search(searchType, keyword, page);

		// 4. JSP로 데이터 전달
		model.addAttribute("searchType", searchType);
		model.addAttribute("keyword", keyword);
		model.addAttribute("list", list);
		model.addAttribute("memberCount", memberCount);
		model.addAttribute("page", page);

		return "/admin/member";
	}

	@RequestMapping("/detail")
	public String detail(@RequestParam("member_seq") int member_seq, Model model) {

		UsersDTO member = memberDAO.selectBySeq(member_seq);

		model.addAttribute("member", member);

		return "admin/memberDetail";
	}

	@RequestMapping("/blacklist")
	public String blacklist(int member_seq) {

		memberDAO.updateBlacklist(member_seq);

		return "redirect:/admin/member/detail?member_seq=" + member_seq;
	}

}
