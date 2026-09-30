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
}