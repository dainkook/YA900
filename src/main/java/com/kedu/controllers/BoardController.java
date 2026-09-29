package com.kedu.controllers;

import java.util.List;

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
		return "/board/board";
	}
	
	@RequestMapping("/detail")
	public String detail(int seq, Model model) throws Exception {
		model.addAttribute("board", dao.getDetail(seq));
		return "/board/detail?seq=" + seq;
	}
}
