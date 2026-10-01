package com.kedu.dto;

public class TeamDefenDTO {
	
	private int team_id;
	private String team_name;
	private double era;
	private int runs_allowed;
	private int earned_runs;
	private double innings_pitched;
	private int hits_allowed;
	private int home_runs_allowed;
	private int strikeouts;
	private int walks_hbp;
	private int wild_pitches;
	private int errors;
	private double whip;
	private int quality_starts;
	private int holds;
	private int saves;
	private String team_logo;
	
	public TeamDefenDTO () {}

	public TeamDefenDTO(int team_id, String team_name, double era, int runs_allowed, int earned_runs,
			double innings_pitched, int hits_allowed, int home_runs_allowed, int strikeouts, int walks_hbp,
			int wild_pitches, int errors, double whip, int quality_starts, int holds, int saves) {
		this.team_id = team_id;
		this.team_name = team_name;
		this.era = era;
		this.runs_allowed = runs_allowed;
		this.earned_runs = earned_runs;
		this.innings_pitched = innings_pitched;
		this.hits_allowed = hits_allowed;
		this.home_runs_allowed = home_runs_allowed;
		this.strikeouts = strikeouts;
		this.walks_hbp = walks_hbp;
		this.wild_pitches = wild_pitches;
		this.errors = errors;
		this.whip = whip;
		this.quality_starts = quality_starts;
		this.holds = holds;
		this.saves = saves;
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

	public double getEra() {
		return era;
	}

	public void setEra(double era) {
		this.era = era;
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

	public double getInnings_pitched() {
		return innings_pitched;
	}

	public void setInnings_pitched(double innings_pitched) {
		this.innings_pitched = innings_pitched;
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

	public int getStrikeouts() {
		return strikeouts;
	}

	public void setStrikeouts(int strikeouts) {
		this.strikeouts = strikeouts;
	}

	public int getWalks_hbp() {
		return walks_hbp;
	}

	public void setWalks_hbp(int walks_hbp) {
		this.walks_hbp = walks_hbp;
	}

	public int getWild_pitches() {
		return wild_pitches;
	}

	public void setWild_pitches(int wild_pitches) {
		this.wild_pitches = wild_pitches;
	}

	public int getErrors() {
		return errors;
	}

	public void setErrors(int errors) {
		this.errors = errors;
	}

	public double getWhip() {
		return whip;
	}

	public void setWhip(double whip) {
		this.whip = whip;
	}

	public int getQuality_starts() {
		return quality_starts;
	}

	public void setQuality_starts(int quality_starts) {
		this.quality_starts = quality_starts;
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
	
	public String getTeam_logo() {
		return team_logo;
	}

	public void setTeam_logo(String team_logo) {
		this.team_logo = team_logo;
	}
	
	
}