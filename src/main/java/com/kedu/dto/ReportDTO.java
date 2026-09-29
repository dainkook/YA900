package com.kedu.dto;

import java.sql.Timestamp;

public class ReportDTO {
	
	private int report_seq;
	private String reporter;
	private String target_id;
	private int target_seq;
	private String target_type;
	private String reason;
	private String status;
	private Timestamp regdate;
	
	
	public ReportDTO() {}
	
	public ReportDTO(int report_seq, String reporter, String target_id, int target_seq, String target_type,
			String reason, String status, Timestamp regdate) {
		this.report_seq = report_seq;
		this.reporter = reporter;
		this.target_id = target_id;
		this.target_seq = target_seq;
		this.target_type = target_type;
		this.reason = reason;
		this.status = status;
		this.regdate = regdate;
	}
	public int getReport_seq() {
		return report_seq;
	}
	public void setReport_seq(int report_seq) {
		this.report_seq = report_seq;
	}
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	public String getTarget_id() {
		return target_id;
	}
	public void setTarget_id(String target_id) {
		this.target_id = target_id;
	}
	public int getTarget_seq() {
		return target_seq;
	}
	public void setTarget_seq(int target_seq) {
		this.target_seq = target_seq;
	}
	public String getTarget_type() {
		return target_type;
	}
	public void setTarget_type(String target_type) {
		this.target_type = target_type;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
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
	
}
