package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
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

    public int findTeamId(String teamName) {

        String sql =
                "SELECT team_id "
                + "FROM team "
                + "WHERE team_name = ?";

        return jdbc.queryForObject(
                sql,
                Integer.class,
                teamName
        );
    }
}