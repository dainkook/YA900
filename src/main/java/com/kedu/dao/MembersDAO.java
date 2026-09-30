package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.UsersDTO;

@Repository
public class MembersDAO {

	@Autowired
	private JdbcTemplate jdbc;

	public int insert(UsersDTO dto) {

		String sql = "INSERT INTO users ("
				+ "member_seq, id, name, pw, email, phone, zipcode, "
				+ "address1, address2, gender, age, birth, profile_img, "
				+ "point, team, regdate, blackList, admin"
				+ ") VALUES ("
				+ "USERS_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
				+ "0, ?, SYSTIMESTAMP, 0, '�씪諛�'"
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
		String sql = "select count(*) from users where id =?";
		return jdbc.queryForObject(sql, Integer.class, email);
	}
}
