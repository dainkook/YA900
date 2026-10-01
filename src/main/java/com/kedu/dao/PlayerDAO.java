package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.PlayerDTO;

@Repository
public class PlayerDAO {

    @Autowired
    private JdbcTemplate jdbc;

    public void saveOrUpdate(PlayerDTO dto) {

        String sql =
            "MERGE INTO player p " +
            "USING (SELECT ? player_id, ? player_name, ? player_team, ? player_image, ? player_position FROM dual) temp " +
            "ON (p.player_id = temp.player_id) " +

            "WHEN MATCHED THEN " +
            "UPDATE SET " +
            "p.player_name = temp.player_name, " +
            "p.player_team = temp.player_team, " +
            "p.player_image = temp.player_image, " +
            "p.player_position = temp.player_position " +

            "WHEN NOT MATCHED THEN " +
            "INSERT (player_id, player_name, player_team, player_image, player_position) " +
            "VALUES (temp.player_id, temp.player_name, temp.player_team, temp.player_image, temp.player_position)";

        jdbc.update(
            sql,
            dto.getPlayer_id(),
            dto.getPlayer_name(),
            dto.getPlayer_team(),
            dto.getPlayer_image(),
            dto.getPlayer_position()
        );
    }
}