package com.kedu.dto;

import java.sql.Timestamp;

public class PredictionDTO {
	
	private int prediction_seq;
	private int game_id;
	private Timestamp start_date;
	private Timestamp end_date;
	private int winner;
	
	public PredictionDTO () {}

	public PredictionDTO(int prediction_seq, int game_id, Timestamp start_date, Timestamp end_date, int winner) {
		this.prediction_seq = prediction_seq;
		this.game_id = game_id;
		this.start_date = start_date;
		this.end_date = end_date;
		this.winner = winner;
	}

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
	
	
	
	

}
