
package com.kedu.dto;

import java.sql.Timestamp;

public class PredictionViewDTO {

    private int prediction_seq;
    private int game_id;
    private Timestamp start_date;
    private Timestamp end_date;
    private int winner;

    private String title;
    private String location;
    private String home_team;
    private String away_team;
    private String home_logo;
    private String away_logo;
    private String game_status;

    private int home_score;
    private int away_score;
    
    private Timestamp gameStartDate;

    public int getPrediction_seq() {
        return prediction_seq;
    }

    public void setPrediction_seq(int prediction_seq) {
        this.prediction_seq = prediction_seq;
    }

    public int getGame_id() {
        return game_id;
    }

    public void setGame_id(int game_id) {
        this.game_id = game_id;
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

    public int getWinner() {
        return winner;
    }

    public void setWinner(int winner) {
        this.winner = winner;
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

    public String getHome_team() {
        return home_team;
    }

    public void setHome_team(String home_team) {
        this.home_team = home_team;
    }

    public String getAway_team() {
        return away_team;
    }

    public void setAway_team(String away_team) {
        this.away_team = away_team;
    }

    public String getHome_logo() {
        return home_logo;
    }

    public void setHome_logo(String home_logo) {
        this.home_logo = home_logo;
    }

    public String getAway_logo() {
        return away_logo;
    }

    public void setAway_logo(String away_logo) {
        this.away_logo = away_logo;
    }

    public String getGame_status() {
        return game_status;
    }

    public void setGame_status(String game_status) {
        this.game_status = game_status;
    }

    public int getHome_score() {
        return home_score;
    }

    public void setHome_score(int home_score) {
        this.home_score = home_score;
    }

    public int getAway_score() {
        return away_score;
    }

    public void setAway_score(int away_score) {
        this.away_score = away_score;
    }
    
    public Timestamp getGameStartDate() {
        return gameStartDate;
    }

    public void setGameStartDate(Timestamp gameStartDate) {
        this.gameStartDate = gameStartDate;
    }
}
