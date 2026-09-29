package com.kedu.dto;

import java.sql.Timestamp;

public class QuizResultDTO {

	private int result_id;
	private String member_id;
	private int total_count;
	private int correct_count;
	private Timestamp play_date;
	
	
	public QuizResultDTO() {}
	
	public QuizResultDTO(int result_id, String member_id, int total_count, int correct_count, Timestamp play_date) {
		this.result_id = result_id;
		this.member_id = member_id;
		this.total_count = total_count;
		this.correct_count = correct_count;
		this.play_date = play_date;
	}
	public int getResult_id() {
		return result_id;
	}
	public void setResult_id(int result_id) {
		this.result_id = result_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getTotal_count() {
		return total_count;
	}
	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}
	public int getCorrect_count() {
		return correct_count;
	}
	public void setCorrect_count(int correct_count) {
		this.correct_count = correct_count;
	}
	public Timestamp getPlay_date() {
		return play_date;
	}
	public void setPlay_date(Timestamp play_date) {
		this.play_date = play_date;
	}
}
