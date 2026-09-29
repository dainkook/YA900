package com.kedu.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kedu.dto.BoardDTO;

@Repository
public class BoardDAO {
	@Autowired
	JdbcTemplate jdbc;
	
	public int totalCount() {
		String sql = "select count(*) from board";
		return jdbc.queryForObject(sql, Integer.class);
	}
	
	public List<BoardDTO> listOfPage(int first, int last) {
		String sql = "select * from (select board.*, row_number() over(order by seq desc) rn from board) where rn between ? and ?";
		return jdbc.query(sql, new BeanPropertyRowMapper<>(BoardDTO.class), first, last);
	}
	
	public BoardDTO getDetail(int seq) {
		String sql = "select * from board where board_seq = ?";
		return jdbc.queryForObject(sql, new BeanPropertyRowMapper<>(BoardDTO.class) ,seq);
	}
}
