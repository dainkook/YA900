package com.kedu.controllers;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
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
import com.kedu.dto.Re_ReplyDTO;
import com.kedu.dto.ReplyDTO;
import com.kedu.dto.ReportDTO;

@Controller
@RequestMapping("/board")
public class BoardController {
   
   @Autowired
   private BoardDAO dao;
   @Autowired
   private FilesDAO fdao;
   
   @RequestMapping("/board")
   public String board(Model model,
           @RequestParam(defaultValue = "1") int cpage,
           @RequestParam(required = false) String team
   ) throws Exception {
       List<BoardDTO> list;
       int totalCount;
       if ("free".equals(team)) {
    	   list = dao.listOfPageNotTeam(cpage * 10 - 9, cpage * 10);
    	   totalCount = dao.totalCountFreeBoard();
    	   model.addAttribute("selectedTeam", "자유");
           
       } else if(team!=null&&!team.trim().isEmpty()) {
    	   list = dao.listOfPageByTeam(team, cpage * 10 - 9, cpage * 10);
           totalCount = dao.totalCountByTeam(team);
           model.addAttribute("selectedTeam", team);
       } else {
           list = dao.listOfPage(cpage * 10 - 9, cpage * 10);
           totalCount = dao.totalCount();
       }
       model.addAttribute("list", list);
       model.addAttribute("recordTotalCount", totalCount);
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
		List<Re_ReplyDTO> re_replyList = dao.getReReplyList(seq);
		model.addAttribute("re_replyList", re_replyList);
		dao.viewCount(seq);
		return "/board/detail";
	}
	
	@RequestMapping("/write")
	public String write(HttpSession session, Model model) throws Exception {
	    String id = (String) session.getAttribute("id");
	    if (id == null) {
	        return "redirect:/login";
	    }
	    String myTeam = dao.isUserTeam(id);
	    if (myTeam == null || myTeam.trim().isEmpty()) {
	        return "redirect:/board/board?cpage=1";
	    }
	    return "/board/write";
	}
	

	@RequestMapping("/writeComplete")
	public String writeComplete(BoardDTO dto, HttpSession session, MultipartFile[] files) throws Exception {
	    String id = (String) session.getAttribute("id");
	    if (dto.getTeam() != null && dto.getTeam().trim().isEmpty()) {
	        dto.setTeam(null);
	    }
	    String myTeam = dao.isUserTeam(id);
	    if (myTeam == null || myTeam.trim().isEmpty()) {
	        return "redirect:/board/board?cpage=1";
	    }
	    dto.setTeam(myTeam);
	    dto.setWriter(id);
	    int seq = dao.getNextval();
	    dto.setBoard_seq(seq);
	    dao.write(dto);
	    String path = "d:/uploads/";
	    if (files != null) {
	        for (MultipartFile file : files) {
	            if (file == null || file.isEmpty()) {
	                continue;
	            }
	            String oriName = file.getOriginalFilename();
	            String sysName = UUID.randomUUID() + "_" + oriName;
	            file.transferTo(new File(path + sysName));
	            fdao.insertFile(
	                new FilesDTO(0, oriName, sysName, null, seq)
	            );
	        }
	    }
	    return "redirect:/board/board?team="
	            + URLEncoder.encode(myTeam, "UTF-8")
	            + "&cpage=1";
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
			result.put("error", "");
			return result;
		}
		
		String oriName = file.getOriginalFilename();
		String extension = oriName.substring(oriName.lastIndexOf(".") + 1).toLowerCase();
		
		if(!extension.matches("jpg|jpeg|png|gif|webp")) {
			result.put("error", "");
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
	    String teamLogo = dao.isTeamLogo(team);
	    dto.setWriter(id);
	    dto.setTeam(team);
	    dto.setTeamLogo(teamLogo);
	    dao.addChat(dto);
	    return "success";
	}
	
	@RequestMapping("/chatList")
	@ResponseBody
	public List<LiveChatDTO> chatList(int game_id, HttpSession session, Model model) throws Exception {
		return dao.getChatList(game_id);
	}
	
	@RequestMapping("/replyWrite")
	public String replyWrite(ReplyDTO dto) throws Exception {
		dao.addReply(dto);
		return "redirect:/board/detail?seq=" + dto.getParent_seq();
	}
	
	@RequestMapping("/replyUpdate")
	public String replyUpdate(ReplyDTO dto) throws Exception {
		dao.updateReply(dto);
		return "redirect:/board/detail?seq=" + dto.getParent_seq();
	}
	
	@RequestMapping("/replyDelete")
	public String replyDelete(int re_reply_seq, int parent_seq) throws Exception {
		dao.deleteReply(re_reply_seq);
		return "redirect:/board/detail?seq=" + parent_seq;
	}
	
	@RequestMapping("/re_replyWrite")
	public String reReplyWrite(Re_ReplyDTO dto) throws Exception {
		dao.addReReply(dto);
		return "redirect:/board/detail?seq=" + dto.getBoards_seq();
	}
	
	@RequestMapping("/re_replyUpdate")
	public String reReplyUpdate(Re_ReplyDTO dto) throws Exception {
		dao.updateReReply(dto);
		return "redirect:/board/detail?seq=" + dto.getBoards_seq();
	}
	
	@RequestMapping("/re_replyDelete")
	public String reReplyDelete(int re_reply_seq, int boards_seq) throws Exception {
		dao.deleteReReply(re_reply_seq);
		return "redirect:/board/detail?seq=" + boards_seq;
	}
	
	@RequestMapping("/report")
	public String report() throws Exception {
		return "/board/report";
	}
	
	@RequestMapping("/reportComplete")
	public String reportComplete(ReportDTO dto, Model model) throws Exception {
	    dao.addReport(dto);
	    int seq = dto.getParent_seq();
	    model.addAttribute("seq", seq);
	    return "board/reportComplete";
	}
}
