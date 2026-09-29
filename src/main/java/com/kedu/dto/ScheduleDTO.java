package com.kedu.dto;

import java.sql.Timestamp;

public class ScheduleDTO {

	private int game_id;
	private String title;
	private String location;
	private Timestamp start_date;
	private Timestamp end_date;
	private int winner_id;
	private int home_id;
	private int away_id;

	public ScheduleDTO() {}

	public ScheduleDTO(int game_id, String title, String location, Timestamp start_date, Timestamp end_date,
			int winner_id, int home_id, int away_id) {
		this.game_id = game_id;
		this.title = title;
		this.location = location;
		this.start_date = start_date;
		this.end_date = end_date;
		this.winner_id = winner_id;
		this.home_id = home_id;
		this.away_id = away_id;
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

	public int getWinner_id() {
		return winner_id;
	}

	public void setWinner_id(int winner_id) {
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
}
