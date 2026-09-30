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

	// 공지사항 작성
	public int insert(NoticeDTO dto) {
		String sql = "insert into notice "
				   + "(notice_seq, title, contents, writer, view_count, write_date) "
				   + "values (?, ?, ?, ?, 0, sysdate)";
		return jdbc.update(sql,
				dto.getNotice_seq(),
				dto.getTitle(),
				dto.getContents(),
				dto.getWriter());
	}

	// 공지사항 전체 조회
	public List<NoticeDTO> selectAll() {
		String sql = "select * from notice "
				   + "order by notice_seq desc";
		return jdbc.query(sql,
				new BeanPropertyRowMapper<>(NoticeDTO.class));
	}

	// 공지사항 수정
	public int update(NoticeDTO dto) {
		String sql = "update notice "
				   + "set title = ?, contents = ? "
				   + "where notice_seq = ?";
		return jdbc.update(sql,
				dto.getTitle(),
				dto.getContents(),
				dto.getNotice_seq());
	}

	// 공지사항 삭제
	public int delete(int notice_seq) {
		String sql = "delete from notice "
				   + "where notice_seq = ?";
		return jdbc.update(sql, notice_seq);
	}

	// 제목 검색
	public List<NoticeDTO> searchByTitle(String title) {
		String sql = "select * from notice "
				   + "where title like '%' || ? || '%' "
				   + "order by notice_seq desc";
		return jdbc.query(sql,
				new BeanPropertyRowMapper<>(NoticeDTO.class),
				title);
	}

	// 내용 검색
	public List<NoticeDTO> searchByContents(String contents) {
		String sql = "select * from notice "
				   + "where contents like '%' || ? || '%' "
				   + "order by notice_seq desc";
		return jdbc.query(sql,
				new BeanPropertyRowMapper<>(NoticeDTO.class),
				contents);
	}

	// 전체 검색 (제목 + 내용)
	public List<NoticeDTO> searchByAll(String search) {
		String sql = "select * from notice "
				   + "where title like '%' || ? || '%' "
				   + "or contents like '%' || ? || '%' "
				   + "order by notice_seq desc";
		return jdbc.query(sql,
				new BeanPropertyRowMapper<>(NoticeDTO.class),
				search,
				search);
	}

	// 공지사항 상세 조회
	public NoticeDTO selectBySeq(int notice_seq) {
		String sql = "select * from notice where notice_seq = ?";
		return jdbc.queryForObject(sql,
				new BeanPropertyRowMapper<>(NoticeDTO.class),
				notice_seq);
	}

	// 조회수 증가
	public int viewCount(int notice_seq) {
		String sql = "update notice "
				   + "set view_count = view_count + 1 "
				   + "where notice_seq = ?";
		return jdbc.update(sql, notice_seq);
	}

	// 다음 공지사항 번호
	public int getNextSeq() {
		String sql = "select notice_seq.nextval from dual";
		return jdbc.queryForObject(sql, Integer.class);
	}
}