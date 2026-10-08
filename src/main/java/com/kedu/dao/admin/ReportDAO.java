package com.kedu.dao.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kedu.dto.PageDTO;
import com.kedu.dto.ReportDTO;

@Repository
public class ReportDAO {

	@Autowired
	private JdbcTemplate jdbc;

	// 전체 신고 목록
	public List<ReportDTO> selectAll(PageDTO page) {

		String sql = "SELECT * "
				+ "FROM ( "
				+ "SELECT ROW_NUMBER() OVER(ORDER BY regdate DESC, report_seq DESC) AS rn, "
				+ "report_seq, "
				+ "target_contents, "
				+ "target_type, "
				+ "target_seq, "
				+ "parent_seq, "
				+ "target_id, "
				+ "reporter, "
				+ "report_type, "
				+ "status, "
				+ "regdate "
				+ "FROM report "
				+ ") "
				+ "WHERE rn BETWEEN ? AND ?";

		return jdbc.query(
				sql,
				new BeanPropertyRowMapper<>(ReportDTO.class),
				page.getStartIndex(),
				page.getEndIndex());
	}

	// 전체 신고 개수
	public int getCount() {

		String sql = "SELECT COUNT(*) FROM report";

		return jdbc.queryForObject(sql, Integer.class);
	}

	// 신고 검색
	public List<ReportDTO> search(String searchType, String keyword, PageDTO page) {

		String sql = "SELECT * "
				+ "FROM ( "
				+ "SELECT ROW_NUMBER() OVER(ORDER BY regdate DESC, report_seq DESC) AS rn, "
				+ "report_seq, "
				+ "target_contents, "
				+ "target_type, "
				+ "target_seq, "
				+ "parent_seq, "
				+ "target_id, "
				+ "reporter, "
				+ "report_type, "
				+ "status, "
				+ "regdate "
				+ "FROM report ";

		if (searchType.equals("target")) {

			sql += "WHERE target_type LIKE ? ";

		} else if (searchType.equals("targetId")) {

			sql += "WHERE target_id LIKE ? ";

		} else if (searchType.equals("reporter")) {

			sql += "WHERE reporter LIKE ? ";

		} else if (searchType.equals("reportType")) {

			sql += "WHERE report_type LIKE ? ";

		} else if (searchType.equals("all")) {

			sql += "WHERE target_type LIKE ? "
					+ "OR target_id LIKE ? "
					+ "OR reporter LIKE ? "
					+ "OR report_type LIKE ? ";
		}

		sql += ") "
				+ "WHERE rn BETWEEN ? AND ?";

		String keywordValue = "%" + keyword + "%";

		if (searchType.equals("all")) {

			return jdbc.query(
					sql,
					new BeanPropertyRowMapper<>(ReportDTO.class),
					keywordValue,
					keywordValue,
					keywordValue,
					keywordValue,
					page.getStartIndex(),
					page.getEndIndex());

		} else {

			return jdbc.query(
					sql,
					new BeanPropertyRowMapper<>(ReportDTO.class),
					keywordValue,
					page.getStartIndex(),
					page.getEndIndex());
		}
	}

	// 검색 결과 개수
	public int getSearchCount(String searchType, String keyword) {

		String sql = "";

		if (searchType.equals("target")) {

			sql = "SELECT COUNT(*) "
					+ "FROM report "
					+ "WHERE target_type LIKE ?";

			return jdbc.queryForObject(
					sql,
					Integer.class,
					"%" + keyword + "%");

		} else if (searchType.equals("targetId")) {

			sql = "SELECT COUNT(*) "
					+ "FROM report "
					+ "WHERE target_id LIKE ?";

			return jdbc.queryForObject(
					sql,
					Integer.class,
					"%" + keyword + "%");

		} else if (searchType.equals("reporter")) {

			sql = "SELECT COUNT(*) "
					+ "FROM report "
					+ "WHERE reporter LIKE ?";

			return jdbc.queryForObject(
					sql,
					Integer.class,
					"%" + keyword + "%");

		} else if (searchType.equals("reportType")) {

			sql = "SELECT COUNT(*) "
					+ "FROM report "
					+ "WHERE report_type LIKE ?";

			return jdbc.queryForObject(
					sql,
					Integer.class,
					"%" + keyword + "%");

		} else if (searchType.equals("all")) {

			sql = "SELECT COUNT(*) "
					+ "FROM report "
					+ "WHERE target_type LIKE ? "
					+ "OR target_id LIKE ? "
					+ "OR reporter LIKE ? "
					+ "OR report_type LIKE ?";

			String keywordValue = "%" + keyword + "%";

			return jdbc.queryForObject(
					sql,
					Integer.class,
					keywordValue,
					keywordValue,
					keywordValue,
					keywordValue);
		}

		return 0;
	}

	// 신고 상세 조회
	public ReportDTO selectBySeq(int report_seq) {

		String sql = "SELECT * "
				+ "FROM report "
				+ "WHERE report_seq = ?";

		return jdbc.queryForObject(
				sql,
				new BeanPropertyRowMapper<>(ReportDTO.class),
				report_seq);
	}

	// 신고 상태 변경
	public int updateStatus(int report_seq, String status) {

		String sql = "UPDATE report "
				+ "SET status = ? "
				+ "WHERE report_seq = ?";

		return jdbc.update(sql, status, report_seq);
	}
}