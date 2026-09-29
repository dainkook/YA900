package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
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
}