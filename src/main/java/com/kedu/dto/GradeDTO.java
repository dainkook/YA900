package com.kedu.dto;

public class GradeDTO {
	private int grade_Id;
	private String grade_Name;
	private int min_Point;
	private int max_Point;

	// 기본 생성자
	public GradeDTO() {
	}

	// 전체 생성자
	public GradeDTO(int grade_Id, String grade_Name, int min_Point, int max_Point) {
		this.grade_Id = grade_Id;
		this.grade_Name = grade_Name;
		this.min_Point = min_Point;
		this.max_Point = max_Point;
	}

	public int getGrade_Id() {
		return grade_Id;
	}

	public void setGrade_Id(int grade_Id) {
		this.grade_Id = grade_Id;
	}

	public String getGrade_Name() {
		return grade_Name;
	}

	public void setGrade_Name(String grade_Name) {
		this.grade_Name = grade_Name;
	}

	public int getMin_Point() {
		return min_Point;
	}

	public void setMin_Point(int min_Point) {
		this.min_Point = min_Point;
	}

	public int getMax_Point() {
		return max_Point;
	}

	public void setMax_Point(int max_Point) {
		this.max_Point = max_Point;
	}
}

