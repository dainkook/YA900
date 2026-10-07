package com.kedu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.TicketDTO;

@Repository
public class TicketDAO {

    @Autowired
    private JdbcTemplate jdbc;

    // 해당 경기의 전체 티켓(좌석) 조회
    public List<TicketDTO> selectByGameId(int game_id) {

        String sql = "SELECT "
                + "ticket_id, "
                + "game_id, "
                + "seat_id, "
                + "price "
                + "FROM ticket "
                + "WHERE game_id = ? "
                + "ORDER BY ticket_id";

        return jdbc.query(
                sql,
                new BeanPropertyRowMapper<>(TicketDTO.class),
                game_id
        );
    }
}