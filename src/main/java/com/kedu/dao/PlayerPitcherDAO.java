package com.kedu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.PlayerPitcherDTO;

@Repository
public class PlayerPitcherDAO {

    @Autowired
    private JdbcTemplate jdbc;

    public int insertPlayer(PlayerPitcherDTO dto) {

        String sql =
                "MERGE INTO playerPitcher p "
                + "USING (SELECT ? player_id FROM dual) d "
                + "ON (p.player_id = d.player_id) "
                + "WHEN MATCHED THEN UPDATE SET "
                + "p.player_team = ?, "
                + "p.player_name = ?, "
                + "p.era = ?, "
                + "p.games = ?, "
                + "p.wins = ?, "
                + "p.losses = ?, "
                + "p.holds = ?, "
                + "p.saves = ?, "
                + "p.innings = ?, "
                + "p.strikeouts = ?, "
                + "p.hits_allowed = ?, "
                + "p.home_runs_allowed = ?, "
                + "p.runs_allowed = ?, "
                + "p.earned_runs = ?, "
                + "p.base_on_balls = ?, "
                + "p.hit_by_pitch = ?, "
                + "p.win_rate = ?, "
                + "p.wpa = ?, "
                + "p.war = ? "
                + "WHEN NOT MATCHED THEN INSERT ("
                + "player_id, "
                + "player_team, "
                + "player_name, "
                + "era, "
                + "games, "
                + "wins, "
                + "losses, "
                + "holds, "
                + "saves, "
                + "innings, "
                + "strikeouts, "
                + "hits_allowed, "
                + "home_runs_allowed, "
                + "runs_allowed, "
                + "earned_runs, "
                + "base_on_balls, "
                + "hit_by_pitch, "
                + "win_rate, "
                + "wpa, "
                + "war"
                + ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        return jdbc.update(
                sql,

                // USING
                dto.getPlayer_id(),

                // UPDATE
                dto.getPlayer_team(),
                dto.getPlayer_name(),
                dto.getEra(),
                dto.getGames(),
                dto.getWins(),
                dto.getLosses(),
                dto.getHolds(),
                dto.getSaves(),
                dto.getInnings(),
                dto.getStrikeouts(),
                dto.getHits_allowed(),
                dto.getHome_runs_allowed(),
                dto.getRuns_allowed(),
                dto.getEarned_runs(),
                dto.getBase_on_balls(),
                dto.getHit_by_pitch(),
                dto.getWin_rate(),
                dto.getWpa(),
                dto.getWar(),

                // INSERT
                dto.getPlayer_id(),
                dto.getPlayer_team(),
                dto.getPlayer_name(),
                dto.getEra(),
                dto.getGames(),
                dto.getWins(),
                dto.getLosses(),
                dto.getHolds(),
                dto.getSaves(),
                dto.getInnings(),
                dto.getStrikeouts(),
                dto.getHits_allowed(),
                dto.getHome_runs_allowed(),
                dto.getRuns_allowed(),
                dto.getEarned_runs(),
                dto.getBase_on_balls(),
                dto.getHit_by_pitch(),
                dto.getWin_rate(),
                dto.getWpa(),
                dto.getWar()
        );
    }
    
    public List<PlayerPitcherDTO> getTop10Pitchers() {

        String sql =
            "SELECT * FROM ("
            + "SELECT * FROM playerPitcher "
            + "ORDER BY war DESC"
            + ") WHERE ROWNUM <= 10";

        return jdbc.query(
            sql,
            new BeanPropertyRowMapper<>(PlayerPitcherDTO.class)
        );
    }
    public List<PlayerPitcherDTO> selectAll() {

        String sql =
                "SELECT * FROM ("
                + "SELECT "
                + "pp.player_id, "
                + "pp.player_team, "
                + "pp.player_name, "
                + "pp.era, "
                + "pp.games, "
                + "pp.wins, "
                + "pp.losses, "
                + "pp.holds, "
                + "pp.saves, "
                + "pp.innings, "
                + "pp.strikeouts, "
                + "pp.hits_allowed, "
                + "pp.home_runs_allowed, "
                + "pp.runs_allowed, "
                + "pp.earned_runs, "
                + "pp.base_on_balls, "
                + "pp.hit_by_pitch, "
                + "pp.win_rate, "
                + "pp.wpa, "
                + "pp.war, "
                + "p.player_image, "
                + "t.team_name, "
                + "t.team_logo "
                + "FROM playerPitcher pp "
                + "LEFT JOIN player p ON pp.player_id = p.player_id "
                + "LEFT JOIN team t ON pp.player_team = t.team_name "
                + "WHERE p.player_image IS NOT NULL "
                + "AND TRIM(p.player_image) IS NOT NULL "
                + "ORDER BY pp.era ASC"
                + ") "
                + "WHERE ROWNUM <= 50";

        return jdbc.query(sql, (rs, rowNum) -> {
            PlayerPitcherDTO dto = new PlayerPitcherDTO();

            dto.setPlayer_id(rs.getInt("player_id"));
            dto.setPlayer_team(rs.getString("player_team"));
            dto.setPlayer_name(rs.getString("player_name"));
            dto.setPlayer_image(rs.getString("player_image"));
            dto.setTeam_name(rs.getString("team_name"));
            dto.setTeam_logo(rs.getString("team_logo"));
            dto.setEra(rs.getDouble("era"));
            dto.setGames(rs.getInt("games"));
            dto.setWins(rs.getInt("wins"));
            dto.setLosses(rs.getInt("losses"));
            dto.setHolds(rs.getInt("holds"));
            dto.setSaves(rs.getInt("saves"));
            dto.setInnings(rs.getString("innings"));
            dto.setStrikeouts(rs.getInt("strikeouts"));
            dto.setHits_allowed(rs.getInt("hits_allowed"));
            dto.setHome_runs_allowed(rs.getInt("home_runs_allowed"));
            dto.setRuns_allowed(rs.getInt("runs_allowed"));
            dto.setEarned_runs(rs.getInt("earned_runs"));
            dto.setBase_on_balls(rs.getInt("base_on_balls"));
            dto.setHit_by_pitch(rs.getInt("hit_by_pitch"));
            dto.setWin_rate(rs.getDouble("win_rate"));
            dto.setWpa(rs.getDouble("wpa"));
            dto.setWar(rs.getDouble("war"));

            return dto;
        });
    }
}