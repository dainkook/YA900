
package com.kedu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.PredictionViewDTO;

@Repository
public class PredictionDAO {

    @Autowired
    private JdbcTemplate jdbc;

    public List<PredictionViewDTO> selectAllPredictions() {

    	String sql =
    		    "SELECT * FROM ( " +
    		    "SELECT p.prediction_seq, p.game_id, p.start_date, p.end_date, p.winner, " +
    		    "s.start_date AS game_start_date, " +
    		    "s.title, s.location, s.game_status, s.home_score, s.away_score, " +
    		    "h.team_name AS home_team, a.team_name AS away_team, " +
    		    "h.team_logo AS home_logo, a.team_logo AS away_logo " +
    		    "FROM prediction p " +
    		    "JOIN schedule s ON p.game_id = s.game_id " +
    		    "JOIN team h ON s.home_id = h.team_id " +
    		    "JOIN team a ON s.away_id = a.team_id " +
    		    "ORDER BY p.prediction_seq " +
    		    ") WHERE ROWNUM <= 5";

        return jdbc.query(sql, new BeanPropertyRowMapper<>(PredictionViewDTO.class));
    }
    
    public Integer selectTeamIdForChoice(int predictionId, int choice) {

        if (choice == 0) {
            return null;
        }

        String column = (choice == 1) ? "s.home_id" : "s.away_id";

        String sql = "SELECT " + column
                + " FROM prediction p"
                + " JOIN schedule s ON p.game_id = s.game_id"
                + " WHERE p.prediction_seq = ?";

        return jdbc.queryForObject(sql, Integer.class, predictionId);
    }
}
