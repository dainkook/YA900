package com.kedu.dto;

import java.sql.Timestamp;

public class QuizAttemptDTO {

	private int attempt_id;
	private String member_id;
	private int current_question;
	private String status;
	private Timestamp started_at;
	private Timestamp updated_at;
	
	
	public QuizAttemptDTO() {}
	
	public QuizAttemptDTO(int attempt_id, String member_id, int current_question, String status, Timestamp started_at,
			Timestamp updated_at) {
		this.attempt_id = attempt_id;
		this.member_id = member_id;
		this.current_question = current_question;
		this.status = status;
		this.started_at = started_at;
		this.updated_at = updated_at;
	}
	public int getAttempt_id() {
		return attempt_id;
	}
	public void setAttempt_id(int attempt_id) {
		this.attempt_id = attempt_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getCurrent_question() {
		return current_question;
	}
	public void setCurrent_question(int current_question) {
		this.current_question = current_question;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Timestamp getStarted_at() {
		return started_at;
	}
	public void setStarted_at(Timestamp started_at) {
		this.started_at = started_at;
	}
	public Timestamp getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(Timestamp updated_at) {
		this.updated_at = updated_at;
	}
}