package com.kedu.dto;

public class TicketDTO {

	private int ticket_id;
	private int game_id;
	private int seat_id;
	private int price;
	
	public TicketDTO() {}
	
	public TicketDTO(int ticket_id, int game_id, int seat_id, int price) {
		this.ticket_id = ticket_id;
		this.game_id = game_id;
		this.seat_id = seat_id;
		this.price = price;
	}

	public int getTicket_id() {
		return ticket_id;
	}

	public void setTicket_id(int ticket_id) {
		this.ticket_id = ticket_id;
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
}
