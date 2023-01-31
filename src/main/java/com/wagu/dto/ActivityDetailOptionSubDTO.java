package com.wagu.dto;

public class ActivityDetailOptionSubDTO {
	private int ticket_sub_id;
	private int ticket_opt_id;
	private String content;
	private int price;
	
	public ActivityDetailOptionSubDTO(int ticket_sub_id, int ticket_opt_id, String content, int price) {
		this.ticket_sub_id = ticket_sub_id;
		this.ticket_opt_id = ticket_opt_id;
		this.content = content;
		this.price = price;
	}
	
	public int getTicket_opt_id() {
		return ticket_opt_id;
	}

	public void setTicket_opt_id(int ticket_opt_id) {
		this.ticket_opt_id = ticket_opt_id;
	}

	public int getTicket_sub_id() {
		return ticket_sub_id;
	}

	public void setTicket_sub_id(int ticket_sub_id) {
		this.ticket_sub_id = ticket_sub_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
