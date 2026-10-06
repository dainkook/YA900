package com.kedu.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.BoardDTO;
import com.kedu.dto.LiveChatDTO;
import com.kedu.dto.ReplyDTO;

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
	
		public int write(BoardDTO dto) {
			String sql = "insert into board values(?, ?, ?, ?, 0, sysdate, ?, null, 0, null)";
			return jdbc.update(sql, dto.getBoard_seq(), dto.getTitle(), dto.getContents(), dto.getWriter(), dto.getTeam());
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
	
	public List<BoardDTO> getRecentBoards() {
	    String sql = "select * from (select board.*, row_number() over(order by board_seq desc) rn from board) where rn between 1 and 8";
	    return jdbc.query(sql, new BeanPropertyRowMapper<>(BoardDTO.class));
	}
	
	public int updateDetail(int seq, String title, String contents) {
		String sql = "update board set title = ?, contents = ? where board_seq = ?";
		return jdbc.update(sql, title, contents, seq);
	}
	
	public int deleteDetail(int seq) {
		String sql = "delete from board where board_seq = ?";
		return jdbc.update(sql, seq);
	}
	
	public int viewCount(int seq) {
		String sql = "update board set view_count = view_count + 1 where board_seq = ?";
		return jdbc.update(sql, seq);
	}
	
	public int getNextval() {
		String sql = "select board_seq.nextval from dual";
		int seq= jdbc.queryForObject(sql, Integer.class);
		System.out.println(seq);
		return seq;
	}
	
	public int addChat(LiveChatDTO dto) {
		String sql = "insert into livechat(liveChat_seq, contents, writer, game_id, regdate, team) values(liveChat_seq.nextval, ?, ?, ?, sysdate, ?)";
		return jdbc.update(sql, dto.getContents(), dto.getWriter(), dto.getGame_id(), dto.getTeam());
	}
	
	public List<LiveChatDTO> getChatList(int game_id) {
		String sql = "select * from livechat where game_id = ? order by liveChat_seq desc";
		return jdbc.query(sql, new BeanPropertyRowMapper<>(LiveChatDTO.class), game_id);
	}
	
	public List<ReplyDTO> getReplyList(int parent_seq) {
		String sql = "select * from reply where parent_seq=? order by reply_seq desc";
		return jdbc.query(sql, new BeanPropertyRowMapper<>(ReplyDTO.class),parent_seq);
	}
}
