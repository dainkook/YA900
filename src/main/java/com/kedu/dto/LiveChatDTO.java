package com.kedu.dto;

import java.sql.Timestamp;

public class LiveChatDTO {

	int liveChat_seq;
	String contents;
	String writer;
	String teamLogo;
	int report_seq;
	String reporter;
	int game_id;
	Timestamp regdate;
	String team;
	public int getLiveChat_seq() {
		return liveChat_seq;
	}
	public void setLiveChat_seq(int liveChat_seq) {
		this.liveChat_seq = liveChat_seq;
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
	public int getGame_id() {
		return game_id;
	}
	public void setGame_id(int game_id) {
		this.game_id = game_id;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	
	public LiveChatDTO() {}
	public LiveChatDTO(int liveChat_seq, String contents, String writer, String teamLogo, int report_seq,
			String reporter, int game_id, Timestamp regdate, String team) {
		this.liveChat_seq = liveChat_seq;
		this.contents = contents;
		this.writer = writer;
		this.teamLogo = teamLogo;
		this.report_seq = report_seq;
		this.reporter = reporter;
		this.game_id = game_id;
		this.regdate = regdate;
		this.team = team;
	};
	
	
}
