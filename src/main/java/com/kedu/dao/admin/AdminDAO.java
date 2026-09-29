package com.kedu.dao.admin;

import java.util.List;
import java.util.Map;

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
	
	//오늘 예매 수
	public int getTodayReservationCount() {
		String sql = "select count(*) from reservation where trunc(reservation_date) = trunc(sysdate)";
		return jdbc.queryForObject(sql, Integer.class);
	}
	
	//월별 예매 수
	public List<Map<String, Object>> getMonthlyReservation(){
		 String sql = "SELECT TO_CHAR(reservation_date, 'MM') AS MONTH, " +
		            "COUNT(*) AS CNT " +
		            "FROM reservation " +
		            "GROUP BY TO_CHAR(reservation_date, 'MM') " +
		            "ORDER BY MONTH";

		    return jdbc.queryForList(sql);
	}
	
	//성별 통계
	public List<Map<String, Object>> getGenderStats(){
		String sql = "SELECT gender, COUNT(*) AS cnt " +
				"FROM users " +
				"GROUP BY gender " +
				"ORDER BY CASE " +
				"WHEN gender = '남성' THEN 1 " +
				"WHEN gender = '여성' THEN 2 " +
				"END";
		
		return jdbc.queryForList(sql);
	}
	
	//나이 통계
	public List<Map<String, Object>> getAgeStats(){
		String sql =   "SELECT gender, " +
		        "TRUNC(age / 10) * 10 AS age_group, " +
		        "COUNT(*) AS cnt " +
		        "FROM users " +
		        "GROUP BY gender, TRUNC(age / 10) * 10 " +
		        "ORDER BY gender, age_group";

		return jdbc.queryForList(sql);
	}
}
