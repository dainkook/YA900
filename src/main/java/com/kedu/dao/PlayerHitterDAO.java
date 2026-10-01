package com.kedu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.PlayerHitterDTO;

@Repository
public class PlayerHitterDAO {

	@Autowired
	private JdbcTemplate jdbc;

	public int insertPlayer(PlayerHitterDTO dto) {

		String sql =
				"INSERT INTO playerHitter ("
				+ "player_id, "
				+ "player_name, "
				+ "player_team, "
				+ "batting_avg, "
				+ "games, "
				+ "at_bats, "
				+ "hits, "
				+ "home_runs, "
				+ "doubles, "
				+ "triples, "
				+ "runs_batted_in, "
				+ "runs, "
				+ "stolen_bases, "
				+ "base_on_balls, "
				+ "hit_by_pitch, "
				+ "strikeouts, "
				+ "on_base_percentage, "
				+ "slugging_percentage, "
				+ "ops, "
				+ "wrc, "
				+ "war"
				+ ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		return jdbc.update(
				sql,
				dto.getPlayer_id(),
				dto.getPlayer_name(),
				dto.getPlayer_team(),
				dto.getBatting_avg(),
				dto.getGames(),
				dto.getAt_bats(),
				dto.getHits(),
				dto.getHome_runs(),
				dto.getDoubles(),
				dto.getTriples(),
				dto.getRuns_batted_in(),
				dto.getRuns(),
				dto.getStolen_bases(),
				dto.getBase_on_balls(),
				dto.getHit_by_pitch(),
				dto.getStrikeouts(),
				dto.getOn_base_percentage(),
				dto.getSlugging_percentage(),
				dto.getOps(),
				dto.getWrc(),
				dto.getWar()
		);
	}
	
	public List<PlayerHitterDTO> getTop10Hitters() {

	    String sql =
	            "SELECT PLAYER_NAME, PLAYER_TEAM, BATTING_AVG, GAMES, AT_BATS "
	            + "FROM ("
	            + " SELECT PLAYER_NAME, PLAYER_TEAM, BATTING_AVG, GAMES, AT_BATS "
	            + " FROM playerHitter "
	            + " WHERE AT_BATS >= 400 "
	            + " ORDER BY BATTING_AVG DESC"
	            + ") "
	            + "WHERE ROWNUM <= 10";

	    return jdbc.query(
	            sql,
	            new BeanPropertyRowMapper<>(PlayerHitterDTO.class)
	    );
	}
	public List<PlayerHitterDTO> selectAll() {

		String sql =
			    "SELECT "
			    + "ph.player_id, "
			    + "ph.player_team, "
			    + "ph.player_name, "
			    + "ph.batting_avg, "
			    + "ph.games, "
			    + "ph.at_bats, "
			    + "ph.hits, "
			    + "ph.home_runs, "
			    + "ph.doubles, "
			    + "ph.triples, "
			    + "ph.runs_batted_in, "
			    + "ph.runs, "
			    + "ph.stolen_bases, "
			    + "ph.base_on_balls, "
			    + "ph.hit_by_pitch, "
			    + "ph.strikeouts, "
			    + "ph.on_base_percentage, "
			    + "ph.slugging_percentage, "
			    + "ph.ops, "
			    + "ph.wrc, "
			    + "ph.war, "
			    + "p.player_image, "
			    + "t.team_name, "
			    + "t.team_logo "
			    + "FROM playerHitter ph "
			    + "LEFT JOIN player p ON ph.player_id = p.player_id "
			    + "LEFT JOIN team t ON ph.player_team = t.team_name "
			    + "WHERE p.player_image IS NOT NULL "
			    + "ORDER BY ph.war DESC";

		return jdbc.query(sql, (rs, rowNum) -> {

			PlayerHitterDTO dto = new PlayerHitterDTO();

			dto.setPlayer_id(rs.getInt("player_id"));
			dto.setPlayer_team(rs.getString("player_team"));
			dto.setPlayer_name(rs.getString("player_name"));
			dto.setPlayer_image(rs.getString("player_image"));
			dto.setTeam_name(rs.getString("team_name"));
			dto.setTeam_logo(rs.getString("team_logo"));
			dto.setBatting_avg(rs.getDouble("batting_avg"));
			dto.setGames(rs.getInt("games"));
			dto.setAt_bats(rs.getInt("at_bats"));
			dto.setHits(rs.getInt("hits"));
			dto.setHome_runs(rs.getInt("home_runs"));
			dto.setDoubles(rs.getInt("doubles"));
			dto.setTriples(rs.getInt("triples"));
			dto.setRuns_batted_in(rs.getInt("runs_batted_in"));
			dto.setRuns(rs.getInt("runs"));
			dto.setStolen_bases(rs.getInt("stolen_bases"));
			dto.setBase_on_balls(rs.getInt("base_on_balls"));
			dto.setHit_by_pitch(rs.getInt("hit_by_pitch"));
			dto.setStrikeouts(rs.getInt("strikeouts"));
			dto.setOn_base_percentage(rs.getDouble("on_base_percentage"));
			dto.setSlugging_percentage(rs.getDouble("slugging_percentage"));
			dto.setOps(rs.getDouble("ops"));
			dto.setWrc(rs.getDouble("wrc"));
			dto.setWar(rs.getDouble("war"));

			return dto;
		});
	}
}