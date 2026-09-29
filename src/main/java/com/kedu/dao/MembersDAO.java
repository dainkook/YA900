package com.kedu.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MembersDAO {
	@Autowired
	private JdbcTemplate jdbc;
	String sql = "INSERT INTO users ("
	        + "member_seq, id, name, pw, email, phone, zipcode, "
	        + "address1, address2, gender, age, birth, profile_img, "
	        + "point, team, regdate, blackList, admin"
	        + ") VALUES ("
	        + "member_seq_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
	        + "0, ?, SYSTIMESTAMP, 0, '¿œπ›'"
	        + ")";
	
	return jdbc
	
}
