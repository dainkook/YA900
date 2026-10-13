package com.kedu.dto;

import java.sql.Timestamp;

public class Re_ReplyDTO {

	private int re_reply_seq;
	private String contents;
	private String writer;
	private Timestamp write_date;
	private int parent_seq;
	private int boards_seq;
	
	public int getBoards_seq() {
		return boards_seq;
	}
	public void setBoards_seq(int boards_seq) {
		this.boards_seq = boards_seq;
	}
	public int getRe_reply_seq() {
		return re_reply_seq;
	}
	public void setRe_reply_seq(int re_reply_seq) {
		this.re_reply_seq = re_reply_seq;
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
	
	public Re_ReplyDTO () {}
	
	public Re_ReplyDTO(int re_reply_seq, String contents, String writer, Timestamp write_date, int parent_seq, int boards_seq) {
		this.re_reply_seq = re_reply_seq;
		this.contents = contents;
		this.writer = writer;
		this.write_date = write_date;
		this.parent_seq = parent_seq;
		this.boards_seq = boards_seq;
	}
	
	
}
