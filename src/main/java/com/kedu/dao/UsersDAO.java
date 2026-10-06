package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.UsersDTO;

@Repository
public class UsersDAO {

	@Autowired
	private JdbcTemplate jdbc;

	public int signup(UsersDTO dto) {

		String sql = "INSERT INTO users ("
				+ "member_seq, id, name, pw, email, phone, zipcode, "
				+ "address1, address2, gender, age, birth, profile_img, "
				+ "point, team, regdate, blackList, admin"
				+ ") VALUES ("
				+ "USERS_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
				+ "0, ?, SYSTIMESTAMP, 0, '¿œπ›'"
				+ ")";

		return jdbc.update(sql,
				dto.getId(),
				dto.getName(),
				dto.getPw(),
				dto.getEmail(),
				dto.getPhone(),
				dto.getZipcode(),
				dto.getAddress1(),
				dto.getAddress2(),
				dto.getGender(),
				dto.getAge(),
				dto.getBirth(),
				dto.getProfile_img(),
				dto.getTeam()
				);
	}
  
	public UsersDTO login(String id, String pw) {

	    String sql = "SELECT * FROM users WHERE id = ? AND pw = ?";

	    try {
	        return jdbc.queryForObject(
	            sql,
	            new BeanPropertyRowMapper<UsersDTO>(UsersDTO.class),
	            id,
	            pw
	        );
	    } catch (Exception e) {
	        return null;
	    }
	}
	public int idCheck(String id) {
		String sql= "select count(*) from users where id = ?";
		return jdbc.queryForObject(sql, Integer.class, id);
	}
	public int emailCheck(String email) {
		String sql = "select count(*) from users where email =?";
		return jdbc.queryForObject(sql, Integer.class, email);
	}

	public String findUserId(String name, String email) {

	    String sql = "SELECT id FROM users WHERE name = ? AND email = ?";

	    try {
	        return jdbc.queryForObject(
	            sql,
	            String.class,
	            name,
	            email
	        );
	    } catch (Exception e) {
	        return null;
	    }
	}
	public UsersDTO findUserPw(String name, String id, String email) {
		String sql= "select * from users where id=? and name=? and email=?";
		return  jdbc.queryForObject(sql, new BeanPropertyRowMapper<>(UsersDTO.class), id,name,email);
	}
	public int updatePw(String id, String newPw) {
		String sql = "update users set pw=? where id=?";
		return jdbc.update(sql, newPw, id);
		
	}
}
