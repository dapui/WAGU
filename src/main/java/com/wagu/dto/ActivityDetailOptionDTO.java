package com.wagu.dto;

public class ActivityDetailOptionDTO {
	private int ticket_opt_id;
	private String title;
	private int price;
	private String content;
	
	public ActivityDetailOptionDTO(int ticket_opt_id, String title, int price, String content) {
		super();
		this.ticket_opt_id = ticket_opt_id;
		this.title = title;
		this.price = price;
		this.content = content;
	}

	public int getTicket_opt_id() {
		return ticket_opt_id;
	}

	public void setTicket_opt_id(int ticket_opt_id) {
		this.ticket_opt_id = ticket_opt_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	
}
