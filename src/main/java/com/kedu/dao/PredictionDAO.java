
package com.kedu.dao;

import java.sql.Timestamp;
import java.util.ArrayList;
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
                "SELECT * FROM ( "
              + "SELECT p.prediction_seq, p.game_id, p.start_date, p.end_date, p.winner, "
              + "s.start_date AS game_start_date, "
              + "s.title, s.location, s.game_status, s.home_score, s.away_score, "
              + "h.team_name AS home_team, a.team_name AS away_team, "
              + "h.team_logo AS home_logo, a.team_logo AS away_logo "
              + "FROM prediction p "
              + "JOIN schedule s ON p.game_id = s.game_id "
              + "JOIN team h ON s.home_id = h.team_id "
              + "JOIN team a ON s.away_id = a.team_id "
              + "WHERE s.start_date > SYSDATE "
              + "ORDER BY s.start_date ASC "
              + ") WHERE ROWNUM <= 6";

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
    
    public List<Integer> getGameCount(ArrayList<Long> nextweek) {
        ArrayList<Integer> gameCount = new ArrayList<>();

        for (int i = 0; i < nextweek.size(); i++) {
            String sql = "SELECT COUNT(*) FROM schedule "
                       + "WHERE start_date >= TRUNC(?) "
                       + "AND start_date < TRUNC(?) + 1";

            Timestamp date = new Timestamp(nextweek.get(i));

            gameCount.add(jdbc.queryForObject(
                sql, Integer.class, date, date
            ));
        }

        return gameCount;
    }
    
    public List<Integer> searchGameId() {

        String sql =
                "SELECT game_id "
              + "FROM schedule "
              + "WHERE start_date >= TRUNC(SYSDATE, 'IW') + 8 "
              + "AND start_date < TRUNC(SYSDATE, 'IW') + 14 "
              + "ORDER BY start_date ASC";

        return jdbc.queryForList(sql, Integer.class);
    }
    
    public void insertPrediction(int gameId) {

        String checkSql = "SELECT COUNT(*) FROM prediction WHERE game_id = ?";

        int count = jdbc.queryForObject(checkSql, Integer.class, gameId);

        if (count == 0) {

            String sql =
                    "INSERT INTO prediction "
                  + "(prediction_seq, game_id, start_date, end_date, winner) "
                  + "VALUES (prediction_seq.NEXTVAL, ?, SYSTIMESTAMP, "
                  + "(SELECT start_date FROM schedule WHERE game_id = ?), NULL)";

            jdbc.update(sql, gameId, gameId);
        }
    }
}
