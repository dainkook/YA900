package com.kedu.dto;

public class NoticeDTO {

	int notice_seq;
	String title;
	String contents;
	String writer;
	int view_count;
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
	
	public NoticeDTO() {}
	
	public NoticeDTO(int notice_seq, String title, String contents, String writer, int view_count) {
		this.notice_seq = notice_seq;
		this.title = title;
		this.contents = contents;
		this.writer = writer;
		this.view_count = view_count;
	};
	
	
}
