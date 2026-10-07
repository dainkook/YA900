package com.kedu.dto;

import java.sql.Timestamp;

public class ReportDTO {
	
	private int report_seq;
	private String target_contents;
	private String target_type;
	private int target_seq;
	private Integer parent_seq;
	private String target_id;
	private String reporter;
	private String report_type;
	private String status;
	private Timestamp regdate;
	
	public ReportDTO() {}

	public int getReport_seq() {
		return report_seq;
	}

	public void setReport_seq(int report_seq) {
		this.report_seq = report_seq;
	}

	public String getTarget_contents() {
		return target_contents;
	}

	public void setTarget_contents(String target_contents) {
		this.target_contents = target_contents;
	}

	public String getTarget_type() {
		return target_type;
	}

	public void setTarget_type(String target_type) {
		this.target_type = target_type;
	}

	public int getTarget_seq() {
		return target_seq;
	}

	public void setTarget_seq(int target_seq) {
		this.target_seq = target_seq;
	}

	public Integer getParent_seq() {
		return parent_seq;
	}

	public void setParent_seq(Integer parent_seq) {
		this.parent_seq = parent_seq;
	}

	public String getTarget_id() {
		return target_id;
	}

	public void setTarget_id(String target_id) {
		this.target_id = target_id;
	}

	public String getReporter() {
		return reporter;
	}

	public void setReporter(String reporter) {
		this.reporter = reporter;
	}

	public String getReport_type() {
		return report_type;
	}

	public void setReport_type(String report_type) {
		this.report_type = report_type;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public ReportDTO(int report_seq, String target_contents, String target_type, int target_seq, Integer parent_seq,
			String target_id, String reporter, String report_type, String status, Timestamp regdate) {
		this.report_seq = report_seq;
		this.target_contents = target_contents;
		this.target_type = target_type;
		this.target_seq = target_seq;
		this.parent_seq = parent_seq;
		this.target_id = target_id;
		this.reporter = reporter;
		this.report_type = report_type;
		this.status = status;
		this.regdate = regdate;
	}

	
	
	
}
