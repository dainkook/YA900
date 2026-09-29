package com.kedu.dao.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ScheduleDAO {

	@Autowired
	private JdbcTemplate jdbc;
}
