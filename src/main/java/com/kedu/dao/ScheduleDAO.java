package com.kedu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.ScheduleDTO;

@Repository
public class ScheduleDAO {

	@Autowired
	private JdbcTemplate jdbc;

	public int insertSchedule(ScheduleDTO dto) {

		String sql =
		        "insert into schedule "
		        + "(game_id, title, location, start_date, end_date, "
		        + "winner_id, home_id, away_id, home_score, away_score, game_status) "
		        + "values (schedule_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		return jdbc.update(
		        sql,
		        dto.getTitle(),
		        dto.getLocation(),
		        dto.getStart_date(),
		        dto.getEnd_date(),
		        dto.getWinner_id(),
		        dto.getHome_id(),
		        dto.getAway_id(),
		        dto.getHome_score(),
		        dto.getAway_score(),
		        dto.getGame_status()
		);
	}

	public List<ScheduleDTO> selectByMonth(int month) {

	    String sql =
	            "SELECT "
	            + "s.game_id, "
	            + "s.title, "
	            + "s.location, "
	            + "s.start_date, "
	            + "s.end_date, "
	            + "s.winner_id, "
	            + "s.home_id, "
	            + "s.away_id, "
	            + "s.home_score, "
	            + "s.away_score, "
	            + "s.game_status, "
	            + "h.team_name AS home_team, "
	            + "a.team_name AS away_team, "
	            + "h.team_logo AS home_logo, "
	            + "a.team_logo AS away_logo "
	            + "FROM schedule s "
	            + "JOIN team h ON s.home_id = h.team_id "
	            + "JOIN team a ON s.away_id = a.team_id "
	            + "WHERE EXTRACT(MONTH FROM s.start_date) = ? "
	            + "ORDER BY "
	            + "CASE "
	            + "WHEN TRUNC(s.start_date) >= TRUNC(SYSDATE) THEN 0 "
	            + "ELSE 1 "
	            + "END, "
	            + "s.start_date";

	    return jdbc.query(
	            sql,
	            new BeanPropertyRowMapper<>(ScheduleDTO.class),
	            month
	    );
	}

	public int findTeamId(String teamName) {

		String sql =
				"SELECT team_id "
						+ "FROM team "
						+ "WHERE team_name = ?";

		try {

			return jdbc.queryForObject(
					sql,
					Integer.class,
					teamName
					);

		} catch (Exception e) {

			return 0;
		}
	}
	public String findStadium(int teamId) {

		String sql =
				"SELECT stadium "
						+ "FROM team "
						+ "WHERE team_id = ?";

		try {
			return jdbc.queryForObject(
					sql,
					String.class,
					teamId
					);
		} catch (Exception e) {
			return "πÃ¡§";
		}
	}
}