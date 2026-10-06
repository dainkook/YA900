package com.kedu.dto;

import java.sql.Timestamp;

public class ReservationDTO {

	private int reservation_id;
	private String member_id;
	private int ticket_id;
	private Timestamp reservation_date;
	private String status;
	private int game_id;
	private int seat_id;
	private int price;
	private String title;
	
	public ReservationDTO() {}
	
	public ReservationDTO(int reservation_id, String member_id, int ticket_id, Timestamp reservation_date,
			String status, int game_id, int seat_id, int price, String title) {
		this.reservation_id = reservation_id;
		this.member_id = member_id;
		this.ticket_id = ticket_id;
		this.reservation_date = reservation_date;
		this.status = status;
		this.game_id = game_id;
		this.seat_id = seat_id;
		this.price = price;
		this.title = title;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getGame_id() {
		return game_id;
	}
	public void setGame_id(int game_id) {
		this.game_id = game_id;
	}
	public int getSeat_id() {
		return seat_id;
	}
	public void setSeat_id(int seat_id) {
		this.seat_id = seat_id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
}