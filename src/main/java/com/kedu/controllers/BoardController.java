package com.kedu.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kedu.dao.BoardDAO;
import com.kedu.dto.BoardDTO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardDAO dao;
	
	@RequestMapping("/board")
	public String board(Model model, int cpage) throws Exception  {
		List<BoardDTO> list = dao.listOfPage(cpage * 10 - 9, cpage * 10);
		model.addAttribute("list", list);
		model.addAttribute("recordTotalCount", dao.totalCount());
		model.addAttribute("recordCountPerPage", 10);
		model.addAttribute("naviCountPerPage", 10);
		model.addAttribute("cpage", cpage);
		model.addAttribute("isSearch", false);
		return "/board/board";
	}
	
	@RequestMapping("/detail")
	public String detail(int seq, Model model) throws Exception {
		model.addAttribute("board", dao.getDetail(seq));
		String logo = dao.teamLogoEditer(seq);
		if(logo!=null) {
		model.addAttribute("logo", logo);
		}
		return "/board/detail";
	}
	
	@RequestMapping("/write")
	public String write(HttpSession session) throws Exception {
		System.out.println(session.getAttribute("loginId"));
		return "/board/write";
	}
	
	@RequestMapping("/writeComplete")
	public String writeComplete(String title, String contents, HttpSession session) throws Exception {
		String id = (String)session.getAttribute("loginId");
		String team = dao.isUserTeam(id);
		dao.write(title, contents, id, team);
		return "redirect:/board/board?cpage=1";
	}
	
	@RequestMapping("/search")
	public String search(String option, String search, Model model, int cpage) throws Exception {
		if(!search.equals("")) {
		List<BoardDTO> list = dao.searchBoard(option, search, cpage*10-9, cpage*10);
		model.addAttribute("list", list);
		model.addAttribute("recordTotalCount", dao.searchCount(option, search));
		model.addAttribute("recordCountPerPage", 10);
		model.addAttribute("naviCountPerPage", 10);
		model.addAttribute("isSearch", true);
		model.addAttribute("option", option);
		model.addAttribute("search", search);
		model.addAttribute("cpage", cpage);
		System.out.println(dao.searchCount(option, search));
		return "/board/board";
		} else {
			return "redirect:/board/board?cpage=1";		
			}
	}
	
	@RequestMapping("/test")
	public String test(HttpSession session) throws Exception {
		session.setAttribute("loginId", "admin");
		return "redirect:/";
	}
}
