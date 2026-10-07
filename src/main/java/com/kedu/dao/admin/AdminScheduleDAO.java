package com.kedu.dao.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.PageDTO;
import com.kedu.dto.ScheduleDTO;

@Repository
public class AdminScheduleDAO {

    @Autowired
    private JdbcTemplate jdbc;

    // 전체 경기 목록
    public List<ScheduleDTO> selectAll(PageDTO page) {

        String sql = "SELECT * "
                + "FROM ( "
                + "SELECT ROW_NUMBER() OVER(ORDER BY s.start_date DESC, s.game_id DESC) AS rn, "
                + "s.game_id, "
                + "s.title, "
                + "s.location, "
                + "s.start_date, "
                + "s.end_date, "
                + "s.winner_id, "
                + "s.home_id, "
                + "s.away_id, "
                + "s.home_score, "
                + "s.away_score, "
                + "s.game_status, "
                + "s.naver_game_id, "
                + "h.team_name AS home_team, "
                + "a.team_name AS away_team, "
                + "h.team_logo AS home_logo, "
                + "a.team_logo AS away_logo "
                + "FROM schedule s "
                + "JOIN team h ON s.home_id = h.team_id "
                + "JOIN team a ON s.away_id = a.team_id "
                + ") "
                + "WHERE rn BETWEEN ? AND ?";

        return jdbc.query(
                sql,
                new BeanPropertyRowMapper<>(ScheduleDTO.class),
                page.getStartIndex(),
                page.getEndIndex());
    }

    // 전체 경기 개수
    public int getCount() {

        String sql = "SELECT COUNT(*) FROM schedule";

        return jdbc.queryForObject(sql, Integer.class);
    }

    // 경기 검색
    public List<ScheduleDTO> search(String searchType, String keyword, PageDTO page) {

        String sql = "SELECT * "
                + "FROM ( "
                + "SELECT ROW_NUMBER() OVER(ORDER BY s.start_date DESC, s.game_id DESC) AS rn, "
                + "s.game_id, "
                + "s.title, "
                + "s.location, "
                + "s.start_date, "
                + "s.end_date, "
                + "s.winner_id, "
                + "s.home_id, "
                + "s.away_id, "
                + "s.home_score, "
                + "s.away_score, "
                + "s.game_status, "
                + "s.naver_game_id, "
                + "h.team_name AS home_team, "
                + "a.team_name AS away_team, "
                + "h.team_logo AS home_logo, "
                + "a.team_logo AS away_logo "
                + "FROM schedule s "
                + "JOIN team h ON s.home_id = h.team_id "
                + "JOIN team a ON s.away_id = a.team_id ";

        if (searchType.equals("team")) {

            sql += "WHERE h.team_name LIKE ? "
                    + "OR a.team_name LIKE ? ";

        } else if (searchType.equals("location")) {

            sql += "WHERE s.location LIKE ? ";

        } else if (searchType.equals("all")) {

            sql += "WHERE s.title LIKE ? "
                    + "OR s.location LIKE ? "
                    + "OR h.team_name LIKE ? "
                    + "OR a.team_name LIKE ? ";
        }

        sql += ") "
                + "WHERE rn BETWEEN ? AND ?";

        String keywordValue = "%" + keyword + "%";

        if (searchType.equals("team")) {

            return jdbc.query(
                    sql,
                    new BeanPropertyRowMapper<>(ScheduleDTO.class),
                    keywordValue,
                    keywordValue,
                    page.getStartIndex(),
                    page.getEndIndex());

        } else if (searchType.equals("all")) {

            return jdbc.query(
                    sql,
                    new BeanPropertyRowMapper<>(ScheduleDTO.class),
                    keywordValue,
                    keywordValue,
                    keywordValue,
                    keywordValue,
                    page.getStartIndex(),
                    page.getEndIndex());

        } else {

            return jdbc.query(
                    sql,
                    new BeanPropertyRowMapper<>(ScheduleDTO.class),
                    keywordValue,
                    page.getStartIndex(),
                    page.getEndIndex());
        }
    }

    // 검색 결과 개수
    public int getSearchCount(String searchType, String keyword) {

        String sql = "";

        if (searchType.equals("team")) {

            sql = "SELECT COUNT(*) "
                    + "FROM schedule s "
                    + "JOIN team h ON s.home_id = h.team_id "
                    + "JOIN team a ON s.away_id = a.team_id "
                    + "WHERE h.team_name LIKE ? "
                    + "OR a.team_name LIKE ?";

            String keywordValue = "%" + keyword + "%";

            return jdbc.queryForObject(
                    sql,
                    Integer.class,
                    keywordValue,
                    keywordValue);

        } else if (searchType.equals("location")) {

            sql = "SELECT COUNT(*) "
                    + "FROM schedule s "
                    + "WHERE s.location LIKE ?";

            return jdbc.queryForObject(
                    sql,
                    Integer.class,
                    "%" + keyword + "%");

        } else if (searchType.equals("all")) {

            sql = "SELECT COUNT(*) "
                    + "FROM schedule s "
                    + "JOIN team h ON s.home_id = h.team_id "
                    + "JOIN team a ON s.away_id = a.team_id "
                    + "WHERE s.title LIKE ? "
                    + "OR s.location LIKE ? "
                    + "OR h.team_name LIKE ? "
                    + "OR a.team_name LIKE ?";

            String keywordValue = "%" + keyword + "%";

            return jdbc.queryForObject(
                    sql,
                    Integer.class,
                    keywordValue,
                    keywordValue,
                    keywordValue,
                    keywordValue);
        }

        return 0;
    }
}