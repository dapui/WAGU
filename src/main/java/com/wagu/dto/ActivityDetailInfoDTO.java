package com.wagu.dto;

public class ActivityDetailInfoDTO {
	private int ticket_detail_info_id;
	private String icon;
	private String content;
	
	public ActivityDetailInfoDTO(int ticket_detail_info_id, String icon, String content) {
		this.ticket_detail_info_id = ticket_detail_info_id;
		this.icon = icon;
		this.content = content;
	}

	public int getTicket_detail_info_id() {
		return ticket_detail_info_id;
	}

	public void setTicket_detail_info_id(int ticket_detail_info_id) {
		this.ticket_detail_info_id = ticket_detail_info_id;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}
