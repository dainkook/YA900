package com.kedu.dao.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.PageDTO;
import com.kedu.dto.ReservationDTO;

@Repository
public class ReservationDAO {

	@Autowired
	private JdbcTemplate jdbc;

	public List<ReservationDTO> selectAll(PageDTO page) {

	    String sql = "SELECT * "
	            + "FROM ( "
	            + "SELECT ROW_NUMBER() OVER(ORDER BY r.reservation_id DESC) AS rn, "
	            + "r.reservation_id, r.member_id, r.ticket_id, "
	            + "r.reservation_date, r.status, "
	            + "t.game_id, t.seat_id, t.price, "
	            + "s.title "
	            + "FROM reservation r "
	            + "JOIN ticket t ON r.ticket_id = t.ticket_id "
	            + "JOIN schedule s ON t.game_id = s.game_id "
	            + ") "
	            + "WHERE rn BETWEEN ? AND ?";

	    return jdbc.query(
	            sql,
	            new BeanPropertyRowMapper<>(ReservationDTO.class),
	            page.getStartIndex(),
	            page.getEndIndex());
	}

	public int getCount() {
		String sql = "select count(*) from reservation";
		return jdbc.queryForObject(sql, Integer.class);
	}

	// 검색
	public List<ReservationDTO> search(String searchType, String keyword, PageDTO page) {

	    String sql = "SELECT * "
	            + "FROM ( "
	            + "SELECT ROW_NUMBER() OVER(ORDER BY r.reservation_id DESC) AS rn, "
	            + "r.reservation_id, r.member_id, r.ticket_id, "
	            + "r.reservation_date, r.status, "
	            + "t.game_id, t.seat_id, t.price, "
	            + "s.title "
	            + "FROM reservation r "
	            + "JOIN ticket t ON r.ticket_id = t.ticket_id "
	            + "JOIN schedule s ON t.game_id = s.game_id ";

	    if (searchType.equals("reservation_id")) {

	        sql += "WHERE TO_CHAR(r.reservation_id) LIKE ? ";

	    } else if (searchType.equals("member_id")) {

	        sql += "WHERE r.member_id LIKE ? ";

	    } else if (searchType.equals("title")) {

	        sql += "WHERE s.title LIKE ? ";

	    } else if (searchType.equals("all")) {

	        sql += "WHERE TO_CHAR(r.reservation_id) LIKE ? "
	                + "OR r.member_id LIKE ? "
	                + "OR s.title LIKE ? ";
	    }

	    sql += ") "
	            + "WHERE rn BETWEEN ? AND ?";


	    if (searchType.equals("all")) {

	        String keywordValue = "%" + keyword + "%";

	        return jdbc.query(
	                sql,
	                new BeanPropertyRowMapper<>(ReservationDTO.class),
	                keywordValue,
	                keywordValue,
	                keywordValue,
	                page.getStartIndex(),
	                page.getEndIndex());

	    } else {

	        return jdbc.query(
	                sql,
	                new BeanPropertyRowMapper<>(ReservationDTO.class),
	                "%" + keyword + "%",
	                page.getStartIndex(),
	                page.getEndIndex());
	    }
	}

	// 검색 결과 개수
	public int getSearchCount(String searchType, String keyword) {

		String sql = "";

		if (searchType.equals("reservation_id")) {

			sql = "SELECT COUNT(*) " + "FROM reservation r " + "WHERE TO_CHAR(r.reservation_id) LIKE ?";

			return jdbc.queryForObject(sql, Integer.class, "%" + keyword + "%");

		} else if (searchType.equals("member_id")) {

			sql = "SELECT COUNT(*) " + "FROM reservation r " + "WHERE r.member_id LIKE ?";

			return jdbc.queryForObject(sql, Integer.class, "%" + keyword + "%");

		} else if (searchType.equals("title")) {

			sql = "SELECT COUNT(*) " + "FROM reservation r " + "JOIN ticket t ON r.ticket_id = t.ticket_id "
					+ "JOIN schedule s ON t.game_id = s.game_id " + "WHERE s.title LIKE ?";

			return jdbc.queryForObject(sql, Integer.class, "%" + keyword + "%");

		} else if (searchType.equals("all")) {

			sql = "SELECT COUNT(*) " + "FROM reservation r " + "JOIN ticket t ON r.ticket_id = t.ticket_id "
					+ "JOIN schedule s ON t.game_id = s.game_id " + "WHERE TO_CHAR(r.reservation_id) LIKE ? "
					+ "OR r.member_id LIKE ? " + "OR s.title LIKE ?";

			String keywordValue = "%" + keyword + "%";

			return jdbc.queryForObject(sql, Integer.class, keywordValue, keywordValue, keywordValue);
		}

		return 0;
	}
	
	public ReservationDTO selectById(int reservation_id) {
		String sql = "SELECT "
	               + "r.reservation_id, "
	               + "r.member_id, "
	               + "r.ticket_id, "
	               + "r.reservation_date, "
	               + "r.status, "
	               + "t.game_id, "
	               + "t.seat_id, "
	               + "t.price, "
	               + "s.title "
	               + "FROM reservation r "
	               + "JOIN ticket t ON r.ticket_id = t.ticket_id "
	               + "JOIN schedule s ON t.game_id = s.game_id "
	               + "WHERE r.reservation_id = ?";
		return jdbc.queryForObject(sql, 
				new BeanPropertyRowMapper<>(ReservationDTO.class),
				reservation_id);
	}
	
	public int cancel(int reservation_id) {
		String sql = "update reservation set status = '취소' where reservation_id = ?";
		return jdbc.update(sql, reservation_id);
	}
}
