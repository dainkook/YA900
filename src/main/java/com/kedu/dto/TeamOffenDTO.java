package com.kedu.dto;

public class TeamOffenDTO {
	
	private int team_id;
    private String team_name;
    private double batting_average;
    private int runs;
    private int rbi;
    private int at_bats;
    private int home_runs;
    private int hits;
    private int doubles;
    private int triples;
    private int stolen_bases;
    private int walks_hbp;
    private int strikeouts;
    private int double_plays;
    private double on_base_percentage;
    private double slugging_percentage;
    private double ops;
    private String team_logo;
    
    public TeamOffenDTO () {}

	public TeamOffenDTO(int team_id, String team_name, double batting_average, int runs, int rbi, int at_bats,
			int home_runs, int hits, int doubles, int triples, int stolen_bases, int walks_hbp, int strikeouts,
			int double_plays, double on_base_percentage, double slugging_percentage,double ops) {
		this.team_id = team_id;
		this.team_name = team_name;
		this.batting_average = batting_average;
		this.runs = runs;
		this.rbi = rbi;
		this.at_bats = at_bats;
		this.home_runs = home_runs;
		this.hits = hits;
		this.doubles = doubles;
		this.triples = triples;
		this.stolen_bases = stolen_bases;
		this.walks_hbp = walks_hbp;
		this.strikeouts = strikeouts;
		this.double_plays = double_plays;
		this.on_base_percentage = on_base_percentage;
		this.slugging_percentage = slugging_percentage;
		this.ops = ops;
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

	public double getBatting_average() {
		return batting_average;
	}

	public void setBatting_average(double batting_average) {
		this.batting_average = batting_average;
	}

	public int getRuns() {
		return runs;
	}

	public void setRuns(int runs) {
		this.runs = runs;
	}

	public int getRbi() {
		return rbi;
	}

	public void setRbi(int rbi) {
		this.rbi = rbi;
	}

	public int getAt_bats() {
		return at_bats;
	}

	public void setAt_bats(int at_bats) {
		this.at_bats = at_bats;
	}

	public int getHome_runs() {
		return home_runs;
	}

	public void setHome_runs(int home_runs) {
		this.home_runs = home_runs;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public int getDoubles() {
		return doubles;
	}

	public void setDoubles(int doubles) {
		this.doubles = doubles;
	}

	public int getTriples() {
		return triples;
	}

	public void setTriples(int triples) {
		this.triples = triples;
	}

	public int getStolen_bases() {
		return stolen_bases;
	}

	public void setStolen_bases(int stolen_bases) {
		this.stolen_bases = stolen_bases;
	}

	public int getWalks_hbp() {
		return walks_hbp;
	}

	public void setWalks_hbp(int walks_hbp) {
		this.walks_hbp = walks_hbp;
	}

	public int getStrikeouts() {
		return strikeouts;
	}

	public void setStrikeouts(int strikeouts) {
		this.strikeouts = strikeouts;
	}

	public int getDouble_plays() {
		return double_plays;
	}

	public void setDouble_plays(int double_plays) {
		this.double_plays = double_plays;
	}

	public double getOn_base_percentage() {
		return on_base_percentage;
	}

	public void setOn_base_percentage(double on_base_percentage) {
		this.on_base_percentage = on_base_percentage;
	}

	public double getSlugging_percentage() {
		return slugging_percentage;
	}

	public void setSlugging_percentage(double slugging_percentage) {
		this.slugging_percentage = slugging_percentage;
	}
	
	public double getOps() {
	    return ops;
	}

	public void setOps(double ops) {
	    this.ops = ops;
	}
	
	public String getTeam_logo() {
		return team_logo;
	}

	public void setTeam_logo(String team_logo) {
		this.team_logo = team_logo;
	}
	
    
    
}
