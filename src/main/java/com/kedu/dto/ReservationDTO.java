package com.kedu.dto;

import java.sql.Timestamp;

public class ReservationDTO {

	private int reservation_id;
	private String member_id;
	private int ticket_id;
	private Timestamp reservation_date;
	
	public ReservationDTO() {}
	
	public ReservationDTO(int reservation_id, String member_id, int ticket_id, Timestamp reservation_date) {
		this.reservation_id = reservation_id;
		this.member_id = member_id;
		this.ticket_id = ticket_id;
		this.reservation_date = reservation_date;
	}

	public int getReservation_id() {
		return reservation_id;
	}

	public void setReservation_id(int reservation_id) {
		this.reservation_id = reservation_id;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getTicket_id() {
		return ticket_id;
	}

	public void setTicket_id(int ticket_id) {
		this.ticket_id = ticket_id;
	}

	public Timestamp getReservation_date() {
		return reservation_date;
	}

	public void setReservation_date(Timestamp reservation_date) {
		this.reservation_date = reservation_date;
	}
}
