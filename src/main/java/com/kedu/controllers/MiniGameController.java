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
import com.kedu.dao.PredictionDAO;
import com.kedu.dao.PredictionResultDAO;
import com.kedu.dto.MyTeamDTO;
import com.kedu.dto.PlayerDTO;
import com.kedu.dto.PredictionResultDTO;
import com.kedu.dto.PredictionViewDTO;

@Controller
public class MiniGameController {
	
	@Autowired
	private PlayerDAO playerDAO;
	
	@Autowired
	private PredictionDAO predictionDAO;

	@Autowired
	private PredictionResultDAO predictionresultDAO;
	
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
	public String prediction(Model model,HttpSession session) {
		
		List<PredictionViewDTO> predictionList = predictionDAO.selectAllPredictions();
		String id = (String) session.getAttribute("id");
		model.addAttribute("predictionList", predictionList);
		if(id != null) {
			model.addAttribute("myPredictionList", predictionresultDAO.selectMyPredictions(id));
		}
		
		return "minigame/prediction";
	}
	
	@RequestMapping(value = "/prediction/submit", method = RequestMethod.POST)
	public String submitPrediction(@RequestParam("predictionIds") List<Integer> predictionIds, @RequestParam("choices") List<Integer> choices, HttpSession session) {

	    String id = (String) session.getAttribute("id");

	    for (int i = 0; i < predictionIds.size(); i++) {
	        int predictionId = predictionIds.get(i);
	        int choice = choices.get(i);

	        Integer teamId = predictionDAO.selectTeamIdForChoice(predictionId, choice);
	        
	        if (teamId == null) {
	            throw new IllegalArgumentException(
	                "ÆÀ ID Á¶È¸ ½ÇÆÐ - predictionId: " + predictionId
	                + ", choice: " + choice
	            );
	        }

	        PredictionResultDTO dto = new PredictionResultDTO();
	        dto.setPrediction_id(predictionId);
	        dto.setMember_id(id);
	        dto.setTeam_id(teamId);
	        dto.setPredicted_result(choice);

	        predictionresultDAO.insertPredictionResult(dto);
	    }

	    return "redirect:/prediction";
	}
	
	
	@RequestMapping("/quiz")
	public String quiz() {
		return "minigame/quiz";
	}

}
