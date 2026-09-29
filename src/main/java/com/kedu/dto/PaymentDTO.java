package com.kedu.dto;

import java.sql.Timestamp;

public class PaymentDTO {

	private int payment_id;
	private int reservation_id;
	private int amount;
	private Timestamp payment_date;

	public PaymentDTO() {}
	
	public PaymentDTO(int payment_id, int reservation_id, int amount, Timestamp payment_date) {
		this.payment_id = payment_id;
		this.reservation_id = reservation_id;
		this.amount = amount;
		this.payment_date = payment_date;
	}
	
	public int getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}

	public int getReservation_id() {
		return reservation_id;
	}

	public void setReservation_id(int reservation_id) {
		this.reservation_id = reservation_id;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Timestamp getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(Timestamp payment_date) {
		this.payment_date = payment_date;
	}

	
}
