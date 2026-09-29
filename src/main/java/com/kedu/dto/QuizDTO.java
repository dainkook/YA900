package com.kedu.dto;

public class QuizDTO {

	private int quiz_id;
	private String quiz_contents;
	private String choice1;
	private String choice2;
	private String choice3;
	private String choice4;
	private int answer;
	private String category;
	
	
	public QuizDTO() {}
	
	public QuizDTO(int quiz_id, String quiz_contents, String choice1, String choice2, String choice3, String choice4,
			int answer, String category) {
		this.quiz_id = quiz_id;
		this.quiz_contents = quiz_contents;
		this.choice1 = choice1;
		this.choice2 = choice2;
		this.choice3 = choice3;
		this.choice4 = choice4;
		this.answer = answer;
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
	public String getChoice1() {
		return choice1;
	}
	public void setChoice1(String choice1) {
		this.choice1 = choice1;
	}
	public String getChoice2() {
		return choice2;
	}
	public void setChoice2(String choice2) {
		this.choice2 = choice2;
	}
	public String getChoice3() {
		return choice3;
	}
	public void setChoice3(String choice3) {
		this.choice3 = choice3;
	}
	public String getChoice4() {
		return choice4;
	}
	public void setChoice4(String choice4) {
		this.choice4 = choice4;
	}
	public int getAnswer() {
		return answer;
	}
	public void setAnswer(int answer) {
		this.answer = answer;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
}
