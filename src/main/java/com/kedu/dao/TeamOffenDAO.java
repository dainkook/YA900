package com.kedu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.TeamOffenDTO;

@Repository
public class TeamOffenDAO {

    @Autowired
    private JdbcTemplate jdbc;

    public int insertTeamOffen(TeamOffenDTO dto) {

        String sql =
                "INSERT INTO teamOffen ("
                + "team_id, "
                + "team_name, "
                + "batting_average, "
                + "runs, "
                + "rbi, "
                + "at_bats, "
                + "home_runs, "
                + "hits, "
                + "doubles, "
                + "triples, "
                + "stolen_bases, "
                + "walks_hbp, "
                + "strikeouts, "
                + "double_plays, "
                + "on_base_percentage, "
                + "slugging_percentage, "
                + "ops"
                + ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        return jdbc.update(
                sql,
                dto.getTeam_id(),
                dto.getTeam_name(),
                dto.getBatting_average(),
                dto.getRuns(),
                dto.getRbi(),
                dto.getAt_bats(),
                dto.getHome_runs(),
                dto.getHits(),
                dto.getDoubles(),
                dto.getTriples(),
                dto.getStolen_bases(),
                dto.getWalks_hbp(),
                dto.getStrikeouts(),
                dto.getDouble_plays(),
                dto.getOn_base_percentage(),
                dto.getSlugging_percentage(),
                dto.getOps()
        );
    }
    public List<TeamOffenDTO> selectAll() {

    	String sql =
    			"SELECT "
    			+ "o.team_id, "
    			+ "o.team_name, "
    			+ "t.team_logo, "
    			+ "o.batting_average, "
    			+ "o.runs, "
    			+ "o.rbi, "
    			+ "o.at_bats, "
    			+ "o.home_runs, "
    			+ "o.hits, "
    			+ "o.doubles, "
    			+ "o.triples, "
    			+ "o.stolen_bases, "
    			+ "o.walks_hbp, "
    			+ "o.strikeouts, "
    			+ "o.double_plays, "
    			+ "o.on_base_percentage, "
    			+ "o.slugging_percentage, "
    			+ "o.ops "
    			+ "FROM TeamOffen o "
    			+ "JOIN team t ON o.team_id = t.team_id "
    			+ "ORDER BY o.batting_average DESC";

    	return jdbc.query(sql,new BeanPropertyRowMapper<>(TeamOffenDTO.class));
    }

    public int findTeamId(String teamName) {

        String sql =
                "SELECT team_id "
                + "FROM team "
                + "WHERE team_name = ?";

        return jdbc.queryForObject(sql, Integer.class, teamName);
    }
}