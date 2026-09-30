package com.kedu.dto;

public class PlayerDTO {
	
	private int player_id;
	private String player_team;
	
	public PlayerDTO () {}

	public PlayerDTO(int player_id, String player_team) {
		this.player_id = player_id;
		this.player_team = player_team;
	}

	public int getPlayer_id() {
		return player_id;
	}

	public void setPlayer_id(int player_id) {
		this.player_id = player_id;
	}

	public String getPalyer_team() {
		return player_team;
	}

	public void setPalyer_team(String palyer_team) {
		this.player_team = player_team;
	}


}
