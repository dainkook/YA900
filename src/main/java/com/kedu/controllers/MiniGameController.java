package com.kedu.controllers;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kedu.dao.PlayerDAO;
import com.kedu.dao.PredictionDAO;
import com.kedu.dao.PredictionResultDAO;
import com.kedu.dao.QuizDAO;
import com.kedu.dao.UsersDAO;
import com.kedu.dto.MyTeamDTO;
import com.kedu.dto.PlayerDTO;
import com.kedu.dto.PredictionResultDTO;
import com.kedu.dto.PredictionViewDTO;
import com.kedu.dto.QuizDTO;

@Controller
public class MiniGameController {

    @Autowired
    private PlayerDAO playerDAO;

  
    @Autowired
    private PredictionDAO predictionDAO;
    
    @Autowired 
    private PredictionResultDAO predictionresultDAO;

    @Autowired
    private QuizDAO quizDAO;
    
   @Autowired
   private UsersDAO usersDAO;
    
  

    @RequestMapping("/myteam")
    public String myTeam(
            Model model,
            HttpSession session,
            @RequestParam(value = "edit", required = false) String edit) {

        String id = (String) session.getAttribute("id");

        if (id == null) {
            return "redirect:/login";
        }

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


    @RequestMapping(value = "/myteamresult", method = RequestMethod.GET)
    public String myTeamResult(HttpSession session, Model model) {

        String id = (String) session.getAttribute("id");

        if (id == null) {
            return "redirect:/login";
        }

        int result = playerDAO.countMyTeam(id);
        List<PlayerDTO> myPlayerList = playerDAO.selectMyTeamPlayers(id);

        model.addAttribute("myPlayerList", myPlayerList);

        if (result > 0) {
            return "minigame/myteamresult";
        } else {
            return "minigame/myteam";
        }
    }

    @RequestMapping(value = "/myteamresult", method = RequestMethod.POST)
    public String myTeamResultPost(
            MyTeamDTO dto,
            HttpSession session,
            Model model) {

        String id = (String) session.getAttribute("id");

        if (id == null) {
            return "redirect:/login";
        }

        int count = playerDAO.countMyTeam(id);

        if (count > 0) {
            playerDAO.updateMyTeam(dto, id);
        } else {
            playerDAO.addMyTeam(dto, id);
        }

        return "redirect:/myteamresult";
    }

    @RequestMapping("/prediction")
    public String prediction(Model model, HttpSession session) {

        String id = (String) session.getAttribute("id");
        List<Integer> gameIds = predictionDAO.searchGameId();
        for (int i = 0; i < gameIds.size(); i++) {
            predictionDAO.insertPrediction(gameIds.get(i));
        }
        List<PredictionViewDTO> predictionList = predictionDAO.selectAllPredictions();
        model.addAttribute("predictionList", predictionList);
        if (id != null) {
            model.addAttribute(
                "myPredictionList",
                predictionresultDAO.selectMyPredictions(id)
            );
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
    public String quiz(HttpSession session, Model model) {

   
        int quizCount = quizDAO.selectQuizCount();

   
        int playCount = quizDAO.selectQuizPlayCount();

  
        int pointPerCorrect = quizDAO.selectPointPerCorrect();


        int maxPoint = playCount * pointPerCorrect;

        model.addAttribute("quizCount", quizCount);
        model.addAttribute("playCount", playCount);
        model.addAttribute("pointPerCorrect", pointPerCorrect);
        model.addAttribute("maxPoint", maxPoint);

  
        model.addAttribute("rankingList", usersDAO.selectPointRanking());

        String id = (String) session.getAttribute("id");

        if (id != null) {
            model.addAttribute("summary", quizDAO.selectQuizSummary(id));
            model.addAttribute("latest", quizDAO.selectLatestQuizResult(id));
            model.addAttribute("point", usersDAO.selectUser(id).getPoint());
            
            model.addAttribute("pointHistoryList",quizDAO.selectPointHistory(id));
        }

        return "minigame/quiz";
    }

    @RequestMapping(value = "/quiz/start", method = RequestMethod.GET)
    public String quizStart(Model model, HttpSession session) {

        String id = (String) session.getAttribute("id");

        if (id == null) {
            return "redirect:/login";
        }

  
        List<QuizDTO> list = quizDAO.selectQuiz();

     
        if (list == null || list.isEmpty()) {
            model.addAttribute("list", list);
            return "minigame/quizPlay";
        }

      
        model.addAttribute("list", list);

        return "minigame/quizPlay";
    }

   
    
    @ResponseBody
    @RequestMapping(value = "/quiz/submit", method = RequestMethod.POST)
    public String submitQuiz(
            @RequestParam(value = "quizIds", required = false)
            List<Integer> quizIds,

            @RequestParam(value = "userAnswers", required = false)
            List<String> userAnswers,

            HttpSession session,
            javax.servlet.http.HttpServletResponse response) {

    
        String memberId = (String) session.getAttribute("id");

        if (memberId == null || memberId.trim().isEmpty()) {
            response.setStatus(401);

            return "login plz";

        }

        if (quizIds == null || userAnswers == null
                || quizIds.isEmpty()
                || quizIds.size() != userAnswers.size()
                || quizIds.size() > 10) {

            response.setStatus(400);
            return "no data quiz";

        }

     
        Set<Integer> uniqueQuizIds = new HashSet<Integer>();

        for (int i = 0; i < quizIds.size(); i++) {

            Integer quizId = quizIds.get(i);
            String answer = userAnswers.get(i);

            if (quizId == null || quizId <= 0
                    || !uniqueQuizIds.add(quizId)) {

                response.setStatus(400);
                return "id boom";

            }

            if (answer == null
                    || !("O".equals(answer) || "X".equals(answer))) {

                response.setStatus(400);

                return "O or X";

            }
        }

        try {
        	int correctCount = quizDAO.saveQuizResult(memberId, quizIds, userAnswers);
        	int earnedPoint = correctCount * 10;
        	int updateRows = usersDAO.updatePoint(memberId, earnedPoint);
        	
        	if(updateRows !=1){
        		throw new IllegalStateException("포인트 적립에 실패했습니다.");
        	}
        		return "OK";
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(500);
            return "result quiz save X";

        }
    }
  
    @RequestMapping(value = "/quiz/history", method = RequestMethod.GET)
    public String quizHistory(HttpSession session, Model model) {

        
        String id = (String) session.getAttribute("id");

        
        if (id == null) {
            return "redirect:/login";
        }

        
        List<Map<String, Object>> historyList =
                quizDAO.selectHistory(id);

  
        model.addAttribute("historyList", historyList);

    
        return "minigame/quizHistory";
    }
    
  
    @RequestMapping(value = "/quiz/history/detail", method = RequestMethod.GET)
    public String quizHistoryDetail(
            @RequestParam("resultId") int resultId,
            HttpSession session,
            Model model) {

 
        String id = (String) session.getAttribute("id");

   
        if (id == null) {
            return "redirect:/login";
        }

      
        List<Map<String, Object>> detailList =
                quizDAO.selectHistoryDetail(resultId, id);

     
        if (detailList.isEmpty()) {
            return "redirect:/quiz/history";
        }

        model.addAttribute("detailList", detailList);
        model.addAttribute("resultId", resultId);

        return "minigame/quizHistoryDetail";
    }
    
    @RequestMapping("/quiz/pointHistory")
    	public String pointHistory(HttpSession session, Model model) {
    	String memberId=(String) session.getAttribute("id");
    	
    	if(memberId == null) {
    		return "redirect:/login";
    	}
    	List<Map<String, Object>> pointHistoryList =
    			quizDAO.selectPointHistory(memberId);
    	
    	model.addAttribute("pointHistoryList", pointHistoryList);
    	return "minigame/quiz";
    }
}