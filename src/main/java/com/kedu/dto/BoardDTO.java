package com.kedu.dto;

import java.sql.Timestamp;

public class BoardDTO {

	private int board_seq;
	private String title;
	private String contents;
	private String writer;
	private int view_count;
	private Timestamp write_date;
	private String team;
	private String teamLogo;
	private Integer report_seq;
	private String reporter;
	
	public int getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public String getTeamLogo() {
		return teamLogo;
	}
	public void setTeamLogo(String teamLogo) {
		this.teamLogo = teamLogo;
	}
	public Integer getReport_seq() {
		return report_seq;
	}
	public void setReport_seq(Integer report_seq) {
		this.report_seq = report_seq;
	}
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	
	public BoardDTO() {}
	public BoardDTO(int board_seq, String title, String contents, String writer, int view_count, Timestamp write_date,
		String team, String teamLogo, int report_seq, String reporter) {
		this.board_seq = board_seq;
		this.title = title;
		this.contents = contents;
		this.writer = writer;
		this.view_count = view_count;
		this.write_date = write_date;
		this.team = team;
		this.teamLogo = teamLogo;
		this.report_seq = report_seq;
		this.reporter = reporter;
	};
	
	
}
