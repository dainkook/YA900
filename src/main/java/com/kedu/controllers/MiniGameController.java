
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
import com.kedu.dao.QuizDAO;
import com.kedu.dto.MyTeamDTO;
import com.kedu.dto.PlayerDTO;
import com.kedu.dto.QuizDTO;

@Controller
public class MiniGameController {

    @Autowired
    private PlayerDAO playerDAO;

    @Autowired
    private QuizDAO quizDAO;

    // =========================
    // 나만의 팀
    // =========================
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

    // 나만의 팀 결과 페이지
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

    // 나만의 팀 저장 및 수정
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

    // =========================
    // 경기 예측
    // =========================
    @RequestMapping("/prediction")
    public String prediction() {
        return "minigame/prediction";
    }

   
    // 퀴즈 메인 페이지
    @RequestMapping("/quiz")
    public String quiz(HttpSession session, Model model) {

        // 전체 등록된 퀴즈 수
        int quizCount = quizDAO.selectQuizCount();

        // 한 판 출제 문제 수
        int playCount = quizDAO.selectQuizPlayCount();

        // 정답 한 문제당 포인트
        int pointPerCorrect = quizDAO.selectPointPerCorrect();

        // 획득 가능한 최대 포인트
        int maxPoint = playCount * pointPerCorrect;

        model.addAttribute("quizCount", quizCount);
        model.addAttribute("playCount", playCount);
        model.addAttribute("pointPerCorrect", pointPerCorrect);
        model.addAttribute("maxPoint", maxPoint);

        // 기존 랭킹 및 로그인 사용자 정보 로직은 그대로 유지
        model.addAttribute("rankingList", quizDAO.selectQuizRanking());

        String id = (String) session.getAttribute("id");

        if (id != null) {
            model.addAttribute("summary", quizDAO.selectQuizSummary(id));
            model.addAttribute("latest", quizDAO.selectLatestQuizResult(id));
        }

        return "minigame/quiz";
    }
    
    // 퀴즈 시작 페이지
    @RequestMapping(value = "/quiz/start", method = RequestMethod.GET)
    public String quizStart(Model model, HttpSession session) {

        String id = (String) session.getAttribute("id");

        if (id == null) {
            return "redirect:/login";
        }

        // 랜덤 퀴즈 10개 조회
        List<QuizDTO> list = quizDAO.selectQuiz();

        // 출제할 문제가 없는 경우
        if (list == null || list.isEmpty()) {
            model.addAttribute("list", list);
            return "minigame/quizPlay";
        }

        // 조회한 문제 목록을 JSP로 전달
        model.addAttribute("list", list);

        return "minigame/quizPlay";
    }

   
    // 퀴즈 결과 저장
    @ResponseBody
    @RequestMapping(value = "/quiz/submit", method = RequestMethod.POST)
    public String submitQuiz(
            @RequestParam(value = "quizIds", required = false)
            List<Integer> quizIds,

            @RequestParam(value = "userAnswers", required = false)
            List<String> userAnswers,

            HttpSession session,
            javax.servlet.http.HttpServletResponse response) {

        // 로그인 여부 확인
        String memberId = (String) session.getAttribute("id");

        if (memberId == null || memberId.trim().isEmpty()) {
            response.setStatus(401);
            return "로그인이 필요합니다.";
        }

        // 전송 데이터 확인
        if (quizIds == null || userAnswers == null
                || quizIds.isEmpty()
                || quizIds.size() != userAnswers.size()
                || quizIds.size() > 10) {

            response.setStatus(400);
            return "퀴즈 전송 데이터가 올바르지 않습니다.";
        }

        // 중복 문제 ID 및 답안 확인
        Set<Integer> uniqueQuizIds = new HashSet<Integer>();

        for (int i = 0; i < quizIds.size(); i++) {

            Integer quizId = quizIds.get(i);
            String answer = userAnswers.get(i);

            if (quizId == null || quizId <= 0
                    || !uniqueQuizIds.add(quizId)) {

                response.setStatus(400);
                return "문제 ID가 올바르지 않습니다.";
            }

            if (answer == null
                    || !("O".equals(answer) || "X".equals(answer))) {

                response.setStatus(400);
                return "답안은 O 또는 X만 가능합니다.";
            }
        }

        try {

            // DAO에서 정답을 다시 조회하고 점수 및 결과를 저장
            quizDAO.saveQuizResult(memberId, quizIds, userAnswers);

            // fetch()에서 성공으로 인식할 응답
            return "OK";

        } catch (Exception e) {

            // 실제 오류는 서버 콘솔에서 확인
            e.printStackTrace();

            response.setStatus(500);
            return "퀴즈 결과 저장에 실패했습니다.";
        }
    }
    // 퀴즈 기록 조회
    @RequestMapping(value = "/quiz/history", method = RequestMethod.GET)
    public String quizHistory(HttpSession session, Model model) {

        // 로그인한 회원의 아이디 가져오기
        String id = (String) session.getAttribute("id");

        // 로그인하지 않은 경우 로그인 페이지로 이동
        if (id == null) {
            return "redirect:/login";
        }

        // 해당 회원의 퀴즈 기록 조회
        List<Map<String, Object>> historyList =
                quizDAO.selectHistory(id);

        // 조회 결과를 JSP로 전달
        model.addAttribute("historyList", historyList);

        // 기록 조회 화면으로 이동
        return "minigame/quizHistory";
    }
    
    // 퀴즈 기록 상세 페이지
    @RequestMapping(value = "/quiz/history/detail", method = RequestMethod.GET)
    public String quizHistoryDetail(
            @RequestParam("resultId") int resultId,
            HttpSession session,
            Model model) {

        // 로그인한 회원 아이디 확인
        String id = (String) session.getAttribute("id");

        // 로그인하지 않았다면 로그인 페이지로 이동
        if (id == null) {
            return "redirect:/login";
        }

        // 해당 회차의 상세 기록 조회
        List<Map<String, Object>> detailList =
                quizDAO.selectHistoryDetail(resultId, id);

        // 기록이 없거나 본인의 기록이 아니라면 전체 기록으로 이동
        if (detailList.isEmpty()) {
            return "redirect:/quiz/history";
        }

        model.addAttribute("detailList", detailList);
        model.addAttribute("resultId", resultId);

        return "minigame/quizHistoryDetail";
    }
}