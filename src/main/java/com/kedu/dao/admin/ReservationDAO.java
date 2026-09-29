package com.kedu.dao.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDAO {

	@Autowired
	private JdbcTemplate jdbc;
}
