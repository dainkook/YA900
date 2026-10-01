package com.kedu.dto;

public class PlayerPitcherDTO {

	private int player_id;
	private String player_team;
	private String player_name;
	private String player_image;
	private double era;
	private int games;
	private int wins;
	private int losses;
	private int holds;
	private int saves;
	private String innings;
	private int strikeouts;
	private int hits_allowed;
	private int home_runs_allowed;
	private int runs_allowed;
	private int earned_runs;
	private int base_on_balls;
	private int hit_by_pitch;
	private double win_rate;
	private double wpa;
	private double war;
	private String team_name;
	private String team_logo;

	public PlayerPitcherDTO() {
	}

	public PlayerPitcherDTO(int player_id, String player_team, String player_name, String player_image,
			double era, int games, int wins, int losses, int holds, int saves, String innings,
			int strikeouts, int hits_allowed, int home_runs_allowed, int runs_allowed,
			int earned_runs, int base_on_balls, int hit_by_pitch, double win_rate,
			double wpa, double war) {
		this.player_id = player_id;
		this.player_team = player_team;
		this.player_name = player_name;
		this.player_image = player_image;
		this.era = era;
		this.games = games;
		this.wins = wins;
		this.losses = losses;
		this.holds = holds;
		this.saves = saves;
		this.innings = innings;
		this.strikeouts = strikeouts;
		this.hits_allowed = hits_allowed;
		this.home_runs_allowed = home_runs_allowed;
		this.runs_allowed = runs_allowed;
		this.earned_runs = earned_runs;
		this.base_on_balls = base_on_balls;
		this.hit_by_pitch = hit_by_pitch;
		this.win_rate = win_rate;
		this.wpa = wpa;
		this.war = war;
	}

	public int getPlayer_id() {
		return player_id;
	}

	public void setPlayer_id(int player_id) {
		this.player_id = player_id;
	}

	public String getPlayer_team() {
		return player_team;
	}

	public void setPlayer_team(String player_team) {
		this.player_team = player_team;
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

	public double getEra() {
		return era;
	}

	public void setEra(double era) {
		this.era = era;
	}

	public int getGames() {
		return games;
	}

	public void setGames(int games) {
		this.games = games;
	}

	public int getWins() {
		return wins;
	}

	public void setWins(int wins) {
		this.wins = wins;
	}

	public int getLosses() {
		return losses;
	}

	public void setLosses(int losses) {
		this.losses = losses;
	}

	public int getHolds() {
		return holds;
	}

	public void setHolds(int holds) {
		this.holds = holds;
	}

	public int getSaves() {
		return saves;
	}

	public void setSaves(int saves) {
		this.saves = saves;
	}

	public String getInnings() {
		return innings;
	}

	public void setInnings(String innings) {
		this.innings = innings;
	}

	public int getStrikeouts() {
		return strikeouts;
	}

	public void setStrikeouts(int strikeouts) {
		this.strikeouts = strikeouts;
	}

	public int getHits_allowed() {
		return hits_allowed;
	}

	public void setHits_allowed(int hits_allowed) {
		this.hits_allowed = hits_allowed;
	}

	public int getHome_runs_allowed() {
		return home_runs_allowed;
	}

	public void setHome_runs_allowed(int home_runs_allowed) {
		this.home_runs_allowed = home_runs_allowed;
	}

	public int getRuns_allowed() {
		return runs_allowed;
	}

	public void setRuns_allowed(int runs_allowed) {
		this.runs_allowed = runs_allowed;
	}

	public int getEarned_runs() {
		return earned_runs;
	}

	public void setEarned_runs(int earned_runs) {
		this.earned_runs = earned_runs;
	}

	public int getBase_on_balls() {
		return base_on_balls;
	}

	public void setBase_on_balls(int base_on_balls) {
		this.base_on_balls = base_on_balls;
	}

	public int getHit_by_pitch() {
		return hit_by_pitch;
	}

	public void setHit_by_pitch(int hit_by_pitch) {
		this.hit_by_pitch = hit_by_pitch;
	}

	public double getWin_rate() {
		return win_rate;
	}

	public void setWin_rate(double win_rate) {
		this.win_rate = win_rate;
	}

	public double getWpa() {
		return wpa;
	}

	public void setWpa(double wpa) {
		this.wpa = wpa;
	}

	public double getWar() {
		return war;
	}

	public void setWar(double war) {
		this.war = war;
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
	
	
}