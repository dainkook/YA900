package com.kedu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.QuizAttemptDTO;
import com.kedu.dto.QuizAttemptDetailDTO;
import com.kedu.dto.QuizDTO;

@Repository
public class QuizAttemptDAO {

	@Autowired
	private JdbcTemplate jdbc;

	// 회원의 진행 중인 퀴즈 조회
	public QuizAttemptDTO selectInProgress(String memberId) {
		String sql = "SELECT attempt_id, member_id, current_question, " + "status, started_at, updated_at "
				+ "FROM quiz_attempt " + "WHERE member_id = ? " + "AND status = 'IN_PROGRESS' "
				+ "ORDER BY started_at DESC";
		return jdbc.query(sql, new BeanPropertyRowMapper<>(QuizAttemptDTO.class), memberId).stream().findFirst()
				.orElse(null);
	}

	// 새 퀴즈 진행 기록 생성
	public int insertAttempt(String memberId) {

		// 1. 시퀀스로 새로운 진행 번호 발급
		String seqSql = "SELECT quiz_attempt_seq.NEXTVAL FROM dual";

		int attemptId = jdbc.queryForObject(seqSql, Integer.class);

		// 2. 진행 기록 테이블에 저장
		String sql = "INSERT INTO quiz_attempt " + "(attempt_id, member_id, current_question, "
				+ "status, started_at, updated_at) " + "VALUES (?, ?, 1, 'IN_PROGRESS', "
				+ "SYSTIMESTAMP, SYSTIMESTAMP)";

		jdbc.update(sql, attemptId, memberId);

		// 생성한 진행 번호 반환
		return attemptId;
	}

	// 퀴즈 진행 기록에 출제 문제 저장
	public void insertAttemptDetails(int attemptId, List<QuizDTO> quizList) {

		String sql = "INSERT INTO quiz_attempt_detail " + "(attempt_id, question_order, quiz_id, selected_answer) "
				+ "VALUES (?, ?, ?, NULL)";

		for (int i = 0; i < quizList.size(); i++) {

			int questionOrder = i + 1;
			int quizId = quizList.get(i).getQuiz_id();

			jdbc.update(sql, attemptId, questionOrder, quizId);
		}
	}

	// 사용자가 선택한 답안 저장
	public int updateAnswer(int attemptId, int questionOrder, String selectedAnswer) {

		String sql = "UPDATE quiz_attempt_detail " + "SET selected_answer = ? " + "WHERE attempt_id = ? "
				+ "AND question_order = ?";

		return jdbc.update(sql, selectedAnswer, attemptId, questionOrder);
	}

	// 현재 문제 순서 업데이트
	public int updateCurrentQuestion(int attemptId, int currentQuestion) {

		String sql = "UPDATE quiz_attempt " + "SET current_question = ?, " + "updated_at = SYSTIMESTAMP "
				+ "WHERE attempt_id = ? " + "AND status = 'IN_PROGRESS'";

		return jdbc.update(sql, currentQuestion, attemptId);
	}

	// 진행 기록에 저장된 문제 목록 조회
	public List<QuizDTO> selectAttemptQuizList(int attemptId) {

		String sql = "SELECT q.quiz_id, q.quiz_contents, q.answer, " + "q.explanation, q.category "
				+ "FROM quiz_attempt_detail d " + "JOIN quiz q ON d.quiz_id = q.quiz_id " + "WHERE d.attempt_id = ? "
				+ "ORDER BY d.question_order";

		return jdbc.query(sql, new BeanPropertyRowMapper<>(QuizDTO.class), attemptId);
	}

	// 진행 기록에 저장된 답안 목록 조회
	public List<QuizAttemptDetailDTO> selectAttemptDetails(int attemptId) {

		String sql = "SELECT attempt_id, question_order, quiz_id, selected_answer " + "FROM quiz_attempt_detail "
				+ "WHERE attempt_id = ? " + "ORDER BY question_order";

		return jdbc.query(sql, new BeanPropertyRowMapper<>(QuizAttemptDetailDTO.class), attemptId);
	}

	// 퀴즈 제출 완료 처리 / 진행 중인 기록만 완료 상태로 변경
	public int completeAttempt(int attemptId, String memberId) {

		String sql = "UPDATE quiz_attempt " + "SET status = 'COMPLETED', " + "updated_at = SYSTIMESTAMP "
				+ "WHERE attempt_id = ? " + "AND member_id = ? " + "AND status = 'IN_PROGRESS'";

		return jdbc.update(sql, attemptId, memberId);
	}
}
