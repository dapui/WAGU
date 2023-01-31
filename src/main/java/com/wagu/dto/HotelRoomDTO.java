package com.wagu.dto;

public class HotelRoomDTO {
	private String room;
	private int room_price_weekday;
	private int room_price_weekend;
	private String description;
	private String image;
	
	public HotelRoomDTO(String room, int room_price_weekday, int room_price_weekend, String description, String image) {
		this.room = room;
		this.room_price_weekday = room_price_weekday;
		this.room_price_weekend = room_price_weekend;
		this.description = description;
		this.image = image;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public int getRoom_price_weekday() {
		return room_price_weekday;
	}

	public void setRoom_price_weekday(int room_price_weekday) {
		this.room_price_weekday = room_price_weekday;
	}

	public int getRoom_price_weekend() {
		return room_price_weekend;
	}

	public void setRoom_price_weekend(int room_price_weekend) {
		this.room_price_weekend = room_price_weekend;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	
	
}
