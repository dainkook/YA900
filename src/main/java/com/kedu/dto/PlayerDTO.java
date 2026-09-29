package com.kedu.dto;

public class PlayerDTO {
	
	private int player_id;
	private String palyer_team;
	private int backnum;
	
	public PlayerDTO () {}

	public PlayerDTO(int player_id, String palyer_team, int backnum) {
		this.player_id = player_id;
		this.palyer_team = palyer_team;
		this.backnum = backnum;
	}

	public int getPlayer_id() {
		return player_id;
	}

	public void setPlayer_id(int player_id) {
		this.player_id = player_id;
	}

	public String getPalyer_team() {
		return palyer_team;
	}

	public void setPalyer_team(String palyer_team) {
		this.palyer_team = palyer_team;
	}

	public int getBacknum() {
		return backnum;
	}

	public void setBacknum(int backnum) {
		this.backnum = backnum;
	}
	
	
	
	

}
