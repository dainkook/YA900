package com.kedu.dao.admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

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

		return jdbc.query(sql, new BeanPropertyRowMapper<>(ReservationDTO.class), page.getStartIndex(), page.getEndIndex());
	}

	public int getCount() {
		String sql = "SELECT COUNT(*) FROM reservation";
		return jdbc.queryForObject(sql, Integer.class);
	}

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
			return jdbc.query(sql, new BeanPropertyRowMapper<>(ReservationDTO.class), keywordValue, keywordValue, keywordValue, page.getStartIndex(), page.getEndIndex());
		} else {
			return jdbc.query(sql, new BeanPropertyRowMapper<>(ReservationDTO.class), "%" + keyword + "%", page.getStartIndex(), page.getEndIndex());
		}
	}

	public int getSearchCount(String searchType, String keyword) {
		String sql = "";

		if (searchType.equals("reservation_id")) {
			sql = "SELECT COUNT(*) "
					+ "FROM reservation r "
					+ "WHERE TO_CHAR(r.reservation_id) LIKE ?";
			return jdbc.queryForObject(sql, Integer.class, "%" + keyword + "%");
		} else if (searchType.equals("member_id")) {
			sql = "SELECT COUNT(*) "
					+ "FROM reservation r "
					+ "WHERE r.member_id LIKE ?";
			return jdbc.queryForObject(sql, Integer.class, "%" + keyword + "%");
		} else if (searchType.equals("title")) {
			sql = "SELECT COUNT(*) "
					+ "FROM reservation r "
					+ "JOIN ticket t ON r.ticket_id = t.ticket_id "
					+ "JOIN schedule s ON t.game_id = s.game_id "
					+ "WHERE s.title LIKE ?";
			return jdbc.queryForObject(sql, Integer.class, "%" + keyword + "%");
		} else if (searchType.equals("all")) {
			sql = "SELECT COUNT(*) "
					+ "FROM reservation r "
					+ "JOIN ticket t ON r.ticket_id = t.ticket_id "
					+ "JOIN schedule s ON t.game_id = s.game_id "
					+ "WHERE TO_CHAR(r.reservation_id) LIKE ? "
					+ "OR r.member_id LIKE ? "
					+ "OR s.title LIKE ?";

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

		return jdbc.queryForObject(sql, new BeanPropertyRowMapper<>(ReservationDTO.class), reservation_id);
	}

	public int cancel(int reservation_id) {
		String sql = "UPDATE reservation "
				+ "SET status = '취소' "
				+ "WHERE reservation_id = ?";
		return jdbc.update(sql, reservation_id);
	}

	public List<Integer> selectReservedTicketIds(int game_id) {
		String sql = "SELECT r.ticket_id "
				+ "FROM reservation r "
				+ "JOIN ticket t ON r.ticket_id = t.ticket_id "
				+ "WHERE t.game_id = ? "
				+ "AND r.status = ?";

		return jdbc.query(sql, (rs, rowNum) -> rs.getInt("ticket_id"), game_id, "예매완료");
	}

	public int insertReservation(String member_id, int ticket_id) {
		String sql = "INSERT INTO reservation "
				+ "(reservation_id, member_id, ticket_id, reservation_date, status) "
				+ "VALUES (reservation_seq.nextval, ?, ?, SYSTIMESTAMP, ?)";

		return jdbc.update(sql, member_id, ticket_id, "예매완료");
	}

	public int insertReservationBySeatId(String member_id, int game_id, int seat_id, String paymentId, int usedPoint) {
		String sql = "INSERT INTO reservation "
				+ "(reservation_id, member_id, ticket_id, reservation_date, "
				+ "status, payment_id, used_point) "
				+ "SELECT reservation_seq.NEXTVAL, ?, ticket_id, SYSTIMESTAMP, ?, ?, ? "
				+ "FROM ticket "
				+ "WHERE game_id = ? "
				+ "AND seat_id = ?";

		return jdbc.update(sql, member_id, "예매완료", paymentId, usedPoint, game_id, seat_id);
	}

	public List<Integer> selectReservedSeatIds(int game_id) {
		String sql = "SELECT t.seat_id "
				+ "FROM reservation r "
				+ "JOIN ticket t ON r.ticket_id = t.ticket_id "
				+ "WHERE t.game_id = ? "
				+ "AND r.status = ?";

		return jdbc.query(sql, (rs, rowNum) -> rs.getInt("seat_id"), game_id, "예매완료");
	}

	public List<Map<String, Object>> selectMyReservations(String member_id) {
		String sql = "SELECT "
				+ "MIN(r.reservation_id) AS reservation_id, "
				+ "MIN(r.reservation_date) AS reservation_date, "
				+ "r.status, "
				+ "r.payment_id, "
				+ "t.game_id, "
				+ "LISTAGG(t.seat_id, ', ') "
				+ "WITHIN GROUP (ORDER BY t.seat_id) AS seat_ids, "
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
				+ "AND r.status = ? "
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

		Integer joinCount = jdbc.queryForObject(
				"SELECT COUNT(*) "
				+ "FROM reservation r "
				+ "JOIN ticket t ON r.ticket_id = t.ticket_id "
				+ "JOIN schedule s ON t.game_id = s.game_id "
				+ "JOIN team home ON s.home_id = home.team_id "
				+ "JOIN team away ON s.away_id = away.team_id "
				+ "WHERE r.member_id = ? "
				+ "AND r.status = '예매완료'",
				Integer.class,
				member_id
		);

		return jdbc.queryForList(sql, member_id, "예매완료");
	}

	public int cancelReservation(int reservation_id) {
		String sql = "UPDATE reservation "
				+ "SET status = ? "
				+ "WHERE reservation_id = ?";

		return jdbc.update(sql, "취소", reservation_id);
	}

	public int cancelReservationsByPaymentId(String paymentId) {
		String sql = "UPDATE reservation "
				+ "SET status = ? "
				+ "WHERE payment_id = ? "
				+ "AND status = ?";

		return jdbc.update(sql, "취소", paymentId, "예매완료");
	}

	public String selectPaymentId(int reservation_id) {
		String sql = "SELECT payment_id "
				+ "FROM reservation "
				+ "WHERE reservation_id = ?";

		return jdbc.queryForObject(sql, String.class, reservation_id);
	}

	public int selectMemberPoint(String member_id) {
		String sql = "SELECT NVL(point, 0) "
				+ "FROM users "
				+ "WHERE id = ?";
		return jdbc.queryForObject(sql, Integer.class, member_id);
	}

	@Transactional
	public void insertReservationWithPoints(String member_id, int game_id, List<Integer> seat_ids, String paymentId, int usedPoints) {
		if (seat_ids == null || seat_ids.isEmpty()) {
			throw new IllegalArgumentException("선택한 좌석이 없습니다.");
		}

		if (usedPoints < 0) {
			throw new IllegalArgumentException("사용 포인트가 올바르지 않습니다.");
		}

		java.util.Set<Integer> uniqueSeats = new java.util.HashSet<>(seat_ids);

		if (uniqueSeats.size() != seat_ids.size()) {
			throw new IllegalArgumentException("중복된 좌석이 있습니다.");
		}

		String placeholders = String.join(",", java.util.Collections.nCopies(seat_ids.size(), "?"));
		String priceSql = "SELECT COUNT(*), NVL(SUM(price), 0) "
				+ "FROM ticket "
				+ "WHERE game_id = ? "
				+ "AND seat_id IN (" + placeholders + ")";

		Object[] priceParams = new Object[seat_ids.size() + 1];
		priceParams[0] = game_id;

		for (int i = 0; i < seat_ids.size(); i++) {
			priceParams[i + 1] = seat_ids.get(i);
		}

		Map<String, Object> priceInfo = jdbc.queryForMap(priceSql, priceParams);
		int ticketCount = ((Number) priceInfo.get("TICKET_COUNT")).intValue();
		int totalPrice = ((Number) priceInfo.get("TOTAL_PRICE")).intValue();

		if (ticketCount != seat_ids.size()) {
			throw new IllegalArgumentException("선택한 좌석 중 유효하지 않은 좌석이 있습니다.");
		}

		if (usedPoints > totalPrice) {
			throw new IllegalArgumentException("사용 포인트가 결제 금액보다 많습니다.");
		}

		String reservedSql = "SELECT COUNT(*) "
				+ "FROM reservation r "
				+ "JOIN ticket t ON r.ticket_id = t.ticket_id "
				+ "WHERE t.game_id = ? "
				+ "AND t.seat_id IN (" + placeholders + ") "
				+ "AND r.status = ?";

		Object[] reservedParams = new Object[seat_ids.size() + 2];
		reservedParams[0] = game_id;

		for (int i = 0; i < seat_ids.size(); i++) {
			reservedParams[i + 1] = seat_ids.get(i);
		}

		reservedParams[seat_ids.size() + 1] = "예매완료";
		int reservedCount = jdbc.queryForObject(reservedSql, Integer.class, reservedParams);

		if (reservedCount > 0) {
			throw new IllegalStateException("이미 예약된 좌석이 있습니다. 좌석을 다시 선택해 주세요.");
		}

		if (usedPoints > 0) {
			String pointSql = "UPDATE users "
					+ "SET point = NVL(point, 0) - ? "
					+ "WHERE id = ? "
					+ "AND NVL(point, 0) >= ?";

			int updated = jdbc.update(pointSql, usedPoints, member_id, usedPoints);

			if (updated != 1) {
				throw new IllegalStateException("보유 포인트가 부족합니다. 잔액을 확인해 주세요.");
			}

			String historySql = "INSERT INTO point_history "
					+ "(point_seq, member_id, amount, reason, regdate) "
					+ "VALUES (point_seq.NEXTVAL, ?, ?, ?, SYSTIMESTAMP)";

			jdbc.update(historySql, member_id, -usedPoints, "티켓 예약 포인트 사용");
		}

		for (Integer seat_id : seat_ids) {
			String insertSql = "INSERT INTO reservation "
					+ "(reservation_id, member_id, ticket_id, "
					+ "reservation_date, status, payment_id) "
					+ "SELECT reservation_seq.NEXTVAL, ?, t.ticket_id, "
					+ "SYSTIMESTAMP, ?, ? "
					+ "FROM ticket t "
					+ "WHERE t.game_id = ? "
					+ "AND t.seat_id = ? "
					+ "AND NOT EXISTS ( "
					+ "    SELECT 1 FROM reservation r "
					+ "    WHERE r.ticket_id = t.ticket_id "
					+ "    AND r.status = ? "
					+ ")";

			int inserted = jdbc.update(insertSql, member_id, "예매완료", paymentId, game_id, seat_id, "예매완료");

			if (inserted != 1) {
				throw new IllegalStateException("좌석 예약에 실패했습니다. 다시 시도해 주세요.");
			}
		}
	}

	public int selectUsedPointByPaymentId(String paymentId) {
		String sql = "SELECT NVL(SUM(used_point), 0) "
				+ "FROM reservation "
				+ "WHERE payment_id = ?";

		return jdbc.queryForObject(sql, Integer.class, paymentId);
	}

	public int selectActiveReservationCountByPaymentId(String paymentId) {
		String sql = "SELECT COUNT(*) "
				+ "FROM reservation "
				+ "WHERE payment_id = ? "
				+ "AND status = ?";

		return jdbc.queryForObject(sql, Integer.class, paymentId, "예매완료");
	}

	public String selectMemberIdByPaymentId(String paymentId) {
		String sql = "SELECT member_id "
				+ "FROM reservation "
				+ "WHERE payment_id = ? "
				+ "AND ROWNUM = 1";

		return jdbc.queryForObject(sql, String.class, paymentId);
	}
}