package com.kedu.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.PredictionDTO;
import com.kedu.dto.PredictionResultDTO;

@Repository
public class PredictionResultDAO {
	
	@Autowired
	private JdbcTemplate jdbc;
	
	public int insertPredictionResult(PredictionResultDTO dto) {
		
		String sql = "insert into prediction_result(result_id, prediction_id, member_id, team_id, predict_date, is_correct, predicted_result) values(prediction_result_seq.nextval, ?, ?, ?, ? , 0, ?)";
		
		return jdbc.update(sql, dto.getPrediction_id(), dto.getMember_id(), dto.getTeam_id(),new Timestamp(System.currentTimeMillis()), dto.getPredicted_result());
		
	}
	
	public int countPredictionResult(int predictionId, String memberId) {
		
		String sql = "select count(*) from prediction_result where prediction_id = ? and member_id = ?";
		
		return jdbc.queryForObject(sql, Integer.class,predictionId,memberId);
	}
	
	public List<Map<String, Object>> selectMyPredictions(String memberId) {
		
		String sql =
		        "SELECT pr.prediction_id AS PREDICTION_ID, " +
		        "pr.predicted_result AS PREDICTED_RESULT, " +
		        "pr.is_correct AS IS_CORRECT, " +
		        "s.start_date AS START_DATE, " +
		        "h.team_name AS HOME_TEAM, " +
		        "a.team_name AS AWAY_TEAM " +
		        "FROM prediction_result pr " +
		        "JOIN prediction p ON pr.prediction_id = p.prediction_seq " +
		        "JOIN schedule s ON p.game_id = s.game_id " +
		        "JOIN team h ON s.home_id = h.team_id " +
		        "JOIN team a ON s.away_id = a.team_id " +
		        "WHERE pr.member_id = ? " +
		        "ORDER BY pr.predict_date DESC";

	    return jdbc.queryForList(sql, memberId);
	}
	
	public void isUserCorrect(String id) {
		String sql = "SELECT * FROM prediction_result WHERE member_id = ? AND is_correct = 0";
		List<PredictionResultDTO> list = jdbc.query(sql, new BeanPropertyRowMapper<>(PredictionResultDTO.class), id);
		String sql2 = "select * from prediction";
		List<PredictionDTO> list2 = jdbc.query(sql2, new BeanPropertyRowMapper<>(PredictionDTO.class));
		for(int i = 0; i<list.size(); i++) {
			for(int j = 0; j<list2.size(); j++) {
				if(list.get(i).getPrediction_id()==list2.get(j).getPrediction_seq()) {
					Integer winner = list2.get(j).getWinner();
					if (winner == null || winner == 0) {
					    continue;
					}
					if(list.get(i).getPredicted_result() == winner) {
						String sql3 = "update prediction_result SET is_correct = ? where prediction_id = ? and member_id = ?";
						jdbc.update(sql3, 2, list.get(i).getPrediction_id(), id);
						String sql4 = "select point from users where id = ?";
						Integer point = jdbc.queryForObject(sql4, Integer.class, id);
						String sql5 = "update users set point = ? where id = ?";
						jdbc.update(sql5, point + 100, id);
					} else {
						String sql3 = "update prediction_result SET is_correct = ? where prediction_id = ? and member_id = ?";
						jdbc.update(sql3, 1, list.get(i).getPrediction_id(), id);
					}
				}
			}
		}
	}
	
	public int getUserPoint(String id) {
	    String sql = "SELECT NVL(point, 0) FROM users WHERE id = ?";
	    return jdbc.queryForObject(sql, Integer.class, id);
	}
	
	public int getPredictionCount(String id) {
	    String sql = "SELECT COUNT(*) FROM prediction_result WHERE member_id = ?";
	    return jdbc.queryForObject(sql, Integer.class, id);
	}
	
	public double getHitRate(String id) {
	    String sql =
	        "SELECT NVL(ROUND(" +
	        "SUM(CASE WHEN is_correct = 2 THEN 1 ELSE 0 END) * 100.0 / " +
	        "NULLIF(SUM(CASE WHEN is_correct IN (1, 2) THEN 1 ELSE 0 END), 0), " +
	        "1), 0) " +
	        "FROM prediction_result " +
	        "WHERE member_id = ?";

	    return jdbc.queryForObject(sql, Double.class, id);
	}

}
