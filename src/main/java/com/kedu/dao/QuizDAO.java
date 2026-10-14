package com.kedu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.ConnectionCallback;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.QuizDTO;

@Repository
public class QuizDAO {

    @Autowired
    private JdbcTemplate jdbc;

    public List<QuizDTO> selectQuiz() {

        String sql =
                "SELECT * FROM ("
                + " SELECT * FROM quiz ORDER BY DBMS_RANDOM.VALUE"
                + ") WHERE ROWNUM <= 10";

        return jdbc.query(
                sql,
                new BeanPropertyRowMapper<QuizDTO>(QuizDTO.class)
        );
    }

    public int saveQuizResult(
            final String memberId,
            final List<Integer> quizIds,
            final List<String> userAnswers) {

        if (memberId == null || memberId.trim().isEmpty()) {
            throw new IllegalArgumentException("회원 ID가 없습니다.");
        }

        if (quizIds == null || userAnswers == null
                || quizIds.isEmpty()
                || quizIds.size() != userAnswers.size()
                || quizIds.size() > 10) {

            throw new IllegalArgumentException(
                    "퀴즈 데이터가 올바르지 않습니다.");
        }

        Set<Integer> uniqueQuizIds = new HashSet<Integer>();

        for (Integer quizId : quizIds) {
            if (quizId == null || quizId <= 0
                    || !uniqueQuizIds.add(quizId)) {

                throw new IllegalArgumentException(
                        "퀴즈 ID가 올바르지 않습니다.");
            }
        }

        for (String userAnswer : userAnswers) {
            if (!"O".equals(userAnswer)
                    && !"X".equals(userAnswer)) {

                throw new IllegalArgumentException(
                        "잘못된 답변입니다.");
            }
        }

        return jdbc.execute(new ConnectionCallback<Integer>() {

            @Override
            public Integer doInConnection(Connection conn)
                    throws SQLException, DataAccessException {

                int correctCount = 0;

                String answerSql =
                        "SELECT answer FROM quiz WHERE quiz_id = ?";

                try (PreparedStatement answerPstmt =
                             conn.prepareStatement(answerSql)) {

                    for (int i = 0; i < quizIds.size(); i++) {

                        answerPstmt.setInt(1, quizIds.get(i));

                        try (ResultSet rs =
                                     answerPstmt.executeQuery()) {

                            if (!rs.next()) {
                                throw new SQLException(
                                        "존재하지 않는 퀴즈 ID: "
                                        + quizIds.get(i));
                            }

                            String correctAnswer =
                                    rs.getString("answer");

                            String userAnswer = userAnswers.get(i);

                            if (userAnswer.equals(correctAnswer)) {
                                correctCount++;
                            }
                        }
                    }
                }

                int resultId;

                String sequenceSql =
                        "SELECT quiz_result_seq.NEXTVAL FROM dual";

                try (PreparedStatement seqPstmt =
                             conn.prepareStatement(sequenceSql);
                     ResultSet rs = seqPstmt.executeQuery()) {

                    if (!rs.next()) {
                        throw new SQLException(
                                "결과 번호 발급에 실패했습니다.");
                    }

                    resultId = rs.getInt(1);
                }

                String resultSql =
                        "INSERT INTO quiz_result "
                        + "(result_id, member_id, total_count, "
                        + "correct_count, play_date) "
                        + "VALUES (?, ?, ?, ?, ?)";

                try (PreparedStatement resultPstmt =
                             conn.prepareStatement(resultSql)) {

                    resultPstmt.setInt(1, resultId);
                    resultPstmt.setString(2, memberId);
                    resultPstmt.setInt(3, quizIds.size());
                    resultPstmt.setInt(4, correctCount);
                    resultPstmt.setTimestamp(
                            5,
                            new Timestamp(System.currentTimeMillis())
                    );

                    resultPstmt.executeUpdate();
                }

                String detailSql =
                        "INSERT INTO quiz_result_detail "
                        + "(detail_id, result_id, quiz_id, "
                        + "user_answer, is_correct) "
                        + "VALUES (?, ?, ?, ?, ?)";

                String detailSequenceSql =
                        "SELECT quiz_result_detail_seq.NEXTVAL FROM dual";

                try (PreparedStatement detailPstmt =
                             conn.prepareStatement(detailSql);
                     PreparedStatement detailSeqPstmt =
                             conn.prepareStatement(detailSequenceSql)) {

                    for (int i = 0; i < quizIds.size(); i++) {

                        int detailId;

                        try (ResultSet rs =
                                     detailSeqPstmt.executeQuery()) {

                            if (!rs.next()) {
                                throw new SQLException(
                                        "상세 번호 발급에 실패했습니다.");
                            }

                            detailId = rs.getInt(1);
                        }

                        String correctAnswer;

                        try (PreparedStatement answerPstmt =
                                     conn.prepareStatement(
                                             "SELECT answer FROM quiz "
                                             + "WHERE quiz_id = ?")) {

                            answerPstmt.setInt(1, quizIds.get(i));

                            try (ResultSet rs =
                                         answerPstmt.executeQuery()) {

                                if (!rs.next()) {
                                    throw new SQLException(
                                            "퀴즈를 찾을 수 없습니다.");
                                }

                                correctAnswer =
                                        rs.getString("answer");
                            }
                        }

                        String userAnswer = userAnswers.get(i);

                        int isCorrect =
                                userAnswer.equals(correctAnswer) ? 1 : 0;

                        detailPstmt.setInt(1, detailId);
                        detailPstmt.setInt(2, resultId);
                        detailPstmt.setInt(3, quizIds.get(i));
                        detailPstmt.setString(4, userAnswer);
                        detailPstmt.setInt(5, isCorrect);

                        detailPstmt.executeUpdate();
                    }
                }

                return correctCount;
            }
        });
    }

