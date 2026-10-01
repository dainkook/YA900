package com.kedu.dao.admin;

import java.util.ArrayList;
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
		           + " SELECT "
		           + " ROW_NUMBER() OVER( "
		           + " ORDER BY regdate DESC, id DESC "
		           + " ) AS rn, "
		           + " users.* "
		           + " FROM users "
		           + ") "
		           + "WHERE rn BETWEEN ? AND ?";

	    return jdbc.query(
	        sql,
	        new BeanPropertyRowMapper<>(UsersDTO.class),
	        page.getStartIndex(),
	        page.getEndIndex()
	    );
	}
	
	public int getCount() {
		String sql = "select count(*) from users";
		return jdbc.queryForObject(sql, Integer.class);
	}
	
	public List<UsersDTO> search(String searchType, String keyword){
		
		if(searchType.equals("name")) {
			String sql = "select * from users where name like ?";
			return jdbc.query(sql, 
					new BeanPropertyRowMapper<>(UsersDTO.class),
					"%" + keyword + "%");
		} else if(searchType.equals("id")) {
			String sql = "select * from users where id like ?";
			return jdbc.query(sql, 
					new BeanPropertyRowMapper<>(UsersDTO.class),
					"%" + keyword + "%");
		} else if(searchType.equals("phone")) {
			String sql = "select * from users where phone like ?";
			return jdbc.query(sql, 
					new BeanPropertyRowMapper<>(UsersDTO.class),
					"%" + keyword + "%");
		}
		return new ArrayList<>();
	}
	
}
