package com.kedu.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kedu.dao.PlayerDAO;
import com.kedu.dto.MyTeamDTO;
import com.kedu.dto.PlayerDTO;

@Controller
public class MiniGameController {
	
	@Autowired
	private PlayerDAO playerDAO;
	
	@RequestMapping("/myteam")
	public String myTeam(Model model,HttpSession session,@RequestParam(value="edit", required=false) String edit) {

	    String id = (String) session.getAttribute("id");

	    int count = playerDAO.countMyTeam(id);

	    if (count > 0 && !"true".equals(edit)) {
	        return "redirect:/myteamresult";
	    }

	    List<PlayerDTO> playerList = playerDAO.selectAll();
	    List<PlayerDTO> myPlayerList = playerDAO.selectMyTeamPlayers(id);

	    model.addAttribute("playerList", playerList);
	    model.addAttribute("myPlayerList", myPlayerList);

	    return "minigame/myteam";
	}

	
	@RequestMapping(value="/myteamresult", method=RequestMethod.GET)
	public String myTeamResult(HttpSession session, Model model) {
	    String id = (String)session.getAttribute("id");
	    
	    int result = playerDAO.countMyTeam(id);
	    List<PlayerDTO> myPlayerList = playerDAO.selectMyTeamPlayers(id);

	    model.addAttribute("myPlayerList", myPlayerList);
	    if(result > 0) {
	    	return "minigame/myteamresult";
	    } else {
	    	return "minigame/myteam";
	    }
	   
	}
	
	@RequestMapping(value="/myteamresult", method=RequestMethod.POST)
	public String myTeamResultPost( MyTeamDTO dto,HttpSession session,Model model) {

	    String id = (String) session.getAttribute("id");

	    int count = playerDAO.countMyTeam(id);

	    if (count > 0) {
	        playerDAO.updateMyTeam(dto, id);
	    } else {
	        playerDAO.addMyTeam(dto, id);
	    }
	    return "redirect:/myteamresult";
	}
	
	@RequestMapping("/prediction")
	public String prediction() {
		
		return "minigame/prediction";
	}
	
	@RequestMapping("/quiz")
	public String quiz() {
		return "minigame/quiz";
	}

}
