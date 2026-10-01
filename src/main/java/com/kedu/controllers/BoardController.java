package com.kedu.controllers;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kedu.dao.BoardDAO;
import com.kedu.dao.FilesDAO;
import com.kedu.dto.BoardDTO;
import com.kedu.dto.FilesDTO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardDAO dao;
	@Autowired
	private FilesDAO fdao;
	
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
		List<FilesDTO> files = fdao.getFiles(seq);
		if(logo!=null) {
		model.addAttribute("logo", logo);
		}
		model.addAttribute("files", files);
		dao.viewCount(seq);
		return "/board/detail";
	}
	
	@RequestMapping("/write")
	public String write(HttpSession session) throws Exception {
		System.out.println(session.getAttribute("loginId"));
		return "/board/write";
	}
	
	@RequestMapping("/writeComplete")
	public String writeComplete(BoardDTO dto, HttpSession session, MultipartFile[] files) throws Exception {
		String id = (String)session.getAttribute("loginId");
		String team = dao.isUserTeam(id);
		int seq = dao.getNextval();
		dto.setBoard_seq(seq);
		dao.write(dto.getTitle(), dto.getContents(), id, team);
		String path = "d:/uploads/";
		for(MultipartFile file : files) {
			if(file.isEmpty()) {
				continue;
			}
			String oriName = file.getOriginalFilename();
			String sysName = UUID.randomUUID() + "_" + oriName;
			System.out.println("파일 이름 : " + file.getOriginalFilename());
			file.transferTo(new File(path + sysName));
			
			fdao.insertFile(new FilesDTO(0,oriName,sysName,null,seq));
		}
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
	
	@RequestMapping("/updateDetail")
	public String updateDetail(int seq, String title, String contents) throws Exception {
		dao.updateDetail(seq, title, contents);
		return "redirect:/board/detail?seq="+seq;
	}
	
	@RequestMapping("/delete")
	public String delete(int seq) throws Exception {
		dao.deleteDetail(seq);
		return "redirect:/board/board?cpage=1";
	}
	
	@RequestMapping("/test")
	public String test(HttpSession session) throws Exception {
		session.setAttribute("loginId", "admin");
		return "redirect:/";
	}
}