    public List<Map<String, Object>> selectHistory(String memberId) {

        String sql =
                "SELECT "
                + "result_id AS \"resultId\", "
                + "member_id AS \"memberId\", "
                + "total_count AS \"totalCount\", "
                + "correct_count AS \"correctCount\", "
                + "TO_CHAR(play_date, 'YYYY-MM-DD HH24:MI:SS') "
                + "AS \"playDate\" "
                + "FROM quiz_result "
                + "WHERE member_id = ? "
                + "ORDER BY play_date DESC, result_id DESC";

        return jdbc.queryForList(sql, memberId);
    }

    public List<Map<String, Object>> selectHistoryDetail(
            int resultId,
            String memberId) {

        String sql =
                "SELECT "
                + "d.detail_id AS \"detailId\", "
                + "d.quiz_id AS \"quizId\", "
                + "q.quiz_contents AS \"quizContents\", "
                + "d.user_answer AS \"userAnswer\", "
                + "q.answer AS \"correctAnswer\", "
                + "d.is_correct AS \"isCorrect\", "
                + "q.explanation AS \"explanation\", "
                + "q.category AS \"category\" "
                + "FROM quiz_result_detail d "
                + "JOIN quiz q ON d.quiz_id = q.quiz_id "
                + "JOIN quiz_result r ON d.result_id = r.result_id "
                + "WHERE d.result_id = ? "
                + "AND r.member_id = ? "
                + "ORDER BY d.detail_id ASC";

        return jdbc.queryForList(sql, resultId, memberId);
    }

    public int selectQuizCount() {

        String sql = "SELECT COUNT(*) FROM quiz";

        return jdbc.queryForObject(sql, Integer.class);
    }

    public int selectQuizPlayCount() {
        return 10;
    }

    public int selectPointPerCorrect() {
        return 10;
    }

    public Map<String, Object> selectQuizSummary(String memberId) {

        String sql =
                "SELECT "
                + "COUNT(*) AS \"playCount\", "
                + "NVL(MAX(correct_count), 0) AS \"bestScore\", "
                + "NVL(SUM(correct_count), 0) AS \"sumCorrect\", "
                + "NVL(SUM(total_count), 0) AS \"sumTotal\" "
                + "FROM quiz_result "
                + "WHERE member_id = ?";

        return jdbc.queryForMap(sql, memberId);
    }

    public Map<String, Object> selectLatestQuizResult(String memberId) {

        String sql =
                "SELECT * FROM ( "
                + "SELECT "
                + "correct_count AS \"correctCount\", "
                + "total_count AS \"totalCount\", "
                + "play_date AS \"playDate\" "
                + "FROM quiz_result "
                + "WHERE member_id = ? "
                + "ORDER BY play_date DESC, result_id DESC "
                + ") WHERE ROWNUM = 1";

        List<Map<String, Object>> list =
                jdbc.queryForList(sql, memberId);

        if (list.isEmpty()) {
            return null;
        }

        return list.get(0);
    }

    public List<Map<String, Object>> selectQuizRanking() {

        String sql =
                "SELECT * FROM ( "
                + "SELECT "
                + "member_id AS \"memberId\", "
                + "MAX(correct_count) AS \"score\", "
                + "ROW_NUMBER() OVER ( "
                + "ORDER BY MAX(correct_count) DESC, "
                + "MAX(play_date) DESC "
                + ") AS \"rankNo\" "
                + "FROM quiz_result "
                + "GROUP BY member_id "
                + ") WHERE ROWNUM <= 5 "
                + "ORDER BY \"rankNo\"";

        return jdbc.queryForList(sql);
    }
}
