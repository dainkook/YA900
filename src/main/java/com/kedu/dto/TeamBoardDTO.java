package com.kedu.dto;

import java.sql.Timestamp;

public class TeamBoardDTO {

	int teamBoard_seq;
	String title;
	String contents;
	String writer;
	int view_count;
	Timestamp write_date;
	String team;
	String teamLogo;
	int report_seq;
	String reporter;
	public int getTeamBoard_seq() {
		return teamBoard_seq;
	}
	public void setTeamBoard_seq(int teamBoard_seq) {
		this.teamBoard_seq = teamBoard_seq;
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
	public int getReport_seq() {
		return report_seq;
	}
	public void setReport_seq(int report_seq) {
		this.report_seq = report_seq;
	}
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	
	public TeamBoardDTO() {}
	public TeamBoardDTO(int teamBoard_seq, String title, String contents, String writer, int view_count,
		Timestamp write_date, String team, String teamLogo, int report_seq, String reporter) {
		this.teamBoard_seq = teamBoard_seq;
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
