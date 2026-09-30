package com.kedu.dto;

import java.sql.Timestamp;

public class NoticeDTO {

	private int notice_seq;
	private String title;
	private String contents;
	private String writer;
	private int view_count;
	private Timestamp write_date;
	
	
	public NoticeDTO() {}
	
	public NoticeDTO(int notice_seq, String title, String contents, String writer, int view_count,
			Timestamp write_date) {
		this.notice_seq = notice_seq;
		this.title = title;
		this.contents = contents;
		this.writer = writer;
		this.view_count = view_count;
		this.write_date = write_date;
	}
	public int getNotice_seq() {
		return notice_seq;
	}
	public void setNotice_seq(int notice_seq) {
		this.notice_seq = notice_seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
}