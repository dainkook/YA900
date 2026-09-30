package com.kedu.dao.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.NoticeDTO;

@Repository
public class NoticeDAO {

	@Autowired
	private JdbcTemplate jdbc;

	public int insert(NoticeDTO dto) {
		String sql = "insert into notice " 
				   + "(notice_seq, title, contents, writer, view_count, write_date) "
				   + "values (notice_seq.nextval, ?, ?, ?, 0, sysdate)";
		return jdbc.update(sql, 
				dto.getTitle(), 
				dto.getContents(), 
				dto.getWriter());
	}

	public List<NoticeDTO> selectAll() {
		String sql = "select * from notice " 
				   + "order by notice_seq desc";
		return jdbc.query(sql, 
				new BeanPropertyRowMapper<>(NoticeDTO.class));
	}

	public int update(NoticeDTO dto) {
		String sql = "update notice " 
				   + "set title = ?, contents = ? " 
				   + "where notice_seq = ?";
		return jdbc.update(sql, 
				dto.getTitle(), 
				dto.getContents(), 
				dto.getNotice_seq());
	}

	public int delete(int notice_seq) {
		String sql = "delete from notice " 
				   + "where notice_seq = ?";
		return jdbc.update(sql, notice_seq);
	}

	public List<NoticeDTO> searchByTitle(String title) {
		String sql = "select * from notice " 
				   + "where title like '%' || ? || '%' " 
				   + "order by notice_seq desc";
		return jdbc.query(sql, 
				new BeanPropertyRowMapper<>(NoticeDTO.class), 
				title);
	}

	public NoticeDTO selectBySeq(int notice_seq) {
		String sql = "select * from notice where notice_seq = ?";
		return jdbc.queryForObject(sql, 
				new BeanPropertyRowMapper<>(NoticeDTO.class), 
				notice_seq);
	}

	public int viewCount(int notice_seq) {
		String sql = "update notice " 
				   + "set view_count = view count + 1" 
				   + "where notice_seq = ?";
		return jdbc.update(sql, notice_seq);
	}
}
