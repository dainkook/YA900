package com.kedu.dao.admin;

import java.util.List;
import java.util.Map;

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

	// �˻�
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

	// �˻� ��� ����
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
		String sql = "update reservation set status = '���' where reservation_id = ?";
		return jdbc.update(sql, reservation_id);
	}
	
	// 특정 경기에서 이미 예매된 티켓 ID 조회
	public List<Integer> selectReservedTicketIds(int game_id) {

		String sql = "SELECT r.ticket_id "
				   + "FROM reservation r "
				   + "JOIN ticket t ON r.ticket_id = t.ticket_id "
				   + "WHERE t.game_id = ? "
				   + "AND r.status = ?";

		return jdbc.query(
				sql,
				(rs, rowNum) -> rs.getInt("ticket_id"),
				game_id,
				"예매완료");
	}

	// 예매 정보 저장
	public int insertReservation(String member_id, int ticket_id) {

		String sql = "INSERT INTO reservation "
				   + "(reservation_id, member_id, ticket_id, reservation_date, status) "
				   + "VALUES (reservation_seq.nextval, ?, ?, SYSTIMESTAMP, ?)";

		return jdbc.update(
				sql,
				member_id,
				ticket_id,
				"예매완료");
	}
	
	// 좌석 번호로 예매 정보 저장
	public int insertReservationBySeatId(
	        String member_id,
	        int game_id,
	        int seat_id,
	        String paymentId) {

	    String sql =
	            "INSERT INTO reservation "
	          + "(reservation_id, member_id, ticket_id, reservation_date, status, payment_id) "
	          + "SELECT reservation_seq.nextval, ?, ticket_id, SYSTIMESTAMP, ?, ? "
	          + "FROM ticket "
	          + "WHERE game_id = ? "
	          + "AND seat_id = ?";

	    return jdbc.update(
	            sql,
	            member_id,
	            "예매완료",
	            paymentId,
	            game_id,
	            seat_id
	    );
	}
	
	// 특정 경기에서 이미 예매된 좌석 번호 조회
	public List<Integer> selectReservedSeatIds(int game_id) {

	    String sql = "SELECT t.seat_id "
	               + "FROM reservation r "
	               + "JOIN ticket t ON r.ticket_id = t.ticket_id "
	               + "WHERE t.game_id = ? "
	               + "AND r.status = ?";

	    return jdbc.query(
	            sql,
	            (rs, rowNum) -> rs.getInt("seat_id"),
	            game_id,
	            "예매완료"
	    );
	}
	
	public List<Map<String, Object>> selectMyReservations(String member_id) {

	    String sql =
	            "SELECT "
	          + "MIN(r.reservation_id) AS reservation_id, "
	          + "MIN(r.reservation_date) AS reservation_date, "
	          + "r.status, "
	          + "r.payment_id, "
	          + "t.game_id, "
	          + "LISTAGG(t.seat_id, ', ') WITHIN GROUP (ORDER BY t.seat_id) AS seat_ids, "
	          + "SUM(t.price) AS total_price, "
	          + "s.title, "
	          + "s.location, "
	          + "s.start_date, "
	          + "home.team_name AS home_team, "
	          + "away.team_name AS away_team "
	          + "FROM reservation r "
	          + "JOIN ticket t ON r.ticket_id = t.ticket_id "
	          + "JOIN schedule s ON t.game_id = s.game_id "
	          + "JOIN team home ON s.home_id = home.team_id "
	          + "JOIN team away ON s.away_id = away.team_id "
	          + "WHERE r.member_id = ? "
	          + "AND r.status = '예매완료' "
	          + "GROUP BY "
	          + "r.status, "
	          + "r.payment_id, "
	          + "t.game_id, "
	          + "s.title, "
	          + "s.location, "
	          + "s.start_date, "
	          + "home.team_name, "
	          + "away.team_name "
	          + "ORDER BY MIN(r.reservation_date) DESC";

	    return jdbc.queryForList(sql, member_id);
	}
	
	public int cancelReservation(int reservation_id) {

	    String sql =
	            "UPDATE reservation "
	          + "SET status = ? "
	          + "WHERE reservation_id = ?";

	    return jdbc.update(
	            sql,
	            "취소",
	            reservation_id
	    );
	}
	
	public int cancelReservationsByPaymentId(String paymentId) {

	    String sql =
	            "UPDATE reservation "
	          + "SET status = ? "
	          + "WHERE payment_id = ?";

	    return jdbc.update(
	            sql,
	            "취소",
	            paymentId
	    );
	}
	
	public String selectPaymentId(int reservation_id) {

	    String sql =
	            "SELECT payment_id "
	          + "FROM reservation "
	          + "WHERE reservation_id = ?";

	    return jdbc.queryForObject(
	            sql,
	            String.class,
	            reservation_id
	    );
	}
}
