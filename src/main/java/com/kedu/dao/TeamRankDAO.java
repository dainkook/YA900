package com.kedu.dao;

import java.util.List;

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
    
    public List<TeamRankDTO> selectAll() {
    	String sql = "SELECT tr.team_id, tr.team_name, t.team_logo, "
    	        + "tr.win_rate, tr.games_behind, tr.games, tr.wins, tr.losses, tr.draws, "
    	        + "tr.winning_streak, tr.batting_avg, tr.era "
    	        + "FROM teamRank tr "
    	        + "JOIN team t ON tr.team_id = t.team_id "
    	        + "ORDER BY tr.win_rate DESC";

        return jdbc.query(sql, (rs, rowNum) -> {
            TeamRankDTO dto = new TeamRankDTO();

            dto.setTeam_id(rs.getInt("team_id"));
            dto.setTeam_name(rs.getString("team_name"));
            dto.setTeam_logo(rs.getString("team_logo"));
            dto.setWin_rate(rs.getDouble("win_rate"));
            dto.setGames_behind(rs.getDouble("games_behind"));
            dto.setGames(rs.getInt("games"));
            dto.setWins(rs.getInt("wins"));
            dto.setLosses(rs.getInt("losses"));
            dto.setDraws(rs.getInt("draws"));
            dto.setWinning_streak(rs.getString("winning_streak"));
            dto.setBatting_avg(rs.getDouble("batting_avg"));
            dto.setEra(rs.getDouble("era"));

            return dto;
        });
    }
}