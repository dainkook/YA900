package com.kedu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.TeamDefenDTO;

@Repository
public class TeamDefenDAO {

    @Autowired
    private JdbcTemplate jdbc;

    public int insertTeamDefen(TeamDefenDTO dto) {

        String sql =
                "INSERT INTO teamDefen ("
                + "team_id, "
                + "team_name, "
                + "era, "
                + "runs_allowed, "
                + "earned_runs, "
                + "innings_pitched, "
                + "hits_allowed, "
                + "home_runs_allowed, "
                + "strikeouts, "
                + "walks_hbp, "
                + "wild_pitches, "
                + "errors, "
                + "whip, "
                + "quality_starts, "
                + "holds, "
                + "saves"
                + ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        return jdbc.update(
                sql,
                dto.getTeam_id(),
                dto.getTeam_name(),
                dto.getEra(),
                dto.getRuns_allowed(),
                dto.getEarned_runs(),
                dto.getInnings_pitched(),
                dto.getHits_allowed(),
                dto.getHome_runs_allowed(),
                dto.getStrikeouts(),
                dto.getWalks_hbp(),
                dto.getWild_pitches(),
                dto.getErrors(),
                dto.getWhip(),
                dto.getQuality_starts(),
                dto.getHolds(),
                dto.getSaves()
        );
    }
    public List<TeamDefenDTO> selectAll() {

    	String sql =
    			"SELECT "
    			+ "d.team_id, "
    			+ "d.team_name, "
    			+ "t.team_logo, "
    			+ "d.era, "
    			+ "d.runs_allowed, "
    			+ "d.earned_runs, "
    			+ "d.innings_pitched, "
    			+ "d.hits_allowed, "
    			+ "d.home_runs_allowed, "
    			+ "d.strikeouts, "
    			+ "d.walks_hbp, "
    			+ "d.wild_pitches, "
    			+ "d.errors, "
    			+ "d.whip, "
    			+ "d.quality_starts, "
    			+ "d.holds, "
    			+ "d.saves "
    			+ "FROM TeamDefen d "
    			+ "JOIN team t ON d.team_id = t.team_id "
    			+ "ORDER BY d.era ASC";

    	return jdbc.query(sql,new BeanPropertyRowMapper<>(TeamDefenDTO.class));
    }

    public int findTeamId(String teamName) {

        String sql =
                "SELECT team_id "
                + "FROM team "
                + "WHERE team_name = ?";

        return jdbc.queryForObject(sql,Integer.class,teamName);
    }
}