package com.kedu.dto;

import java.sql.Timestamp;

public class ReplyDTO {

	private int reply_seq;
	private String contents;
	private String writer;
	private int view_count;
	private Timestamp write_date;
	private int parent_seq;
	private int report_seq;
	private String reporter;
	public int getReply_seq() {
		return reply_seq;
	}
	public void setReply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	public Timestamp getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Timestamp write_date) {
		this.write_date = write_date;
	}
	public int getParent_seq() {
		return parent_seq;
	}
	public void setParent_seq(int parent_seq) {
		this.parent_seq = parent_seq;
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
	
	public ReplyDTO() {}
	public ReplyDTO(int reply_seq, String contents, String writer, int view_count, Timestamp write_date, int parent_seq,
			int report_seq, String reporter) {
		this.reply_seq = reply_seq;
		this.contents = contents;
		this.writer = writer;
		this.view_count = view_count;
		this.write_date = write_date;
		this.parent_seq = parent_seq;
		this.report_seq = report_seq;
		this.reporter = reporter;
	};
	
	
}
