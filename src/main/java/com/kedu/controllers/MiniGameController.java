package com.kedu.controllers;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kedu.dao.PlayerDAO;
import com.kedu.dao.PredictionDAO;
import com.kedu.dao.PredictionResultDAO;
import com.kedu.dao.QuizAttemptDAO;
import com.kedu.dao.QuizDAO;
import com.kedu.dao.QuizResultDAO;
import com.kedu.dao.UsersDAO;
import com.kedu.dto.MyTeamDTO;
import com.kedu.dto.PlayerDTO;
import com.kedu.dto.PredictionResultDTO;
import com.kedu.dto.PredictionViewDTO;
import com.kedu.dto.QuizAttemptDTO;
import com.kedu.dto.QuizAttemptDetailDTO;
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

	@Autowired
	private QuizResultDAO quizResultDAO;

	@Autowired
	private QuizAttemptDAO quizAttemptDAO;

	@RequestMapping("/myteam")
	public String myTeam(Model model, HttpSession session,
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
	public String myTeamResultPost(MyTeamDTO dto, HttpSession session, Model model) {

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
			predictionresultDAO.isUserCorrect(id);
			model.addAttribute("myPoint", predictionresultDAO.getUserPoint(id));
			model.addAttribute("predictionCount", predictionresultDAO.getPredictionCount(id));
			model.addAttribute("hitRate", predictionresultDAO.getHitRate(id));
			model.addAttribute("myPredictionList", predictionresultDAO.selectMyPredictions(id));
		}

		return "minigame/prediction";
	}

	@RequestMapping(value = "/prediction/submit", method = RequestMethod.POST)
	public String submitPrediction(@RequestParam("predictionIds") List<Integer> predictionIds,
			@RequestParam("choices") List<Integer> choices, HttpSession session) {

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

		model.addAttribute("rankingList", quizDAO.selectQuizRanking());

		String id = (String) session.getAttribute("id");

		if (id != null) {
			// 기존 로그인 사용자 정보
			model.addAttribute("summary", quizDAO.selectQuizSummary(id));
			model.addAttribute("latest", quizDAO.selectLatestQuizResult(id));
			model.addAttribute("point", usersDAO.selectUser(id).getPoint());
			model.addAttribute("pointHistoryList", quizDAO.selectPointHistory(id));

			// 오늘 퀴즈 참여 횟수 조회
			int todayCount = quizResultDAO.countTodayPlays(id);

			// JSP로 참여 횟수 전달
			model.addAttribute("todayCount", todayCount);

		} else {
			// 비로그인 상태에서는 참여 횟수를 0으로 표시
			model.addAttribute("todayCount", 0);
		}

		return "minigame/quiz";
	}

	@RequestMapping(value = "/quiz/start", method = RequestMethod.GET)
	public String quizStart(Model model, HttpSession session) {

	    String id = (String) session.getAttribute("id");

	    // 1. 로그인 확인
	    if (id == null) {
	        return "redirect:/login";
	    }

	    // 2. 진행 중인 퀴즈가 있는지 먼저 조회
	    QuizAttemptDTO attempt = quizAttemptDAO.selectInProgress(id);

	    List<QuizDTO> list;
	    int attemptId;
	    int currentQuestion;

	    if (attempt != null) {

	        // 기존 진행 기록이 있으므로 이어하기 안내창 표시
	        model.addAttribute("resumeAttempt", true);

	        // 3. 기존 퀴즈 문제 불러오기
	        attemptId = attempt.getAttempt_id();

	        list = quizAttemptDAO.selectAttemptQuizList(attemptId);

	        currentQuestion = attempt.getCurrent_question();

	        // 저장된 문제가 없으면 오류 안내
	        if (list == null || list.isEmpty()) {
	            model.addAttribute("list", list);
	            model.addAttribute("error", "퀴즈 문제를 불러오지 못했습니다.");
	            return "minigame/quizPlay";
	        }

	    } else {

	        // 기존 진행 기록이 없으므로 안내창 없이 바로 시작
	        model.addAttribute("resumeAttempt", false);

	        // 4. 진행 중인 퀴즈가 없을 때만 하루 참여 횟수 확인
	        int todayCount = quizResultDAO.countTodayPlays(id);

	        if (todayCount >= 2) {
	            return "redirect:/quiz?limit=1";
	        }

	        // 5. 새 퀴즈 문제 조회
	        list = quizDAO.selectQuiz();

	        if (list == null || list.isEmpty()) {
	            model.addAttribute("list", list);
	            model.addAttribute("error", "출제할 문제가 없습니다.");
	            return "minigame/quizPlay";
	        }

	        // 6. 새 진행 기록 생성 및 문제 목록 저장
	        attemptId = quizAttemptDAO.insertAttempt(id);
	        quizAttemptDAO.insertAttemptDetails(attemptId, list);

	        currentQuestion = 1;
	    }

	    // 7. JSP로 전달할 퀴즈 데이터
	    model.addAttribute("list", list);
	    model.addAttribute("attemptId", attemptId);
	    model.addAttribute("currentQuestion", currentQuestion);

	    // 8. DB에 저장된 문제별 답안 목록 조회
	    model.addAttribute(
	        "attemptDetails",
	        quizAttemptDAO.selectAttemptDetails(attemptId)
	    );

	    return "minigame/quizPlay";
	}

	// 답안 선택 시 DB에 저장
	@ResponseBody
	@RequestMapping(value = "/quiz/answer", method = RequestMethod.POST)
	public String saveQuizAnswer(@RequestParam("attemptId") int attemptId,
			@RequestParam("questionOrder") int questionOrder, @RequestParam("selectedAnswer") String selectedAnswer,
			HttpSession session, HttpServletResponse response) {

		String memberId = (String) session.getAttribute("id");

		// 로그인 확인
		if (memberId == null) {
			response.setStatus(401);
			return "LOGIN_REQUIRED";
		}

		// 입력값 확인
		if (attemptId <= 0 || questionOrder < 1 || questionOrder > 10
				|| !("O".equals(selectedAnswer) || "X".equals(selectedAnswer))) {
			response.setStatus(400);
			return "INVALID_DATA";
		}

		// 해당 회원의 진행 중인 퀴즈인지 확인
		QuizAttemptDTO attempt = quizAttemptDAO.selectInProgress(memberId);

		if (attempt == null || attempt.getAttempt_id() != attemptId) {
			response.setStatus(403);
			return "INVALID_ATTEMPT";
		}

		// 답안 저장
		int result = quizAttemptDAO.updateAnswer(attemptId, questionOrder, selectedAnswer);

		if (result != 1) {
			response.setStatus(400);
			return "ANSWER_SAVE_FAILED";
		}

		return "OK";
	}

	// 다음 문제로 이동할 때 현재 문제 번호 저장
	@ResponseBody
	@RequestMapping(value = "/quiz/progress", method = RequestMethod.POST)
	public String saveQuizProgress(@RequestParam("attemptId") int attemptId,
			@RequestParam("currentQuestion") int currentQuestion, HttpSession session,
			HttpServletResponse response) {

		String memberId = (String) session.getAttribute("id");

		// 로그인 확인
		if (memberId == null) {
			response.setStatus(401);
			return "LOGIN_REQUIRED";
		}

		// 문제 번호 확인
		if (attemptId <= 0 || currentQuestion < 2 || currentQuestion > 10) {
			response.setStatus(400);
			return "INVALID_DATA";
		}

		// 해당 회원의 진행 중인 퀴즈인지 확인
		QuizAttemptDTO attempt = quizAttemptDAO.selectInProgress(memberId);

		if (attempt == null || attempt.getAttempt_id() != attemptId) {
			response.setStatus(403);
			return "INVALID_ATTEMPT";
		}

		// 직전 문제에 답했는지 확인
		List<com.kedu.dto.QuizAttemptDetailDTO> details = quizAttemptDAO.selectAttemptDetails(attemptId);

		if (details == null || details.size() < currentQuestion
				|| !"O".equals(details.get(currentQuestion - 2).getSelected_answer())
						&& !"X".equals(details.get(currentQuestion - 2).getSelected_answer())) {
			response.setStatus(400);
			return "PREVIOUS_ANSWER_REQUIRED";
		}

		// 현재 문제 번호 업데이트
		int result = quizAttemptDAO.updateCurrentQuestion(attemptId, currentQuestion);

		if (result != 1) {
			response.setStatus(400);
			return "PROGRESS_SAVE_FAILED";
		}

		return "OK";
	}

	// 퀴즈 최종 제출
	// 결과 저장, 포인트 적립, 완료 처리를 하나의 트랜잭션으로 실행
	@Transactional(rollbackFor = Exception.class)
	@ResponseBody
	@RequestMapping(value = "/quiz/submit", method = RequestMethod.POST)
	public String submitQuiz(@RequestParam("attemptId") int attemptId, HttpSession session,
			HttpServletResponse response) {

		String memberId = (String) session.getAttribute("id");

		// 1. 로그인 확인
		if (memberId == null || memberId.trim().isEmpty()) {
			response.setStatus(401);
			return "LOGIN_REQUIRED";
		}

		// 2. 진행 기록 ID 확인
		if (attemptId <= 0) {
			response.setStatus(400);
			return "INVALID_ATTEMPT_ID";
		}

		// 3. 해당 회원의 진행 중인 퀴즈인지 확인
		QuizAttemptDTO attempt = quizAttemptDAO.selectInProgress(memberId);

		System.out.println("회원 ID: " + memberId);
		System.out.println("제출 attemptId: " + attemptId);

		if (attempt == null) {
		    System.out.println("진행 중인 퀴즈를 찾지 못함");
		} else {
		    System.out.println("DB attemptId: " + attempt.getAttempt_id());
		    System.out.println("DB 상태: " + attempt.getStatus());
		}
		
		if (attempt == null || attempt.getAttempt_id() != attemptId) {
			response.setStatus(403);
			return "INVALID_ATTEMPT";
		}

		// 4. DB에 저장된 문제별 답안 조회
		List<QuizAttemptDetailDTO> details = quizAttemptDAO.selectAttemptDetails(attemptId);

		// 현재 퀴즈는 10문제이므로 10개인지 확인
		if (details == null || details.size() != 10) {
			response.setStatus(400);
			return "INVALID_QUESTION_COUNT";
		}

		List<Integer> quizIds = new ArrayList<Integer>();
		List<String> userAnswers = new ArrayList<String>();

		Set<Integer> uniqueQuizIds = new HashSet<Integer>();

		for (int i = 0; i < details.size(); i++) {

			QuizAttemptDetailDTO detail = details.get(i);

			// 문제 순서가 1부터 10까지 정상인지 확인
			if (detail.getQuestion_order() != i + 1) {
				response.setStatus(400);
				return "INVALID_QUESTION_ORDER";
			}

			// 문제 ID 중복 확인
			int quizId = detail.getQuiz_id();

			if (quizId <= 0 || !uniqueQuizIds.add(quizId)) {
				response.setStatus(400);
				return "INVALID_QUESTION_ID";
			}

			// 모든 문제에 답했는지 확인
			String answer = detail.getSelected_answer();

			if (!"O".equals(answer) && !"X".equals(answer)) {
				response.setStatus(400);
				return "UNANSWERED_QUESTION";
			}

			quizIds.add(quizId);
			userAnswers.add(answer);
		}

		// 5. 결과 저장, 포인트 적립, 완료 처리를 트랜잭션으로 실행
		try {
			int correctCount = quizDAO.saveQuizResult(memberId, quizIds, userAnswers);

			int earnedPoint = correctCount * 10;

			int updateRows = usersDAO.updatePoint(memberId, earnedPoint);

			if (updateRows != 1) {
				throw new IllegalStateException("포인트 적립에 실패했습니다.");
			}

			int completedRows = quizAttemptDAO.completeAttempt(attemptId, memberId);

			if (completedRows != 1) {
				throw new IllegalStateException("퀴즈 완료 처리에 실패했습니다.");
			}

			return "OK";

		} catch (Exception e) {
			// 예외를 다시 던져야 트랜잭션이 롤백될 수 있음
			throw new RuntimeException("퀴즈 결과 저장에 실패했습니다.", e);
		}
	}

	@RequestMapping(value = "/quiz/history", method = RequestMethod.GET)
	public String quizHistory(HttpSession session, Model model) {

		String id = (String) session.getAttribute("id");

		if (id == null) {
			return "redirect:/login";
		}

		List<Map<String, Object>> historyList = quizDAO.selectHistory(id);

		model.addAttribute("historyList", historyList);

		return "minigame/quizHistory";
	}

	@RequestMapping(value = "/quiz/history/detail", method = RequestMethod.GET)
	public String quizHistoryDetail(@RequestParam("resultId") int resultId, HttpSession session, Model model) {

		String id = (String) session.getAttribute("id");

		if (id == null) {
			return "redirect:/login";
		}

		List<Map<String, Object>> detailList = quizDAO.selectHistoryDetail(resultId, id);

		if (detailList.isEmpty()) {
			return "redirect:/quiz/history";
		}

		model.addAttribute("detailList", detailList);
		model.addAttribute("resultId", resultId);

		return "minigame/quizHistoryDetail";
	}

	@RequestMapping("/quiz/pointHistory")
	public String pointHistory(HttpSession session, Model model) {
		String memberId = (String) session.getAttribute("id");

		if (memberId == null) {
			return "redirect:/login";
		}
		List<Map<String, Object>> pointHistoryList = quizDAO.selectPointHistory(memberId);

		model.addAttribute("pointHistoryList", pointHistoryList);
		return "minigame/quiz";
	}
}