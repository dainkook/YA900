package com.kedu.dao.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.PageDTO;
import com.kedu.dto.UsersDTO;

@Repository
public class MemberDAO {

    @Autowired
    private JdbcTemplate jdbc;

    public List<UsersDTO> selectAll(PageDTO page) {

        String sql = "SELECT * "
                   + "FROM ( "
                   + "SELECT "
                   + "ROW_NUMBER() OVER( "
                   + "ORDER BY member_seq DESC "
                   + ") AS rn, "
                   + "users.* "
                   + "FROM users "
                   + ") "
                   + "WHERE rn BETWEEN ? AND ?";

        return jdbc.query(
                sql,
                new BeanPropertyRowMapper<>(UsersDTO.class),
                page.getStartIndex(),
                page.getEndIndex());
    }

    public int getCount() {
        String sql = "select count(*) from users";
        return jdbc.queryForObject(sql, Integer.class);
    }

    public List<UsersDTO> search(String searchType, String keyword, PageDTO page) {

        String sql = "SELECT * "
                   + "FROM ("
                   + "SELECT ROW_NUMBER() OVER("
                   + "ORDER BY member_seq DESC"
                   + ") AS rn, users.* "
                   + "FROM users ";

        if (searchType.equals("name")) {
            sql += "WHERE name LIKE ? ";
        } else if (searchType.equals("id")) {
            sql += "WHERE id LIKE ? ";
        } else if (searchType.equals("phone")) {
            sql += "WHERE phone LIKE ? ";
        } else if (searchType.equals("all")) {
            sql += "WHERE id LIKE ? "
                + "OR name LIKE ? "
                + "OR phone LIKE ? ";
        }

        sql += ") "
             + "WHERE rn BETWEEN ? AND ?";

        if (searchType.equals("all")) {
            String keywordValue = "%" + keyword + "%";

            return jdbc.query(
                    sql,
                    new BeanPropertyRowMapper<>(UsersDTO.class),
                    keywordValue,
                    keywordValue,
                    keywordValue,
                    page.getStartIndex(),
                    page.getEndIndex());

        } else {
            return jdbc.query(
                    sql,
                    new BeanPropertyRowMapper<>(UsersDTO.class),
                    "%" + keyword + "%",
                    page.getStartIndex(),
                    page.getEndIndex());
        }
    }

    public int getSearchCount(String searchType, String keyword) {

        String sql = "";

        if (searchType.equals("id")) {
            sql = "SELECT COUNT(*) "
                + "FROM users "
                + "WHERE id LIKE ?";

            return jdbc.queryForObject(
                    sql,
                    Integer.class,
                    "%" + keyword + "%");

        } else if (searchType.equals("name")) {
            sql = "SELECT COUNT(*) "
                + "FROM users "
                + "WHERE name LIKE ?";

            return jdbc.queryForObject(
                    sql,
                    Integer.class,
                    "%" + keyword + "%");

        } else if (searchType.equals("phone")) {
            sql = "SELECT COUNT(*) "
                + "FROM users "
                + "WHERE phone LIKE ?";

            return jdbc.queryForObject(
                    sql,
                    Integer.class,
                    "%" + keyword + "%");

        } else if (searchType.equals("all")) {
            sql = "SELECT COUNT(*) "
                + "FROM users "
                + "WHERE id LIKE ? "
                + "OR name LIKE ? "
                + "OR phone LIKE ?";

            String keywordValue = "%" + keyword + "%";

            return jdbc.queryForObject(
                    sql,
                    Integer.class,
                    keywordValue,
                    keywordValue,
                    keywordValue);
        }

        return 0;
    }

    public UsersDTO selectBySeq(int member_seq) {
        String sql = "select * from users where member_seq = ?";

        return jdbc.queryForObject(
                sql,
                new BeanPropertyRowMapper<>(UsersDTO.class),
                member_seq);
    }

    public void updateBlacklist(int member_seq) {

        String sql = "SELECT blacklist FROM users WHERE member_seq = ?";

        int blacklist = jdbc.queryForObject(
                sql,
                Integer.class,
                member_seq);

        if (blacklist == 0) {
            blacklist = 1;
        } else {
            blacklist = 0;
        }

        sql = "UPDATE users SET blacklist = ? WHERE member_seq = ?";

        jdbc.update(sql, blacklist, member_seq);
    }
}