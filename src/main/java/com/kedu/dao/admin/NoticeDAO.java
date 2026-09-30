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

	// 전체 검색
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

	// 전체 목록 페이지 조회
	public List<NoticeDTO> selectPage(int start, int end) {

		String sql =
				"select * from ("
			  + " select row_number() over(order by notice_seq desc) rn, "
			  + " notice_seq, title, contents, writer, view_count, write_date "
			  + " from notice"
			  + ") "
			  + "where rn between ? and ? "
			  + "order by rn";

		return jdbc.query(sql,
				new BeanPropertyRowMapper<>(NoticeDTO.class),
				start,
				end);
	}

	// 제목 검색 페이지 조회
	public List<NoticeDTO> searchPageByTitle(String title, int start, int end) {

		String sql =
				"select * from ("
			  + " select row_number() over(order by notice_seq desc) rn, "
			  + " notice_seq, title, contents, writer, view_count, write_date "
			  + " from notice "
			  + " where title like '%' || ? || '%'"
			  + ") "
			  + "where rn between ? and ? "
			  + "order by rn";

		return jdbc.query(sql,
				new BeanPropertyRowMapper<>(NoticeDTO.class),
				title,
				start,
				end);
	}

	// 내용 검색 페이지 조회
	public List<NoticeDTO> searchPageByContents(String contents, int start, int end) {
		String sql =
				"select * from ("
			  + "select row_number() over(order by notice_seq desc) rn, "
			  + " notice_seq, title, contents, writer, view_count, write_date "
			  + " from notice "
			  + " where contents like '%' || ? || '%'"
			  + ") "
			  + "where rn between ? and ? "
			  + "order by rn";

		return jdbc.query(sql,
				new BeanPropertyRowMapper<>(NoticeDTO.class),
				contents,
				start,
				end);
	}

	// 전체 검색 페이지 조회
	public List<NoticeDTO> searchPageByAll(String search, int start, int end) {

		String sql =
				"select * from ("
			  + "select row_number() over(order by notice_seq desc) rn, "
			  + "notice_seq, title, contents, writer, view_count, write_date "
			  + " from notice "
			  + " where title like '%' || ? || '%' "
			  + " or contents like '%' || ? || '%'"
			  + ") "
			  + "where rn between ? and ? "
			  + "order by rn";

		return jdbc.query(sql,
				new BeanPropertyRowMapper<>(NoticeDTO.class),
				search,
				search,
				start,
				end);
	}

	// 전체 게시글 개수
	public int getCount() {
		String sql = "select count(*) from notice";
		
		return jdbc.queryForObject(sql, Integer.class);
	}

	// 제목 검색 게시글 개수
	public int getCountByTitle(String title) {
		String sql = "select count(*) "
				   + "from notice "
				   + "where title like '%' || ? || '%'";

		return jdbc.queryForObject(sql, Integer.class, title);
	}

	// 내용 검색 게시글 개수
	public int getCountByContents(String contents) {
		String sql = "select count(*) "
				   + "from notice "
				   + "where contents like '%' || ? || '%'";

		return jdbc.queryForObject(sql, Integer.class, contents);
	}

	// 전체 검색 게시글 개수
	public int getCountByAll(String search) {
		String sql = "select count(*) "
				   + "from notice "
				   + "where title like '%' || ? || '%' "
				   + "or contents like '%' || ? || '%'";

		return jdbc.queryForObject(sql,
				Integer.class,
				search,
				search);
	}

	//상세 조회
	public NoticeDTO selectBySeq(int notice_seq) {
		String sql = "select * from notice "
				   + "where notice_seq = ?";
		
		return jdbc.queryForObject(sql,
				new BeanPropertyRowMapper<>(NoticeDTO.class),
				notice_seq);
	}

	//조회수
	public int viewCount(int notice_seq) {
		String sql = "update notice "
				   + "set view_count = view_count + 1 "
				   + "where notice_seq = ?";
		
		return jdbc.update(sql, notice_seq);
	}

	//수정
	public int update(NoticeDTO dto) {
		String sql = "update notice "
				   + "set title = ?, contents = ? "
				   + "where notice_seq = ?";
		
		return jdbc.update(sql,
				dto.getTitle(),
				dto.getContents(),
				dto.getNotice_seq());
	}

	//삭제
	public int delete(int notice_seq) {
		String sql = "delete from notice "
				   + "where notice_seq = ?";
		
		return jdbc.update(sql, notice_seq);
	}

	//시퀀스 번호
	public int getNextSeq() {
		String sql = "select notice_seq.nextval from dual";
		
		return jdbc.queryForObject(sql, Integer.class);
	}
}