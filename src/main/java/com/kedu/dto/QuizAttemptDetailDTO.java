package com.kedu.dto;

public class QuizAttemptDetailDTO {

	private int attempt_id;
	private int question_order;
	private int quiz_id;
	private String selected_answer;
	
	
	public QuizAttemptDetailDTO() {}
	
	public QuizAttemptDetailDTO(int attempt_id, int question_order, int quiz_id, String selected_answer) {
		this.attempt_id = attempt_id;
		this.question_order = question_order;
		this.quiz_id = quiz_id;
		this.selected_answer = selected_answer;
	}
	public int getAttempt_id() {
		return attempt_id;
	}
	public void setAttempt_id(int attempt_id) {
		this.attempt_id = attempt_id;
	}
	public int getQuestion_order() {
		return question_order;
	}
	public void setQuestion_order(int question_order) {
		this.question_order = question_order;
	}
	public int getQuiz_id() {
		return quiz_id;
	}
	public void setQuiz_id(int quiz_id) {
		this.quiz_id = quiz_id;
	}
	public String getSelected_answer() {
		return selected_answer;
	}
	public void setSelected_answer(String selected_answer) {
		this.selected_answer = selected_answer;
	}
	
	
}
