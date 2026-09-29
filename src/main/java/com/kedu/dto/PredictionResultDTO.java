package com.kedu.dto;

import java.sql.Timestamp;

public class PredictionResultDTO {
	
	private int result_id;
	private int prediction_id;
	private String member_id;
	private int team_id;
	private Timestamp predict_date;
	private int is_correct;
	
	public PredictionResultDTO () {}

	public PredictionResultDTO(int result_id, int prediction_id, String member_id, int team_id, Timestamp predict_date,
			int is_correct) {
		this.result_id = result_id;
		this.prediction_id = prediction_id;
		this.member_id = member_id;
		this.team_id = team_id;
		this.predict_date = predict_date;
		this.is_correct = is_correct;
	}

	public int getResult_id() {
		return result_id;
	}

	public void setResult_id(int result_id) {
		this.result_id = result_id;
	}

	public int getPrediction_id() {
		return prediction_id;
	}

	public void setPrediction_id(int prediction_id) {
		this.prediction_id = prediction_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getTeam_id() {
		return team_id;
	}

	public void setTeam_id(int team_id) {
		this.team_id = team_id;
	}

	public Timestamp getPredict_date() {
		return predict_date;
	}

	public void setPredict_date(Timestamp predict_date) {
		this.predict_date = predict_date;
	}

	public int getIs_correct() {
		return is_correct;
	}

	public void setIs_correct(int is_correct) {
		this.is_correct = is_correct;
	}
	
	
	
	
	
	

}
