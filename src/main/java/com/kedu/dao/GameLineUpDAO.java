package com.kedu.dao;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.kedu.dto.GameLineUpDTO;

@Repository
public class GameLineUpDAO {

	@Autowired
	private JdbcTemplate jdbc;

	public void deleteByGameId(String gameId) {
		String sql = "DELETE FROM game_lineup WHERE game_id = ?";
		jdbc.update(sql, gameId);
	}

	public void insert(GameLineUpDTO dto) {
		String sql = "INSERT INTO game_lineup "
				+ "(game_id, player_id, team, batting_order, position, starter) "
				+ "VALUES (?, ?, ?, ?, ?, ?)";
		jdbc.update(sql,
				dto.getGame_id(),
				dto.getPlayer_id(),
				dto.getTeam(),
				dto.getBatting_order(),
				dto.getPosition(),
				dto.getStarter());
	}

	public List<GameLineUpDTO> selectByGameId(String gameId) {

		String sql =
				"SELECT "
				+ "g.game_id, "
				+ "g.player_id, "
				+ "g.team, "
				+ "g.batting_order, "
				+ "g.position, "
				+ "g.starter, "
				+ "p.player_name, "
				+ "p.player_image "
				+ "FROM game_lineup g "
				+ "LEFT JOIN player p ON g.player_id = p.player_id "
				+ "WHERE g.game_id = ? "
				+ "ORDER BY "
				+ "CASE WHEN g.team = 'away' THEN 1 ELSE 2 END, "
				+ "g.batting_order";

		return jdbc.query(sql,new BeanPropertyRowMapper<>(GameLineUpDTO.class),gameId);
	}
}