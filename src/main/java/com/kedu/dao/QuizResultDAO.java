
package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.QuizResultDTO;
import com.kedu.dto.QuizResultDetailDTO;

@Repository
public class QuizResultDAO {

    @Autowired
    private JdbcTemplate jdbc;

    // 퀴즈 전체 결과 저장
    public int insertResult(QuizResultDTO dto) {

        String sql =
            "INSERT INTO quiz_result " +
            "(result_id, member_id, total_count, correct_count, play_date) " +
            "VALUES (quiz_result_seq.NEXTVAL, ?, ?, ?, SYSTIMESTAMP)";

        return jdbc.update(
            sql,
            dto.getMember_id(),
            dto.getTotal_count(),
            dto.getCorrect_count()
        );
    }

    // 방금 저장한 결과의 번호 조회
    public int selectLatestResultId(String memberId) {

        String sql =
            "SELECT MAX(result_id) " +
            "FROM quiz_result " +
            "WHERE member_id = ?";

        Integer result = jdbc.queryForObject(
            sql,
            Integer.class,
            memberId
        );

        return result;
    }

    // 문제별 답안 저장
    public int insertResultDetail(QuizResultDetailDTO dto) {

        String sql =
            "INSERT INTO quiz_result_detail " +
            "(detail_id, result_id, quiz_id, user_answer, is_correct) " +
            "VALUES (quiz_result_detail_seq.NEXTVAL, ?, ?, ?, ?)";

        return jdbc.update(
            sql,
            dto.getResult_id(),
            dto.getQuiz_id(),
            dto.getUser_answer(),
            dto.getIs_correct()
        );
    }

    // 문제 ID로 정답 조회
    public String selectAnswer(int quizId) {

        String sql =
            "SELECT answer FROM quiz WHERE quiz_id = ?";

        return jdbc.queryForObject(
            sql,
            String.class,
            quizId
        );
    }
    
    // 오늘 퀴즈 참여 횟수 조회
    public int countTodayPlays(String memberId) {
    	String sql = "SELECT COUNT(*) " +
    	        "FROM quiz_result " +
    	        "WHERE member_id = ? " +
    	        "AND play_date >= TRUNC(SYSDATE) " +
    	        "AND play_date < TRUNC(SYSDATE) + 1";
    	
    	return jdbc.queryForObject(sql, Integer.class, memberId);
    }
}