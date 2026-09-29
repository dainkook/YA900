package com.kedu.dao.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO {

	@Autowired
	private JdbcTemplate jdbc;
	
	  public boolean login(String admin_id, String admin_pw) {
	        String sql = "SELECT COUNT(*) FROM admin WHERE admin_id = ? AND admin_pw = ?";
	        int count = jdbc.queryForObject(
	            sql,
	            Integer.class,
	            admin_id,
	            admin_pw);
	        return count > 0;
	    }
}
