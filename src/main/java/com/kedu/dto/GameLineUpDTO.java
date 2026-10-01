package com.kedu.dto;

public class GameLineUpDTO {

	private String game_id;
	private int player_id;
	private String team;
	private int batting_order;
	private String position;
	private int starter;
	private String player_name;
	private String player_image;

	public GameLineUpDTO() {
		super();
	}

	public String getGame_id() {
		return game_id;
	}

	public void setGame_id(String game_id) {
		this.game_id = game_id;
	}

	public int getPlayer_id() {
		return player_id;
	}

	public void setPlayer_id(int player_id) {
		this.player_id = player_id;
	}

	public String getTeam() {
		return team;
	}

	public void setTeam(String team) {
		this.team = team;
	}

	public int getBatting_order() {
		return batting_order;
	}

	public void setBatting_order(int batting_order) {
		this.batting_order = batting_order;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public int getStarter() {
		return starter;
	}

	public void setStarter(int starter) {
		this.starter = starter;
	}

	public String getPlayer_name() {
		return player_name;
	}

	public void setPlayer_name(String player_name) {
		this.player_name = player_name;
	}

	public String getPlayer_image() {
		return player_image;
	}

	public void setPlayer_image(String player_image) {
		this.player_image = player_image;
	}
}