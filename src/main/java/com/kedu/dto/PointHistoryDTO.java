package com.kedu.dto;

import java.sql.Timestamp;

public class PointHistoryDTO {

	private int point_seq;
	private String member_id;
	private int amount;
	private String reason;
	private Timestamp regdate;

	public PointHistoryDTO() {
	}
	
	public PointHistoryDTO(int point_seq, String member_id, int amount,
			String reason, Timestamp regdate) {
		this.point_seq = point_seq;
		this.member_id = member_id;
		this.amount = amount;
		this.reason = reason;
		this.regdate = regdate;
	}

	public int getPoint_seq() {
		return point_seq;
	}

	public void setPoint_seq(int point_seq) {
		this.point_seq = point_seq;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
}
