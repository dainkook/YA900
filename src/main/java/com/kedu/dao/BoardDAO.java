package com.kedu.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
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
	
	public int searchCount(String option, String search) {
		int result = 0;
		if(option.equals("제목")) {
			String sql = "select count(*) from board where title like '%' || ? || '%'";
			result = jdbc.queryForObject(sql, Integer.class, search);
		} else if(option.equals("내용")) {
			String sql = "select count(*) from board where contents like '%' || ? || '%'";
			result = jdbc.queryForObject(sql, Integer.class, search);
		} else if(option.equals("글쓴이")) {
			String sql = "select count(*) from board where writer like '%' || ? || '%'";
		result = jdbc.queryForObject(sql, Integer.class, search);
		}
		return result;
	}
	
	public List<BoardDTO> listOfPage(int first, int last) {
		String sql = "select * from (select board.*, row_number() over(order by board_seq desc) rn from board) where rn between ? and ?";
		return jdbc.query(sql, new BeanPropertyRowMapper<>(BoardDTO.class), first, last);
	}
	
	public BoardDTO getDetail(int seq) {
		String sql = "select * from board where board_seq = ?";
		return jdbc.queryForObject(sql, new BeanPropertyRowMapper<>(BoardDTO.class) ,seq);
	}
	
	public String isUserTeam(String id) {
		String sql = "select team from users where id = ?";
		return jdbc.queryForObject(sql, String.class, id);
	}
	
	public int write(String title, String contents, String id, String team) {
		String sql = "insert into board values(board_seq.nextval, ?, ?, 0, sysdate, ?, null, 0, null";
		return jdbc.update(sql, title, contents, id, team);
	}
	
	public List<BoardDTO> searchBoard(String option, String search, int first, int last) {
		if(option.equals("제목")) {
			String sql = "select * from "
			           + "(select board.*, row_number() over(order by board_seq desc) rn "
			           + "from board where title like '%' || ? || '%')"
			           + "where rn between ? and ?";
			return jdbc.query(sql, new BeanPropertyRowMapper<>(BoardDTO.class), search, first, last);
		} else if(option.equals("내용")) {
			String sql = "select * from "
			           + "(select board.*, row_number() over(order by board_seq desc) rn "
			           + "from board where contents like '%' || ? || '%')"
			           + "where rn between ? and ?";
			return jdbc.query(sql, new BeanPropertyRowMapper<>(BoardDTO.class), search, first, last);
		} else if(option.equals("글쓴이")) {
			String sql = "select * from "
			           + "(select board.*, row_number() over(order by board_seq desc) rn "
			           + "from board where writer like '%' || ? || '%')"
			           + "where rn between ? and ?";
			return jdbc.query(sql, new BeanPropertyRowMapper<>(BoardDTO.class), search, first, last);
		} else {
			List<BoardDTO> fail = new ArrayList<>();
			return fail;
		}
	}
	
	public String teamLogoEditer(int seq) {
		String sql = "select team from board where board_seq = ?";
		String team = jdbc.queryForObject(sql, String.class, seq);
		if(team!=null) {
		String sql2 = "select team_logo from team where team_name = ?";
		return jdbc.queryForObject(sql2, String.class, team);
		} return null;
	}
}
