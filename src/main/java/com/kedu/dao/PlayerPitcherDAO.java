package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.PlayerPitcherDTO;

@Repository
public class PlayerPitcherDAO {

    @Autowired
    private JdbcTemplate jdbc;

    public int insertPlayer(PlayerPitcherDTO dto) {

        String sql =
                "INSERT INTO playerPitcher ("
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
}