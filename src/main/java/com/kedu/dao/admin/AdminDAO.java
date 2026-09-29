package com.kedu.dao.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.AdminDTO;

@Repository
public class AdminDAO {

	@Autowired
	private JdbcTemplate jdbc;
	
	//관리자ID를 기준으로 계정 여부 조회
	public AdminDTO selectById(String admin_id) {
		String sql = "SELECT * FROM admin WHERE admin_id = ?";
		try {
			return jdbc.queryForObject(
					sql, 
					new BeanPropertyRowMapper<>(AdminDTO.class), 
					admin_id);
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
	
	//전체 회원 수
	public int getMemberCount() {
		String sql = "select count(*) from users";
		return jdbc.queryForObject(sql, Integer.class);
	}
	
	//전체 예매 수
	public int getReservationCount() {
		String sql = "select count(*) from reservation";
		return jdbc.queryForObject(sql, Integer.class);
	}
	
	public int getTodayReservationCount() {
		String sql = "select count(*) from reservation where trunc(reservation_date) = trunc(sysdate)";
		return jdbc.queryForObject(sql, Integer.class);
	}
	
}
