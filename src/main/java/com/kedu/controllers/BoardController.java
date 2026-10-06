package com.kedu.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kedu.dao.BoardDAO;
import com.kedu.dao.FilesDAO;
import com.kedu.dto.BoardDTO;
import com.kedu.dto.FilesDTO;
import com.kedu.dto.LiveChatDTO;
import com.kedu.dto.ReplyDTO;

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
		List<ReplyDTO> replyList = dao.getReplyList(seq);
		model.addAttribute("replyList", replyList);
		dao.viewCount(seq);
		return "/board/detail";
	}
	
	@RequestMapping("/write")
	public String write(HttpSession session) throws Exception {
		System.out.println(session.getAttribute("id"));
		return "/board/write";
	}
	
	@RequestMapping("/writeComplete")
	public String writeComplete(BoardDTO dto, HttpSession session, MultipartFile[] files) throws Exception {
		String id = (String)session.getAttribute("id");
		String team = dao.isUserTeam(id);
		int seq = dao.getNextval();
		dto.setBoard_seq(seq);
		dto.setTeam(team);
		dto.setWriter(id);
		System.out.println(dto.getContents().length());
		dao.write(dto);
		String path = "d:/uploads/";
		for(MultipartFile file : files) {
			if(file.isEmpty()) {
				continue;
			}
			String oriName = file.getOriginalFilename();
			String sysName = UUID.randomUUID() + "_" + oriName;
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
	
	@RequestMapping("/download")
	public void download(String oriName, String sysName, HttpServletResponse resp) throws Exception {
		oriName = new String(oriName.getBytes(), "ISO-8859-1");
		File target = new File("d:/uploads/" + sysName);
		resp.setContentType("application/octet-stream");
		resp.setHeader("Content-Disposition", "attachment; filename = \"" + oriName + "\"");
		FileInputStream fis = new FileInputStream(target);
		FileCopyUtils.copy(fis, resp.getOutputStream());
	}
	
	@RequestMapping("/test")
	public String test(HttpSession session) throws Exception {
		session.setAttribute("id", "admin");
		return "redirect:/";
	}
	
	@RequestMapping("/testComplete")
	public String testComplete(HttpSession session) throws Exception {
		session.removeAttribute("id");
		return "redirect:/";
	}
	
	@RequestMapping("/uploadImage")
	@ResponseBody
	public Map<String, String> uploadImage(@RequestParam("file") MultipartFile file) throws Exception {
		Map<String, String> result = new HashMap<>();
		if(file.isEmpty()) {
			result.put("error", "파일이 비어있습니다.");
			return result;
		}
		
		String oriName = file.getOriginalFilename();
		String extension = oriName.substring(oriName.lastIndexOf(".") + 1).toLowerCase();
		
		if(!extension.matches("jpg|jpeg|png|gif|webp")) {
			result.put("error", "지원하지 않는 파일 형식입니다.");
			return result;
		}
		
		String sysName = UUID.randomUUID().toString() + "." + extension;
		String path = "D:/uploads/files/";
		File uploadDir = new File(path);
		if(!uploadDir.exists()) {
			uploadDir.mkdirs();
		}
		
		file.transferTo(new File(path + sysName));
		result.put("url", "/uploads/files/" + sysName);
		return result;
	}
	
	@RequestMapping("/chat")
	@ResponseBody
	public String chat(LiveChatDTO dto, HttpSession session, Model model) throws Exception {
	    String id = (String)session.getAttribute("id");
	    String team = dao.isUserTeam(id);
	    dto.setWriter(id);
	    dto.setTeam(team);
	    dao.addChat(dto);
	    return "success";
	}
	
	@RequestMapping("/chatList")
	@ResponseBody
	public List<LiveChatDTO> chatList(int game_id) throws Exception {
		return dao.getChatList(game_id);
	}
}
