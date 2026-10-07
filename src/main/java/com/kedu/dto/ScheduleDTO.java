package com.kedu.dto;

import java.sql.Timestamp;

public class ScheduleDTO {

	private int game_id;
	private String title;
	private String location;
	private Timestamp start_date;
	private Timestamp end_date;
	private Integer winner_id;
	private int home_id;
	private int away_id;
	private String home_team;
	private String away_team;
	private Integer home_score;
	private Integer away_score;
	private String game_status;
	private String home_logo;
	private String away_logo;
	private String naver_game_id;

	public ScheduleDTO() {}

	public ScheduleDTO(int game_id, String title, String location, Timestamp start_date, Timestamp end_date,
			int winner_id, int home_id, int away_id, String home_team, String away_team) {;
		this.game_id = game_id;
		this.title = title;
		this.location = location;
		this.start_date = start_date;
		this.end_date = end_date;
		this.winner_id = winner_id;
		this.home_id = home_id;
		this.away_id = away_id;
		this.home_team = home_team;
		this.away_team = away_team;
	}

	public int getGame_id() {
		return game_id;
	}

	public void setGame_id(int game_id) {
		this.game_id = game_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Timestamp getStart_date() {
		return start_date;
	}

	public void setStart_date(Timestamp start_date) {
		this.start_date = start_date;
	}

	public Timestamp getEnd_date() {
		return end_date;
	}

	public void setEnd_date(Timestamp end_date) {
		this.end_date = end_date;
	}

	public Integer getWinner_id() {
		return winner_id;
	}

	public void setWinner_id(Integer winner_id) {
		this.winner_id = winner_id;
	}

	public int getHome_id() {
		return home_id;
	}

	public void setHome_id(int home_id) {
		this.home_id = home_id;
	}

	public int getAway_id() {
		return away_id;
	}

	public void setAway_id(int away_id) {
		this.away_id = away_id;
	}

	public String getHome_team() {
		return home_team;
	}

	public void setHome_team(String home_team) {
		this.home_team = home_team;
	}

	public String getAway_team() {
		return away_team;
	}

	public void setAway_team(String away_team) {
		this.away_team = away_team;
	}
	
	public Integer getHome_score() {
	    return home_score;
	}

	public void setHome_score(Integer home_score) {
	    this.home_score = home_score;
	}

	public Integer getAway_score() {
	    return away_score;
	}

	public void setAway_score(Integer away_score) {
	    this.away_score = away_score;
	}

	public String getGame_status() {
	    return game_status;
	}

	public void setGame_status(String game_status) {
	    this.game_status = game_status;
	}
	
	public String getHome_logo() {
	    return home_logo;
	}

	public void setHome_logo(String home_logo) {
	    this.home_logo = home_logo;
	}

	public String getAway_logo() {
	    return away_logo;
	}

	public void setAway_logo(String away_logo) {
	    this.away_logo = away_logo;
	}
	
	public String getNaver_game_id() {
	    return naver_game_id;
	}

	public void setNaver_game_id(String naver_game_id) {
	    this.naver_game_id = naver_game_id;
	}
	
	
	
}

