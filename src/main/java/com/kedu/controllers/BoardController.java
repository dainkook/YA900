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
import com.kedu.dao.admin.NoticeDAO;
import com.kedu.dto.BoardDTO;
import com.kedu.dto.FilesDTO;
import com.kedu.dto.LiveChatDTO;
import com.kedu.dto.NoticeDTO;
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
   @Autowired
   private NoticeDAO ndao;
   
   @RequestMapping("/board")
   public String board(Model model,
           @RequestParam(defaultValue = "1") int cpage,
           @RequestParam(required = false) String team
   ) throws Exception {
       List<BoardDTO> list;
       List<NoticeDTO> notice;
       int totalCount;
       if ("free".equals(team)) {
    	   list = dao.listOfPageNotTeam(cpage * 10 - 9, cpage * 10);
    	   totalCount = dao.totalCountFreeBoard();
    	   model.addAttribute("selectedTeam", "자유");
       } else if("notice".equals(team)){
           notice = ndao.selectPage(cpage * 10-9, cpage*10);
           list = dao.noticeToBoard(notice);
           totalCount = ndao.getCount();
           model.addAttribute("selectedTeam", "공지");
       } else if(team!=null&&!team.trim().isEmpty()) {
    	   list = dao.listOfPageByTeam(team, cpage * 10 - 9, cpage * 10);
           totalCount = dao.totalCountByTeam(team);
           model.addAttribute("teamLogo", dao.isTeamLogo(team));
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
	public String detail(String type, int seq, Model model) throws Exception {
		if("notice".equals(type)) {
		model.addAttribute("board", ndao.selectBySeq(seq));
		ndao.viewCount(seq);
		return "/board/noticeBoard";
		} else {
		model.addAttribute("board", dao.getDetail(seq));
		String writer = dao.whoIsWriter(seq);
		String logo = dao.teamLogoEditer(writer);
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
	}
	
	@RequestMapping("/write")
	public String write(HttpSession session, Model model) throws Exception {
	    String id = (String)session.getAttribute("id");
	    if (id == null) {
	        return "redirect:/login";
	    }
	    return "/board/write";
	}
	

	@RequestMapping("/writeComplete")
	public String writeComplete(BoardDTO dto, HttpSession session, MultipartFile[] files) throws Exception {
	    String id = (String) session.getAttribute("id");
	    if (dto.getTeam() != null && dto.getTeam().trim().isEmpty()) {
	        dto.setTeam(null);
	    }
	    dto.setWriter(id);
	    String logo = dao.isTeamLogo(dto.getTeam());
	    dto.setTeamLogo(logo);
	    int seq = dao.getNextval();
	    dto.setBoard_seq(seq);
	    dao.write(dto);
	    String path = "D:/uploads/";
	    File uploadDir = new File(path);
	    if (!uploadDir.exists()) {
	        uploadDir.mkdirs();
	    }
	    if (files != null) {
	        for (MultipartFile file : files) {
	            if (file == null || file.isEmpty()) {
	                continue;
	            }
	            String oriName = new File(file.getOriginalFilename()).getName();
	            String sysName = UUID.randomUUID() + "_" + oriName;
	            file.transferTo(new File(path + sysName));
	            fdao.insertFile(
	                new FilesDTO(0, oriName, sysName, null, seq)
	            );
	        }
	    }
	    if (dto.getTeam() == null) {
	        return "redirect:/board/board?cpage=1";
	    }

	    return "redirect:/board/board?team="
	            + URLEncoder.encode(dto.getTeam(), "UTF-8")
	            + "&cpage=1";
	}
	
	@RequestMapping("/search")
	public String search(String type, String option, String search, Model model, int cpage) throws Exception {
		if(!search.equals("")) {
			model.addAttribute("recordCountPerPage", 10);
			model.addAttribute("naviCountPerPage", 10);
			model.addAttribute("isSearch", true);
			model.addAttribute("option", option);
			model.addAttribute("search", search);
			model.addAttribute("cpage", cpage);
			if("notice".equals(type)) {
				if(option.equals("제목")) {
					List<NoticeDTO> list = ndao.searchPageByTitle(search, cpage*10-9, cpage*10);
					model.addAttribute("list", list);
					model.addAttribute("recordTotalCount", ndao.getCountByTitle(search));
					return "/board/board?team=notice&cpage=1";
				} else {
					List<NoticeDTO> list = ndao.searchPageByContents(search, cpage*10-9, cpage*10);
					model.addAttribute("list", list);
					model.addAttribute("recordTotalCount", ndao.getCountByContents(search));
					return "/board/board?team=notice&cpage=1";
				}
			} else {
				List<BoardDTO> list = dao.searchBoard(option, search, cpage*10-9, cpage*10);
				model.addAttribute("list", list);
				model.addAttribute("selectedTeam", type);
				model.addAttribute("recordTotalCount", dao.searchCount(option, search));
				return "/board/board";
			}
		} else {
			return "redirect:/board/board?cpage=1";		
			}
	}
	
	@RequestMapping("/updateDetail")
	public String updateDetail(int seq, String title, String contents,
	        HttpSession session,
	        @RequestParam(value = "files", required = false) MultipartFile[] files,
	        @RequestParam(value = "removedImages", required = false) String[] removedImages,
	        @RequestParam(value = "removedFileSeqs", required = false) Integer[] removedFileSeqs) throws Exception {

	    String id = (String) session.getAttribute("id");
	    BoardDTO board = dao.getDetail(seq);

	    // 작성자 본인만 수정할 수 있도록 확인
	    if (id == null || !id.equals(board.getWriter())) {
	        return "redirect:/board/detail?seq=" + seq;
	    }

	    dao.updateDetail(seq, title, contents);

	    // 본문에서 제거한 기존 Summernote 이미지 파일 삭제
	    if (removedImages != null) {
	        for (String imageUrl : removedImages) {
	            if (imageUrl == null || !imageUrl.startsWith("/uploads/files/")) {
	                continue;
	            }
	            // 최종 본문에 이미지가 남아 있으면 실제 파일은 삭제하지 않음
	            if (contents != null && contents.contains(imageUrl)) {
	                continue;
	            }

	            String fileName = imageUrl.substring("/uploads/files/".length());
	            if (!fileName.isEmpty() && !fileName.contains("/") && !fileName.contains("\\")) {
	                File imageFile = new File("D:/uploads/files/" + fileName);
	                if (imageFile.exists() && imageFile.isFile()) {
	                    imageFile.delete();
	                }
	            }
	        }
	    }

	    // 삭제 체크한 기존 첨부파일 제거
	    if (removedFileSeqs != null) {
	        List<FilesDTO> savedFiles = fdao.getFiles(seq);
	        for (Integer fileSeq : removedFileSeqs) {
	            if (fileSeq == null) {
	                continue;
	            }
	            for (FilesDTO savedFile : savedFiles) {
	                if (savedFile.getFile_seq() == fileSeq) {
	                    int deleted = fdao.deleteFile(fileSeq, seq);
	                    if (deleted > 0) {
	                        File target = new File("D:/uploads/" + savedFile.getSysName());
	                        if (target.exists() && target.isFile()) {
	                            target.delete();
	                        }
	                    }
	                    break;
	                }
	            }
	        }
	    }

	    // 수정 화면에서 새로 첨부한 파일 저장
	    String path = "D:/uploads/";
	    File uploadDir = new File(path);
	    if (!uploadDir.exists()) {
	        uploadDir.mkdirs();
	    }

	    if (files != null) {
	        for (MultipartFile file : files) {
	            if (file == null || file.isEmpty()) {
	                continue;
	            }

	            String oriName = new File(file.getOriginalFilename()).getName();
	            String sysName = UUID.randomUUID().toString() + "_" + oriName;
	            file.transferTo(new File(path + sysName));
	            fdao.insertFile(new FilesDTO(0, oriName, sysName, null, seq));
	        }
	    }

	    return "redirect:/board/detail?seq=" + seq;
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
		if(file == null || file.isEmpty()) {
			result.put("error", "업로드할 이미지 파일을 선택해주세요.");
			return result;
		}
		
		String oriName = file.getOriginalFilename();
		String extension = oriName.substring(oriName.lastIndexOf(".") + 1).toLowerCase();
		
		if(!extension.matches("jpg|jpeg|png|gif|webp")) {
			result.put("error", "JPG, JPEG, PNG, GIF, WEBP 이미지 파일만 업로드할 수 있습니다.");
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
	
	@RequestMapping("/deleteImage")
	@ResponseBody
	public Map<String, Object> deleteImage(@RequestParam("imageUrl") String imageUrl) throws Exception {
	    Map<String, Object> result = new HashMap<>();

	    if (imageUrl == null || !imageUrl.startsWith("/uploads/files/")) {
	        result.put("success", false);
	        return result;
	    }

	    String fileName = imageUrl.substring("/uploads/files/".length());

	    if (fileName.isEmpty() || fileName.contains("/") || fileName.contains("\\")) {
	        result.put("success", false);
	        return result;
	    }

	    File file = new File("D:/uploads/files/" + fileName);

	    if (file.exists() && file.isFile()) {
	        result.put("success", file.delete());
	    } else {
	        result.put("success", true);
	    }

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
	public String replyDelete(int reply_seq, int parent_seq) throws Exception {
		dao.deleteReply(reply_seq);
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
