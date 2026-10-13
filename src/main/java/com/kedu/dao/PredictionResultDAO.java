package com.kedu.dao;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

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
	        "SELECT pr.prediction_id, pr.predicted_result, " +
	        "s.start_date, h.team_name AS home_team, a.team_name AS away_team " +
	        "FROM prediction_result pr " +
	        "JOIN prediction p ON pr.prediction_id = p.prediction_seq " +
	        "JOIN schedule s ON p.game_id = s.game_id " +
	        "JOIN team h ON s.home_id = h.team_id " +
	        "JOIN team a ON s.away_id = a.team_id " +
	        "WHERE pr.member_id = ? " +
	        "ORDER BY pr.predict_date DESC";

	    return jdbc.queryForList(sql, memberId);
	}

}
