package com.kedu.dao.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReportDAO {

	@Autowired
	private JdbcTemplate jdbc;
}
