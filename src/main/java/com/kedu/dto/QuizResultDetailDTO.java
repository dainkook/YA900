package com.kedu.dto;

public class QuizResultDetailDTO {

	private int detail_id;
	private int result_id;
	private int quiz_id;
	private String user_answer;
	private int is_correct;
	
	
	public QuizResultDetailDTO() {}
	
	public QuizResultDetailDTO(int detail_id, int result_id, int quiz_id, String user_answer, int is_correct) {
		this.detail_id = detail_id;
		this.result_id = result_id;
		this.quiz_id = quiz_id;
		this.user_answer = user_answer;
		this.is_correct = is_correct;
	}
	public int getDetail_id() {
		return detail_id;
	}
	public void setDetail_id(int detail_id) {
		this.detail_id = detail_id;
	}
	public int getResult_id() {
		return result_id;
	}
	public void setResult_id(int result_id) {
		this.result_id = result_id;
	}
	public int getQuiz_id() {
		return quiz_id;
	}
	public void setQuiz_id(int quiz_id) {
		this.quiz_id = quiz_id;
	}
	public String getUser_answer() {
		return user_answer;
	}
	public void setUser_answer(String user_answer) {
		this.user_answer = user_answer;
	}
	public int getIs_correct() {
		return is_correct;
	}
	public void setIs_correct(int is_correct) {
		this.is_correct = is_correct;
	}
}