package com.kedu.dto;

public class TeamRankDTO {

    private int team_id;
    private String team_name;
    private double win_rate;
    private double games_behind;
    private int games;
    private int wins;
    private int losses;
    private int draws;
    private String winning_streak;
    private double batting_avg;
    private double era;

    public TeamRankDTO() {
    }

    public TeamRankDTO(int team_id, String team_name, double win_rate, double games_behind, int games,
            int wins, int losses, int draws, String winning_streak, double batting_avg, double era) {

        this.team_id = team_id;
        this.team_name = team_name;
        this.win_rate = win_rate;
        this.games_behind = games_behind;
        this.games = games;
        this.wins = wins;
        this.losses = losses;
        this.draws = draws;
        this.winning_streak = winning_streak;
        this.batting_avg = batting_avg;
        this.era = era;
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

    public double getWin_rate() {
        return win_rate;
    }

    public void setWin_rate(double win_rate) {
        this.win_rate = win_rate;
    }

    public double getGames_behind() {
        return games_behind;
    }

    public void setGames_behind(double games_behind) {
        this.games_behind = games_behind;
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

    public int getDraws() {
        return draws;
    }

    public void setDraws(int draws) {
        this.draws = draws;
    }

    public String getWinning_streak() {
        return winning_streak;
    }

    public void setWinning_streak(String winning_streak) {
        this.winning_streak = winning_streak;
    }

    public double getBatting_avg() {
        return batting_avg;
    }

    public void setBatting_avg(double batting_avg) {
        this.batting_avg = batting_avg;
    }

    public double getEra() {
        return era;
    }

    public void setEra(double era) {
        this.era = era;
    }
}