package com.kedu.dto;

import java.sql.Timestamp;

public class FilesDTO {

	private int file_seq;
	private String oriName;
	private String sysName;
	private Timestamp regdate;
	private int parent_seq;
	
	public FilesDTO() {}
	
	public FilesDTO(int file_seq, String oriName, String sysName, Timestamp regdate, int parent_seq) {
		this.file_seq = file_seq;
		this.oriName = oriName;
		this.sysName = sysName;
		this.regdate = regdate;
		this.parent_seq = parent_seq;
	}
	public int getFile_seq() {
		return file_seq;
	}
	public void setFile_seq(int file_seq) {
		this.file_seq = file_seq;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public String getSysName() {
		return sysName;
	}
	public void setSysName(String sysName) {
		this.sysName = sysName;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getParent_seq() {
		return parent_seq;
	}
	public void setParent_seq(int parent_seq) {
		this.parent_seq = parent_seq;
	}
}
