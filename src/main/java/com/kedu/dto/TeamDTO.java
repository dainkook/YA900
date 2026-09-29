package com.kedu.dto;

public class TeamDTO {
	
	private int team_id;
	private String team_name;
	private String team_logo;
	private String stadium;
	
	public TeamDTO () {}

	public TeamDTO(int team_id, String team_name, String team_logo, String stadium) {
		this.team_id = team_id;
		this.team_name = team_name;
		this.team_logo = team_logo;
		this.stadium = stadium;
	}

	public int getTeam_id() {
		return team_id;
	}

	public void setTeam_id(int team_id) {
		this.team_id = team_id;
	}

	public String getTeam_name() {
		return team_name;
	}

	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}

	public String getTeam_logo() {
		return team_logo;
	}

	public void setTeam_logo(String team_logo) {
		this.team_logo = team_logo;
	}

	public String getStadium() {
		return stadium;
	}

	public void setStadium(String stadium) {
		this.stadium = stadium;
	}
	
}
