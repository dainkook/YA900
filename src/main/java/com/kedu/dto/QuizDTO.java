package com.kedu.dto;

public class QuizDTO {

	private int quiz_id;
	private String quiz_contents;
	private String answer;
	private String explanation;
	private String category;
	
	public QuizDTO() {}
	
	public QuizDTO(int quiz_id, String quiz_contents, String answer, String explanation, String category) {
		this.quiz_id = quiz_id;
		this.quiz_contents = quiz_contents;
		this.answer = answer;
		this.explanation = explanation;
		this.category = category;
	}

	public int getQuiz_id() {
		return quiz_id;
	}
	public void setQuiz_id(int quiz_id) {
		this.quiz_id = quiz_id;
	}
	public String getQuiz_contents() {
		return quiz_contents;
	}
	public void setQuiz_contents(String quiz_contents) {
		this.quiz_contents = quiz_contents;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getExplanation() {
		return explanation;
	}
	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
}