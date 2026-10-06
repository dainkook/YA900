package com.kedu.dto;

public class MyTeamDTO {
	
	private String id;
	private String player_1B;
	private String player_2B;
	private String player_3B;
	private String player_SP;
	private String player_C;
	private String player_RF;
	private String player_LF;
	private String player_CF;
	private String player_SS;
	
	public MyTeamDTO () {}

	public MyTeamDTO(String id, String player_1b, String player_2b, String player_3b, String player_SP, String player_C,
			String player_RF, String player_LF, String player_CF, String player_SS) {super();
		this.id = id;
		this.player_1B = player_1b;
		this.player_2B = player_2b;
		this.player_3B = player_3b;
		this.player_SP = player_SP;
		this.player_C = player_C;
		this.player_RF = player_RF;
		this.player_LF = player_LF;
		this.player_CF = player_CF;
		this.player_SS = player_SS;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPlayer_1B() {
		return player_1B;
	}

	public void setPlayer_1B(String player_1b) {
		player_1B = player_1b;
	}

	public String getPlayer_2B() {
		return player_2B;
	}

	public void setPlayer_2B(String player_2b) {
		player_2B = player_2b;
	}

	public String getPlayer_3B() {
		return player_3B;
	}

	public void setPlayer_3B(String player_3b) {
		player_3B = player_3b;
	}

	public String getPlayer_SP() {
		return player_SP;
	}

	public void setPlayer_SP(String player_SP) {
		this.player_SP = player_SP;
	}

	public String getPlayer_C() {
		return player_C;
	}

	public void setPlayer_C(String player_C) {
		this.player_C = player_C;
	}

	public String getPlayer_RF() {
		return player_RF;
	}

	public void setPlayer_RF(String player_RF) {
		this.player_RF = player_RF;
	}

	public String getPlayer_LF() {
		return player_LF;
	}

	public void setPlayer_LF(String player_LF) {
		this.player_LF = player_LF;
	}

	public String getPlayer_CF() {
		return player_CF;
	}

	public void setPlayer_CF(String player_CF) {
		this.player_CF = player_CF;
	}

	public String getPlayer_SS() {
		return player_SS;
	}

	public void setPlayer_SS(String player_SS) {
		this.player_SS = player_SS;
	}
	
	
	
	
}
