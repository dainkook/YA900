package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.TeamRankDTO;

@Repository
public class TeamRankDAO {

    @Autowired
    private JdbcTemplate jdbc;

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

    public int insertTeamRank(TeamRankDTO dto) {

        String sql =
                "INSERT INTO teamRank ("
                + "team_id, "
                + "team_name, "
                + "win_rate, "
                + "games_behind, "
                + "games, "
                + "wins, "
                + "losses, "
                + "draws, "
                + "winning_streak, "
                + "batting_avg, "
                + "era"
                + ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        return jdbc.update(
                sql,
                dto.getTeam_id(),
                dto.getTeam_name(),
                dto.getWin_rate(),
                dto.getGames_behind(),
                dto.getGames(),
                dto.getWins(),
                dto.getLosses(),
                dto.getDraws(),
                dto.getWinning_streak(),
                dto.getBatting_avg(),
                dto.getEra()
        );
    }
}